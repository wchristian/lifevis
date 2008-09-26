use strict;
use warnings;

=head1 NAME

Win32::Process::Info::NT - Provide process information via NT-native calls.

=head1 SYNOPSIS


This package fetches process information on a given Windows
machine, using Microsoft Windows NT's native process
information calls.

 use Win32::Process::Info
 $pi = Win32::Process::Info->new (undef, 'NT');
 $pi->Set (elapsed_as_seconds => 0);	# In clunks, not seconds.
 @pids = $pi->ListPids ();	# Get all known PIDs
 @info = $pi->GetProcInfo ();	# Get the max

CAVEAT USER:

This package does not support access to a remote machine,
because the underlying API doesn't. If you specify a machine
name (other than '', 0, or undef) when you instantiate a
new Win32::Process::Info::NT object, you will get an exception.

This package is B<not> intended to be used independently;
instead, it is a subclass of Win32::Process::Info, and should
only be called via that package.

=head1 DESCRIPTION

The main purpose of the Win32::Process::Info package is to get whatever
information is convenient (for the author!) about one or more Windows
32 processes. GetProcInfo (which see) is therefore the most-important
subroutine in the package. See it for more information.

Unless explicitly stated otherwise, modules, variables, and so
on are considered private. That is, the author reserves the right
to make arbitrary changes in the way they work, without telling
anyone. For subroutines, variables, and so on which are considered
public, the author will make an effort keep them stable, and failing
that to call attention to changes.

Nothing is exported by default, though all the public subroutines are
exportable, either by name or by using the :all tag.

The following subroutines should be considered public:

=over 4

=cut

package Win32::Process::Info::DummyRoutine;

#	The purpose of this is to provide a dummy Call
#	method for those cases where we might not be able
#	to map a subroutine.

sub new {
my $class = shift;
$class = ref $class if ref $class;
my $self = {};
bless $self, $class;
return $self;
}

sub Call {
return undef;
}

# 0.010	02-Sep-2002	T. R. Wyant
#		Initial release under this name.
#
# 0.011	14-Sep-2002	T. R. Wyant
#		Increment version.
#
#	30-Oct-2002	T. R. Wyant
#		Fix warning when -w in effect. Fix provided by Judy
#		Hawkins (of Pitney Bowes, according to her mailing
#		address), and accepted with thanks.
#
# 0.012	11-Nov-2002	T. R. Wyant
#		Increment version.
#		Pick up username info.
#
#	12-Nov-2002	T. R. Wyant
#		Change 'new' argument to a hash. This method wasn't
#			marked private, but neither is it in the POD.
#		Reject hashes with keys other than variant.
#
#	21-Nov-2002	T. R. Wyant
#		Set SeDebugPrivilege on instantiation.
#		Replace "sub" manifest constants with "use constant".
#		Retry OpenProcess in (apparently futile) attempt to
#			get at lest _some_ information when it's
#			not all available.
#		GetProcInfo now returns all PIDs requested, even if
#			the process handle could not be opened. This
#			is what the documentation has said it did all
#			along, but was not what it actually did.
#
#	05-Dec-2002	T. R. Wyant
#		Discovered Win32API::Registry::AllowPriv. Used that
#			instead of my own Win32::API method to set
#			the privilege (when you care enough to steal
#			the very best). My own method preserved after
#			the __END__ directive as a monument to - well,
#			something.
#
# 0.013	13-Mar-2003	T. R. Wyant
#		Changed dependencies in Makefile.pl. See Info.pm for
#			more information.
#		Made Win32API::Registry optional; if not found, just
#			don't set SeDebugPrivilege.
#
# 0.013_23 26-Jun-2003	T. R. Wyant
#		Added optional first hashref argument to GetProcInfo,
#			used no_user_info key to bypass user info. This
#			was to be consistent with the WMI variant; the
#			reason for adding this to WMI doesn't exist for
#			this variant.
#
# 0.014	27-Jun-2003	T. R. Wyant
#		Released.
#
# 0.014_01 25-Jul-2003	T. R. Wyant
#		Added hash argument assert_debug_priv to 'new' method.
#			It's ignored, though, since this variant
#			always asserts debug.
#
# 1.000 09-Oct-2003	T. R. Wyant
#		When the only thing you've fixed in the last two months
#			is the docs, it's time to call it production
#			code. And if _that_ statement doesn't flush
#			out more problems, nothing will.
#
# 1.005 15-Mar-2005	T. R. Wyant
#		Move assertion of seDebugPriv to the point where we
#		discover we can require Win32API::Registry, since we
#		don't need to do it but once for the process (not once
#		per instantiation of the object), and we don't leak
#		token handles this way.
# 1.005_01 08-Mar-2007	T. R. Wyant
#		Fix code in synopsis.
#		Remove reference to 'use_wmi_names' in documentation.
# 1.006 11-Jan-2007 T. R. Wyant
#		Released above changes.
# 1.007 22-Aug-2007 T. R. Wyant
#		Updated copyright notice and license.

