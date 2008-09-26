#!/usr/bin/perl -w

# $Id$
# $Revision$
# $HeadURL$
# $Date$
# $Source$

use 5.010;
use strict;
use warnings;
#use diagnostics;
=cut
use criticism (
    -exclude => ['ProhibitCallsToUndeclaredSubs',
              'ProhibitConstantPragma',
              'RequireExtendedFormatting',
              'ProhibitComplexRegexes',
              'RequireVersionVar',
              'ProhibitLongLines',
              'ProhibitMagicNumbers', # TODO : Reconsider this.
              'ProhibitCommentedOutCode', # TODO : Comment out in clean-up
              'ProhibitFlagComments', # TODO : Comment out in clean-up
              'ProhibitPostfixControls',
              'RequireLineBoundaryMatching',
              'ProhibitCallsToUnexportedSubs'],
    -severity => 1
);
=cut
use utf8;

use Benchmark ':hireswallclock';

use Carp;
use OpenGL qw/ :all /;
use OpenGL::Image;
use Image::BMP;
use Math::Trig;
use Win32;
use Win32::Process::List;
use Win32::Process;
use Win32::Process::Memory;
use LWP::Simple;

use English qw(-no_match_vars);
$OUTPUT_AUTOFLUSH = 1;

# %DB::packages = ( 'main' => 1 );

# Dwarf Fortress 3D Map Viewer
#
# The base intention of this program is to provide an OpenGL engine capable of
# rendering ascii-based map files in such a way as to semi-accurately display
# the interior layout of a dwarven fortress and surroundings.
#
# It is Public Domain software.
#
# This program based on this:
#
### ----------------------
### OpenGL cube demo.
###
### Written by Chris Halsall (chalsall@chalsall.com) for the
### O'Reilly Network on Linux.com (oreilly.linux.com).
### May 2000.
###
### Released into the Public Domain; do with it as you wish.
### We would like to hear about interesting uses.
###
### Coded to the groovy tunes of Yello: Pocket Universe.
###
### Translated from C to Perl by J-L Morel <jl_morel@bribes.org>
### ( http://www.bribes.org/perl/wopengl.html )

use constant TYPE => 0;
use constant DESIGNATION => 1;
use constant OCCUPATION => 2;

use constant PROGRAM_TITLE => 'Lifevis - A real-time Dwarf Fortress world viewer';
use constant PI        => 4 * atan2 1, 1;
use constant PIOVER180 => PI / 180;
my $tex_const = 0.046875; # width or height of one texture field

# Some global variables.

# Window and texture IDs, window width and height.
my $window_ID;
my $window_width = 533;
my $window_height = 300;

my @texture_ID;
    
use constant grass => 0;
use constant stone => 1;
use constant cursor => 2;
use constant obsidian => 3;
use constant unknown => 4;
use constant minstone => 5;
use constant pool => 6;
use constant water => 7;
use constant soil => 8;
use constant tree => 9;
use constant shrub => 10;
use constant sapling => 10;

# Object and scene global variables.

# Camera position and rotation variables.
my ($x_pos,$y_pos,$z_pos,$x_off,$y_off,$z_off,$x_rot,$y_rot);
$x_pos   =   0;
$y_pos   =   0;
$z_pos   =   0;
$x_rot   = -45.0;
$y_rot   = 157.5;
my $mouse_dist = 40;
my $middle_mouse = 0;
reposition_camera(); # sets up initial camera position offsets


# Settings for our light.  Try playing with these (or add more lights).
my @light_ambient  = ( 0.7, 0.7, 0.7, 1.0 );
my @light_diffuse  = ( 0.9, 0.9, 0.9, 1.0 );
my @light_position = ( -0.8, 1.5, 1.0, 0.0 );

my (%special_inputs, %normal_inputs);   # hashes containing the functions called on certain key presses

my $last_mouse_x;
my $last_mouse_y;

my (%sin_cache, %cos_cache);

our @OFFSETS;
my $dwarf_pid;
my $ver;
my $proc;
my $pe_timestamp;

my ($submenid,$menid);

my $delay_full_update=40;

my $range = 1;
my $cache_limit = (1+(2*$range))*(1+(2*$range));
my ($xmouse, $ymouse, $zmouse) = (0,0,15);                 # cursor coordinates
my ($xmouse_old, $ymouse_old, $zmouse_old) = (0,0,15);                 # cursor coordinates
my ($xcell, $ycell)=($range,$range);                    # cursor cell coordinates
my ($xcount, $ycount);
our $ZCOUNT;                 # dimensions of the map data we're dealing with
my ($x_max, $y_max);                 # dimensions of the map data we're dealing with

my $slice=0;
my $slice_follows=0;

my $map_base;                                   # offset of the address where the map blocks start

my @cells;
use constant changed => 0;
use constant z => 1;
use constant offset => 2;
use constant cache_ptr => 3;
# slice constants
#use constant changed => 0;

my @tiles;
use constant type => 0;

my @cache;
use constant cell_ptr => 0;

my @cache_bucket;
my @protected_caches;

our @TILE_TYPES;
do 'df_internals.pl';
use constant base_visual => 0;
use constant base_texture => 1;
use constant EMPTY => 0;
use constant FLOOR => 1;
use constant WALL => 2;
use constant RAMP => 3;
use constant STAIR => 4;
use constant FORTIF => 5;
use constant PILLAR => 6;
use constant RAMP_TOP => 7;

# TODO: Split these and ramp-tops into seperate models. Fix texturing on ramp models where i fucked up diagonals.
my @ramps = (
{ mask => 0b0_1111_0000, func => '4S' },
{ mask => 0b0_1101_0000, func => '3S1' },
{ mask => 0b0_1110_0000, func => '3S2' },
{ mask => 0b0_0111_0000, func => '3S3' },
{ mask => 0b0_1011_0000, func => '3S4' },
{ mask => 0b0_1100_0010, func => '2S_1D1' },
{ mask => 0b0_0110_0001, func => '2S_1D2' },
{ mask => 0b0_0011_1000, func => '2S_1D3' },
{ mask => 0b0_1001_0100, func => '2S_1D4' },
{ mask => 0b0_1100_0000, func => '2S1' },
{ mask => 0b0_0110_0000, func => '2S2' },
{ mask => 0b0_0011_0000, func => '2S3' },
{ mask => 0b0_1001_0000, func => '2S4' },
{ mask => 0b0_1010_0000, func => '1S_1S1' },
{ mask => 0b0_0101_0000, func => '1S_1S2' },
{ mask => 0b0_1000_0100, func => '1S_1DL1' },
{ mask => 0b0_0100_0010, func => '1S_1DL2' },
{ mask => 0b0_0010_0001, func => '1S_1DL3' },
{ mask => 0b0_0001_1000, func => '1S_1DL4' },
{ mask => 0b0_1000_0010, func => '1S_1DR1' },
{ mask => 0b0_0100_0001, func => '1S_1DR2' },
{ mask => 0b0_0010_1000, func => '1S_1DR3' },
{ mask => 0b0_0001_0100, func => '1S_1DR4' },
{ mask => 0b0_1000_0000, func => '1S1' },
{ mask => 0b0_0100_0000, func => '1S2' },
{ mask => 0b0_0010_0000, func => '1S3' },
{ mask => 0b0_0001_0000, func => '1S4' },
{ mask => 0b0_0000_1111, func => '4D' },
{ mask => 0b0_0000_1101, func => '3D1' },
{ mask => 0b0_0000_1110, func => '3D2' },
{ mask => 0b0_0000_0111, func => '3D3' },
{ mask => 0b0_0000_1011, func => '3D4' },
{ mask => 0b0_0001_1100, func => '1S_2D4' },
{ mask => 0b0_1000_0110, func => '1S_2D1' },
{ mask => 0b0_0100_0011, func => '1S_2D2' },
{ mask => 0b0_0010_1001, func => '1S_2D3' },
{ mask => 0b0_0000_1001, func => '2D1' },
{ mask => 0b0_0000_1100, func => '2D2' },
{ mask => 0b0_0000_0110, func => '2D3' },
{ mask => 0b0_0000_0011, func => '2D4' },
{ mask => 0b0_0000_1010, func => '1D_1D1' },
{ mask => 0b0_0000_0101, func => '1D_1D2' },
{ mask => 0b0_0000_1000, func => '1D1' },
{ mask => 0b0_0000_0100, func => '1D2' },
{ mask => 0b0_0000_0010, func => '1D3' },
{ mask => 0b0_0000_0001, func => '1D4' },
{ mask => 0b1_0000_0000, func => 'N' },
);

our %DRAW_MODEL;
do 'models.pl';

use Win32::OLE('in');
my $WMI_service_object = Win32::OLE->GetObject ("winmgmts:\\\\.\\root\\CIMV2") or croak "WMI connection failed.\n";
my @state_array;
my $memory_use;

# ------
# The main() function.  Inits OpenGL.  Calls our own init function,
# then passes control onto OpenGL.

connect_to_DF();

extract_base_memory_data();
#exit;
glutInit();

print 'setting up OpenGL environment...   ';
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
glutInitWindowSize($window_width, $window_height);
glutInitWindowPosition(390,250);

$window_ID = glutCreateWindow( PROGRAM_TITLE ); # Open a window

createMenu();

# Set up Callback functions ####################################################

glutDisplayFunc(\&render_scene);               # Register the callback function to do the drawing.

#glutIdleFunc(\&idle_tasks);                  # If there's nothing to do, draw.

glutReshapeFunc(\&resize_scene);               # It's a good idea to know when our window's resized.

glutKeyboardFunc(\&process_key_press);               # And let's get some keyboard input.
glutSpecialFunc(\&process_special_key_press);

glutMotionFunc(\&process_active_mouse_motion);
glutMouseFunc(\&process_mouse_click);



print "OpenGL environment ready.\n";

print "initializing OpenGL...\n";

ourInit($window_width, $window_height);         # OK, OpenGL's ready to go.  Let's call our own init function.

print "OpenGL initialized.\n";

# Print out a bit of help dialog.
print PROGRAM_TITLE, "\n";
print << 'TXT';
Use arrow keys to rotate, 'R' to reverse, 'X' to stop.
Page up/down will move cube away from/towards camera.
Use first letter of shown display mode settings to alter.
Q or [Esc] to quit; OpenGL window must have focus for input.
TXT
;

refresh_map_data();

# Pass off control to OpenGL.
# Above functions are called as appropriate.
print "switching to main loop...\n";
glutMainLoop();


################################################################################
## Rendering Functions #########################################################
################################################################################

my @cell_offsets;

sub refresh_map_data {
    glutPostRedisplay() if sync_to_DF();
    glutTimerFunc (100, \&refresh_map_data, 0);
    return;
}

sub extract_base_memory_data {
    $xcount = $proc->get_u32( $OFFSETS[$ver]{x_count} ); # map size in cells
    $ycount = $proc->get_u32( $OFFSETS[$ver]{y_count} );
    $ZCOUNT = $proc->get_u32( $OFFSETS[$ver]{z_count} );

    $x_max = ($xcount*16)-1;
    $y_max = ($ycount*16)-1;

    # checking whether the game has a map already
    $map_base = $proc->get_u32( $OFFSETS[$ver]{map_loc} );
    croak 'Map data is not yet available, make sure you have a game loaded.' unless ( $map_base );

    # get the offsets of the address storages for each x-slice and cycle through
    my @xoffsets = $proc->get_packs('L', 4, $map_base, $xcount);
    for my $bx ( 0 .. $xcount-1 ) {
        # get the offsets of the address storages for each y-column in this x-slice and cycle through
        my @yoffsets = $proc->get_packs('L', 4, $xoffsets[$bx], $ycount);
        for my $by ( 0 .. $ycount-1 ) {
            $cell_offsets[$bx][$by] = $yoffsets[$by];
            $cells[$bx][$by][offset] = $yoffsets[$by];
        }
    }
    return;
}

sub sync_to_DF {
    my $redraw = 0;
    my $deletions = 0;
    my $start_time = new Benchmark;

    $xmouse_old = $xmouse;
    $ymouse_old = $ymouse;
    $zmouse_old = $zmouse;

    # get mouse data
    $xmouse = $proc->get_u32( $OFFSETS[$ver]{mouse_x} );
    $ymouse = $proc->get_u32( $OFFSETS[$ver]{mouse_y} );
    $zmouse = $proc->get_u32( $OFFSETS[$ver]{mouse_z} );

    # normalize mouse data if out of bounds, i.e. cursor not in use
    if ( $xmouse > $xcount*16 || $ymouse > $ycount*16 || $zmouse > $ZCOUNT ) {
        $xmouse = $xmouse_old;
        $ymouse = $ymouse_old;
        $zmouse = $zmouse_old;
    }

    $redraw = 1 if (
        $xmouse != $xmouse_old ||
        $ymouse != $ymouse_old ||
        $zmouse != $zmouse_old
    );

    $delay_full_update++;
    return 0 if ( $delay_full_update < 20 && $redraw == 0 );
    $delay_full_update=0;

    # update camera system with mouse data
    ($x_pos,$z_pos,$y_pos) = ($xmouse,$ymouse,$zmouse);
    reposition_camera(); # sets up initial camera position offsets

    # calculate cell coords from mouse coords
    ($xcell, $ycell) = ( int($xmouse/16), int($ymouse/16) );
    $xcell = $range if $xcell <= $range-1;
    $ycell = $range if $ycell <= $range-1;
    $xcell = $xcount-$range-1 if $xcell >= $xcount-$range;
    $ycell = $ycount-$range-1 if $ycell >= $ycount-$range;
    
    #TODO: When at the edge, only grab at inner edge.
    # cycle through cells in range around cursor to grab data
    for my $bx ( $xcell-$range-1 .. $xcell+$range+1 ) {
        next if ( $bx < 0 || $bx > $xcount-1);
        for my $by ( $ycell-$range-1 .. $ycell+$range+1 ) {
            next if ( $by < 0 || $by > $ycount-1);

            # cycle through slices in cell
            my @zoffsets = $proc->get_packs('L', 4, $cells[$bx][$by][offset], $ZCOUNT);
            $cells[$bx][$by][changed] = 0 if !defined $cells[$bx][$by][changed];
            for my $bz ( 0..$#zoffsets ) {
                next if ( $zoffsets[$bz] == 0 );                # go to the next block if this one is not allocated

                # process slice in cell and set slice to changed
                my $slice_changed = new_process_block(
                    $zoffsets[$bz],                             # offset of the current slice
                    $bx,                                        # x location of the current slice
                    $by,                                        # y location of the current slice
                    $bz );
                # update changed status of cell if necessary
                if ($slice_changed) {
                    $cells[$bx][$by][z][$bz] = 1;
                    $cells[$bx][$by][changed] = 1;  # z location of the current block
                }
            }
            $redraw = 1 if $cells[$bx][$by][changed];
        }
    }

    # cycle through cells in range around cursor to generate display lists
    for my $bx ( $xcell-$range .. $xcell+$range ) {
        for my $by ( $ycell-$range .. $ycell+$range ) {

            my $cache_id;

            if ( defined $cells[$bx][$by][cache_ptr] ){
                $cache_id = $cells[$bx][$by][cache_ptr];

                # cell is in cache
                if( $cells[$bx][$by][changed] ) {

                    # cycle through slices and create displaylists as necessary, storing the ids in the cache entry
                    my $slices = $cells[$bx][$by][z];
                    for my $slice ( 0 .. (@{ $slices } - 1) ) {
                        if ( @{ $slices }[$slice] ) {
                            generate_display_list( $cache_id, $slice, $by, $bx );
                            @{ $slices }[$slice] = 0;
                        }
                    }
                    $cells[$bx][$by][changed] = 0;
                }

                $cache[$cache_id][1]++;

                $protected_caches[$cache_id] = 1;

            }
            else {
                # cell is not in cache

                # get fresh cache id either from end of cache or out of bucket
                $cache_id = $#cache+1;
                $cache_id = pop @cache_bucket if ( $#cache_bucket > -1 );

                # set up link to cell and back-link to cache id
                $cache[$cache_id][cell_ptr] = \$cells[$bx][$by][cache_ptr];
                $cells[$bx][$by][cache_ptr] = $cache_id;
                $cache[$cache_id][1] = 0;

                # cycle through slices and create displaylists as necessary, storing the ids in the cache entry
                my $slices = $cells[$bx][$by][z];
                for my $slice ( 0 .. ( @{ $slices } - 1) ) {
                    if ( @{ $slices }[$slice] ) {
                        generate_display_list( $cache_id, $slice, $by, $bx );
                        @{ $slices }[$slice] = 0;
                    }
                }
                $cells[$bx][$by][changed] = 0;

                $protected_caches[$cache_id] = 1;
            }
        }
    }

    @state_array = in $WMI_service_object->ExecQuery ('SELECT PrivatePageCount FROM Win32_Process WHERE ProcessId = '.$PROCESS_ID,'WQL',0x10 | 0x20);
    $memory_use = $state_array[0]->{PrivatePageCount};

    # check that we're not using too much memory and destroy cache entries if necessary
    while ( $memory_use > 300_787_840 && $deletions < (2*$range) ) { # $cache_limit <= $#cache && 
        my $delete;
        my $use;

        for my $id (0..$#cache) {
            next if !defined $cache[$id][1]; # skip empty caches
            next if $protected_caches[$id];  # skip caches we're currently looking at

            if ( !defined $use || $cache[$id][1] < $use ) {
                $delete = $id;
                $use = $cache[$id][1];
            }
        }

        last if !defined $delete;

        my $slices = $cache[$delete];
        for my $slice ( 2 .. ( @{ $slices } - 1) ) {
            glDeleteLists($cache[$delete][$slice],1) if $cache[$delete][$slice];
        }

        undef ${$cache[$delete][0]};

        undef $cache[$delete];
        push @cache_bucket, $delete;

        $deletions++;

        #printf "Commited Memory = %d Bytes\n", $myself->get_memtotal;
    }

    @protected_caches = [];

    my $end_time = new Benchmark;
    my $time_difference = timediff($end_time, $start_time);
    print 'the code took:',timestr($time_difference),"\n";

    #say "$#cache caches";
    #say "---";
    return $redraw;
}

sub generate_display_list {
    my ( $id, $z, $y, $x ) = @_;
    my $dl;
    my $type;
    my $type_below;

    if($cache[$id][$z+2]) {
        $dl = $cache[$id][$z+2];
    }
    else {
        $dl = glGenLists(1);
        $cache[$id][$z+2] = $dl;
    }

    glNewList($dl, GL_COMPILE);
    for my $texture ( 0 .. $#texture_ID ) {
        glBindTexture(GL_TEXTURE_2D, $texture_ID[$texture]);       # select mipmapped texture
        glBegin(GL_TRIANGLES);
        my $tile = $tiles[$z][type];
        my $tile_below = $tiles[$z-1][type];
        my $tile_above = $tiles[$z+1][type];
        for my $rx (($x*16)..($x*16)+15) {
            for my $ry (($y*16)..($y*16)+15) {
    
                next if !defined $tile->[$rx][$ry];
                $type = $tile->[$rx][$ry];
                next if $type == 32;
                next if $TILE_TYPES[$type][base_texture] != $texture;
                $type_below = $tile_below->[$rx][$ry];
    
                my ($below, $north, $south, $west, $east) = (EMPTY,EMPTY,EMPTY,EMPTY,EMPTY);
                my ($northeast, $southeast, $southwest, $northwest) = (EMPTY,EMPTY,EMPTY,EMPTY);
                my $x_mod = $rx%16;
                my $y_mod = $ry%16;
    
                $below = $TILE_TYPES[$type_below][base_visual] if $type_below;
    
                if ( $TILE_TYPES[$type][base_visual] == WALL ) {
                    $north = $TILE_TYPES[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $y_mod != 0;
                    $south = $TILE_TYPES[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $y_mod != 15;
                    $west = $TILE_TYPES[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $x_mod != 0;
                    $east = $TILE_TYPES[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $x_mod != 15;
                    $DRAW_MODEL{Wall}->($rx,$z,$ry,1,1);
                    next;
                }
    
                elsif ( $TILE_TYPES[$type][base_visual] == FLOOR ) {
                    my $type_above = $tile_above->[$rx][$ry];
                    $north = $TILE_TYPES[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $y_mod != 0;
                    $south = $TILE_TYPES[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $y_mod != 15;
                    $west = $TILE_TYPES[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $x_mod != 0;
                    $east = $TILE_TYPES[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $x_mod != 15;
                    
                    my $brightness_modificator = 1;
                    $brightness_modificator = 0.75 if( defined $type_above && $TILE_TYPES[$type_above][base_visual] != EMPTY );
                    $DRAW_MODEL{Floor}->($rx,$z,$ry,1,$brightness_modificator);
                    next;
                }
    
                elsif ( $TILE_TYPES[$type][base_visual] == RAMP ) {
                    next if ( defined $type_below && $TILE_TYPES[$type_below][base_visual] == RAMP );
                    $north = $TILE_TYPES[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $ry != 0;
                    $northeast = $TILE_TYPES[$tile->[$rx+1][$ry-1]][base_visual] if $tile->[$rx+1][$ry-1] && ($ry != 0 || $rx != $x_max);
                    $east = $TILE_TYPES[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $rx != $x_max;
                    $southeast = $TILE_TYPES[$tile->[$rx+1][$ry+1]][base_visual] if $tile->[$rx+1][$ry+1] && ($ry != $y_max || $rx != $x_max);
                    $south = $TILE_TYPES[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $ry != $y_max;
                    $southwest = $TILE_TYPES[$tile->[$rx-1][$ry+1]][base_visual] if $tile->[$rx-1][$ry+1] && ($ry != $y_max || $ry != 0);
                    $west = $TILE_TYPES[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $rx != 0;
                    $northwest = $TILE_TYPES[$tile->[$rx-1][$ry-1]][base_visual] if $tile->[$rx-1][$ry-1] && ($ry != 0|| $ry != 0);
                    
                    my $surroundings = 0;
                    $surroundings += ($north == WALL)       ? 0b1000_0000 : 0;
                    $surroundings += ($west == WALL)        ? 0b0100_0000 : 0;
                    $surroundings += ($south == WALL)       ? 0b0010_0000 : 0;
                    $surroundings += ($east == WALL)        ? 0b0001_0000 : 0;
                    $surroundings += ($northwest == WALL)   ? 0b0000_1000 : 0;
                    $surroundings += ($southwest == WALL)   ? 0b0000_0100 : 0;
                    $surroundings += ($southeast == WALL)   ? 0b0000_0010 : 0;
                    $surroundings += ($northeast == WALL)   ? 0b0000_0001 : 0;
                    
                    $surroundings = 0b1_0000_0000 if ( $surroundings == 0 );
    
                    for my $ramp_type ( 0 .. $#ramps ){
                        my $mask = $ramps[$ramp_type]{mask};
                        my $bit_comparison = $mask & $surroundings;
                        if ( $bit_comparison == $mask ){
                            my $func = $ramps[$ramp_type]{func};
                            croak "Need following ramp model: $func" if !defined $DRAW_MODEL{$func};
                            $DRAW_MODEL{$func}->($rx,$z,$ry,1,1);
                            last;
                        }
                    }
                    next;
                }
    
            }
        }
        glEnd();
    }
    glEndList();

    return;
}

sub new_process_block {
    my ($block_offset, $bx, $by, $bz) = @_;
    my $changed = 0;

    my @type_data        = $proc->get_packs(        # extract type/designation/occupation arrays for this block
        'S', 2,                                     # format and size in bytes of each data unit
        $block_offset+$OFFSETS[$ver]{type_off},            # starting offset
        256);                                       # number of units
    #my @designation_data = $proc->get_packs('L', 4, $block_offset+$OFFSETS[$ver]{designation_off}, 256);
    #my @ocupation_data   = $proc->get_packs('L', 4, $block_offset+$OFFSETS[$ver]{occupancy_off},   256);

    my ($rx,$ry,$y,$x,$tile);

    my $bx_scaled = $bx * 16;
    my $by_scaled = $by * 16;
	my $tile_index=0;
   
    for my $x ( 0..15 ) {
        $rx = $bx_scaled+$x;                   # this calculates the real x and y values of this tile on the overall map_base
        $tile = $tiles[$bz][type][$rx] ||= [];

        for my $y ( 0..15 ) {                           # cycle through 16 x and 16 y values, which generate a total of 256 tile indexes
            $ry = $by_scaled+$y;

            if ( !defined $tile->[$ry] || $tile->[$ry] != $type_data[$tile_index] ) {
                $changed = 1;
                $tile->[$ry] = $type_data[$tile_index];
            }
            #$cells[$real_x][$real_y][z][$bz][DESIGNATION] = $designation_data[$tile_index];
            #$cells[$real_x][$real_y][z][$bz][OCCUPATION] = $ocupation_data[$tile_index];
            ++$tile_index;
        }
    }

    return $changed;
}

sub ask { print "$_[0]";
    return; }

sub connect_to_DF {

    do 'df_offsets.pl';

    $ver = init_process_connection();

    refresh_datastore() unless $ver;

    return;
}

sub init_process_connection {
    ### get dwarf process id #######################################################
    my %list = Win32::Process::List->new()->GetProcesses();
    for my $key ( keys %list ) {
        $dwarf_pid = $key   if ( $list{$key} =~ /dwarfort.exe/ );
    }
    croak "Couldn't find process ID, make sure DF is running and a savegame is loaded." unless ( $dwarf_pid );

    ### lower priority of dwarf fortress ###########################################
    Win32::Process::Open( my $dwarf_process, $dwarf_pid, 1 );
    $dwarf_process->SetPriorityClass( IDLE_PRIORITY_CLASS );
    croak "Couldn't lower process priority, this is really odd and shouldn't happen, try running as administrator or poke Mithaldu/Xenofur." unless ( $dwarf_process );

    ### actually read stuff from memory ############################################
    $proc = Win32::Process::Memory->new({ pid  => $dwarf_pid, access => 'read/query' });   # open process with read access
    croak "Couldn't open memory access to Dwarf Fortress, this is really odd and shouldn't happen, try running as administrator or poke Mithaldu/Xenofur." unless ( $proc );


    ### Let's Pla... erm, figure out what version this is ##########################

    for my $i ( 0..$#OFFSETS ) {
        $pe_timestamp = $proc->get_u32( $OFFSETS[$i]{pe_timestamp_offset} );
        return $i if ( $OFFSETS[$i]{PE} == $pe_timestamp );
    }
    return;
}


################################################################################

sub refresh_datastore {
    say "Could not find DF version in local data store. Checking for new memory address data...\n";
    import_remote_xml();

    $ver = init_process_connection();

    if (!$ver) {
        croak "Version could not be correctly identified. Please contact Xenofur/Mithaldu or Jifodu for updated memory addresses.\n";
    }
    return;
}

sub import_remote_xml {
    say '  Remotely...';
    my $source = 'http://www.geocities.com/jifodus/tables/dwarvis/';
    my @xml_list;

    my $list = get($source);
    croak 'Couldn\'t get it!' unless defined $list;

    while ( $list =~ m/<A HREF="(.+?\.xml)">/gi ) {
        push @xml_list, $1;
    }

    say '    Found '.($#xml_list+1).' memory data files...';

    for my $file (@xml_list) {
        my $known = 0;
        for my $i ( 0..$#OFFSETS ) {
            $known = 1 if $file =~ m/$OFFSETS[$i]{version}/;
        }

        if ($known) {
            say "    One file ($file) discarded, memory data inside already known.";
            next;
        }

        my $xml = get($source.$file);
        croak 'Couldn\'t get it!' unless defined $xml;

        my $msg_file = $file;
        $msg_file =~ s/core\.xml/messages.txt/;
        my $message = get($source.$msg_file);

        process_xml($xml,$message);
    }
    return;
}

sub process_xml {
    my ($xml, $message) = @_;
    my (@data_store,@new_data_store);

    my %config_hash;

    if( $xml =~ m/<version name="(.+?)" \/>/i ) {
        $config_hash{version} = $1;
    } else { return 0; }

    if( $xml =~ m/<pe timestamp_offset="0x(.+?)" timestamp="0x(.+?)" \/>/i ) {
        $config_hash{pe_timestamp_offset} = hex $1;
        $config_hash{PE} = hex $2;
    } else { return 0; }

    if( $xml =~ m/<address name="map_data" value="0x(.+?)" \/>/i ) {
        $config_hash{map_loc} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="map_x_count" value="0x(.+?)" \/>/i ) {
        $config_hash{x_count} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="map_y_count" value="0x(.+?)" \/>/i ) {
        $config_hash{y_count} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="map_z_count" value="0x(.+?)" \/>/i ) {
        $config_hash{z_count} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<offset name="map_data_type_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{type_off} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<offset name="map_data_designation_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{designation_off} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<offset name="map_data_occupancy_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{occupancy_off} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="mouse_x" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_x} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="mouse_y" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_y} = hex $1;
    } else { return 0; }

    if( $xml =~ m/<address name="mouse_z" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_z} = hex $1;
    } else { return 0; }

    for my $i ( 0..$#OFFSETS ) {
        return 0 if $OFFSETS[$i]{version} eq $config_hash{version};
    }

    say "    Recognized new memory address data for DF $config_hash{version}, inserting into data store.";
    say "--- -- -\n$message\n--- -- -" if defined $message;
    push @OFFSETS, \%config_hash;

    open my $HANDLE, '<', "df_offsets.pl" or croak ( "horribly: $OS_ERROR" );
    @data_store = <$HANDLE>;
    close $HANDLE or croak ( "horribly: $OS_ERROR" );

    for my $line (@data_store) {
        if ( $line =~ m/OFFSETS\ END\ HERE/ ) {
            push @new_data_store, "        {\n";
            push @new_data_store, "            version => \"$config_hash{version}\",\n";
            push @new_data_store, '            PE => '.sprintf('0x%08x', $config_hash{PE}).",\n";
            push @new_data_store, '            map_loc => '.sprintf('0x%08x', $config_hash{map_loc}).",\n";
            push @new_data_store, '            x_count => '.sprintf('0x%08x', $config_hash{x_count}).",\n";
            push @new_data_store, '            y_count => '.sprintf('0x%08x', $config_hash{y_count}).",\n";
            push @new_data_store, '            z_count => '.sprintf('0x%08x', $config_hash{z_count}).",\n";
            push @new_data_store, '            pe_timestamp_offset => '.sprintf('0x%08x', $config_hash{pe_timestamp_offset}).",\n";
            push @new_data_store, '            type_off        => '.sprintf('0x%08x', $config_hash{type_off}).",\n";
            push @new_data_store, '            designation_off => '.sprintf('0x%08x', $config_hash{designation_off}).",\n";
            push @new_data_store, '            occupancy_off   => '.sprintf('0x%08x', $config_hash{occupancy_off}).",\n";
            push @new_data_store, '            mouse_x   => '.sprintf('0x%08x', $config_hash{mouse_x}).",\n";
            push @new_data_store, '            mouse_y   => '.sprintf('0x%08x', $config_hash{mouse_y}).",\n";
            push @new_data_store, '            mouse_z   => '.sprintf('0x%08x', $config_hash{mouse_z}).",\n";
            push @new_data_store, "        },\n";
        }
        push @new_data_store, $line;
    }

    open $HANDLE, ">", "df_offsets.pl" or croak ( "horribly: $OS_ERROR" );
    for my $line ( @new_data_store ) {
        print $HANDLE $line;
    }
    close $HANDLE or croak ( "horribly: $OS_ERROR" );
    return;
}


################################################################################



################################################################################
## Rendering Functions #########################################################
################################################################################

# ------
# Does everything needed before losing control to the main
# OpenGL event loop.

sub ourInit {
    my ($Width, $Height) = @_;

    build_textures();

    glClearColor(0.7, 0.7, 0.7, 0.0);    # Color to clear color buffer to.

    glClearDepth(1.0);    # Depth to clear depth buffer to; type of test.
    glDepthFunc(GL_LESS);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    glCullFace(GL_BACK);
    glEnable(GL_CULL_FACE);

    glShadeModel(GL_SMOOTH);    # Enables Smooth Color Shading; try GL_FLAT for (lack of) fun.
    #glEnable(GL_NORMALIZE);

    resize_scene($Width, $Height);    # Load up the correct perspective matrix; using a callback directly.

    glLightfv_p(GL_LIGHT1, GL_AMBIENT,  @light_ambient);
    glLightfv_p(GL_LIGHT1, GL_DIFFUSE,  @light_diffuse);

    glEnable (GL_LIGHT1);

    glColorMaterial(GL_FRONT,GL_AMBIENT_AND_DIFFUSE);    # A handy trick -- have surface material mirror the color.
    glEnable(GL_COLOR_MATERIAL);
    return;
}

# ------
# Routine which draws all cubes in the map

# ------
# Barebone menu creation functions

sub createMenu {

  $submenid = glutCreateMenu(\&menu);
  glutAddMenuEntry('Teapot', 2);
  glutAddMenuEntry('Cube', 3);
  glutAddMenuEntry('Torus', 4);

  $menid = glutCreateMenu(\&menu);
  glutAddMenuEntry('Clear', 1);
  glutAddSubMenu('Draw', $submenid);
  glutAddMenuEntry('Quit', 0);

  glutAttachMenu(GLUT_RIGHT_BUTTON);
    return;
}

sub menu {
    my ($in) = @_;

  if($in == 0 && defined $in){
    glutDestroyWindow($window_ID);
    exit(0);
  }
  
  glutPostRedisplay();
    return;
}

# ------
# Routine which handles background stuff when the app is idle

sub idle_tasks {

    glutPostRedisplay();
    return;
}

# ------
# Routine which actually does the drawing

sub render_scene {
    my $buf; # For our strings.

    # Enables, disables or otherwise adjusts as appropriate for our current settings.

    glEnable(GL_TEXTURE_2D);

    glEnable(GL_LIGHTING);

    glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

    glEnable(GL_DEPTH_TEST);

    glMatrixMode(GL_MODELVIEW);    # Need to manipulate the ModelView matrix to move our model around.

    gluLookAt(
        $x_pos + $x_off, $y_pos + $y_off, $z_pos + $z_off,
        $x_pos,$y_pos,$z_pos,
        0,1,0);

    glLightfv_p(GL_LIGHT1, GL_POSITION,
                (
                    $light_position[0],
                    $light_position[1],
                    $light_position[2],
                    $light_position[3]
                ));    # Set up a light, turn it on.

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);    # Clear the color and depth buffers.
  
    glColor3f(1, 1, 1); # Basic polygon color

    # cycle through cells in range around cursor to render
    for my $bx ( $xcell-$range .. $xcell+$range ) {
        for my $by ( $ycell-$range .. $ycell+$range ) {
            #next unless $cells[$bx][$by][cache_ptr];

            my $slices = $cache[$cells[$bx][$by][cache_ptr]];
            for my $slice ( 2 .. ( @{ $slices } - 1) ) {
                glCallList($slices->[$slice]) if $slices->[$slice];
            }
        }
    }

    # draw visible cursor
    glDisable(GL_LIGHTING);
    glLineWidth(2);
    glBindTexture(GL_TEXTURE_2D, $texture_ID[cursor]);
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    glBegin(GL_QUADS);
    $DRAW_MODEL{Cursor}->($x_pos,$y_pos,$z_pos,1,1);
    glEnd();
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    glBindTexture(GL_TEXTURE_2D, $texture_ID[grass]);

    glLoadIdentity();    # Move back to the origin (for the text, below).

    glMatrixMode(GL_PROJECTION);    # We need to change the projection matrix for the text rendering.

    glPushMatrix();    # But we like our current view too; so we save it here.

    glLoadIdentity();    # Now we set up a new projection for the text.
    glOrtho(0,$window_width,0,$window_height,-1.0,1.0);

    glDisable(GL_TEXTURE_2D);    # Lit or textured text looks awful.
    glDisable(GL_LIGHTING);

    glDisable(GL_DEPTH_TEST);    # We don'$t want depth-testing either.

    glColor4f(0.6,1.0,0.6,.75);    # But, for fun, let's make the text partially transparent too.

    $buf = sprintf 'x_rot: %d', $x_rot;
    glRasterPos2i(2,2); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'y_rot: %d', $y_rot;
    glRasterPos2i(2,14); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'z_pos: %f', $z_pos;
    glRasterPos2i(2,26); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'y_pos: %f', $y_pos;
    glRasterPos2i(2,38); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'x_pos: %f', $x_pos;
    glRasterPos2i(2,50); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'z_off: %f', $z_off;
    glRasterPos2i(2,62); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'y_off: %f', $y_off;
    glRasterPos2i(2,74); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'x_off: %f', $x_off;
    glRasterPos2i(2,86); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'Mem: %f', (($memory_use / 300_787_840) * 100);
    glRasterPos2i(2,98); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf 'Caches: %d', (($#cache+1) - ($#cache_bucket+1));
    glRasterPos2i(2,110); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    if ( $tiles[$zmouse][type][$xmouse][$ymouse] ) {
        $buf = sprintf 'Type: %d', $tiles[$zmouse][type][$xmouse][$ymouse];
        glRasterPos2i(2,122); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);
    }

    $buf = sprintf 'Mouse: %d %d', $xmouse,$ymouse;
    glRasterPos2i(2,134); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    #$buf = "X";
    #glRasterPos2i(146,144); print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    # Now we want to render the calulated FPS at the top. To ease, simply translate up.  Note we're working in screen pixels in this projection.

    #    glTranslatef(6.0,$window_height - 14,0.0);
    #
    #    glColor4f(0.2,0.2,0.2,0.75);    # Make sure we can read the FPS section by first placing a dark, mostly opaque backdrop rectangle.
    #
    #    glBegin(GL_QUADS);
    #    glVertex3f(  0.0, -2.0, 0.0);
    #    glVertex3f(  0.0, 12.0, 0.0);
    #    glVertex3f(140.0, 12.0, 0.0);
    #    glVertex3f(140.0, -2.0, 0.0);
    #    glEnd();
    #
    #    glColor4f(0.9,0.2,0.2,.75);
    #    $buf = sprintf 'FPS: %f F: %2d", $FrameRate, $FrameCount;
    #    glRasterPos2i(6,0);
    #    print_opengl_string(GLUT_BITMAP_HELVETICA_12,$buf);

    glPopMatrix();    # Done with this special projection matrix.  Throw it away.

    glutSwapBuffers();    # All done drawing.  Let's show it.

    #ourDoFPS();    # And collect our statistics.
    return;
}

################################################################################
## 3D Maintenance ##############################################################
################################################################################

# ------
# Callback routine executed whenever our window is resized.  Lets us
# request the newly appropriate perspective projection matrix for
# our needs.  Try removing the gluPerspective() call to see what happens.

sub resize_scene {
    my ($width, $height) = @_;

    $height = 1 if ($height == 0);    # Let's not core dump, no matter what.

    glViewport(0, 0, $width, $height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,$width/$height,0.1,100.0);

    glMatrixMode(GL_MODELVIEW);

    $window_width  = $width;
    $window_height = $height;
    return;
}


################################################################################
## Texture Stuff ###############################################################
################################################################################

# ------
# Function to build a simple full-color texture with alpha channel,
# and then create mipmaps.  This could instead load textures from
# graphics files from disk, or render textures based on external
# input.

sub build_textures {

    print 'loading textures..';

    @texture_ID = glGenTextures_p(12);    # Generate a texture index, then bind it for future operations.

    create_texture('grass',grass);
    create_texture('stone',stone);
    create_texture('cursor',cursor);
    create_texture('obsidian',obsidian);
    create_texture('unknown',unknown);
    create_texture('minstone',minstone);
    create_texture('pool',pool);
    create_texture('water',water);
    create_texture('soil',soil);
    create_texture('tree',tree);
    create_texture('shrub',shrub);
    create_texture('sapling',sapling);

    #glBindTexture(GL_TEXTURE_2D, $texture_ID[grass]);       # select mipmapped texture
    #glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);    # Some pretty standard settings for wrapping and filtering.
    #glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_REPEAT);

    say "   textures loaded.\n";
    return;
}

sub create_texture {
    my ($name,$id) = @_;
    glBindTexture(GL_TEXTURE_2D, $texture_ID[$id]);
    my $tex = new OpenGL::Image(engine=>'Magick',source=>"textures/$name.png");
    my ($ifmt,$fmt,$type) = $tex->Get('gl_internalformat','gl_format','gl_type');
    my ($w,$h) = $tex->Get('width','height');
    glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR_MIPMAP_NEAREST);
    glTexImage2D_c(GL_TEXTURE_2D, 0, $ifmt, $w, $h, 0, $fmt, $type, $tex->Ptr());
}


################################################################################
## Input Stuff #################################################################
################################################################################

# Callback function called when a normal $key is pressed. ######################

sub process_key_press {
    my $key = shift;
    my $c = uc chr $key;

    unless ( $normal_inputs{exist_check} ) {
        $normal_inputs{exist_check} = 1;
#        $normal_inputs{108} = sub { $Light_On       = $Light_On     ? 0 : 1;        }; # L
#        $normal_inputs{116} = sub { $Texture_On     = $Texture_On   ? 0 : 1;        }; # T

        #        $normal_inputs{97} = sub { $y_rot += 2.5; }; # Q
        #        $normal_inputs{100} = sub { $y_rot -= 2.5; }; # E
        $normal_inputs{97} = sub {
            my $cos_y = $cos_cache{$y_rot} ||= cos($y_rot * PIOVER180);
            my $sin_y = $sin_cache{$y_rot} ||= sin($y_rot * PIOVER180);
            $x_pos += $cos_y * 0.25;
            $z_pos += $sin_y * 0.25;
        }; # A
        $normal_inputs{100} = sub {
            my $cos_y = $cos_cache{$y_rot} ||= cos($y_rot * PIOVER180);
            my $sin_y = $sin_cache{$y_rot} ||= sin($y_rot * PIOVER180);
            $x_pos -= $cos_y * 0.25;
            $z_pos -= $sin_y * 0.25;
        }; # D
        $normal_inputs{119} = sub {
            my $cos_y = $cos_cache{$y_rot} ||= cos($y_rot * PIOVER180);
            my $sin_y = $sin_cache{$y_rot} ||= sin($y_rot * PIOVER180);
            $x_pos -= $sin_y * 0.25;
            $z_pos += $cos_y * 0.25;
        }; # W
        $normal_inputs{115} = sub {
            my $cos_y = $cos_cache{$y_rot} ||= cos($y_rot * PIOVER180);
            my $sin_y = $sin_cache{$y_rot} ||= sin($y_rot * PIOVER180);
            $x_pos += $sin_y * 0.25;
            $z_pos -= $cos_y * 0.25;
        }; # S

        $normal_inputs{113} = sub {
            $y_rot -= 2;
            $y_rot -= 360 if ($y_rot > 360);
            $y_rot += 360 if ($y_rot < 0);
            reposition_camera();
        }; # Q

        $normal_inputs{101} = sub {
            $y_rot += 2;
            $y_rot -= 360 if ($y_rot > 360);
            $y_rot += 360 if ($y_rot < 0);
            reposition_camera();
        }; # E

        $normal_inputs{116} = sub {
            $slice--;
            reposition_camera();
        }; # T

        $normal_inputs{103} = sub {
            $slice++;
            reposition_camera();
        }; # G

        $normal_inputs{122} = sub {
            $slice = $slice ? 0 : $zmouse;
            $slice_follows = $slice_follows ? 0 : 1;
            reposition_camera();
        }; # Z

        $normal_inputs{114} = sub { $y_pos += 1; $slice-- if $slice_follows;  }; # R
        $normal_inputs{102} = sub { $y_pos -= 1; $slice++ if $slice_follows;  }; # F

        $normal_inputs{107} = sub { refresh_map_data(); }; # K

        $normal_inputs{27} = sub { glutDestroyWindow($window_ID); exit(1);           }; # ESC

        #$normal_inputs{102} = sub { $Filtering_On   = $Filtering_On ? 0 : 1;        }; # F
        #$normal_inputs{120} = sub { $X_Speed = $Y_Speed = 0;                        }; # X
        #$normal_inputs{32} = $normal_inputs{120};
    }

    glutPostRedisplay();

    if ( $normal_inputs{$key} ) {
        $normal_inputs{$key}->();
        return;
    }

    printf "KP: No action for %d.\n", $key;
    return;
}

# Callback Function called when a special $key is pressed. #####################

sub process_special_key_press {
    my $key = shift;

    unless ( $special_inputs{exist_check} ) {
        $special_inputs{exist_check} = 1;
        $special_inputs{104} = sub { $z_off -= 0.05;     }; # GLUT_KEY_PAGE_UP
        $special_inputs{105} = sub { $z_off += 0.05;     }; # GLUT_KEY_PAGE_DOWN
        #$special_inputs{101} = sub { $X_Speed -= 0.01;   }; # GLUT_KEY_UP
        #$special_inputs{103} = sub { $X_Speed += 0.01;   }; # GLUT_KEY_DOWN
        #$special_inputs{100} = sub { $Y_Speed -= 0.01;   }; # GLUT_KEY_LEFT
        #$special_inputs{102} = sub { $Y_Speed += 0.01;   }; # GLUT_KEY_RIGHT
    }

    glutPostRedisplay();

    if ( $special_inputs{$key} ) {
        $special_inputs{$key}->();
        return;
    }

    printf "SKP: No action for %d.\n", $key;
    return;
}

sub process_mouse_click {
    my ($button, $state, $x, $y) = @_;
    if ($button == GLUT_MIDDLE_BUTTON && $state == GLUT_DOWN) {
        $middle_mouse = 1 ;
        $last_mouse_x = $x;
        $last_mouse_y = $y;
    }

    if ($button == GLUT_LEFT_BUTTON && $state == GLUT_DOWN) {
        $last_mouse_x = $x;
        $last_mouse_y = $y;
    }

    $middle_mouse = 0 if $button == GLUT_MIDDLE_BUTTON && $state == GLUT_UP;
    return;
}

sub process_active_mouse_motion {
    my ($x, $y) = @_;

    my ($new_x, $new_y) = (0, 0);
    $new_x = $x - $last_mouse_x if ($last_mouse_x);
    $new_y = $y - $last_mouse_y if ($last_mouse_y);

    if ( $middle_mouse == 0 ) {

            $y_rot -= (180 * $new_x / 300) * -1;
            $y_rot -= 360 if ($y_rot > 360);
            $y_rot += 360 if ($y_rot < 0);

            my $diff = (180 * $new_y / 300) * -0.75;
            $x_rot += $diff if( ($x_rot + $diff) > -89 and ($x_rot + $diff) < 89 );
    }
    else {

            $mouse_dist += $new_y*0.2;
            $mouse_dist = 1 if $mouse_dist < 1;

    }

    $last_mouse_x = $x;
    $last_mouse_y = $y;
    reposition_camera();

    glutPostRedisplay();
    return;
}

sub reposition_camera {
    my $cos_y = $cos_cache{$y_rot} ||= cos($y_rot * PIOVER180);
    my $sin_y = $sin_cache{$y_rot} ||= sin($y_rot * PIOVER180);
    my $sin_x = $sin_cache{$x_rot} ||= sin($x_rot * PIOVER180);
    my $cos_x = $cos_cache{$x_rot} ||= cos($x_rot * PIOVER180);

    $x_off = ($sin_y * $cos_x) * $mouse_dist;
    $y_off = (-$sin_x) * $mouse_dist;
    $z_off = (-$cos_y * $cos_x) * $mouse_dist;
    return;
}

################################################################################
## Map Stuff ###################################################################
################################################################################


################################################################################
## Helper Stuff ################################################################
################################################################################

# ------
# String rendering routine; leverages on GLUT routine.

sub print_opengl_string {
    my ($font, $str) = @_;
    my @c = split //, $str;

    for(@c) {
        glutBitmapCharacter($font, ord $_);
    }
    return;
}


__END__