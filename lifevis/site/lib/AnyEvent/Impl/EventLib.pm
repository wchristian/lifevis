=head1 NAME

AnyEvent::Impl::EventLib - AnyEvent adaptor for Event::Lib

=head1 SYNOPSIS

   use AnyEvent;
   use Event::Lib;
  
   # this module gets loaded automatically as required

=head1 DESCRIPTION

This module provides transparent support for AnyEvent. You don't have to
do anything to make Event work with AnyEvent except by loading Event::Lib
before creating the first AnyEvent watcher.

The L<Event::Lib> module suffers from the same limitations and bugs
as libevent, most notably it kills already-installed watchers on a
file descriptor and it is unable to support fork. It has many other bugs
such as taking references to file handles and callbacks instead of making
a copy. Only Tk rivals it in its brokenness.

This adaptor module employs the same workaround around the watcher problem
as Tk and should therefore be avoided. (This was done for simplicity, one
could in theory work around the problems with lower overhead by managing
our own watchers).

Event::Lib also leaks file handles and memory and tends to just exit on
problems.

It also doesn't work around the Windows bug of not signalling TCP
connection failures.

Avoid Event::Lib if you can.

=cut

package AnyEvent::Impl::EventLib;

no warnings;
use strict;

use Carp ();
use AnyEvent ();
use Event::Lib;

sub io {
   my ($class, %arg) = @_;

   # work around these bugs in Event::Lib:
   # - adding a callback might destroy other callbacks
   # - only one callback per fd/poll combination
   my ($fh, $mode) = AnyEvent::_dupfh $arg{poll}, $arg{fh}, EV_READ, EV_WRITE;

   # event_new errornously takes a reference to fh and cb instead of making a copy
   # fortunately, going through %arg/_dupfh already makes a copy, so it happpens to work
   my $w = event_new $fh, $mode | EV_PERSIST, $arg{cb};
   $w->add;
   bless \\$w, $class
}

sub timer {
   my ($class, %arg) = @_;

   my $ival = $arg{interval};
   my $cb   = $arg{cb};

   my $w; $w = timer_new
                  $ival
                     ? sub { $w->add ($ival); &$cb }
                     : sub { $w->remove; undef $w; &$cb };

   $w->add ($arg{after} || 1e-10); # work around 0-bug in Event::Lib

   bless \\$w, $class
}

my %sigidx;

# horrid way to get signal name to value mapping
eval {
   local $SIG{__DIE__};
   require POSIX;

   for (keys %SIG) {
      eval "\$sigidx{$_} = &POSIX::SIG$_";
   }
};

sub signal {
   my ($class, %arg) = @_;

   my $w = signal_new $sigidx{$arg{signal}}, $arg{cb};
   $w->add;
   bless \\$w, $class
}

sub DESTROY {
   local $@;

   ${${$_[0]}}->remove;
}

sub one_event {
   event_one_loop;
}

1;

=head1 SEE ALSO

L<AnyEvent>, L<Event::Lib>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