package Win32::Process::Info::NT;

use base qw{Win32::Process::Info};
use vars qw{$VERSION};
$VERSION = '1.007';

use vars qw {
    $AdjustTokenPrivileges
    $CloseHandle
    $elapsed_in_seconds
    $EnumProcesses
    $EnumProcessModules
    $FileTimeToSystemTime
    $GetCurrentProcess
    $GetModuleFileNameEx
    $GetPriorityClass
    $GetProcessAffinityMask
    $GetProcessIoCounters
    $GetProcessWorkingSetSize
    $GetProcessTimes
    $GetProcessVersion
    $GetTokenInformation
    $LookupAccountSid
    $LookupPrivilegeValue
    $OpenProcess
    $OpenProcessToken
    $VERSION
    };
use Carp;
use File::Basename;
use Win32;
use Win32::API;

my $setpriv;
eval {
    require Win32API::Registry and
    $setpriv = sub {
	Win32API::Registry::AllowPriv (
	    Win32API::Registry::SE_DEBUG_NAME (), 1)
	};
    };
$setpriv ||= sub {};
##0.013 use Win32API::Registry qw{:Func :SE_};


my %_transform = (
	CreationDate => \&Win32::Process::Info::_date_to_time_t,
	KernelModeTime => \&Win32::Process::Info::_clunks_to_desired,
	UserModeTime => \&Win32::Process::Info::_clunks_to_desired,
	);

sub _map {
return Win32::API->new (@_) ||
    croak "Error - Failed to map $_[1] from $_[0]: $^E";
}

sub _map_opt {
return Win32::API->new (@_) ||
    Win32::Process::Info::DummyRoutine->new ();
}

my %lglarg = map {($_, 1)} qw{assert_debug_priv variant};

sub new {
my $class = shift;
$class = ref $class if ref $class;
croak "Error - Win32::Process::Info::NT is unsupported under this flavor of Windows."
    unless Win32::IsWinNT ();
my $arg = shift;
if (ref $arg eq 'HASH') {
    my @ilg = grep {!$lglarg{$_}} keys %$arg;
    @ilg and
	croak "Error - Win32::Process::Info::NT argument(s) (@ilg) illegal";
    }
  else {
    croak "Error - Win32::Process::Info::NT does not support remote operation."
	if $arg;
    }
my $self = {%Win32::Process::Info::static};
delete $self->{variant};
$self->{_xfrm} = \%_transform;
bless $self, $class;
# We want to fail silently, since that's probably better than nothing.
##0.013	AllowPriv (SE_DEBUG_NAME, 1)
$setpriv->() if $setpriv;	##0.013 ##1.005
$setpriv = undef;		##1.005
##    or croak "Error - Failed to (try to) assert privilege @{[
##	SE_DEBUG_NAME]}; $^E"
    ;
return $self;
}


=item @info = $pi->GetProcInfo ();

This method returns a list of anonymous hashes, each containing
information on one process. If no arguments are passed, the
list represents all processes in the system. You can pass a
list of process IDs, and get out a list of the attributes of
all such processes that actually exist. If you call this
method in scalar context, you get a reference to the list.

What keys are available depend on the variant in use. With the NT
variant you can hope to get at least the following keys for a "normal"
process (i.e. not the idle process, which is PID 0, nor the system,
which is _usually_ PID 8) to which you have access:

    CreationDate
    ExecutablePath
    KernelModeTime
    MaximumWorkingSetSize
    MinimumWorkingSetSize
    Name (generally the name of the executable file)
    OtherOperationCount
    OtherTransferCount (= number of bytes transferred)
    ProcessId
    ReadOperationCount
    ReadTransferCount (= number of bytes read)
    UserModeTime
    WriteOperationCount
    WriteTransferCount (= number of bytes read)

