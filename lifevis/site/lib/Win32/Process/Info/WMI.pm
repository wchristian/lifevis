=head1 NAME

Win32::Process::Info::WMI - Provide process information via WMI.

=head1 SYNOPSIS

This package fetches process information on a given Windows
machine, using Microsoft's Windows Management Implementation.

 use Win32::Process::Info
 $pi = Win32::Process::Info->new (undef, 'WMI');
 $pi->Set (elapsed_as_seconds => 0);	# In clunks, not seconds.
 @pids = $pi->ListPids ();	# Get all known PIDs
 @info = $pi->GetProcInfo ();	# Get the max

CAVEAT USER:

This package is B<not> intended to be used independently;
instead, it is a subclass of Win32::Process::Info, and should
only be called via that package.

=head1 DESCRIPTION

This package implements the WMI-specific methods of
Win32::Process::Info.

The following methods should be considered public:

=over 4

=cut

#	Modifications:

# 0.010	02-Sep-2002	T. R. Wyant
#		Initial release under this name.
#
# 0.011	14-Sep-2002	T. R. Wyant
#		Increment version.
#
#	26-Sep-2002	T. R. Wyant
#		Pull variant construction out of loop; we only need
#			three of them, anyway.
#
#	30-Oct-2002	T. R. Wyant
#		Set the Warn level to 0 inside GetProcInfo, to try
#			to supress OLE's annoying exceptions when
#			getting the SID of a process with no owner
#			(e.g. 'idle', 'system').
#
#	31-Oct-2002	T. R. Wyant
#		Reinstate check for executable path before getting
#			user SID and name, as way to bypass system
#			and idle pseudo-processes.
#
#	01-Nov-2002	T. R. Wyant
#		Set the Warn level to 0 around the instantiation of
#			the WMI object, to supress yet another annoying
#			message when WMI not present.
#
# 0.012	06-Nov-2002	T. R. Wyant
#		Increment version number.
#		Add attributes 'user' and 'password'.
#		Connect using SWbemLocator.ConnectServer rather than
#			new-ing the monicker, so we can specify user
#			and password if we want.
#
#	12-Nov-2002	T. R. Wyant
#		Change 'new' argument to a hash (it _was_ clearly
#			marked as not being public!)
#		Reject hashes with keys other than host, variant,
#			user, and password.
#
#	03-Dec-2002	T. R. Wyant
#		Add ad-hoc check in 'new' to see if we can retrieve
#			our own proces object. If we can't, we presume
#			that we can't get at any of the process objects
#			either, so we croak.
#		Tried going back to using monicker to instantiate WMI
#			class if we don't need to specify username and
#			password. This didn't behave well on the only
#			NT 4.0 system I have access to. In fact, it
#			hangs trying to call GetOwnerSid on the time
#			synchronization service. Using ConnectServer
#			finds no objects at all - but at least this is
#			something deterministic that I can check for
#			and fail over to the NT-native interface.
#
#	07-Dec-2002	T. R. Wyant
#		Got rid of ad-hoc retrieval check in 'new.' It wasn't
#			doing what I wanted anyway (which was to cope
#			with a flakey NT 4.0 WMI installation).
#
# 0.013	13-Mar-2003	T. R. Wyant
#		Changed dependencies in Makefile.pl. See Info.pm for
#			more information. Released to CPAN.
#
# 0.013_1 13-Apr-2003	T. R. Wyant
#		Don't get sid and owner for knlwrap.exe. I have no
#		logic for this, but I note that pulist doesn't try,
#		and WBEMTEST fails to record an executable path, which
#		is my normal ad-hocery for skipping the user fetch.
#
# 0.013_2 21-Apr-2003	T. R. Wyant
#		Build the %pariah hash (processes not to call methods
#		on) from $ENV{PERL_WIN32_PROCESS_INFO_WMI_PARIAH} if
#		this is present; otherwise use a hardwired list.
#
# 0.013_21 05-Jun-2003	T. R. Wyant
#		Added nodemgr.exe to %pariah.
#
# 0.013_22 20-Jun-2003	T. R. Wyant
#		Added LUCOMS~1.EXE to %pariah.
#		Special-case PERL_WIN32_PROCESS_INFO_WMI_PARIAH=*
#			to mean all processes.
#		DO NOT assert wbemPrivilegeDebug by default. Do so only
#			if PERL_WIN32_PROCESS_INFO_WMI_DEBUG is TRUE.
#		After some testing on the above, empty the %pariah hash.
#			Note that the previous value was
#			'dllhost.exe;knlwrap.exe;lucoms~1.exe;nodemgr.exe'.
#
# 0.013_23 26-Jun-2003	T. R. Wyant
#		Added optional first hashref argument to GetProcInfo,
#			used no_user_info key to bypass user info. This
#			was in support of the Subprocesses method of
#			Win32::Process::Info.
#
# 0.014	27-Jun-2003	T. R. Wyant
#		Released.
#
# 0.014_01 25-Jul-2003	T. R. Wyant
#		Added hash argument assert_debug_priv to 'new' method.
#			This overrides the environment variable.
#
# 1.000 09-Oct-2003	T. R. Wyant
#		When the only thing you've fixed in the last two months
#			is the docs, it's time to call it production
#			code. And if _that_ statement doesn't flush
#			out more problems, nothing will.
#
# 1.001_01 24-Feb-2004	T. R. Wyant
#		Failed attempt to fix WMI memory leak. But it's clearly
#		associated with the use of Win32::OLE::Variant objects
#		to retrieve the owner information, because the code
#		appears not to leak if we don't do this. Versions prior
#		to this one leaked anyway, because the Variant objects
#		were allocated whether or not they were used. But this
#		version doesn't allocate them unless they are to be
#		used.
# 1.001_02 01-Mar-2007	T. R. Wyant
#		Fix code in synopsis.
# 1.002 11-Jan-2007	T. R. Wyant
#		Released above changes.
# 1.003 22-Aug-2007	T. R. Wyant
#		Updated copyright notice and license.
# 1.003_01 01-Nov-2007	T. R. Wyant
#		use warnings;

