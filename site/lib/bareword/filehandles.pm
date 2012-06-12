package bareword::filehandles;
BEGIN {
  $bareword::filehandles::VERSION = '0.003';
}
# ABSTRACT: disables bareword filehandles

{ use 5.008001; }
use strict;
use warnings;

use Lexical::SealRequireHints;
use B::Hooks::OP::Check;
use XSLoader;

XSLoader::load(
    __PACKAGE__,
    # we need to be careful not to touch $VERSION at compile time, otherwise
    # DynaLoader will assume it's set and check against it, which will cause
    # fail when being run in the checkout without dzil having set the actual
    # $VERSION
    exists $bareword::filehandles::{VERSION} ? ${ $bareword::filehandles::{VERSION} } : (),
);


sub unimport { $^H |= 0x20000; $^H{+(__PACKAGE__)} = 1 }


sub import { delete $^H{+(__PACKAGE__)} }


1;

__END__
=pod

=encoding utf-8

=head1 NAME

bareword::filehandles - disables bareword filehandles

=head1 VERSION

version 0.003

=head1 SYNOPSIS

    no bareword::filehandles;

    open FH, $file            # dies
    open my $fh, $file;       # doesn't die

    print FH $string          # dies
    print STDERR $string      # doesn't die

=head1 DESCRIPTION

This module lexically disables the use of bareword filehandles with
builtin functions, except for the special builitin filehandles C<STDIN>,
C<STDOUT>, C<STDERR>, C<ARGV>, C<ARGVOUT> and C<DATA>.

=head1 METHODS

=head2 unimport

Disables bareword filehandles for the remainder of the scope being
compiled.

=head2 import

Enables bareword filehandles for the remainder of the scope being
compiled.

=head1 SEE ALSO

L<perlfunc>,
L<B::Hooks::OP::Check>.

=head1 AUTHOR

Dagfinn Ilmari Mannsåker <ilmari@ilmari.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Dagfinn Ilmari Mannsåker.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