All returns are Perl scalars. The I/O statistic keys represent counts
if named *OperationCount, or bytes if named *TransferCount.

Note that:

- The I/O statistic keys will only be present on Windows 2000.

- The MinimumWorkingSetSize and MaximumWorkingSetSize keys have
no apparent relationship to the amount of memory actually
consumed by the process.

The output will contain all processes for which information was
requested, but will not necessarily contain all information for
all processes.

The _status key of the process hash contains the status of
GetProcInfo's request(s) for information. If all information is
present, the status element of the hash will be zero. If there
was any problem getting any of the information, the _status element
will contain the Windows error code ($^E + 0, to be precise). You
might want to look at it - or not count on the hashes being fully
populated (or both!).

Note that GetProcInfo is not, at the moment, able to duplicate the
information returned by the resource kit tool pulist.exe. And it may
never do so. Pulist.exe relies on the so-called internal APIs, which
for NT are found in ntdll.dll, which may not be linked against.
Pulist.exe gets around this by loading it at run time, and calling
NtQuerySystemInformation. The required constants and structure
definitions are in Winternl.h, which doesn't come with VCC. The caveat
at http://msdn.microsoft.com/library/default.asp?url=/library/en-us/
devnotes/winprog/calling_internal_apis.asp claims that they reserve
the right to change this without notice, so I hesitate to program
against it. Sorry. I guess the real purpose of this paragraph is to
say that I _did_ try.

=cut


#	The following manifest constants are from windef.h

use constant MAX_PATH => 260;


#	The following manifest constants are from winerror.h

use constant ERROR_ACCESS_DENIED => 5;


#	The following manifest constants are from winnt.h

use constant READ_CONTROL                     => 0x00020000;
use constant SYNCHRONIZE                      => 0x00100000;
use constant STANDARD_RIGHTS_REQUIRED         => 0x000F0000;
use constant STANDARD_RIGHTS_READ             => READ_CONTROL;
use constant STANDARD_RIGHTS_WRITE            => READ_CONTROL;
use constant STANDARD_RIGHTS_EXECUTE          => READ_CONTROL;

use constant PROCESS_TERMINATE         => 0x0001;
use constant PROCESS_CREATE_THREAD     => 0x0002;
use constant PROCESS_VM_OPERATION      => 0x0008;
use constant PROCESS_VM_READ           => 0x0010;
use constant PROCESS_VM_WRITE          => 0x0020;
use constant PROCESS_DUP_HANDLE        => 0x0040;
use constant PROCESS_CREATE_PROCESS    => 0x0080;
use constant PROCESS_SET_QUOTA         => 0x0100;
use constant PROCESS_SET_INFORMATION   => 0x0200;
use constant PROCESS_QUERY_INFORMATION => 0x0400;
use constant PROCESS_ALL_ACCESS        => STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE |
                                   0xFFF;

use constant SID_REVISION              => 1;	# Current revision level
use constant SID_MAX_SUB_AUTHORITIES   => 15;

use constant TOKEN_ASSIGN_PRIMARY      => 0x0001;
use constant TOKEN_DUPLICATE           => 0x0002;
use constant TOKEN_IMPERSONATE         => 0x0004;
use constant TOKEN_QUERY               => 0x0008;
use constant TOKEN_QUERY_SOURCE        => 0x0010;
use constant TOKEN_ADJUST_PRIVILEGES   => 0x0020;
use constant TOKEN_ADJUST_GROUPS       => 0x0040;
use constant TOKEN_ADJUST_DEFAULT      => 0x0080;
use constant TOKEN_ADJUST_SESSIONID    => 0x0100;

use constant TOKEN_ALL_ACCESS          => STANDARD_RIGHTS_REQUIRED |
                          TOKEN_ASSIGN_PRIMARY | TOKEN_DUPLICATE |
                          TOKEN_IMPERSONATE | TOKEN_QUERY |
                          TOKEN_QUERY_SOURCE | TOKEN_ADJUST_PRIVILEGES |
                          TOKEN_ADJUST_GROUPS | TOKEN_ADJUST_SESSIONID |
                          TOKEN_ADJUST_DEFAULT;