package Win32::Process::Info::WMI;

use base qw{Win32::Process::Info};
use vars qw{$VERSION};
$VERSION = '1.004';

use strict;
use warnings;

use vars qw{%mutator};
use Carp;
use Time::Local;
use Win32::OLE qw{in with};
use Win32::OLE::Const;
use Win32::OLE::Variant;


%mutator = %Win32::Procecss::Info::mutator;

my %pariah = map {($_ => 1)} grep {$_} split ';',
    lc ($ENV{PERL_WIN32_PROCESS_INFO_WMI_PARIAH} || '');
my $no_user_info = $ENV{PERL_WIN32_PROCESS_INFO_WMI_PARIAH} &&
    $ENV{PERL_WIN32_PROCESS_INFO_WMI_PARIAH} eq '*';
my $assert_debug_priv = $ENV{PERL_WIN32_PROCESS_INFO_WMI_DEBUG};


#	note that "new" is >>>NOT<<< considered a public
#	method.

my $wmi_const;

my %lglarg = map {($_, 1)} qw{assert_debug_priv host password user variant};

sub new {
my $class = shift;
$class = ref $class if ref $class;

my $arg = shift;
my @ilg = grep {!$lglarg{$_}} keys %$arg;
@ilg and
    croak "Error - Win32::Process::Info::WMI argument(s) (@ilg) illegal";

my $mach = $arg->{host} || '';
$mach =~ s|^[\\/]+||;
my $user = $arg->{user} || '';
my $pass = $arg->{password} || '';
$arg->{assert_debug_priv} ||= $assert_debug_priv;

my $old_warn = Win32::OLE->Option ('Warn');
Win32::OLE->Option (Warn => 0);


#	Under at least some circumstances, I have found that I have
#	access when using the monicker, and not if using the locator;
#	especially under NT 4.0 with the retrofitted WMI. So use the
#	monicker unless I have a username/password.

my $wmi;

if ($user) {
    my $locator = Win32::OLE->new ('WbemScripting.SWbemLocator') or do {
	Win32::OLE->Option (Warn => $old_warn);
	croak "Error - Win32::Process::Info::WMI failed to get SWBemLocator object:\n",
	    Win32::OLE->LastError;
	};

    $wmi_const ||= Win32::OLE::Const->Load ($locator) or do {
	Win32::OLE->Option (Warn => $old_warn);
	croak "Error - Win32::Process::Info::WMI failed to load WMI type library:\n",
	    Win32::OLE->LastError;
	};


# Note that MSDN says that the following doesn't work under NT 4.0.
##$wmi->Security_->Privileges->AddAsString ('SeDebugPrivilege', 1);

    $locator->{Security_}{ImpersonationLevel} =
	$wmi_const->{wbemImpersonationLevelImpersonate};
    $locator->{Security_}{Privileges}->Add ($wmi_const->{wbemPrivilegeDebug})
	if $arg->{assert_debug_priv};

    $wmi = $locator->ConnectServer (
	$mach,				# Server
	'root/cimv2',			# Namespace
	$user,				# User (with optional domain)
	$pass,				# Password
	'',				# Locale
	'',				# Authority
##	wbemConnectFlagUseMaxWait,	# Flag
	);
    }
  else {
    my $mm = $mach || '.';
    $wmi = Win32::OLE->GetObject (
	"winmgmts:{impersonationLevel=impersonate@{[
		$arg->{assert_debug_priv} ? ',(Debug)' : '']}}!//$mm/root/cimv2");
    }

