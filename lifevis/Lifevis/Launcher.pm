package Lifevis::Launcher;
use 5.010;
use strict;
use warnings;
use lib '.';
use lib '..';


if ( !grep(m/-console/, @ARGV) and !grep(m/-modelgen/, @ARGV) ) {
    require Win32::Detached;
    open STDERR, '>>error.txt';
    open STDOUT, '>>log.txt';
}

if ( grep(m/-viewer/, @ARGV) ) {
    use Lifevis::Viewer;
    Lifevis::Viewer->run();
}

if ( grep(m/-modelgen/, @ARGV) ) {
    use Lifevis::ModelGen;
    Lifevis::ModelGen->run();
    say "Press Enter to close.";
    my $in = <STDIN>;
}



