=head1 NAME

Coro::AnyEvent - integrate coroutines into AnyEvent

=head1 SYNOPSIS

 use Coro;
 use Coro::AnyEvent;

 # use coro within an AnyEvent environment

=head1 INTRODUCTION

When one naively starts to use coroutines in Perl, one will quickly run
into the problem that coroutines that block on a syscall (sleeping,
reading from a socket etc.) will block all coroutines.

If one then uses an event loop, the problem is that the event loop has
no knowledge of coroutines and will not run them before it polls for new
events, again blocking the whole process.

This module integrates coroutines into any event loop supported by
AnyEvent, combining event-based programming with coroutine-based
programming in a natural way.

All you have to do is C<use Coro::AnyEvent> and then you can run a
coroutines freely.

=head1 DESCRIPTION

This module autodetects the event loop used (by relying on L<AnyEvent>)
and will either automatically defer to the high-performance L<Coro::EV> or
L<Coro::Event> modules, or will use a generic integration into any event
loop supported by L<AnyEvent>.

Unfortunately, few event loops (basically only L<EV> and L<Event>) support
this kind of integration well, and therefore AnyEvent cannot offer the
required functionality.

Here is what this module does when it has to work with other event loops:

=over 4

=item * run ready coroutines before blocking the process

Each time a coroutine is put into the ready queue (and there are no other
coroutines in the ready queue), a timer with an C<after> value of C<0> is
registered with AnyEvent.

This creates something similar to an I<idle> watcher, i.e. a watcher
that keeps the event loop from blocking but still polls for new
events. (Unfortunately, some badly designed event loops (e.g. Event::Lib)
don't support a timeout of C<0> and will always block for a bit).

The callback for that timer will C<cede> to other coroutines of the same
or higher priority for as long as such coroutines exists. This has the
effect of running all coroutines that have work to do will all coroutines
block to wait for external events.

If no coroutines of equal or higher priority are ready, it will cede
to any coroutine, but only once. This has the effect of running
lower-priority coroutines as well, but it will not keep higher priority
coroutines from receiving new events.

The priority used is simply the priority of the coroutine that runs the
event loop, usually the main program, and the priority is usually C<0>.

=item * provide a suitable idle callback.

In addition to hooking into C<ready>, this module will also provide a
C<$Coro::idle> handler that runs the event loop. It is best not to rely on
this, as this is rather inefficient.

=item * provide overrides for AnyEvent's condvars

This module installs overrides for AnyEvent's condvars. That is, when
the module is loaded it will provide its own condition variables. This
makes the coroutine-safe, i.e. you can safely block on them from within a
coroutine.

=item * lead to data corruption or worse

As C<unblock_sub> cannot be by this module (as it is the module that
implements it, basically), you must not call into the event loop
recursively from any coroutine. This is not usually a difficult
restriction to live with, just use condvars, C<unblock_sub> or other means
of inter-coroutine-communications.

If you use a module that supports AnyEvent (or uses the same event loop
as AnyEvent, making the compatible), and it offers callbacks of any kind,
then you must not block in them, either (or use e.g. C<unblock_sub>), see
the description of C<unblock_sub> in the L<Coro> module.

This also means that you should load the module as early as possible,
as only condvars created after this module has been loaded will work
correctly.

=back

=cut

package Coro::AnyEvent;

no warnings;
use strict;

use Coro;
use AnyEvent ();

our $VERSION = 4.91;

#############################################################################
# idle handler

our $IDLE;

#############################################################################
# 0-timeout idle emulation watcher

our $ACTIVITY;

sub _activity {
   $ACTIVITY ||= AnyEvent->timer (after => 0, cb => \&_schedule);
}

Coro::_set_readyhook (\&AnyEvent::detect);

AnyEvent::post_detect {
   unshift @AnyEvent::CondVar::ISA, "Coro::AnyEvent::CondVar";

   Coro::_set_readyhook undef;

   my $model = $AnyEvent::MODEL;

   if ($model eq "AnyEvent::Impl::EV") {
      require Coro::EV;
   } elsif ($model eq "AnyEvent::Impl::Event") {
      require Coro::Event;
   } else {
      Coro::_set_readyhook \&_activity;

      $IDLE = new Coro sub {
         while () {
            AnyEvent->one_event;
            &Coro::schedule;
         }
      };
      $IDLE->{desc} = "[AnyEvent idle process]";

      $Coro::idle = sub {
         local $ACTIVITY = 1; # hack to keep it from being set by the ready call
         $IDLE->ready;
      };
   }
};

#############################################################################
# override condvars

package Coro::AnyEvent::CondVar;

sub _send {
   (delete $_[0]{_ae_coro})->ready if $_[0]{_ae_coro};
}

sub _wait {
   while (!$_[0]{_ae_sent}) {
      local $_[0]{_ae_coro} = $Coro::current;
      Coro::schedule;
   }
}

1;

=head1 SEE ALSO

L<AnyEvent>, to see which event loops are supported, L<Coro::EV> and
L<Coro::Event> for more efficient and more correct solutions (they will be
used automatically if applicable).

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

