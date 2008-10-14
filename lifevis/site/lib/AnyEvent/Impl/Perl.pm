=head1 NAME

AnyEvent::Impl::Perl - Pure-Perl event loop and AnyEvent adaptor for itself

=head1 SYNOPSIS

   use AnyEvent;
   # use AnyEvent::Impl::Perl;
  
   # this module gets loaded automatically as required

=head1 DESCRIPTION

This module provides transparent support for AnyEvent in case no other
event loop could be found or loaded. You don't have to do anything to make
it work with AnyEvent except by possibly loading it before creating the
first AnyEvent watcher.

If you want to use this module instead of autoloading another event loop
you can simply load it before creating the first watcher.

As for performance, this module is on par with (and usually faster than)
most select/poll-based C event modules such as Event or Glib (it does not
even come close to EV, though), with respect to I/O watchers. Timers are
handled less optimally, but for many common tasks, it's still on par with
event loops written in C.

This event loop has been optimised for the following use cases:

=over 4

=item monotonic clock is available

This module will use the POSIX monotonic clock option (if it can be
detected at runtime) or the POSIX C<times> function (if the resolution is
better than 100Hz), in which case it will not suffer adversely from time
jumps.

If no monotonic clock is available, this module will not attempt to
correct for time jumps in any way.

The clock chosen will be reported if the environment variable
C<$PERL_ANYEVENT_VERBOSE> is set to 8 or higher.

=item any number of watchers on one fd

Supporting a large number of watchers per fd is purely a dirty benchmark
optimisation not relevant in practise. The more common case of having one
watcher per fd/poll combo is special-cased, however, and therefore fast,
too.

=item relatively few active fds per C<select> call

This module expects that only a tiny amount of fds is active at any one
time. This is relatively typical of larger servers (but not the case where
C<select> traditionally is fast), at the expense of the "dense activity
case" where most of the fds are active (which suits C<select>).

The optimal implementation of the "dense" case is not much faster, though,
so the module should behave very well in most cases, subject to the bad
scalability of C<select> in general.

=item lots of timer changes/iteration, or none at all

This module sorts the timer list using perl's C<sort>, even though a total
ordering is not required for timers.

This sorting is expensive, but means sorting can be avoided unless the
timer list has changed in a way that requires a new sort.

This means that adding lots of timers is very efficient, as well as not
changing the timers. Advancing timers (e.g. recreating a timeout watcher
on activity) is also relatively efficient, for example, if you have a
large number of timeout watchers that time out after 10 seconds, then the
timer list will be sorted only once every 10 seconds.

This should not have much of an impact unless you have hundreds or
thousands of timers, though, or your timers have very small timeouts.

=back

=cut

package AnyEvent::Impl::Perl;

no warnings;
use strict;

use Scalar::Util ();

use AnyEvent ();
use AnyEvent::Util ();

our $VERSION = 4.3;

our ($NOW, $MNOW);

sub MAXWAIT() { 1000 } # never sleep for longer than this many seconds

BEGIN {
   local $SIG{__DIE__};
   my $time_hires = eval "use Time::HiRes (); 1";
   my $clk_tck    = eval "use POSIX (); POSIX::sysconf (&POSIX::_SC_CLK_TCK)";
   my $round; # actual granularity

   if ($time_hires && eval "&Time::HiRes::clock_gettime (&Time::HiRes::CLOCK_MONOTONIC)") {
      warn "AnyEvent::Impl::Perl using CLOCK_MONOTONIC as timebase.\n" if $AnyEvent::verbose >= 8;
      *_update_clock = sub {
         $NOW  = &Time::HiRes::time;
         $MNOW = Time::HiRes::clock_gettime (&Time::HiRes::CLOCK_MONOTONIC);
      };

   } elsif (100 <= $clk_tck && $clk_tck <= 1000000 && "use POSIX (); (POSIX::times())[0] != -1") { # -1 is also a valid return value :/
      warn "AnyEvent::Impl::Perl using POSIX::times (monotonic) as timebase.\n" if $AnyEvent::verbose >= 8;
      my $HZ1 = 1 / $clk_tck;

      my $last = (POSIX::times ())[0];
      my $next;
      *_update_clock = sub {
         $NOW  = time; # d'oh

         $next = (POSIX::times ())[0];
         # we assume 32 bit signed on wrap but 64 bit will never wrap
         $last -= 0x100000000 if $last > $next;
         $MNOW += ($next - $last) * $HZ1;
         $last = $next;
      };

      $round = $HZ1;

   } elsif (eval "use Time::HiRes (); 1") {
      warn "AnyEvent::Impl::Perl using Time::HiRes::time (non-monotonic) clock as timebase.\n" if $AnyEvent::verbose >= 8;
      *_update_clock = sub {
         $NOW = $MNOW = &Time::HiRes::time;
      };

   } else {
      die "FATAL: unable to find sub-second time source (is this really perl 5.8.0 or later?)";
   }

   $round = 0.001 if $round < 0.001; # 1ms is enough for us
   $round -= $round * 1e-2; # 0.1 => 0.099
   eval "sub ROUNDUP() { $round }";
}