$wmi or do {
    Win32::OLE->Option (Warn => $old_warn);
    croak "Error - Win32::Process::Info::WMI failed to get winmgs object:\n",
	Win32::OLE->LastError;
    };

$wmi_const ||= Win32::OLE::Const->Load ($wmi) or do {
    Win32::OLE->Option (Warn => $old_warn);
    croak "Error - Win32::Process::Info::WMI failed to load WMI type library:\n",
	Win32::OLE->LastError;
    };


#	Whew! we're through with that! Manufacture and return the
#	desired object.

Win32::OLE->Option (Warn => $old_warn);
my $self = {%Win32::Process::Info::static};
$self->{machine} = $mach;
$self->{password} = $pass;
$self->{user} = $pass;
$self->{wmi} = $wmi;
$self->{_attr} = undef;	# Cache for keys.
bless $self, $class;
return $self;
}


=item @info = $pi->GetProcInfo ();

This method returns a list of anonymous hashes, each containing
information on one process. If no arguments are passed, the
list represents all processes in the system. You can pass a
list of process IDs, and get out a list of the attributes of
all such processes that actually exist. If you call this
method in scalar context, you get a reference to the list.

What keys are available depend both on the variant in use and
the setting of b<use_wmi_names>. Assuming B<use_wmi_names> is
TRUE, you can hope to get at least the following keys for a
"normal" process (i.e. not the idle process, which is PID 0,
nor the system, which is PID 8) to which you have access:

    CSCreationClassName
    CSName (= machine name)
    Caption (seems to generally equal Name)
    CreationClassName
    CreationDate
    Description (seems to equal Caption)
    ExecutablePath
    KernelModeTime
    MaximumWorkingSetSize
    MinimumWorkingSetSize
    Name
    OSCreationClassName
    OSName
    OtherOperationCount
    OtherTransferCount
    Owner (*)
    OwnerSid (*)
    PageFaults
    ParentProcessId
    PeakWorkingSetSize
    ProcessId
    ReadOperationCount
    ReadTransferCount
    UserModeTime
    WindowsVersion
    WorkingSetSize
    WriteOperationCount
    WriteTransferCount

You may find other keys available as well.

* - Keys marked with an asterisk are computed, and may not always
be present.

=cut