use constant TOKEN_READ            => STANDARD_RIGHTS_READ | TOKEN_QUERY;


use constant TOKEN_WRITE           => STANDARD_RIGHTS_WRITE | TOKEN_ADJUST_PRIVILEGES |
                          TOKEN_ADJUST_GROUPS | TOKEN_ADJUST_DEFAULT;

use constant TOKEN_EXECUTE         => STANDARD_RIGHTS_EXECUTE;


# Crib notes:
# MS type	Perl type
# Handle	N
# Bool		I
# DWord		I
# Pointer	P

sub GetProcInfo {
    my $self = shift;
    my $opt = ref $_[0] eq 'HASH' ? shift : {};
    
    $CloseHandle ||= _map ('KERNEL32', 'CloseHandle', [qw{N}], 'V');
    $GetModuleFileNameEx ||=
        _map ('PSAPI', 'GetModuleFileNameEx', [qw{N N P N}], 'I');
    $GetPriorityClass ||=
        _map ('KERNEL32', 'GetPriorityClass', [qw{N}], 'I');
    $GetProcessAffinityMask ||=
        _map ('KERNEL32', 'GetProcessAffinityMask', [qw{N P P}], 'I');
    $GetProcessIoCounters ||=
        _map_opt ('KERNEL32', 'GetProcessIoCounters', [qw{N P}], 'I');
    $GetProcessTimes ||=
        _map ('KERNEL32', 'GetProcessTimes', [qw{N P P P P}], 'I');
    $GetProcessWorkingSetSize ||=
        _map ('KERNEL32', 'GetProcessWorkingSetSize', [qw{N P P}], 'I');
    $GetTokenInformation ||=
        _map ('ADVAPI32', 'GetTokenInformation', [qw{N N P N P}], 'I');
    $LookupAccountSid ||=
        _map ('ADVAPI32', 'LookupAccountSid', [qw{P P P P P P P}], 'I');
    $OpenProcess ||= _map ('KERNEL32', 'OpenProcess', [qw{N I N}], 'N');
    $OpenProcessToken ||=
        _map ('ADVAPI32', 'OpenProcessToken', [qw{N N P}], 'I');
    $EnumProcessModules ||=
        _map ('PSAPI', 'EnumProcessModules', [qw{N P N P}], 'I');
    
    
    my $dac = PROCESS_QUERY_INFORMATION | PROCESS_VM_READ;
    my $tac = TOKEN_READ;
    
    @_ = ListPids ($self) unless @_;
    
    my @pinf;
    
    my $dat;
    my %sid_to_name;
    my @trydac = (
        PROCESS_QUERY_INFORMATION | PROCESS_VM_READ,
        PROCESS_QUERY_INFORMATION,
        );
    
    foreach my $pid (map {$_ eq '.' ? $$ : $_} @_) {
    
        $^E = 0;
        $dat = $self->_build_hash (undef, ProcessId => $pid);
        $self->_build_hash ($dat, Name => 'System Idle Process')
        unless $pid;
    
        push @pinf, $dat;
    
        my $prchdl;
        foreach my $dac (@trydac) {
        $prchdl = $OpenProcess->Call ($dac, 0, $pid) and last;
        }
        next unless $prchdl;
    
        my ($cretim, $exttim, $knltim, $usrtim);
        $cretim = $exttim = $knltim = $usrtim = ' ' x 8;
        if ($GetProcessTimes->Call ($prchdl, $cretim, $exttim, $knltim, $usrtim)) {
        my $time = _to_char_date ($cretim);
        $self->_build_hash ($dat, CreationDate => $time) if $time;
        $self->_build_hash ($dat,
            KernelModeTime	=> _ll_to_bigint ($knltim),
            UserModeTime	=> _ll_to_bigint ($usrtim));
        }
    
        my ($minws, $maxws);
        $minws = $maxws = '    ';
        if ($GetProcessWorkingSetSize->Call ($prchdl, $minws, $maxws)) {
        $self->_build_hash ($dat,
            MinimumWorkingSetSize	=> unpack ('L', $minws),
            MaximumWorkingSetSize	=> unpack ('L', $maxws));
        }
    
        my $procio = '        ' x 6;	# structure is 6 longlongs.
        if ($GetProcessIoCounters->Call ($prchdl, $procio)) {
        my ($ro, $wo, $oo, $rb, $wb, $ob) = _ll_to_bigint ($procio);
        $self->_build_hash ($dat,
            ReadOperationCount	=> $ro,
            ReadTransferCount	=> $rb,
            WriteOperationCount	=> $wo,
            WriteTransferCount	=> $wb,
            OtherOperationCount	=> $oo,
            OtherTransferCount	=> $ob);
        }
    
        my $modhdl = '    ';	# Module handle better be 4 bytes.
        my $modgot = '    ';
    
        if ($EnumProcessModules->Call ($prchdl, $modhdl, length $modhdl, $modgot)) {
        $modhdl = unpack ('L', $modhdl);
        my $mfn = ' ' x MAX_PATH;
        if ($GetModuleFileNameEx->Call ($prchdl, $modhdl, $mfn, length $mfn)) {
            $mfn =~ s/\0.*//;
            $mfn =~ s/^\\(\w+)/$ENV{$1} ? $ENV{$1} : "\\$1"/ex;
            $mfn =~ s/^\\\?\?\\//;
            $self->_build_hash ($dat,
            ExecutablePath	=> $mfn);
            my $base = basename ($mfn);
            $self->_build_hash ($dat, Name => $base) if $base;
            }
        }
    
        my ($tokhdl);
        $tokhdl = ' ' x 4;		# Token handle better be 4 bytes.
        {				# Start block, to use as single-iteration loop
            last if $opt->{no_user_info};
            $OpenProcessToken->Call ($prchdl, $tac, $tokhdl)
                or do {$tokhdl = undef; last; };
            sub TokenUser {1};	# PER MSDN
            sub TokenOwner {4};
            my ($dsize, $size_in, $size_out, $sid, $stat, $use, $void);
            $tokhdl = unpack 'L', $tokhdl;
        
            $size_out = ' ' x 4;
            $void = pack 'p', undef;
            my $token_type = TokenUser;
            $GetTokenInformation->Call ($tokhdl, $token_type, $void, 0, $size_out);
            $size_in = unpack 'L', $size_out;
            my $tokinf = ' ' x $size_in;
            $GetTokenInformation->Call ($tokhdl, $token_type, $tokinf, $size_in, $size_out)
                or last;
            my $sidadr = unpack "P$size_in", $tokinf;
        ## NO!	my $sidadr = unpack "P4", $tokinf;
        
            $sid = _text_sid ($sidadr) or last;
            $self->_build_hash ($dat, OwnerSid => $sid);
            if ($sid_to_name{$sid}) {
                $self->_build_hash ($dat, Owner => $sid_to_name{$sid});
                last;
                }
        
            $size_out = $dsize = pack 'L', 0;
            $use = pack 'S', 0;
            $stat = $LookupAccountSid->Call ($void, $sidadr, $void, $size_out, $void, $dsize, $use);
            my ($name, $domain);
            $name = " " x (unpack 'L', $size_out);
            $domain = " " x (unpack 'L', $dsize);
            my $pname = pack 'p', $name;
            my $pdom = pack 'p', $domain;
            $LookupAccountSid->Call ($void, $sidadr, $name, $size_out, $domain, $dsize, $use)
                or last;
            $size_out = unpack 'L', $size_out;
            $dsize = unpack 'L', $dsize;
            my $user = (substr ($domain, 0, $dsize) . "\\" .
                    substr ($name, 0, $size_out));
            $sid_to_name{$sid} = $user;
            $self->_build_hash ($dat, Owner => $user);
        }
    
        $CloseHandle->Call ($tokhdl) if $tokhdl && $tokhdl ne '    ';
        $CloseHandle->Call ($prchdl);
        }
      continue {
        $self->_build_hash ($dat, _status => $^E + 0);
        }
    return wantarray ? @pinf : \@pinf;
}

