=head1 NAME

AnyEvent::Impl::Tk - AnyEvent adaptor for Tk

=head1 SYNOPSIS

   use AnyEvent;
   use Tk;
  
   # this module gets loaded automatically as required

=head1 DESCRIPTION

This module provides transparent support for AnyEvent. You don't have to
do anything to make Tk work with AnyEvent except by loading Tk before
creating the first AnyEvent watcher.

Tk is buggy. Tk is extremely buggy. Tk is so unbelievably buggy that
for each bug reported and fixed, you get one new bug followed by
reintroduction of the old bug in a later revision. I regularly run out of
words to describe how bad it really is.

To work around the many, many bugs in Tk that don't get fixed, this
adaptor dup()'s all filehandles that get passed into its I/O watchers,
so if you register a read and a write watcher for one fh, AnyEvent will
create two additional file descriptors (and handles).

This creates a high overhead and is slow, but seems to work around all
known bugs in L<Tk::fileevent> on 32 bit architectures (Tk seems to be
terminally broken on 64 bit).

To be able to access the Tk event loop, this module creates a main
window and withdraws it immediately. This might cause flickering on some
platforms, but Tk perversely requires a window to be able to wait for file
handle readyness notifications. This window is always created (in this
version of AnyEvent) and can be accessed as C<$AnyEvent::Impl::Tk::mw>.

=cut

package AnyEvent::Impl::Tk;

no warnings;
use strict;

use AnyEvent ();

use Tk ();

our $mw = new MainWindow;
$mw->withdraw;

sub io {
   my (undef, %arg) = @_;

   # work around these bugs in Tk:
   # - removing a callback will destroy other callbacks
   # - removing a callback might crash
   # - adding a callback might destroy other callbacks
   # - only one callback per fh
   # - only one callback per fh/poll combination
   my ($fh, $tk) = AnyEvent::_dupfh $arg{poll}, $arg{fh}, "readable", "writable";

   $mw->fileevent ($fh, $tk => $arg{cb});

   bless [$fh, $tk], AnyEvent::Impl::Tk::Io::
}

sub AnyEvent::Impl::Tk::Io::DESTROY {
   my ($fh, $tk) = @{$_[0]};

   # work around another bug: watchers don't get removed when
   # the fh is closed contrary to documentation. also, trying
   # to unregister a read callback will make it impossible
   # to remove the write callback.
   $mw->fileevent ($fh, $tk => "");
}

sub timer {
   my (undef, %arg) = @_;
   
   my $cb = $arg{cb};

   my $self = bless \\$cb, AnyEvent::Impl::Tk::Timer::;

   if ($arg{interval}) {
      my $ival = $arg{interval} * 1000;
      my $rcb; $rcb = sub {
         if ($cb) {
            $mw->after ($ival, $rcb);
            &$cb;
         }
      };
      $mw->after ($arg{after} * 1000, $rcb);
   } else {
      $mw->after ($arg{after} * 1000, sub {
         &$cb if $cb;
      });
   }

   $self
}

sub AnyEvent::Impl::Tk::Timer::DESTROY {
   $${$_[0]} = undef;
}

sub one_event {
   Tk::DoOneEvent (0);
}

1;

=head1 SEE ALSO

L<AnyEvent>, L<Tk>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut


