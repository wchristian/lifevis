package Lifevis::VtableConv;
use 5.010;
use strict;

__PACKAGE__->run(@ARGV) unless caller();

sub run {
    open my $DAT, "<", "documents/objtree.txt" or die( "horribly: " . $! );
    my @raw_data = <$DAT>;
    close $DAT;

    my $address_found;
    my $address;
    my %vtables;

    for my $line (@raw_data) {
        if ( $line =~ m/^([0-9A-F]+?)h: possible vtable/ ) {
            $address       = hex($1);
            $address_found = 1;
        }
        if ( $line !~ m/::/ && $line !~ m/</ && $line =~ m/^0000: ([^ ]+?)$/ && $address_found ) {
            $vtables{$address} = $1;
            $address_found = 0;
        }
    }

    use Data::Dumper;

    my $code = Dumper( \%vtables );
    $code =~ s/\$VAR1/my \%vtables/;

    my $export_constants = ' ';
    for my $address ( keys %vtables ) {
        $export_constants .= "$vtables{$address} ";
    }

    my $enum = "use enum qw( ";
    for my $address ( keys %vtables ) {
        $enum .= "$vtables{$address}=$address ";
    }
    $enum .= " );";

    open my $OUT, ">", 'Lifevis\Vtables.pm' or die( "horribly: " . $! );
    print $OUT "package Lifevis::Vtables;
    use strict;
    
    use base 'Exporter';
    
    our \@EXPORT = ( qw( get_vtables $export_constants ) );
    
    $code
    
    
    sub get_vtables {
        return \%vtables;
    }
    
    $enum
    
    1;
    ";
    close $OUT;
}

1;
