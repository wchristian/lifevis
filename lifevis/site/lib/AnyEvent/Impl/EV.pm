=head1 NAME

AnyEvent::Impl::EV - AnyEvent adaptor for EV

=head1 SYNOPSIS

   use AnyEvent;
   use EV;
  
   # this module gets loaded automatically as required

=head1 DESCRIPTION

This module provides transparent support for AnyEvent. You don't have to
do anything to make EV work with AnyEvent except by loading EV before
creating the first AnyEvent watcher.

=cut

package AnyEvent::Impl::EV;

no warnings;
use strict;

use EV;

sub time { EV::time }
sub now  { EV::now  }

sub timer {
   my ($class, %arg) = @_;

   EV::timer $arg{after}, $arg{interval}, $arg{cb}
}

sub io {
   my ($class, %arg) = @_;

   my $cb = $arg{cb};

   EV::io
      fileno $arg{fh},
      $arg{poll} eq "r" ? EV::READ : EV::WRITE,
      $cb
}

sub signal {
   my ($class, %arg) = @_;

   EV::signal $arg{signal}, $arg{cb}
}

sub child {
   my ($class, %arg) = @_;

   my $cb = $arg{cb};

   EV::child $arg{pid}, 0, sub {
      $cb->($_[0]->rpid, $_[0]->rstatus);
   }
}

sub one_event {
   EV::loop EV::LOOP_ONESHOT;
}

1;

=head1 SEE ALSO

L<AnyEvent>, L<EV>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

