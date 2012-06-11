package Win32::Detached;

use strict;
use Win32;
use Win32::Process;
use Cwd;

if(@ARGV and $ARGV[0] eq '-nolaunch') {
    shift;
} elsif(!$^C) {
    Win32::Process::Create(
        my $ProcessObj,
        $^X,
        join(" ", map { tr/ // ? qq["$_"] : $_ } $^X, $0, "-nolaunch", @ARGV),
        0,
        DETACHED_PROCESS,
        cwd,
    ) or die Win32::FormatMessage(Win32::GetLastError());
    exit;
}

1;