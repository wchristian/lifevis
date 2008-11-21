=head1 NAME

Coro::Channel - message queues

=head1 SYNOPSIS

 use Coro::Channel;

 $q1 = new Coro::Channel <maxsize>;

 $q1->put ("xxx");
 print $q1->get;

 die unless $q1->size;

=head1 DESCRIPTION

A Coro::Channel is the equivalent of a pipe: you can put things into it on
one end and read things out of it from the other hand. If the capacity of
the Channel is maxed out writers will block. Both ends of a Channel can be
read/written from as many coroutines as you want.

=over 4

=cut

package Coro::Channel;

use strict qw(vars subs);
no warnings;

use Coro ();
use Coro::Semaphore ();

our $VERSION = "5.0";

sub DATA (){ 0 }
sub SGET (){ 1 }
sub SPUT (){ 2 }

=item $q = new Coro:Channel $maxsize

Create a new channel with the given maximum size (unlimited if C<maxsize>
is omitted). Giving a size of one gives you a traditional channel, i.e.
a queue that can store only a single element (which means there will be
no buffering, and C<put> will wait until there is a corresponding C<get>
call). To buffer one element you have to specify C<2>, and so on.

=cut

sub new {
   # we cheat and set infinity == 10**9
   bless [
      [],
      (Coro::Semaphore::_alloc 0),
      (Coro::Semaphore::_alloc +($_[1] || 1_000_000_000) - 1),
   ]
}

=item $q->put ($scalar)

Put the given scalar into the queue.

=cut

sub put {
   push @{$_[0][DATA]}, $_[1];
   Coro::Semaphore::up   $_[0][SGET];
   Coro::Semaphore::down $_[0][SPUT];
}

=item $q->get

Return the next element from the queue, waiting if necessary.

=cut

sub get {
   Coro::Semaphore::down $_[0][SGET];
   Coro::Semaphore::up   $_[0][SPUT];
   shift @{$_[0][DATA]}
}

=item $q->size

Return the number of elements waiting to be consumed. Please note that:

  if ($q->size) {
     my $data = $q->get;
  }

is NOT a race condition but works fine.

=cut

sub size {
   scalar @{$_[0][DATA]}
}

1;

=back

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

