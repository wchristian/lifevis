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
one end end read things out of it from the other hand. If the capacity of
the Channel is maxed out writers will block. Both ends of a Channel can be
read/written from as many coroutines as you want.

=over 4

=cut

package Coro::Channel;

use strict qw(vars subs);
no warnings;

use Coro ();

our $VERSION = 4.804;

=item $q = new Coro:Channel $maxsize

Create a new channel with the given maximum size (unlimited if C<maxsize>
is omitted). Giving a size of one gives you a traditional channel, i.e. a
queue that can store only a single element (which means there will be no
buffering). To buffer one element you have to specify C<2>, and so on.

=cut

sub new {
   # [\@contents, [$getwait], $maxsize, [$putwait]];
   bless [[], [], $_[1] || (1e30),[]], $_[0];
}

=item $q->put ($scalar)

Put the given scalar into the queue.

=cut

sub put {
   push @{$_[0][0]}, $_[1];
   (pop @{$_[0][1]})->ready if @{$_[0][1]};

   while (@{$_[0][0]} >= $_[0][2]) {
      push @{$_[0][3]}, $Coro::current;
      &Coro::schedule;
   }
}

=item $q->get

Return the next element from the queue, waiting if necessary.

=item $q->timed_get ($timeout)

Return the next element from the queue, waiting up to C<$timeout> seconds
if necessary. If no element arrives within the given time an empty list
will be returned.

=cut

sub get {
   while (!@{$_[0][0]}) {
      push @{$_[0][1]}, $Coro::current;
      &Coro::schedule;
   }

   (pop @{$_[0][3]})->ready if @{$_[0][3]};
   shift @{$_[0][0]}
}

sub timed_get {
   require Coro::Timer;
   my $timeout = Coro::Timer::timeout ($_[0]);

   (pop @{$_[0][3]})->ready if @{$_[0][3]};

   while (!@{$_[0][0]}) {
      push @{$_[0][1]}, $Coro::current;
      &Coro::schedule;
      return if $timeout;
   }

   shift @{$_[0][0]}
}

=item $q->size

Return the number of elements waiting to be consumed. Please note that:

  if ($q->size) {
     my $data = $q->get;
  }

is NOT a race condition but works fine.

=cut

sub size {
   scalar @{$_[0][0]}
}

1;

=back

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