sub _get_proc_objects {
my $self = shift;
my @procs = @_ ?
    map {
	my $pi = $_ eq '.' ? $$ : $_;
	my $obj = $self->{wmi}->Get ("Win32_Process='$pi'");
	Win32::OLE->LastError ? () : ($obj)	
	} @_ :
    (in $self->{wmi}->InstancesOf ('Win32_Process'));

if (@procs && !$self->{_attr}) {
    my $atls = $self->{_attr} = [];
    $self->{_xfrm} = {
	KernelModeTime	=> \&Win32::Process::Info::_clunks_to_desired,
	UserModeTime	=> \&Win32::Process::Info::_clunks_to_desired,
	};

    foreach my $attr (in $procs[0]->{Properties_}) {
	my $name = $attr->{Name};
	my $type = $attr->{CIMType};
	push @$atls, $name;
	$self->{_xfrm}{$name} = \&Win32::Process::Info::_date_to_time_t
	    if $type == $wmi_const->{wbemCimtypeDatetime};
	}
    }
$self->{_attr} = {map {($_->{Name}, $_->{CIMType})}
	in $procs[0]->{Properties_}}
    if (@procs && !$self->{_attr});

return @procs;
}

sub GetProcInfo {
my $self = shift;
my $opt = ref $_[0] eq 'HASH' ? shift : {};
my @pinf;
my %username;
my ($sid, $user, $domain);
my $old_warn = Win32::OLE->Option ('Warn');
Win32::OLE->Option (Warn => 0);

my $skip_user = $no_user_info || $opt->{no_user_info};
unless ($skip_user) {
    $sid = Variant (VT_BYREF | VT_BSTR, '');
##    $sid = Variant (VT_BSTR, '');
    $user = Variant (VT_BYREF | VT_BSTR, '');
    $domain = Variant (VT_BYREF | VT_BSTR, '');
#
#	The following plausable ways of caching the variant to try to
#	stem the associated memory leak result in an access violation
#	the second time through (i.e. the first time the object is
#	retrieved from cache rather than being manufactured). God knows
#	why, but so far He has not let me in on the secret. Sometimes
#	There's an OLE type mismatch error before the access violation
#	is reported, but sometimes not.
#
##    $sid = $self->{_variant}{sid} ||= Variant (VT_BYREF | VT_BSTR, '');
##    $user = $self->{_variant}{user} ||= Variant (VT_BYREF | VT_BSTR, '');
##    $domain = $self->{_variant}{domain} ||= Variant (VT_BYREF | VT_BSTR, '');
##    $sid = $Win32::Process::Info::WMI::sid ||= Variant (VT_BYREF | VT_BSTR, '');
##    $user = $Win32::Process::Info::WMI::user ||= Variant (VT_BYREF | VT_BSTR, '');
##    $domain = $Win32::Process::Info::WMI::domain ||= Variant (VT_BYREF | VT_BSTR, '');
    }

foreach my $proc (_get_proc_objects ($self, @_)) {
    my $phash = $self->_build_hash (
	undef, map {($_, $proc->{$_})} @{$self->{_attr}});
    push @pinf, $phash;
    my $oid;

#	The test for executable path is extremely ad-hoc, but the best
#	way I have come up with so far to strain out the System and
#	Idle processes. The methods can misbehave badly on these, and
#	I have found no other way of identifying them. Idle is always
#	process 0, but it seems to me that I have seen once a system
#	whose System process ID was not 8. This test was actually
#	removed at one point, but is reinstated since finding a set of
#	slides on the NT startup which bolsters my confidence in it.
#	But it still looks like ad-hocery to me.

    eval {
	return unless $proc->{ExecutablePath};
	return if $skip_user || $pariah{lc $proc->{Name}};
	$sid->Put ('');
	$proc->GetOwnerSid ($sid);
	$oid = $sid->Get ();
	return unless $oid;
	$phash->{OwnerSid} = $oid;
	unless ($username{$oid}) {
	    $username{$oid} =
	    $proc->GetOwner ($user, $domain) ? $oid :
		"@{[$domain->Get ()]}\\@{[$user->Get ()]}";
	    }
	$phash->{Owner} = $username{$oid};
	};
    }
Win32::OLE->Option (Warn => $old_warn);
return wantarray ? @pinf : \@pinf;
}

