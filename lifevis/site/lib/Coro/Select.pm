=head1 NAME

Coro::Select - a (slow but coro-aware) replacement for CORE::select

=head1 SYNOPSIS

 use Coro::Select;          # replace select globally
 use Core::Select 'select'; # only in this module
 use Coro::Select ();       # use Coro::Select::select

=head1 DESCRIPTION

This module tries to create a fully working replacement for perl's
C<select> built-in, using C<AnyEvent> watchers to do the job, so other
coroutines can run in parallel to any select user. As many libraries that
only have a blocking API do not use global variables and often use select
(or IO::Select), this effectively makes most such libraries "somewhat"
non-blocking w.r.t. other coroutines.

To be effective globally, this module must be C<use>'d before any other
module that uses C<select>, so it should generally be the first module
C<use>'d in the main program.

You can also invoke it from the commandline as C<perl -MCoro::Select>.

Performance naturally isn't great, but unless you need very high select
performance you normally won't notice the difference.

=over 4

=cut

package Coro::Select;

use strict;

use Coro;
use AnyEvent;

use base Exporter::;

our $VERSION = 4.804;
our @EXPORT_OK = "select";

sub import {
   my $pkg = shift;
   if (@_) {
      $pkg->export (scalar caller 0, @_);
   } else {
      $pkg->export ("CORE::GLOBAL", "select");
   }
}

sub select(;*$$$) { # not the correct prototype, but well... :()
   if (@_ == 0) {
      return CORE::select
   } elsif (@_ == 1) {
      return CORE::select $_[0]
   } elsif (defined $_[3] && !$_[3]) {
      return CORE::select $_[0], $_[1], $_[2], $_[3]
   } else {
      my $current = $Coro::current;
      my $nfound = 0;
      my @w;
      # AnyEvent does not do 'e', so replace it by 'r'
      for ([0, 'r', '<'], [1, 'w', '>'], [2, 'r', '<']) {
         my ($i, $poll, $mode) = @$_;
         if (defined (my $vec = $_[$i])) {
            my $rvec = \$_[$i];
            for my $b (0 .. (8 * length $vec)) {
               if (vec $vec, $b, 1) {
                  (vec $$rvec, $b, 1) = 0;
                  open my $fh, "$mode&$b"
                     or die "Coro::Select::fd2fh($b): $!";
                  push @w,
                     AnyEvent->io (fh => $fh, poll => $poll, cb => sub {
                        (vec $$rvec, $b, 1) = 1;
                        $nfound++;
                        $current->ready;
                        undef $current;
                     });
               }
            }
         }
      }

      push @w,
         AnyEvent->timer (after => $_[3], cb => sub {
            $current->ready;
            undef $current;
         })
         if defined $_[3];

      # wait here
      &Coro::schedule;
      &Coro::schedule while $current;

      return $nfound
   }
}

1;

=back

=head1 SEE ALSO

L<Coro::LWP>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut


