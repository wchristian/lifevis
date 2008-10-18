package Lifevis::Launcher;
use 5.010;
use strict;
use warnings;

use lib '.';
use lib '..';

my $detached = 0;

if ( !grep( m/-console/, @ARGV ) and !grep( m/-modelgen/, @ARGV ) and !grep( m/-vtableconv/, @ARGV ) ) {
    require Win32::Detached;
    open STDERR, '>>error.txt';
    open STDOUT, '>>log.txt';
    $detached = 1;
}

if ( grep( m/-viewer/, @ARGV ) ) {
    require Lifevis::Viewer;
    Lifevis::Viewer->set_detached($detached);
    Lifevis::Viewer->run();
}

if ( grep( m/-modelgen/, @ARGV ) ) {
    require Lifevis::ModelGen;
    Lifevis::ModelGen->run();
    say "Press Enter to close.";
    my $in = <STDIN>;
}

if ( grep( m/-vtableconv/, @ARGV ) ) {
    require Lifevis::VtableConv;
    Lifevis::VtableConv->run();
    say "Press Enter to close.";
    my $in = <STDIN>;
}