=item @pids = $pi->ListPids ();

This method lists all known process IDs in the system. If
called in scalar context, it returns a reference to the
list of PIDs. If you pass in a list of pids, the return will
be the intersection of the argument list and the actual PIDs
in the system.

=cut

sub ListPids {
my $self = shift;
my @pinf;
foreach my $proc (_get_proc_objects ($self, @_)) {
    push @pinf, $proc->{ProcessId};
    }
return wantarray ? @pinf : \@pinf;
}
1;
__END__
source of the following list:
http://msdn.microsoft.com/library/default.asp?url=/library/en-us/wmisdk/r_32os5_02er.asp
  string Caption  ;
  string CreationClassName  ;
  datetime CreationDate  ;
  string CSCreationClassName  ;
  string CSName  ;
  string Description  ;
  string ExecutablePath  ;
  uint16 ExecutionState  ;
  string Handle  ;
  uint32 HandleCount  ;
  datetime InstallDate  ;
  uint64 KernelModeTime  ;
  uint32 MaximumWorkingSetSize  ;
  uint32 MinimumWorkingSetSize  ;
  string Name  ;
  string OSCreationClassName  ;
  string OSName  ;
  uint64 OtherOperationCount  ;
  uint64 OtherTransferCount  ;
  uint32 PageFaults  ;
  uint32 PageFileUsage  ;
  uint32 ParentProcessId  ;
  uint32 PeakPageFileUsage  ;
  uint64 PeakVirtualSize  ;
  uint32 PeakWorkingSetSize  ;
  uint32 Priority  ;
  uint64 PrivatePageCount  ;
  uint32 ProcessId  ;
  uint32 QuotaNonPagedPoolUsage  ;
  uint32 QuotaPagedPoolUsage  ;
  uint32 QuotaPeakNonPagedPoolUsage  ;
  uint32 QuotaPeakPagedPoolUsage  ;
  uint64 ReadOperationCount  ;
  uint64 ReadTransferCount  ;
  uint32 SessionId  ;
  string Status  ;
  datetime TerminationDate  ;
  uint32 ThreadCount  ;
  uint64 UserModeTime  ;
  uint64 VirtualSize  ;
  string WindowsVersion  ;
  uint64 WorkingSetSize  ;
  uint64 WriteOperationCount  ;
  uint64 WriteTransferCount  ;

=back

=head1 REQUIREMENTS

It should be obvious that this library must run under some
flavor of Windows.

This library uses the following libraries:

  Carp
  Time::Local
  Win32::OLE
  use Win32::OLE::Const;
  use Win32::OLE::Variant;

As of ActivePerl 630, none of the variant libraries use any libraries
that are not included with ActivePerl. Your mileage may vary.

=head1 ACKNOWLEDGMENTS

This module would not exist without the following people:

Jenda Krynicky, whose "How2 create a PPM distribution"
(F<http://jenda.krynicky.cz/perl/PPM.html>) gave me a leg up on
both PPM and tar distributions.

Dave Roth, F<http://www.roth.net/perl/>, author of
B<Win32 Perl Programming: Administrators Handbook>, which is
published by Macmillan Technical Publishing, ISBN 1-57870-215-1

=head1 AUTHOR

Thomas R. Wyant, III (F<wyant at cpan dot org>)

=head1 COPYRIGHT

Copyright 2001, 2002, 2003, 2004 by
E. I. DuPont de Nemours and Company, Inc.

Modifications since version 1.001_01 copyright 2007 by Thomas R. Wyant,
III. All rights reserved.

=head1 LICENSE

This module is free software; you can use it, redistribute it
and/or modify it under the same terms as Perl itself. Please see
L<http://perldoc.perl.org/index-licence.html> for the current licenses.

=cut

