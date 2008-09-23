#!/usr/bin/perl -w
use 5.010;
use strict;
use warnings;

use Benchmark ':hireswallclock';

use Carp;
use OpenGL qw/ :all /;
use OpenGL::Image;
use Image::BMP;
use Math::Trig;
use Win32::Process::List;
use Win32::Process;
use Win32::Process::Memory;
use LWP::Simple;
$|++;

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

use constant PROGRAM_TITLE => "O'Reilly Net: OpenGL Demo -- C.Halsall";
use constant PI        => 4 * atan2(1, 1);
use constant PIOVER180 => PI / 180;
my $tex_const = 0.046875; # width or height of one texture field

# Some global variables.

# Window and texture IDs, window width and height.
my $Window_ID;
my $Window_Width = 533;
my $Window_Height = 300;

my $Curr_TexMode = 0;
my @TexModesStr = qw/ GL_DECAL GL_MODULATE GL_BLEND GL_REPLACE /;
my @TexModes = ( GL_DECAL, GL_MODULATE, GL_BLEND, GL_REPLACE );
my @Texture_ID;

# Object and scene global variables.

# Camera position and rotation variables.
my ($X_Pos,$Y_Pos,$Z_Pos,$X_Off,$Y_Off,$Z_Off,$X_Rot,$Y_Rot);
$X_Pos   =   0;
$Y_Pos   =   0;
$Z_Pos   =   0;
$X_Rot   = -45.0;
$Y_Rot   = 157.5;
my $mouse_dist = 40;
my $middle_mouse = 0;
ourOrientMe(); # sets up initial camera position offsets

my ( $Map_W, $Map_H, $Map_D );


# Settings for our light.  Try playing with these (or add more lights).
my @Light_Ambient  = ( 0.7, 0.7, 0.7, 1.0 );
my @Light_Diffuse  = ( 0.9, 0.9, 0.9, 1.0 );
my @Light_Position = ( -0.8, 1.5, 1.0, 0.0 );

# ------
# Frames per second (FPS) statistic variables.

use constant CLOCKS_PER_SEC => 1000;
use constant FRAME_RATE_SAMPLES => 50;

my $FrameCount = 0;
my $FrameRate = 0;
my $last=0;

my (%special_inputs, %normal_inputs);   # hashes containing the functions called on certain key presses

my $last_mouse_x;
my $last_mouse_y;
my @map_data;
my @pre_compiled_map_data;
my @compiled_map_data;
my @sliced_map_data;
my %slice_cache;

my %displaylist;

my (%sin_cache, %cos_cache);

our @offsets;
my $dwarf_pid;
my $ver;
my $proc;
my $pe_timestamp;
my @full_map_data;

my ($menu,$submenid,$menid);

my $delay_full_update=40;

my $range = 1;
my $cache_limit = (1+(2*$range))*(1+(2*$range));
my ($xmouse, $ymouse, $zmouse) = (0,0,15);                 # cursor coordinates
my ($xmouse_old, $ymouse_old, $zmouse_old) = (0,0,15);                 # cursor coordinates
my ($xcell, $ycell)=($range,$range);                    # cursor cell coordinates
our ($xcount, $ycount, $zcount);                 # dimensions of the map data we're dealing with
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

our @types;
use constant base_visual => 0;
use constant EMPTY => 0;
use constant FLOOR => 1;
use constant WALL => 2;
use constant RAMP => 3;
use constant STAIR => 4;
use constant FORTIF => 5;
use constant PILLAR => 6;

do 'df_internals.pl';
do 'models.pl';

use Win32::OLE('in');
my $objWMIService = Win32::OLE->GetObject ('winmgmts:\\\\.\\root\\CIMV2') or die "WMI connection failed.\n";
my @state_array;
my $memory_use;

# ------
# The main() function.  Inits OpenGL.  Calls our own init function,
# then passes control onto OpenGL.

connectToDF();

extractBaseMemoryData();
#exit;
glutInit();

print "setting up OpenGL environment...   ";
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
glutInitWindowSize($Window_Width, $Window_Height);
glutInitWindowPosition(390,250);

$Window_ID = glutCreateWindow( PROGRAM_TITLE ); # Open a window

createMenu();

# Set up Callback functions ####################################################

glutDisplayFunc(\&cbRenderScene);               # Register the callback function to do the drawing.

#glutIdleFunc(\&cbBackgroundProc);                  # If there's nothing to do, draw.

glutReshapeFunc(\&cbResizeScene);               # It's a good idea to know when our window's resized.

glutKeyboardFunc(\&cbKeyPressed);               # And let's get some keyboard input.
glutSpecialFunc(\&cbSpecialKeyPressed);

glutMotionFunc(\&cbMouseActiveMotion);
glutMouseFunc(\&cbMouseClickAction);



print "OpenGL environment ready.\n";

print "initializing OpenGL...\n";

ourInit($Window_Width, $Window_Height);         # OK, OpenGL's ready to go.  Let's call our own init function.

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

refreshMapData();

# Pass off control to OpenGL.
# Above functions are called as appropriate.
print "switching to main loop...\n";
glutMainLoop();


################################################################################
## Rendering Functions #########################################################
################################################################################

my @cell_offsets;

sub refreshMapData {
    glutPostRedisplay() if syncToDF();
    glutTimerFunc (100, \&refreshMapData, 0);
    
}

sub extractBaseMemoryData {
    # get map size
    $xcount = $proc->get_u32( $offsets[$ver]{x_count} );
    $ycount = $proc->get_u32( $offsets[$ver]{y_count} );
    $zcount = $proc->get_u32( $offsets[$ver]{z_count} );
    
    $x_max = ($xcount*16)-1;
    $y_max = ($ycount*16)-1;
    
    # checking whether the game has a map already    
    $map_base = $proc->get_u32( $offsets[$ver]{map_loc} );
    croak "Map data is not yet available, make sure you have a game loaded." unless ( $map_base );
    
    # get the offsets of the address storages for each x-slice and cycle through
    my @xoffsets = $proc->get_packs("L", 4, $map_base, $xcount);
    for my $bx ( 0 .. $xcount-1 ) {
        # get the offsets of the address storages for each y-column in this x-slice and cycle through
        my @yoffsets = $proc->get_packs("L", 4, $xoffsets[$bx], $ycount);
        for my $by ( 0 .. $ycount-1 ) {
            $cell_offsets[$bx][$by] = $yoffsets[$by];
            $cells[$bx][$by][offset] = $yoffsets[$by];
        }
    }
}

sub syncToDF {
    my $redraw = 0;
    my $deletions = 0;
    my $t0 = new Benchmark;
    
    $xmouse_old = $xmouse;
    $ymouse_old = $ymouse;
    $zmouse_old = $zmouse;
    
    # get mouse data
    $xmouse = $proc->get_u32( $offsets[$ver]{mouse_x} );
    $ymouse = $proc->get_u32( $offsets[$ver]{mouse_y} );
    $zmouse = $proc->get_u32( $offsets[$ver]{mouse_z} );
    
    # normalize mouse data if out of bounds, i.e. cursor not in use
    if ( $xmouse > $xcount*16 || $ymouse > $ycount*16 || $zmouse > $zcount ) {
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
    ($X_Pos,$Z_Pos,$Y_Pos) = ($xmouse+.5,$ymouse+.5,$zmouse+.5);
    ourOrientMe(); # sets up initial camera position offsets
    
    # calculate cell coords from mouse coords
    ($xcell, $ycell) = ( int($xmouse/16), int($ymouse/16) );
    $xcell = $range if $xcell <= $range-1;
    $ycell = $range if $ycell <= $range-1;
    $xcell = $xcount-$range-1 if $xcell >= $xcount-$range;
    $ycell = $ycount-$range-1 if $ycell >= $ycount-$range;
    
    # cycle through cells in range around cursor to grab data
    for my $bx ( $xcell-$range .. $xcell+$range ) {
        for my $by ( $ycell-$range .. $ycell+$range ) {
            
            # cycle through slices in cell
            my @zoffsets = $proc->get_packs("L", 4, $cells[$bx][$by][offset], $zcount);
            $cells[$bx][$by][changed] = 0;
            for my $bz ( 0..$#zoffsets ) {
                next if ( $zoffsets[$bz] == 0 );                # go to the next block if this one is not allocated
                
                # process slice in cell and set slice to changed
                $cells[$bx][$by][z][$bz] = new_process_block(
                    $zoffsets[$bz],                             # offset of the current slice
                    $bx,                                        # x location of the current slice
                    $by,                                        # y location of the current slice
                    $bz );
                # update changed status of cell if necessary
                $cells[$bx][$by][changed] = 1 if $cells[$bx][$by][z][$bz];  # z location of the current block
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
                    for my $slice ( 0 .. (@$slices - 1) ) {
                        generateDisplayList( $cache_id, $slice, $by, $bx ) if ( @$slices[$slice] );
                    }
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
                for my $slice ( 0 .. (@$slices - 1) ) {
                    generateDisplayList( $cache_id, $slice, $by, $bx ) if ( defined @$slices[$slice] );
                }
                
                $protected_caches[$cache_id] = 1;
            }
        }
    }
    
    @state_array = in $objWMIService->ExecQuery ('SELECT PrivatePageCount FROM Win32_Process WHERE ProcessId = '.$$,'WQL',0x10 | 0x20);
    $memory_use = $state_array[0]->{PrivatePageCount};
    
    # check that we're not using too much memory and destroy cache entries if necessary
    while ( $memory_use > 300787840 && $deletions < 2 ) { # $cache_limit <= $#cache && 
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
        for my $slice ( 2 .. (@$slices - 1) ) {
            glDeleteLists($cache[$delete][$slice],1) if $cache[$delete][$slice];
        }
        
        undef ${$cache[$delete][0]};
        
        undef $cache[$delete];
        push @cache_bucket, $delete;
        
        $deletions++;
        
        #printf "Commited Memory = %d Bytes\n", $myself->get_memtotal;
    }
    
    @protected_caches = [];
    
    my $t1 = new Benchmark;
    my $td = timediff($t1, $t0);
    print "the code took:",timestr($td),"\n";
    
    #say "$#cache caches";
    #say "---";
    return $redraw;
}

sub generateDisplayList {
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
    #glBindTexture(GL_TEXTURE_2D, $Texture_ID[2]);       # select mipmapped texture
    glBegin(GL_TRIANGLES);
    my $tile = $tiles[$z][type];
    my $tile_below = $tiles[$z-1][type];
    for my $rx (($x*16)..($x*16)+15) {
        for my $ry (($y*16)..($y*16)+15) {
            
            next if !defined $tile->[$rx][$ry];
            $type = $tile->[$rx][$ry];
            $type_below = $tile_below->[$rx][$ry];
            next if $type == 32;
            
            my ($below, $north, $south, $west, $east) = (EMPTY,EMPTY,EMPTY,EMPTY,EMPTY);
            my ($northeast, $southeast, $southwest, $northwest) = (EMPTY,EMPTY,EMPTY,EMPTY);
            my $x_mod = $rx%16;
            my $y_mod = $ry%16;
            
            $below = $types[$type_below][base_visual] if $type_below;
            
            if ( $types[$type][base_visual] == WALL ) {
                $north = $types[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $y_mod != 0;
                $south = $types[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $y_mod != 15;
                $west = $types[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $x_mod != 0;
                $east = $types[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $x_mod != 15;
                drawWall($rx,$z,$ry,1, $below, $north, $south, $west, $east);
                next;
            }
            
            elsif ( $types[$tile->[$rx][$ry]][base_visual] == FLOOR ) {
                $north = $types[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $y_mod != 0;
                $south = $types[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $y_mod != 15;
                $west = $types[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $x_mod != 0;
                $east = $types[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $x_mod != 15;
                drawFloor($rx,$z,$ry,1, $below, $north, $south, $west, $east);
                next;
            }
            
            elsif ( $types[$tile->[$rx][$ry]][base_visual] == RAMP ) {
                next if ( defined $type_below && $types[$type_below][base_visual] == RAMP );
                $north = $types[$tile->[$rx][$ry-1]][base_visual] if $tile->[$rx][$ry-1] && $ry != 0;
                $northeast = $types[$tile->[$rx+1][$ry-1]][base_visual] if $tile->[$rx+1][$ry-1] && ($ry != 0 || $rx != $x_max);
                $east = $types[$tile->[$rx+1][$ry]][base_visual] if $tile->[$rx+1][$ry] && $rx != $x_max;
                $southeast = $types[$tile->[$rx+1][$ry+1]][base_visual] if $tile->[$rx+1][$ry+1] && ($ry != $y_max || $rx != $x_max);
                $south = $types[$tile->[$rx][$ry+1]][base_visual] if $tile->[$rx][$ry+1] && $ry != $y_max;
                $southwest = $types[$tile->[$rx-1][$ry+1]][base_visual] if $tile->[$rx-1][$ry+1] && ($ry != $y_max || $ry != 0);
                $west = $types[$tile->[$rx-1][$ry]][base_visual] if $tile->[$rx-1][$ry] && $rx != 0;
                $northwest = $types[$tile->[$rx-1][$ry-1]][base_visual] if $tile->[$rx-1][$ry-1] && ($ry != 0|| $ry != 0);
                
                if( $north == WALL ) {
                    if ( $east == WALL) {
                        #if ( $south == WALL) {
                        #    drawTripleNorthSouthEastRamp($rx,$z,$ry,1);
                        #}
                        #else {
                            #drawDoubleNorthEastRamp($rx,$z,$ry,1);
                        #}
                    }
                    elsif ( $west == WALL) {
                        #drawDoubleNorthWestRamp($rx,$z,$ry,1);
                    }
                    else {
                        drawSingleNorthRamp($rx,$z,$ry,1);                        
                    }
                }
                elsif( $east == WALL ) {
                    if ( $south == WALL) {
                        #drawDoubleSouthEastRamp($rx,$z,$ry,1);
                    }
                    else {
                        drawSingleEastRamp($rx,$z,$ry,1);
                    }
                }
                elsif( $south == WALL ) {
                    if ( $west == WALL) {
                        #drawDoubleSouthWestRamp($rx,$z,$ry,1);
                    }
                    else {
                        drawSingleSouthRamp($rx,$z,$ry,1);
                    }
                }
                elsif( $west == WALL ) {
                    drawSingleWestRamp($rx,$z,$ry,1);
                }
                elsif( $northeast == WALL ) {
                    #drawSingleNorthEastRamp($rx,$z,$ry,1);
                }
                elsif( $southeast == WALL ) {
                    #drawSingleSouthEastRamp($rx,$z,$ry,1);
                }
                elsif( $southwest == WALL ) {
                    #drawSingleSouthWestRamp($rx,$z,$ry,1);
                }
                elsif( $northwest == WALL ) {
                    #drawSingleNorthWestRamp($rx,$z,$ry,1);
                }
                next;
            }
            
        }
    }
    glEnd();
    glEndList();
    
}

sub new_process_block {
    my ($block_offset, $bx, $by, $bz) = @_;
    my $changed = 0;

    my @type_data        = $proc->get_packs(        # extract type/designation/occupation arrays for this block
        "S", 2,                                     # format and size in bytes of each data unit
        $block_offset+$offsets[$ver]{type_off},            # starting offset
        256);                                       # number of units
    #my @designation_data = $proc->get_packs("L", 4, $block_offset+$offsets[$ver]{designation_off}, 256);
    #my @ocupation_data   = $proc->get_packs("L", 4, $block_offset+$offsets[$ver]{occupancy_off},   256);
    
    my ($rx,$ry,$y,$x,$tile);
    
    my $bxScaled = $bx * 16;
    my $byScaled = $by * 16;
	my $tile_index=0;
   
    for $x ( 0..15 ) {
        $rx = $bxScaled+$x;                   # this calculates the real x and y values of this tile on the overall map_base
        $tile = $tiles[$bz][type][$rx] ||= [];
        
        for $y ( 0..15 ) {                           # cycle through 16 x and 16 y values, which generate a total of 256 tile indexes
            $ry = $byScaled+$y;
            
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

sub ask { print "$_[0]"; }

sub connectToDF {
    
    do 'df_offsets.pl';
    
    $ver = init_process_connection();
    
    refresh_datastore() unless $ver;
    
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
    
    for my $i ( 0..$#offsets ) {
        $pe_timestamp = $proc->get_u32( $offsets[$i]{pe_timestamp_offset} );
        return $i if ( $offsets[$i]{PE} == $pe_timestamp );
    }
}


################################################################################

sub refresh_datastore {
    say "Could not find DF version in local data store. Checking for new memory address data...";
    import_remote_xml();
    say "";

    $ver = init_process_connection();

    if (!$ver) {
        croak "Version could not be correctly identified. Please contact Xenofur/Mithaldu or Jifodu for updated memory addresses.\n";
    }
}

sub import_remote_xml {
    say "  Remotely...";
    my $source = "http://www.geocities.com/jifodus/tables/dwarvis/";
    my @xml_list;

    my $list = get($source);
    die "Couldn't get it!" unless defined $list;
    
    while ( $list =~ m/<A HREF="(.+?\.xml)">/gi ) {
        push @xml_list, $1;
    }
    
    say "    Found ".($#xml_list+1)." memory data files...";
    
    for my $file (@xml_list) {
        my $known = 0;
        for my $i ( 0..$#offsets ) {
            $known = 1 if $file =~ m/$offsets[$i]{version}/;
        }
        
        if ($known) {
            say "    One file ($file) discarded, memory data inside already known.";
            next;
        }
        
        my $xml = get($source.$file);
        die "Couldn't get it!" unless defined $xml;
    
        my $msg_file = $file;
        $msg_file =~ s/core\.xml/messages.txt/;
        my $message = get($source.$msg_file);
        
        process_xml($xml,$message);
    }
}

sub process_xml {
    my ($xml, $message) = @_;
    my (@data_store,@new_data_store);
    
    my %config_hash;
    
    if( $xml =~ m/<version name="(.+?)" \/>/i ) {
        $config_hash{version} = $1;
    } else { return 0; }
    
    if( $xml =~ m/<pe timestamp_offset="0x(.+?)" timestamp="0x(.+?)" \/>/i ) {
        $config_hash{pe_timestamp_offset} = hex($1);
        $config_hash{PE} = hex($2);
    } else { return 0; }
    
    if( $xml =~ m/<address name="map_data" value="0x(.+?)" \/>/i ) {
        $config_hash{map_loc} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="map_x_count" value="0x(.+?)" \/>/i ) {
        $config_hash{x_count} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="map_y_count" value="0x(.+?)" \/>/i ) {
        $config_hash{y_count} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="map_z_count" value="0x(.+?)" \/>/i ) {
        $config_hash{z_count} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<offset name="map_data_type_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{type_off} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<offset name="map_data_designation_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{designation_off} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<offset name="map_data_occupancy_offset" value="0x(.+?)" \/>/i ) {
        $config_hash{occupancy_off} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="mouse_x" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_x} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="mouse_y" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_y} = hex($1);
    } else { return 0; }
    
    if( $xml =~ m/<address name="mouse_z" value="0x(.+?)" \/>/i ) {
        $config_hash{mouse_z} = hex($1);
    } else { return 0; }
        
    for my $i ( 0..$#offsets ) {
        return 0 if $offsets[$i]{version} eq $config_hash{version};
    }
    
    say "    Recognized new memory address data for DF $config_hash{version}, inserting into data store.";
    say "--- -- -\n$message\n--- -- -" if defined $message;
    push @offsets, \%config_hash;

    open my $HANDLE, "<", "df_offsets.pl";
    @data_store = <$HANDLE>;
    close $HANDLE;
    
    for my $line (@data_store) {
        if ( $line =~ m/OFFSETS\ END\ HERE/ ) {
            push @new_data_store, "        {\n";
            push @new_data_store, "            version => \"$config_hash{version}\",\n";
            push @new_data_store, "            PE => ".sprintf("0x%08x", $config_hash{PE}).",\n";
            push @new_data_store, "            map_loc => ".sprintf("0x%08x", $config_hash{map_loc}).",\n";
            push @new_data_store, "            x_count => ".sprintf("0x%08x", $config_hash{x_count}).",\n";
            push @new_data_store, "            y_count => ".sprintf("0x%08x", $config_hash{y_count}).",\n";
            push @new_data_store, "            z_count => ".sprintf("0x%08x", $config_hash{z_count}).",\n";
            push @new_data_store, "            pe_timestamp_offset => ".sprintf("0x%08x", $config_hash{pe_timestamp_offset}).",\n";
            push @new_data_store, "            type_off        => ".sprintf("0x%08x", $config_hash{type_off}).",\n";
            push @new_data_store, "            designation_off => ".sprintf("0x%08x", $config_hash{designation_off}).",\n";
            push @new_data_store, "            occupancy_off   => ".sprintf("0x%08x", $config_hash{occupancy_off}).",\n";
            push @new_data_store, "            mouse_x   => ".sprintf("0x%08x", $config_hash{mouse_x}).",\n";
            push @new_data_store, "            mouse_y   => ".sprintf("0x%08x", $config_hash{mouse_y}).",\n";
            push @new_data_store, "            mouse_z   => ".sprintf("0x%08x", $config_hash{mouse_z}).",\n";
            push @new_data_store, "        },\n";
        }
        push @new_data_store, $line;
    }

    open $HANDLE, ">", "df_offsets.pl";
    for my $line ( @new_data_store ) {
        print $HANDLE $line;
    }
    close $HANDLE;
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

    ourBuildTextures();

    glClearColor(0.7, 0.7, 0.7, 0.0);    # Color to clear color buffer to.

    glClearDepth(1.0);    # Depth to clear depth buffer to; type of test.
    glDepthFunc(GL_LESS);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    glCullFace(GL_BACK);
    glEnable(GL_CULL_FACE);

    glShadeModel(GL_SMOOTH);    # Enables Smooth Color Shading; try GL_FLAT for (lack of) fun.
    #glEnable(GL_NORMALIZE);

    cbResizeScene($Width, $Height);    # Load up the correct perspective matrix; using a callback directly.

    glLightfv_p(GL_LIGHT1, GL_AMBIENT,  @Light_Ambient);
    glLightfv_p(GL_LIGHT1, GL_DIFFUSE,  @Light_Diffuse);
    
    glEnable (GL_LIGHT1);
    
    glColorMaterial(GL_FRONT,GL_AMBIENT_AND_DIFFUSE);    # A handy trick -- have surface material mirror the color.
    glEnable(GL_COLOR_MATERIAL);
}

# ------
# Routine which draws all cubes in the map

# ------
# Barebone menu creation functions

sub createMenu {

  $submenid = glutCreateMenu(\&menu);
  glutAddMenuEntry("Teapot", 2);
  glutAddMenuEntry("Cube", 3);
  glutAddMenuEntry("Torus", 4);

  $menid = glutCreateMenu(\&menu);
  glutAddMenuEntry("Clear", 1);
  glutAddSubMenu("Draw", $submenid);
  glutAddMenuEntry("Quit", 0);

  glutAttachMenu(GLUT_RIGHT_BUTTON);
}

sub menu {
    my ($in) = @_;
    
  if($in == 0 && defined $in){
    glutDestroyWindow($Window_ID);
    exit(0);
  }
  
  glutPostRedisplay();
}

# ------
# Routine which handles background stuff when the app is idle

sub cbBackgroundProc {
    
    glutPostRedisplay();
}

# ------
# Routine which actually does the drawing

sub cbRenderScene {
    my $buf; # For our strings.

    # Enables, disables or otherwise adjusts as appropriate for our current settings.

    glEnable(GL_TEXTURE_2D);

    glEnable(GL_LIGHTING);

    glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

    glEnable(GL_DEPTH_TEST);

    glMatrixMode(GL_MODELVIEW);    # Need to manipulate the ModelView matrix to move our model around.

    gluLookAt(
        $X_Pos + $X_Off, $Y_Pos+10 + $Y_Off, $Z_Pos + $Z_Off,
        $X_Pos,$Y_Pos+10,$Z_Pos,
        0,1,0);
    
    glLightfv_p(GL_LIGHT1, GL_POSITION,
                (
                    $Light_Position[0],
                    $Light_Position[1],
                    $Light_Position[2],
                    $Light_Position[3]
                ));    # Set up a light, turn it on.
    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);    # Clear the color and depth buffers.
  
    glColor3f(1, 1, 1); # Basic polygon color
    
    # cycle through cells in range around cursor to render
    for my $bx ( $xcell-$range .. $xcell+$range ) {
        for my $by ( $ycell-$range .. $ycell+$range ) {
            #next unless $cells[$bx][$by][cache_ptr];
            
            my $slices = $cache[$cells[$bx][$by][cache_ptr]];
            for my $slice ( 2 .. (@$slices - 1) ) {
                glCallList($slices->[$slice]) if $slices->[$slice];
            }
        }
    }
    
    # draw visible cursor
    glDisable(GL_LIGHTING);
    glLineWidth(2);
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[3]);
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    glBegin(GL_TRIANGLES);
    #drawCursor($X_Pos-.5,$Y_Pos-.5,$Z_Pos-.5,1);
    glEnd();
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[2]);
    
    glLoadIdentity();    # Move back to the origin (for the text, below).

    glMatrixMode(GL_PROJECTION);    # We need to change the projection matrix for the text rendering.

    glPushMatrix();    # But we like our current view too; so we save it here.

    glLoadIdentity();    # Now we set up a new projection for the text.
    glOrtho(0,$Window_Width,0,$Window_Height,-1.0,1.0);

    glDisable(GL_TEXTURE_2D);    # Lit or textured text looks awful.
    glDisable(GL_LIGHTING);

    glDisable(GL_DEPTH_TEST);    # We don'$t want depth-testing either.

    glColor4f(0.6,1.0,0.6,.75);    # But, for fun, let's make the text partially transparent too.

    $buf = sprintf "X_Rot: %d", $X_Rot;
    glRasterPos2i(2,2); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Rot: %d", $Y_Rot;
    glRasterPos2i(2,14); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Z_Pos: %f", $Z_Pos;
    glRasterPos2i(2,26); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Pos: %f", $Y_Pos;
    glRasterPos2i(2,38); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "X_Pos: %f", $X_Pos;
    glRasterPos2i(2,50); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Z_Off: %f", $Z_Off;
    glRasterPos2i(2,62); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Off: %f", $Y_Off;
    glRasterPos2i(2,74); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "X_Off: %f", $X_Off;
    glRasterPos2i(2,86); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Mem: %f", (($memory_use / 300787840) * 100);
    glRasterPos2i(2,98); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Caches: %d", (($#cache+1) - ($#cache_bucket+1));
    glRasterPos2i(2,110); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);
    
    if ( $tiles[$zmouse][type][$xmouse][$ymouse] ) {
        $buf = sprintf "Type: %d", $tiles[$zmouse][type][$xmouse][$ymouse];
        glRasterPos2i(2,122); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);
    }
    
    $buf = sprintf "Mouse: %d %d", $xmouse,$ymouse;
    glRasterPos2i(2,134); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    #$buf = "X";
    #glRasterPos2i(146,144); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    # Now we want to render the calulated FPS at the top. To ease, simply translate up.  Note we're working in screen pixels in this projection.

    #    glTranslatef(6.0,$Window_Height - 14,0.0);
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
    #    $buf = sprintf "FPS: %f F: %2d", $FrameRate, $FrameCount;
    #    glRasterPos2i(6,0);
    #    ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    glPopMatrix();    # Done with this special projection matrix.  Throw it away.

    glutSwapBuffers();    # All done drawing.  Let's show it.

    #ourDoFPS();    # And collect our statistics.
}

################################################################################
## 3D Maintenance ##############################################################
################################################################################

# ------
# Callback routine executed whenever our window is resized.  Lets us
# request the newly appropriate perspective projection matrix for
# our needs.  Try removing the gluPerspective() call to see what happens.

sub cbResizeScene {
    my ($Width, $Height) = @_;

    $Height = 1 if ($Height == 0);    # Let's not core dump, no matter what.

    glViewport(0, 0, $Width, $Height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,$Width/$Height,0.1,100.0);

    glMatrixMode(GL_MODELVIEW);

    $Window_Width  = $Width;
    $Window_Height = $Height;
}


################################################################################
## Texture Stuff ###############################################################
################################################################################

# ------
# Function to build a simple full-color texture with alpha channel,
# and then create mipmaps.  This could instead load textures from
# graphics files from disk, or render textures based on external
# input.

sub ourBuildTextures {
    
    print "loading texture..";
  
    my $gluerr;
    my $tex = new OpenGL::Image(engine=>'Magick',source=>'grass.png');
    # Get GL info
    my($ifmt,$fmt,$type) = $tex->Get('gl_internalformat','gl_format','gl_type');
    my($w,$h) = $tex->Get('width','height');
    
    @Texture_ID = glGenTextures_p(4);    # Generate a texture index, then bind it for future operations.
    
    
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[0]);                                  # unfiltered texture
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
    glTexImage2D_c(GL_TEXTURE_2D, 0, $ifmt, $w, $h, 0, $fmt, $type, $tex->Ptr());

    glBindTexture(GL_TEXTURE_2D, $Texture_ID[1]);                                  # other mimap method, fails hilariously (?)
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR_MIPMAP_NEAREST);
    gluBuild2DMipmaps_s(GL_TEXTURE_2D, 3, $w, $h, GL_RGB, GL_UNSIGNED_BYTE, $tex->Ptr());
    
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[2]);                                   # mip-mapped texture
    glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR_MIPMAP_NEAREST);
    glTexImage2D_c(GL_TEXTURE_2D, 0, $ifmt, $w, $h, 0, $fmt, $type, $tex->Ptr());
    print ".";

    glBindTexture(GL_TEXTURE_2D, $Texture_ID[3]);       # select mipmapped texture
    $tex = new OpenGL::Image(engine=>'Magick',source=>'cursor.png');
    ($ifmt,$fmt,$type) = $tex->Get('gl_internalformat','gl_format','gl_type');
    ($w,$h) = $tex->Get('width','height');
    glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR_MIPMAP_NEAREST);
    glTexImage2D_c(GL_TEXTURE_2D, 0, $ifmt, $w, $h, 0, $fmt, $type, $tex->Ptr());
    
    
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[2]);       # select mipmapped texture

    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);    # Some pretty standard settings for wrapping and filtering.
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_REPEAT);
    #glTexEnvf(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_BLEND);    # We start with GL_DECAL mode.
    say "   texture loaded.\n";
}


################################################################################
## Input Stuff #################################################################
################################################################################

# Callback function called when a normal $key is pressed. ######################

sub cbKeyPressed {
    my $key = shift;
    my $c = uc chr $key;

    unless ( $normal_inputs{exist_check} ) {
        $normal_inputs{exist_check} = 1;
#        $normal_inputs{108} = sub { $Light_On       = $Light_On     ? 0 : 1;        }; # L
#        $normal_inputs{116} = sub { $Texture_On     = $Texture_On   ? 0 : 1;        }; # T

        #        $normal_inputs{97} = sub { $Y_Rot += 2.5; }; # Q
        #        $normal_inputs{100} = sub { $Y_Rot -= 2.5; }; # E
        $normal_inputs{97} = sub {
            my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * PIOVER180);
            my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * PIOVER180);
            $X_Pos += $cos_y * 0.25;
            $Z_Pos += $sin_y * 0.25;
        }; # A
        $normal_inputs{100} = sub {
            my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * PIOVER180);
            my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * PIOVER180);
            $X_Pos -= $cos_y * 0.25;
            $Z_Pos -= $sin_y * 0.25;
        }; # D
        $normal_inputs{119} = sub {
            my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * PIOVER180);
            my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * PIOVER180);
            $X_Pos -= $sin_y * 0.25;
            $Z_Pos += $cos_y * 0.25;
        }; # W
        $normal_inputs{115} = sub {
            my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * PIOVER180);
            my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * PIOVER180);
            $X_Pos += $sin_y * 0.25;
            $Z_Pos -= $cos_y * 0.25;
        }; # S

        $normal_inputs{113} = sub {
            $Y_Rot -= 2;
            $Y_Rot -= 360 if ($Y_Rot > 360);
            $Y_Rot += 360 if ($Y_Rot < 0);
            ourOrientMe();
        }; # Q

        $normal_inputs{101} = sub {
            $Y_Rot += 2;
            $Y_Rot -= 360 if ($Y_Rot > 360);
            $Y_Rot += 360 if ($Y_Rot < 0);
            ourOrientMe();
        }; # E

        $normal_inputs{116} = sub {
            $slice--;
            ourOrientMe();
        }; # T

        $normal_inputs{103} = sub {
            $slice++;
            ourOrientMe();
        }; # G

        $normal_inputs{122} = sub {
            $slice = $slice ? 0 : $zmouse;
            $slice_follows = $slice_follows ? 0 : 1;
            ourOrientMe();
        }; # Z

        $normal_inputs{114} = sub { $Y_Pos += 1; $slice-- if $slice_follows;  }; # R
        $normal_inputs{102} = sub { $Y_Pos -= 1; $slice++ if $slice_follows;  }; # F
        
        $normal_inputs{107} = sub { refreshMapData(); }; # K

        $normal_inputs{27} = sub { glutDestroyWindow($Window_ID); exit(1);           }; # ESC

        #$normal_inputs{102} = sub { $Filtering_On   = $Filtering_On ? 0 : 1;        }; # F
        #$normal_inputs{120} = sub { $X_Speed = $Y_Speed = 0;                        }; # X
        #$normal_inputs{32} = $normal_inputs{120};

        $normal_inputs{109} = sub {                                                    # M
            $Curr_TexMode=0 if ( ++ $Curr_TexMode > 3 );
            glTexEnvi(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,$TexModes[$Curr_TexMode]);
        };
    }
    
    glutPostRedisplay();

    if ( $normal_inputs{$key} ) {
        $normal_inputs{$key}->();
        return;
    }

    printf "KP: No action for %d.\n", $key;
}

# Callback Function called when a special $key is pressed. #####################

sub cbSpecialKeyPressed {
    my $key = shift;

    unless ( $special_inputs{exist_check} ) {
        $special_inputs{exist_check} = 1;
        $special_inputs{104} = sub { $Z_Off -= 0.05;     }; # GLUT_KEY_PAGE_UP
        $special_inputs{105} = sub { $Z_Off += 0.05;     }; # GLUT_KEY_PAGE_DOWN
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
}

sub cbMouseClickAction {
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
}

sub cbMouseActiveMotion {
    my ($x, $y) = @_;
    
    my ($new_x, $new_y) = (0, 0);
    $new_x = $x - $last_mouse_x if ($last_mouse_x);
    $new_y = $y - $last_mouse_y if ($last_mouse_y);
        
    if ( $middle_mouse == 0 ) {
    
            $Y_Rot -= (180 * $new_x / 300) * -1;
            $Y_Rot -= 360 if ($Y_Rot > 360);
            $Y_Rot += 360 if ($Y_Rot < 0);
    
            my $diff = (180 * $new_y / 300) * -0.75;
            $X_Rot += $diff if( ($X_Rot + $diff) > -89 and ($X_Rot + $diff) < 89 );
    }
    else {
    
            $mouse_dist += $new_y*0.2;
            $mouse_dist = 1 if $mouse_dist < 1;
        
    }
    
    $last_mouse_x = $x;
    $last_mouse_y = $y;
    ourOrientMe();
    
    glutPostRedisplay();
}

sub ourOrientMe {
    my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * PIOVER180);
    my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * PIOVER180);
    my $sin_x = $sin_cache{$X_Rot} ||= sin($X_Rot * PIOVER180);
    my $cos_x = $cos_cache{$X_Rot} ||= cos($X_Rot * PIOVER180);

    $X_Off = ($sin_y * $cos_x) * $mouse_dist;
    $Y_Off = (-$sin_x) * $mouse_dist;
    $Z_Off = (-$cos_y * $cos_x) * $mouse_dist;
}

################################################################################
## Map Stuff ###################################################################
################################################################################


################################################################################
## Helper Stuff ################################################################
################################################################################

# ------
# Frames per second (FPS) statistic routine.

sub ourDoFPS {
    my ($now, $delta);

    if (++$FrameCount >= FRAME_RATE_SAMPLES) {
        $now   = Win32::GetTickCount(); # clock();
        $delta = ($now - $last) / CLOCKS_PER_SEC;
        $last  = $now;

        $FrameRate = FRAME_RATE_SAMPLES / $delta;
        $FrameCount = 0;
    }
}

# ------
# String rendering routine; leverages on GLUT routine.

sub ourPrintString {
    my ($font, $str) = @_;
    my @c = split '', $str;

    for(@c) {
        glutBitmapCharacter($font, ord $_);
    }
}

__END__