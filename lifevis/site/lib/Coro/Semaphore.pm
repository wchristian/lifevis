=head1 NAME

Coro::Semaphore - non-binary semaphores

=head1 SYNOPSIS

 use Coro::Semaphore;

 $sig = new Coro::Semaphore [initial value];

 $sig->down; # wait for signal

 # ... some other "thread"

 $sig->up;

=head1 DESCRIPTION

This module implements counting semaphores. You can initialize a mutex
with any level of parallel users, that is, you can intialize a sempahore
that can be C<down>ed more than once until it blocks. There is no owner
associated with semaphores, so one coroutine can C<down> it while another
can C<up> it.

Counting semaphores are typically used to coordinate access to
resources, with the semaphore count initialized to the number of free
resources. Coroutines then increment the count when resources are added
and decrement the count when resources are removed.

=over 4

=cut

package Coro::Semaphore;

no warnings;

use Coro ();

$VERSION = 4.749;

=item new [inital count]

Creates a new sempahore object with the given initial lock count. The
default lock count is 1, which means it is unlocked by default. Zero (or
negative values) are also allowed, in which case the semaphore is locked
by default.

=cut

sub new {
   bless [defined $_[1] ? $_[1] : 1], $_[0];
}

=item $sem->count

Returns the current semaphore count.

=cut

sub count {
   $_[0][0]
}

=item $sem->adjust ($diff)

Atomically adds the amount given to the current semaphore count. If the
count becomes positive, wakes up any waiters. Does not block if the count
becomes negative, however.

=cut

sub adjust {
   # basically a weird copy of up
   if (($_[0][0] += $_[1]) > 0) {
      (shift @{$_[0][1]})->ready if @{$_[0][1]};
   }
}

=item $sem->down

Decrement the counter, therefore "locking" the semaphore. This method
waits until the semaphore is available if the counter is zero.

=item $status = $sem->timed_down ($timeout)

Like C<down>, but returns false if semaphore couldn't be acquired within
$timeout seconds, otherwise true.

=cut

sub down {
   while ($_[0][0] <= 0) {
      push @{$_[0][1]}, $Coro::current;
      &Coro::schedule;
   }
   --$_[0][0];
}

sub timed_down {
   require Coro::Timer;
   my $timeout = Coro::Timer::timeout ($_[1]);

   while ($_[0][0] <= 0) {
      push @{$_[0][1]}, $Coro::current;
      &Coro::schedule;
      if ($timeout) {
         # ugly as hell. slow, too, btw!
         for (0..$#{$_[0][1]}) {
            if ($_[0][1][$_] == $Coro::current) {
               splice @{$_[0][1]}, $_, 1;
               return;
            }
         }
         die;
      }
   }

   --$_[0][0];
   return 1;
}

=item $sem->up

Unlock the semaphore again.

=cut

sub up {
   if (++$_[0][0] > 0) {
      (shift @{$_[0][1]})->ready if @{$_[0][1]};
   }
}

=item $sem->try

Try to C<down> the semaphore. Returns true when this was possible,
otherwise return false and leave the semaphore unchanged.

=cut

sub try {
   if ($_[0][0] > 0) {
      --$_[0][0];
      return 1;
   } else {
      return 0;
   }
}

=item $sem->waiters

In scalar context, returns the number of coroutines waiting for this
semaphore.

=cut

sub waiters {
   @{$_[0][1]};
}

=item $guard = $sem->guard

This method calls C<down> and then creates a guard object. When the guard
object is destroyed it automatically calls C<up>.

=item $guard = $sem->timed_guard ($timeout)

Like C<guard>, but returns undef if semaphore couldn't be acquired within
$timeout seconds, otherwise the guard object.

=cut

sub guard {
   &down;
   # double indirection because bless works on the referenced
   # object, not (only) on the reference itself.
   bless \\$_[0], Coro::Semaphore::guard::;
}

sub timed_guard {
   &timed_down
      ? bless \\$_[0], Coro::Semaphore::guard::
      : ();
}

sub Coro::Semaphore::guard::DESTROY {
   &up(${${$_[0]}});
}

=back

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

1

