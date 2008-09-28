=head1 NAME

Coro::Storable - offer a more fine-grained Storable interface

=head1 SYNOPSIS

 use Coro::Storable;

=head1 DESCRIPTION

This module implements a few functions from the Storable module in a way
so that it cede's more often. Some applications (such as the Deliantra
game server) sometimes need to load large Storable objects without
blocking the server for a long time.

This is being implemented by using a perlio layer that feeds only small
amounts of data (512 bytes per call) into Storable, and C<Coro::cede>'ing
regularly (at most 100 times per second by default, though).

As it seems that Storable is not reentrant, this module also wraps most
functions of the Storable module so that only one freeze or thaw is done
at any one moment (recursive invocations are not currently supported).

=head1 FUNCTIONS

=over 4

=item $ref = thaw $pst

Retrieve an object from the given $pst, which must have been created with
C<Coro::Storable::freeze> or C<Storable::store_fd>/C<Storable::store>
(sorry, but Storable uses incompatible formats for disk/mem objects).

This works by calling C<Coro::cede> for every 4096 bytes read in.

=item $pst = freeze $ref

Freeze the given scalar into a Storable object. It uses the same format as
C<Storable::store_fd>.

This works by calling C<Coro::cede> for every write that Storable
issues. Unfortunately, Storable often makes many very small writes, so it
is rather inefficient. But it does keep the latency low.

=item $pst = nfreeze $ref

Same as C<freeze> but is compatible to C<Storable::nstore_fd> (note the
C<n>).

=item $pst = blocking_freeze $ref

Same as C<freeze> but is guaranteed to block. This is useful e.g. in
C<Coro::Util::fork_eval> when you want to serialise a data structure
for use with the C<thaw> function for this module. You cannot use
C<Storable::freeze> for this as Storable uses incompatible formats for
memory and file images.

=item $pst = blocking_nfreeze $ref

Same as C<blocking_freeze> but uses C<nfreeze> internally.

=item $guard = guard

Acquire the Storable lock, for when you want to call Storable yourself.

Note that this module already wraps the Storable functions, so there is
rarely the need to do this yourself.

=back

=cut

package Coro::Storable;

use strict qw(subs vars);
no warnings;

use Coro ();
use Coro::Semaphore ();

BEGIN {
   # suppress warnings
   local $^W = 0;
   require Storable;
}

use Storable;
use base "Exporter";

our $VERSION = 4.747;
our @EXPORT = qw(thaw freeze nfreeze blocking_thaw blocking_freeze blocking_nfreeze);

my $lock = new Coro::Semaphore;

sub guard {
   $lock->guard
}

# wrap xs functions
for (qw(net_pstore mstore net_mstore pretrieve mretrieve dclone)) {
   my $orig = \&{"Storable::$_"};
   *{"Storable::$_"} = sub {
      my $guard = $lock->guard;
      &$orig
   };
   die if $@;
}

sub thaw($) {
   open my $fh, "<:via(CoroCede)", \$_[0]
      or die "cannot open pst via CoroCede: $!";
   Storable::fd_retrieve $fh
}

sub freeze($) {
   open my $fh, ">:via(CoroCede)", \my $buf
      or die "cannot open pst via CoroCede: $!";
   Storable::store_fd $_[0], $fh;
   $buf
}

sub nfreeze($) {
   open my $fh, ">:via(CoroCede)", \my $buf
      or die "cannot open pst via CoroCede: $!";
   Storable::nstore_fd $_[0], $fh;
   $buf
}

sub blocking_thaw($) {
   open my $fh, "<", \$_[0]
      or die "cannot open pst: $!";
   Storable::fd_retrieve $fh
}

sub blocking_freeze($) {
   open my $fh, ">", \my $buf
         or die "cannot open pst: $!";
   Storable::store_fd $_[0], $fh;
   close $fh;

   $buf
}

sub blocking_nfreeze($) {
   open my $fh, ">", \my $buf
         or die "cannot open pst: $!";
   Storable::nstore_fd $_[0], $fh;
   close $fh;

   $buf
}

package PerlIO::via::CoroCede;

# generic cede-on-read/write filtering layer

use Time::HiRes ("time");

our $GRANULARITY = 0.02;

my $next_cede;

sub PUSHED {
   __PACKAGE__
}

sub FILL {
   if ($next_cede <= time) {
      $next_cede = time + $GRANULARITY; # calling time() twice usually is a net win
      local *Storable::FILE;
      Coro::cede ();
   }

   read $_[1], my $buf, 512
      or return undef;

   $buf
}

sub WRITE {
   if ($next_cede <= time) {
      $next_cede = time + $GRANULARITY;
      local *Storable::FILE;
      Coro::cede ();
   }

   (print {$_[2]} $_[1]) ? length $_[1] : -1
}

1;

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut


