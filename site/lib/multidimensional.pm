package multidimensional;
{
  $multidimensional::VERSION = '0.010';
}
# ABSTRACT: disables multidmensional array emulation

{ use 5.008; }
use strict;
use warnings;

use Lexical::SealRequireHints 0.005;
use B::Hooks::OP::Check 0.19;
use XSLoader;

XSLoader::load(
    __PACKAGE__,
    # we need to be careful not to touch $VERSION at compile time, otherwise
    # DynaLoader will assume it's set and check against it, which will cause
    # fail when being run in the checkout without dzil having set the actual
    # $VERSION
    exists $multidimensional::{VERSION} ? ${ $multidimensional::{VERSION} } : (),
);


sub unimport { $^H |= 0x20000; $^H{+(__PACKAGE__)} = 1 }


sub import { delete $^H{+(__PACKAGE__)} }


1;

__END__
=pod

=encoding utf-8

=head1 NAME

multidimensional - disables multidmensional array emulation

=head1 VERSION

version 0.010

=head1 SYNOPSIS

    no multidimensional;

    $hash{1, 2};                # dies
    $hash{join($;, 1, 2)};      # doesn't die

=head1 DESCRIPTION

Perl's multidimensional array emultaion stems from the days before the
language had references, but these days it mostly serves to bite you
when you typo a hash slice by using the C<$> sigil instead of C<@>.

This module lexically makes using multidmensional array emulation a
fatal error at compile time.

=head1 METHODS

=head2 unimport

Disables multidimensional array emultaion for the remainder of the
scope being compiled.

=head2 import

Enables multidimensional array emulation for the remainder of the
scope being compiled;

=head1 SEE ALSO

L<perlvar/$;>,
L<B::Hooks::OP::Check>.

=head1 AUTHOR

Dagfinn Ilmari Mannsåker <ilmari@ilmari.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Dagfinn Ilmari Mannsåker.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

