=head1 NAME

Coro::SemaphoreSet - hash of semaphores.

=head1 SYNOPSIS

 use Coro::SemaphoreSet;

 $sig = new Coro::SemaphoreSet [initial value];

 $sig->down("semaphoreid"); # wait for signal

 # ... some other "thread"

 $sig->up("semaphoreid");

=head1 DESCRIPTION

This module implements sets of counting semaphores (see
L<Coro::Semaphore>). It is nothing more than a hash with normal semaphores
as members, but is more efficiently managed.

This is useful if you want to allow parallel tasks to run in parallel but
not on the same problem. Just use a SemaphoreSet and lock on the problem
identifier.

=over 4

=cut

package Coro::SemaphoreSet;

use strict qw(vars subs);
no warnings;

our $VERSION = "5.0";

use Coro::Semaphore ();

=item new [inital count]

Creates a new semaphore set with the given initial lock count for each
individual semaphore. See L<Coro::Semaphore>.

=cut

sub new {
   bless [defined $_[1] ? $_[1] : 1], $_[0];
}

=item $semset->down ($id)

Decrement the counter, therefore "locking" the named semaphore. This
method waits until the semaphore is available if the counter is zero.

=cut

sub down {
   package Coro::Semaphore;
   down ($_[0][1]{$_[1]} ||= new undef, $_[0][0]);
}

#ub timed_down {
#  require Coro::Timer;
#  my $timeout = Coro::Timer::timeout ($_[2]);
#
#  while () {
#     my $sem = ($_[0][1]{$_[1]} ||= [$_[0][0]]);
#
#     if ($sem->[0] > 0) {
#        --$sem->[0];
#        return 1;
#     }
#
#     if ($timeout) {
#        # ugly as hell.
#        for (0..$#{$sem->[1]}) {
#           if ($sem->[1][$_] == $Coro::current) {
#              splice @{$sem->[1]}, $_, 1;
#              return 0;
#           }
#        }
#        die;
#     }
#
#     push @{$sem->[1]}, $Coro::current;
#     &Coro::schedule;
#  }
#

=item $semset->up ($id)

Unlock the semaphore again. If the semaphore then reaches the default
count for this set and has no waiters, the space allocated for it will be
freed.

=cut

sub up {
   my ($self, $id) = @_;

   package Coro::Semaphore;
   my $sem = $self->[1]{$id} ||= new undef, $self->[0];

   up $sem;

   delete $self->[1]{$id} if $self->[0] == count $sem and !waiters $sem;
}

=item $semset->try

Try to C<down> the semaphore. Returns true when this was possible,
otherwise return false and leave the semaphore unchanged.

=cut

sub try {
   package Coro::Semaphore;
   try ($_[0][1]{$_[1]} ||= new undef, $_[0][0]);
}

=item $guard = $semset->guard ($id)

This method calls C<down> and then creates a guard object. When the guard
object is destroyed it automatically calls C<up>.

=cut

sub guard {
   &down;
   bless [@_], Coro::SemaphoreSet::guard::;
}

#ub timed_guard {
#  &timed_down
#     ? bless [$_[0], $_[1]], Coro::SemaphoreSet::guard::
#     : ();
#

sub Coro::SemaphoreSet::guard::DESTROY {
   up @{$_[0]};
}

=item $semaphore = $semset->sem ($id)

This SemaphoreSet version is based on Coro::Semaphore's. This function
creates (if necessary) the underlying Coro::Semaphore object and returns
it. You may legally call any Coro::Semaphore method on it, but note that
calling C<< $semset->up >> can invalidate the returned semaphore.

=cut

sub sem {
   package Coro::Semaphore;
   $_[0][1]{$_[1]} ||= new undef, $_[0][0]
}

1;

=back

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

