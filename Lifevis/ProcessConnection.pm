use strictures;

package Lifevis::ProcessConnection;

use 5.010;
use Carp;
use English;
use File::Slurp 'read_file';
use Data::SExpression;
use Parse::CSV;
use Win32::API;

use lib '.';
use lib '..';
use Win32;
use Win32::Process;
use Lifevis::constants;
use Lifevis::df_offsets;

Win32::API->Import( "psapi", "EnumProcessModules", "NPNP", "I" );

use base 'Exporter';
our @EXPORT_OK = qw( connect_to_DF );

our $VERSION;
my $detached;
our $master_offset;

sub connect_to_DF {
    my ( $ver, $proc ) = init_process_connection();
    fatal_error( "Could not recognize Dwarf Fortress version." ) if !$ver;

    my @offsets;
    $offsets[version] = $ver;

    my $objects = Parse::CSV->new( file => "adresses/$ver/windows/globals.csv", names => 1 );

    my %targets = (
        "world.map.block_index"   => map_loc,
        "world.map.x_count_block" => x_count,
        "world.map.y_count_block" => y_count,
        "world.map.z_count_block" => z_count,
        "cursor.x"                => mouse_x,
        "cursor.y"                => mouse_y,
        "cursor.z"                => mouse_z,
        "world.units.all"         => creature_vector,
        "window_x"                => viewport_x,
        "window_y"                => viewport_y,
        "window_z"                => viewport_z,
        "init.display.grid_x"     => window_grid_x,
        "init.display.grid_y"     => window_grid_y,
        "ui_menu_width"           => menu_state,
        "world.buildings.all"     => building_vector,
        "world.items.all"         => item_vector,
    );

    while ( my $location = $objects->fetch ) {
        my $target = $targets{ $location->{"Field Name"} };
        next if !$target;
        $offsets[$target] = hex $location->{Address};
    }
    $offsets[type_off]        = 0x007a;
    $offsets[designation_off] = 0x027c;
    $offsets[occupancy_off]   = 0x067c;

    $offsets[$_] += $master_offset - 0x400000
      for ( map_loc, x_count, y_count, z_count, mouse_x, mouse_y,
        mouse_z,       creature_vector, viewport_x, viewport_y,      viewport_z, window_grid_x,
        window_grid_y, menu_state,      view_state, building_vector, item_vector,
      );

    return ( $proc, $proc->{hProcess}, \@offsets );
}

sub init_process_connection {
    ### get dwarf process id #######################################################
    my %list = Win32::Process::List->new()->GetProcesses();
    my ( $dwarf_pid ) = grep { $list{$_} =~ /(dwarfort|Dwarf Fortress)\.exe/ } keys %list;
    fatal_error( 'Could not find process ID, make sure DF is running and' . ' a savegame is loaded.' ) if !$dwarf_pid;

    ### lower priority of dwarf fortress ###########################################
    Win32::Process::Open( my $dwarf_process, $dwarf_pid, 1 );
    $dwarf_process->SetPriorityClass( IDLE_PRIORITY_CLASS );
    croak 'Could not lower DF process priority, this is really odd and'
      . ' should not happen, try running as administrator or poke Mithaldu/Xenofur.'
      if !$dwarf_process;

    Win32::Process::Open( my $self_process, $PROCESS_ID, 1 );
    $self_process->SetPriorityClass( IDLE_PRIORITY_CLASS );
    croak 'Could not lower own process priority, this is really odd and'
      . ' should not happen, try running as administrator or poke Mithaldu/Xenofur.'
      if !$self_process;

    ### actually read stuff from memory ############################################
    my $proc =
      Win32::Process::Memory->new( { pid => $dwarf_pid, access => 'read/write/query' } )
      ;    # open process with read access
    croak 'Could not open memory access to Dwarf Fortress, this is really odd'
      . ' and should not happen, try running as'
      . ' administrator or poke Mithaldu/Xenofur.'
      if !$proc;

    ### Let's Pla... erm, figure out what version this is ##########################
    $master_offset = enum_win( $proc->{hProcess} );

    my $pe_offset = $proc->get_u32( $master_offset + 0x3C );

    my %versions;

    my @dirs = glob( "adresses/*" );
    for my $dir ( @dirs ) {
        ( my $version_info = read_file "$dir/version.lisp" ) =~ s/#(\w+)/"0$1"/;
        my $timestamp = Data::SExpression->new->read( ( split /\n/, $version_info )[1] )->[2];
        my $version   = Data::SExpression->new->read( ( split /\n/, $version_info )[0] )->[2];
        $versions{ hex $timestamp } = $version;
    }

    my $pe_timestamp = $proc->get_u32( $master_offset + $pe_offset + 8 );
    return if !$versions{$pe_timestamp};

    return ( $versions{$pe_timestamp}, $proc );
}

sub enum_win {
    my ( $pid ) = @_;

    my $cb        = Win32::API::Type->sizeof( 'HMODULE' ) * 1024;
    my $lphmodule = "\x0" x $cb;
    EnumProcessModules( $pid, $lphmodule, $cb, "" );

    return Win32::API::Type::Unpack( 'HMODULE', $lphmodule );
}

### helpers

sub initialize {
    ( $VERSION, $detached ) = @_;
}

sub fatal_error {
    my ( $error ) = @_;
    if ( $detached ) {
        Win32::MsgBox( $error, MB_ICONSTOP, "Lifevis - $VERSION" );
        exit;
    }
    else {
        croak $error;
    }
}

sub notify_user {
    my ( $message ) = @_;
    if ( $detached ) {
        Win32::MsgBox( $message, MB_ICONINFORMATION, "Lifevis - $VERSION" );
    }
    else {
        say $message;
    }
}

1;