_update_clock;

sub now { $NOW }

# fds[0] is for read, fds[1] is for write watchers
# fds[poll]{v} is the bitmask for select
# fds[poll]{w}[fd] contains a list of i/o watchers
# an I/O watcher is a blessed arrayref containing [fh, poll(0/1), callback, queue-index]
# the queue-index is simply the index in the {w} array, which is only used to improve
# benchmark results in the synthetic "many watchers on one fd" benchmark.
my @fds = ({}, {});

my $need_sort = 1e300; # when to re-sort timer list
my @timer; # list of [ abs-timeout, Timer::[callback] ]

# the pure perl mainloop
sub one_event {
   _update_clock;

   # first sort timers if required (slow)
   if ($MNOW >= $need_sort) {
      $need_sort = 1e300;
      @timer = sort { $a->[0] <=> $b->[0] } @timer;
   }

   # handle all pending timers
   if (@timer && $timer[0][0] <= $MNOW) {
      do {
         my $timer = shift @timer;
         $timer->[1]($timer) if $timer->[1];
      } while @timer && $timer[0][0] <= $MNOW;

   } else {
      # poll for I/O events, we do not do this when there
      # were any pending timers to ensure that one_event returns
      # quickly when some timers have been handled
      my ($wait, @vec, $fds)
         = (@timer && $timer[0][0] < $need_sort ? $timer[0][0] : $need_sort) - $MNOW;

      $wait = $wait < MAXWAIT ? $wait + ROUNDUP : MAXWAIT;

      if ($fds = select
            $vec[0] = $fds[0]{v},
            $vec[1] = $fds[1]{v},
            AnyEvent::WIN32 ? $vec[2] = $fds[1]{v} : undef,
            $wait
      ) {
         _update_clock;

         # buggy microshit windows errornously sets exceptfds instead of writefds
         $vec[1] |= $vec[2] if AnyEvent::WIN32;

         # prefer write watchers, because they usually reduce
         # memory pressure.
         for (1, 0) {
            my $fds = $fds[$_];

            # we parse the bitmask by first expanding it into
            # a string of bits
            for (unpack "b*", $vec[$_]) {
               # and then repeatedly match a regex skipping the 0's
               while (/\G0*1/g) {
                  # and using the resulting string position as fd
                  $_ && $_->[2]()
                     for @{ $fds->{w}[-1 + pos] || [] };
               }
            }
         }
      } elsif (AnyEvent::WIN32 && $! == AnyEvent::Util::WSAEINVAL) {
         # buggy microshit windoze asks us to route around it
         select undef, undef, undef, $wait;
      }
   }
}

sub io {
   my ($class, %arg) = @_;

   my $self = bless [
      $arg{fh},
      $arg{poll} eq "w",
      $arg{cb},
      # q-idx
   ], AnyEvent::Impl::Perl::Io::;

   my $fds = $fds[$self->[1]];

   # add watcher to fds structure
   my $fd = fileno $self->[0];
   my $q = $fds->{w}[$fd] ||= [];

   (vec $fds->{v}, $fd, 1) = 1;

   $self->[3] = @$q;
   push @$q, $self;
   Scalar::Util::weaken $q->[-1];

   $self
}

sub AnyEvent::Impl::Perl::Io::DESTROY {
   my ($self) = @_;

   my $fds = $fds[$self->[1]];

   # remove watcher from fds structure
   my $fd = fileno $self->[0];

   if (@{ $fds->{w}[$fd] } == 1) {
      delete $fds->{w}[$fd];
      (vec $fds->{v}, $fd, 1) = 0;
   } else {
      my $q = $fds->{w}[$fd];
      my $last = pop @$q;

      if ($last != $self) {
         Scalar::Util::weaken ($q->[$self->[3]] = $last);
         $last->[3] = $self->[3];
      }
   }
}

sub timer {
   my ($class, %arg) = @_;
   
   my $self;

   if ($arg{interval}) {
      my $cb   = $arg{cb};
      my $ival = $arg{interval};

      $self = [$MNOW + $arg{after} , sub {
         $_[0][0] = $MNOW + $ival;
         push @timer, $_[0];
         Scalar::Util::weaken $timer[-1];
         $need_sort = $_[0][0] if $_[0][0] < $need_sort;
         &$cb;
      }];
   } else {
      $self = [$MNOW + $arg{after}, $arg{cb}];
   }

   push @timer, $self;
   Scalar::Util::weaken $timer[-1];
   $need_sort = $self->[0] if $self->[0] < $need_sort;

   $self
}

1;

=head1 SEE ALSO

L<AnyEvent>.

=head1 AUTHOR

   Marc Lehmann <schmorp@schmorp.de>
   http://home.schmorp.de/

=cut