sub _to_char_date {
my @result;
$FileTimeToSystemTime ||= Win32::API->new ('KERNEL32', 'FileTimeToSystemTime', [qw{P P}], 'I') or
    croak "Error - Failed to map FileTimeToSystemTime: $^E";
my $systim = '  ' x 8;
foreach (@_) {
    $FileTimeToSystemTime->Call ($_, $systim) or
	croak "Error - FileTimeToSystemTime failed: $^E";
    my $time;
    my ($yr, $mo, $dow, $day, $hr, $min, $sec, $ms) = unpack ('S*', $systim);
    if ($yr == 1601 && $mo == 1 && $day == 1) {
	$time = undef;
	}
      else {
	$time = sprintf ('%04d%02d%02d%02d%02d%02d',
	    $yr, $mo, $day, $hr, $min, $sec);
	}
    push @result, $time;
    }
return @result if wantarray;
return $result[0];
}

sub _ll_to_bigint {
my @result;
foreach (@_) {
    my @data = unpack 'L*', $_;
    while (@data) {
	my $low = shift @data;
	my $high = shift @data;
	push @result, ($high <<= 32) + $low;
	}
    }
return @result if wantarray;
return $result[0];
}

sub _clunks_to_secs {
my @result;
foreach (_ll_to_bigint (@_)) {
    push @result, $_ / 10_000_000;
    }
return @result if wantarray;
return $result[0];
}

=item @pids = $pi->ListPids ()

This subroutine returns a list of all known process IDs in the
system, in no particular order. If called in list context, the
list of process IDs itself is returned. In scalar context, a
reference to the list is returned.

=cut

sub ListPids {
my $self = shift;
my $filter = undef;
$filter = {map {(($_ eq '.' ? $$ : $_), 1)} @_} if @_;
$EnumProcesses ||= _map ('PSAPI', 'EnumProcesses', [qw{P N P}], 'I');
my $psiz = 4;
my $bsiz = 0;
    {
    $bsiz += 1024;
    my $pidbuf = ' ' x $bsiz;
    my $pidgot = '    ';
    $EnumProcesses->Call ($pidbuf, $bsiz, $pidgot) or
	croak "Error - Failed to call EnumProcesses: $^E";
# Note - 122 = The data area passed to a system call is too small
    my $pidnum = unpack ('L', $pidgot);
    redo unless $pidnum < $bsiz;
    $pidnum /= 4;
    my @pids;
    if ($filter) {
	@pids = grep {$filter->{$_}} unpack ("L$pidnum", $pidbuf);
	}
      else {
	@pids = unpack ("L$pidnum", $pidbuf);
	}
    return wantarray ? @pids : \@pids;
    }

}


use vars qw{
    $GetSidIdentifierAuthority
    $GetSidSubAuthority
    $GetSidSubAuthorityCount
    $IsValidSid
    };

#	_text_sid (pointer to SID)

#	This subroutine translates the given sid in to a string.
#	The algorithm is from http://msdn.microsoft.com/library/
#	default.asp?url=/library/en-us/security/security/
#	converting_a_binary_sid_to_string_format.asp)
#
#	As a general note: The SID is represented internally by an
#	opaque structure, which contains a bunch of things that we
#	need to know to format it. Rather than publishing the
#	structure, or providing a formatting routine, Microsoft
#	provided a bunch of subroutines which return pointers to the
#	various pieces/parts of the structure that we need to do it
#	ourselves. This presents us with with the situation of an
#	opaque structure, essentially all of whose parts are public.
#	This, I presume, is an example of the superior engineering that
#	makes Microsoft the darling of the industry.
#
#	It also means we play some serious games, since Win32::API has
#	no mechanism to return a pointer. The next best thing is to
#	tell Win32::API that the return is a number of the appropriate
#	size, "pack" the number to get an honest-to-God pointer, and
#	then unpack again as a pointer to a structure of the
#	appropriate size. A further unpack may be necessary to extract
#	data from the finally-obtained structure. You'll be seeing a
#	lot of this pack/unpack idiom in the code that follows.

sub _text_sid {
my $sid = shift;


#	Make sure we have a valid SID

$IsValidSid ||= _map ('ADVAPI32', 'IsValidSid', [qw{P}], 'I');
my $stat = $IsValidSid->Call ($sid);
return undef unless $stat;


#	Get the identifier authority.

$GetSidIdentifierAuthority ||=
	_map ('ADVAPI32', 'GetSidIdentifierAuthority', [qw{P}], 'N');
my $sia = $GetSidIdentifierAuthority->Call ($sid);
$sia = pack 'L', $sia;
$sia = unpack 'P6', $sia;


#	Get the number of subauthorities.

$GetSidSubAuthorityCount ||=
	_map ('ADVAPI32', 'GetSidSubAuthorityCount', [qw{P}], 'N');
my $subauth = $GetSidSubAuthorityCount->Call ($sid);
$subauth = pack 'L', $subauth;
$subauth = unpack 'P1', $subauth;
$subauth = unpack 'C*', $subauth;


#	Start by formatting the revision number. Note that this is
#	hard-coded. It's in a .h file if you're using "C". The
#	revision is actually in the SID if you trust the include
#	file, but the docs make it look like the SID structure is
#	supposed to be opaque, and in Microsoft's example comes from
#	the .h

my $sidout = sprintf 'S-%lu', SID_REVISION;


#	Format the identifier authority. The rules are different
#	depending on whether the first 2 bytes are in use.

if (unpack 'S', $sia) {
    $sidout .= sprintf ('-0x%s', unpack 'H*', $sia);
    }
  else {
    $sidout .= sprintf '-%lu', unpack 'x2N', $sia;
    }


#	Now tack on all the subauthorities. Because of Microsoft's
#	high-quality design, the subauthorities are in a different
#	byte order than the identifier authority.

$GetSidSubAuthority ||=
	_map ('ADVAPI32', 'GetSidSubAuthority', [qw{P I}], 'N');
for (my $subctr = 0; $subctr < $subauth; $subctr++) {
    my $subid = $GetSidSubAuthority->Call ($sid, $subctr);
    $subid = pack 'L', $subid;
    $subid = unpack 'P4', $subid;
    $sidout .= sprintf '-%lu', unpack 'L', $subid;
    }


#	Return the formatted string.

return $sidout;
}

=back

=head1 REQUIREMENTS

This library uses the following libraries:

 Carp
 Time::Local
 Win32
 Win32::API
 Win32API::Registry (if available)

As of this writing, all but Win32 and Win32::API are part of the
standard Perl distribution. Win32 is not part of the standard Perl
distribution, but comes with the ActivePerl distribution. Win32::API
comes with ActivePerl as of about build 630, but did not come with
earlier versions. It must be installed before installing this module.

=head1 ACKNOWLEDGMENTS

This module would not exist without the following people:

Aldo Calpini, who gave us Win32::API.

The folks of Cygwin (F<http://www.cygwin.com/>), especially Christopher
Faylor, author of ps.cc.

Jenda Krynicky, whose "How2 create a PPM distribution"
(F<http://jenda.krynicky.cz/perl/PPM.html>) gave me a leg up on
both PPM and tar distributions.

Judy Hawkins of Pitney Bowes, for providing testing and patches for
NT 4.0 without WMI.

=head1 AUTHOR

Thomas R. Wyant, III (F<wyant at cpan dot org>)

=head1 COPYRIGHT

Copyright 2001, 2002, 2003 by E. I. DuPont de Nemours and Company, Inc.

Modifications since version 1.005 copyright 2007 by Thomas R. Wyant,
III. All rights reserved.

=head1 LICENSE

This module is free software; you can use it, redistribute it
and/or modify it under the same terms as Perl itself. Please see
L<http://perldoc.perl.org/index-licence.html> for the current licenses.

=cut

1;
__END__

Sample code from MSDN

Set privilege (http://msdn.microsoft.com/library/default.asp?url=/library/en-us/security/security/enabling_and_disabling_privileges.asp)

BOOL SetPrivilege(
    HANDLE hToken,          // access token handle
    LPCTSTR lpszPrivilege,  // name of privilege to enable/disable
    BOOL bEnablePrivilege   // to enable or disable privilege
    )
{
TOKEN_PRIVILEGES tp;
LUID luid;		// 64-bit identifier

if ( !LookupPrivilegeValue(
        NULL,            // lookup privilege on local system
        lpszPrivilege,   // privilege to lookup
        &luid ) )        // receives LUID of privilege
{
    printf("LookupPrivilegeValue error: %u\n", GetLastError() );
    return FALSE;
}

tp.PrivilegeCount = 1;
tp.Privileges[0].Luid = luid;
if (bEnablePrivilege)
    tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
else
    tp.Privileges[0].Attributes = 0;

// Enable the privilege or disable all privileges.

if ( !AdjustTokenPrivileges(
       hToken,
       FALSE,
       &tp,
       sizeof(TOKEN_PRIVILEGES),
       (PTOKEN_PRIVILEGES) NULL,
       (PDWORD) NULL) )
{
      printf("AdjustTokenPrivileges error: %u\n", GetLastError() );
      return FALSE;
}

return TRUE;
}


#	_set_priv ([priv_name, ...])

#	This subroutine turns on the desired privilege (or privileges).
#	If no arguments are passed it turns on the "Debug" privilege.
#	The algorithm is from
#	http://msdn.microsoft.com/library/default.asp?url=/library/
#	en-us/security/security/enabling_and_disabling_privileges.asp
#
#	We return zero for success, or $^E if an error occurs.
#
#	The complication _here_ is that there is no standard internal
#	representation of a privilege. Microsoft encodes them as LUIDs
#	(locally-unique identifiers), which means we have to take as
#	input the strings representing the names of the privileges, and
#	translate each to a LUID, since LUIDS are _local_ to a given
#	instance of an operating system.

sub _set_priv {

my $self = shift;
@_ =  (SE_DEBUG_NAME ()) unless @_;


#	First we have to get our own access token, because that's what
#	we actually set the privilege on. And we'd better declare the
#	correct access intent ahead of time, or Microsoft will be very
#	upset.

$GetCurrentProcess ||= _map ('KERNEL32', 'GetCurrentProcess', [], 'N');
my $prchdl = $GetCurrentProcess->Call () or return $^E + 0;
$OpenProcessToken ||=
	_map ('ADVAPI32', 'OpenProcessToken', [qw{N N P}], 'I');
my $tokhdl;
$tokhdl = ' ' x 4;		# Token handle better be 4 bytes.
my $tac = TOKEN_READ | TOKEN_ADJUST_PRIVILEGES;
$OpenProcessToken->Call ($prchdl, $tac, $tokhdl) or return $^E + 0;
$tokhdl = unpack 'L', $tokhdl;


#	OK, now we get to build up a TOKEN_PRIVILEGES structure
#	representing the privileges we want to assert. This looks like:
#	    A dword count (number of privileges)
#	    The specified number of LUID_AND_ATTRIBUTES structures,
#		    each of which looks like:
#		Luid (64 bits = 8 bytes, as noted above)
#	 	Attributes (4 bytes).
#	Each LUID gets looked up and slapped on the end of the growing
#	TOKEN_PRIVILEGES structure.

my $enab = pack 'L', SE_PRIVILEGE_ENABLED ();
my %gotprv;
$LookupPrivilegeValue ||=
	_map ('ADVAPI32', 'LookupPrivilegeValue', [qw{P P P}], 'I');
my $null = pack 'p', undef;
my $num = 0;
my $tp = '';
foreach my $priv (@_) {
    next if $gotprv{$priv};
    my $luid = '.' x 8;		# An LUID is 64 bits.
    $LookupPrivilegeValue->Call ($null, $priv, $luid) or
		return $^E + 0;
    $gotprv{$priv} = $luid;
    $num++;
    $tp .= $luid . $enab;
    }


#	Okay, the TOKEN_PRIVILEGES structure needs the number of
#	privileges slapped on the front. So:

$num = pack 'L', $num;
$tp = $num . $tp;


#	At long last we turn on the desired privileges. As another
#	example of Microsoft's inspired design, note that we need to
#	tell the subroutine how big the structure is, even though the
#	structure contains the number of elements. Or, alternately,
#	that we have to pass the number of elements even though we told
#	the subroutine how big the structure is.

$AdjustTokenPrivileges ||=
    _map ('ADVAPI32', 'AdjustTokenPrivileges', [qw{N I P N P P}], 'I');
$AdjustTokenPrivileges->Call (
	$tokhdl, 0, $tp, length $tp, $null, $null) or
    return $^E + 0;


return 0;
}

