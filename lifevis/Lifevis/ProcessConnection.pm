package Lifevis::ProcessConnection;

use 5.010;
use strict;
use warnings;
use Carp;
use English;
use Win32::API;

use lib '.';
use lib '..';
use Win32;
use Win32::Process;
use Lifevis::constants;
use Lifevis::df_offsets;

Win32::API->Import("psapi",    "EnumProcessModules",       "NPNP", "I");

use base 'Exporter';
our @EXPORT    = qw( connect_to_DF );
our @EXPORT_OK = qw( );

my $ver;
my $proc;

my $df_proc_handle;
my $dwarf_pid;
my $pe_timestamp;

my $VERSION;
my $detached;
our $master_offset;

my @OFFSETS = get_df_offsets();

sub connect_to_DF {
    $ver = init_process_connection();

    refresh_datastore() unless defined $ver;

    my @offsets;
    $offsets[version]             = $OFFSETS[$ver]{'version'};
    $offsets[PE]                  = $OFFSETS[$ver]{'PE'};
    $offsets[map_loc]             = $OFFSETS[$ver]{'map_loc'} + $master_offset - 0x400000;
    $offsets[x_count]             = $OFFSETS[$ver]{'x_count'} + $master_offset - 0x400000;
    $offsets[y_count]             = $OFFSETS[$ver]{'y_count'} + $master_offset - 0x400000;
    $offsets[z_count]             = $OFFSETS[$ver]{'z_count'} + $master_offset - 0x400000;
    $offsets[type_off]            = $OFFSETS[$ver]{'type_off'};
    $offsets[designation_off]     = $OFFSETS[$ver]{'designation_off'};
    $offsets[occupancy_off]       = $OFFSETS[$ver]{'occupancy_off'};
    $offsets[mouse_x]             = $OFFSETS[$ver]{'mouse_x'} + $master_offset - 0x400000;
    $offsets[mouse_y]             = $OFFSETS[$ver]{'mouse_y'} + $master_offset - 0x400000;
    $offsets[mouse_z]             = $OFFSETS[$ver]{'mouse_z'} + $master_offset - 0x400000;
    $offsets[creature_vector]     = $OFFSETS[$ver]{'creature_vector'} + $master_offset - 0x400000;
    $offsets[creature_race]       = $OFFSETS[$ver]{'creature_race'};
    $offsets[creature_x]          = $OFFSETS[$ver]{'creature_x'};
    $offsets[creature_y]          = $OFFSETS[$ver]{'creature_y'};
    $offsets[viewport_x]          = $OFFSETS[$ver]{'viewport_x'} + $master_offset - 0x400000;
    $offsets[viewport_y]          = $OFFSETS[$ver]{'viewport_y'} + $master_offset - 0x400000;
    $offsets[viewport_z]          = $OFFSETS[$ver]{'viewport_z'} + $master_offset - 0x400000;
    $offsets[window_grid_x]       = $OFFSETS[$ver]{'window_grid_x'} + $master_offset - 0x400000;
    $offsets[window_grid_y]       = $OFFSETS[$ver]{'window_grid_y'} + $master_offset - 0x400000;
    $offsets[menu_state]          = $OFFSETS[$ver]{'menu_state'} + $master_offset - 0x400000;
    $offsets[view_state]          = $OFFSETS[$ver]{'view_state'} + $master_offset - 0x400000;
    $offsets[building_vector]     = $OFFSETS[$ver]{'building_vector'} + $master_offset - 0x400000;
    $offsets[item_vector]         = $OFFSETS[$ver]{'item_vector'} + $master_offset - 0x400000;

    return ( $proc, $df_proc_handle, \@offsets );
}

sub init_process_connection {
    ### get dwarf process id #######################################################
    my %list = Win32::Process::List->new()->GetProcesses();
    for my $key ( keys %list ) {
        $dwarf_pid = $key if ( $list{$key} =~ /(dwarfort|Dwarf Fortress)\.exe/ );
    }
    fatal_error( 'Could not find process ID, make sure DF is running and' . ' a savegame is loaded.' )
      unless ($dwarf_pid);

    ### lower priority of dwarf fortress ###########################################
    Win32::Process::Open( my $dwarf_process, $dwarf_pid, 1 );
    $dwarf_process->SetPriorityClass(IDLE_PRIORITY_CLASS);
    croak 'Could not lower DF process priority, this is really odd and'
      . ' should not happen, try running as administrator or poke Mithaldu/Xenofur.'
      unless ($dwarf_process);

    Win32::Process::Open( my $self_process, $PROCESS_ID, 1 );
    $self_process->SetPriorityClass(IDLE_PRIORITY_CLASS);
    croak 'Could not lower own process priority, this is really odd and'
      . ' should not happen, try running as administrator or poke Mithaldu/Xenofur.'
      unless ($self_process);

    ### actually read stuff from memory ############################################
    $proc =
      Win32::Process::Memory->new( { pid => $dwarf_pid, access => 'read/write/query' } )
      ;    # open process with read access
    croak 'Could not open memory access to Dwarf Fortress, this is really odd'
      . ' and should not happen, try running as'
      . ' administrator or poke Mithaldu/Xenofur.'
      unless ($proc);
    $df_proc_handle = $proc->{hProcess};

    ### Let's Pla... erm, figure out what version this is ##########################
    $master_offset = enum_win($df_proc_handle);

    my $pe_offset = $proc->get_u32( $master_offset + 0x3C );

    for my $i ( 0 .. $#OFFSETS ) {
        $pe_timestamp = $proc->get_u32( $master_offset + $pe_offset + 8 );
        return $i if ( $OFFSETS[$i]{PE} == $pe_timestamp );
    }
    return;
}

sub enum_win {
    my ($pid) = @_;

    my $cb         = Win32::API::Type->sizeof( 'HMODULE' ) * 1024;
    my $lphmodule  = "\x0" x $cb;
    EnumProcessModules($pid, $lphmodule, $cb, "");

    return Win32::API::Type::Unpack('HMODULE', $lphmodule);
}

sub refresh_datastore {
    say 'Could not find DF version in local data store.' . " Checking for new memory address data...\n";
    import_remote_xml();

    $ver = init_process_connection();

    croak 'Version could not be correctly identified.'
      . ' Please contact Xenofur/Mithaldu or Jifodus'
      . " for updated memory addresses.\n"
      unless $ver;
    return;
}

sub import_remote_xml {
    say '  Remotely...';
    my $source = 'http://www.geocities.com/jifodus/tables/dwarvis/';
    my @xml_list;

    my $list = get($source);
    croak 'Could not download the index of the online offset stores!'
      unless defined $list;

    while ( $list =~ m/<A HREF="(.+?\.xml)">/gi ) {
        push @xml_list, $1;
    }

    say '    Found ' . ( $#xml_list + 1 ) . ' memory data files...';

    for my $file (@xml_list) {
        my $known = 0;
        for my $i ( 0 .. $#OFFSETS ) {
            $known = 1 if $file =~ m/$OFFSETS[$i]{version}/;
        }

        if ($known) {
            say "    One file ($file) discarded," . ' memory data inside already known.';
            next;
        }

        my $xml = get( $source . $file );
        croak 'Could not get it!' unless defined $xml;

        my $msg_file = $file;
        $msg_file =~ s/core\.xml/messages.txt/;
        my $message = get( $source . $msg_file );

        process_xml( $xml, $message );
    }
    return;
}

sub process_xml {
    my ( $xml, $message ) = @_;
    my ( @data_store, @new_data_store );

    my %config_hash;

    if ( $xml =~ m/<version name="(.+?)" \/>/i ) {
        $config_hash{version} = $1;
    }
    else { return 0; }

    if ( $xml =~ m/<pe timestamp_offset="0x(.+?)" timestamp="0x(.+?)" \/>/i ) {
        $config_hash{pe_timestamp_offset} = hex $1;
        $config_hash{PE}                  = hex $2;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="map_data" value="0x(.+?)" \/>/i ) {
        $config_hash{map_loc} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="map_x_count" value="0x(.+?)" \/>/i ) {
        $config_hash{x_count} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="map_y_count" value="0x(.+?)" \/>/i ) {
        $config_hash{y_count} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="map_z_count" value="0x(.+?)" \/>/i ) {
        $config_hash{z_count} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<offset name="map_data_type_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{type_off} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<offset name="map_data_designation_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{designation_off} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<offset name="map_data_occupancy_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{occupancy_off} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="mouse_x" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_x} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="mouse_y" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_y} = hex $1;
    }
    else { return 0; }

    if ( $xml =~ m/<address name="mouse_z" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_z} = hex $1;
    }
    else { return 0; }

    for my $i ( 0 .. $#OFFSETS ) {
        return 0 if $OFFSETS[$i]{version} eq $config_hash{version};
    }

    say "    Recognized new memory address data for DF $config_hash{version}," . ' inserting into data store.';
    say "--- -- -\n$message\n--- -- -" if defined $message;
    push @OFFSETS, \%config_hash;

    open my $HANDLE, '<', 'Lifevis/df_offsets.pm'
      or croak("horribly: $OS_ERROR");
    @data_store = <$HANDLE>;
    close $HANDLE or croak("horribly: $OS_ERROR");

    for my $line (@data_store) {
        if ( $line =~ m/OFFSETS\ END\ HERE/ ) {
            push @new_data_store, "    {\n";
            push @new_data_store, "        version => \"$config_hash{version}\",\n";
            push @new_data_store, '        PE => ' . sprintf( '0x%08x', $config_hash{PE} ) . ",\n";
            push @new_data_store, '        map_loc => ' . sprintf( '0x%08x', $config_hash{map_loc} ) . ",\n";
            push @new_data_store, '        x_count => ' . sprintf( '0x%08x', $config_hash{x_count} ) . ",\n";
            push @new_data_store, '        y_count => ' . sprintf( '0x%08x', $config_hash{y_count} ) . ",\n";
            push @new_data_store, '        z_count => ' . sprintf( '0x%08x', $config_hash{z_count} ) . ",\n";
            push @new_data_store,
              '        pe_timestamp_offset => ' . sprintf( '0x%08x', $config_hash{pe_timestamp_offset} ) . ",\n";
            push @new_data_store, '        type_off        => ' . sprintf( '0x%08x', $config_hash{type_off} ) . ",\n";
            push @new_data_store,
              '        designation_off => ' . sprintf( '0x%08x', $config_hash{designation_off} ) . ",\n";
            push @new_data_store,
              '        occupancy_off   => ' . sprintf( '0x%08x', $config_hash{occupancy_off} ) . ",\n";
            push @new_data_store, '        mouse_x   => ' . sprintf( '0x%08x', $config_hash{mouse_x} ) . ",\n";
            push @new_data_store, '        mouse_y   => ' . sprintf( '0x%08x', $config_hash{mouse_y} ) . ",\n";
            push @new_data_store, '        mouse_z   => ' . sprintf( '0x%08x', $config_hash{mouse_z} ) . ",\n";
            push @new_data_store, "    },\n";
        }
        push @new_data_store, $line;
    }

    open $HANDLE, '>', 'Lifevis/df_offsets.pm' or croak("horribly: $OS_ERROR");
    for my $line (@new_data_store) {
        print {$HANDLE} $line;
    }
    close $HANDLE or croak("horribly: $OS_ERROR");
    return;
}

### helpers

sub initialize {
    ( $VERSION, $detached ) = $_[1];
}

sub fatal_error {
    my ($error) = @_;
    if ($detached) {
        Win32::MsgBox( $error, MB_ICONSTOP, "Lifevis - $VERSION" );
        exit;
    }
    else {
        croak $error;
    }
}

sub notify_user {
    my ($message) = @_;
    if ($detached) {
        Win32::MsgBox( $message, MB_ICONINFORMATION, "Lifevis - $VERSION" );
    }
    else {
        say $message;
    }
}

1;
