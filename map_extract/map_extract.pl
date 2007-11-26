#!/usr/bin/perl
use strict;
use warnings;
use Carp;

$|=1;

use Win32::Process::List;
use Win32::Process;
use Win32::Process::Memory;
use Compress::Zlib;

### set up variables ###########################################################
################################################################################
my $dwarf_pid;
#my $df_offset = 0x0089238C;     # v0.27.169.32a
#my $map_offset = 0x01457520;
#my $map_x_count = 0x01457538;
#my $map_y_count = 0x0145753C;
#my $map_z_count = 0x01457540;

#my $df_offset = 0x0089338C;     # v0.27.169.33a
#my $map_offset = 0x01458568;
#my $map_x_count = 0x01458580;
#my $map_y_count = 0x01458584;
#my $map_z_count = 0x01458588;

my $df_offset = 0x0089438C;     # v0.27.169.33b
my $map_offset = 0x01459568;
my $map_x_count = 0x01459580;
my $map_y_count = 0x01459584;
my $map_z_count = 0x01459588;

my $tile_type_offset        = 0x005E;
my $tile_designation_offset = 0x0260;
my $tile_occupancy_offset   = 0x0660;

my $proc;

my @full_map_data;                              # array to hold the full extracted map data

### get dwarf process id #######################################################
################################################################################
my %list = Win32::Process::List->new()->GetProcesses();
for my $key ( keys %list ) {
    $dwarf_pid = $key   if ( $list{$key} =~ /dwarfort.exe/ );
}
croak "Couldn't find PID." unless ( $dwarf_pid );

### lower priority of dwarf fortress ###########################################
################################################################################
Win32::Process::Open( my $dwarf_process, $dwarf_pid, 1 );
$dwarf_process->SetPriorityClass( IDLE_PRIORITY_CLASS );
croak "Couldn't lower process priority." unless ( $dwarf_process );

### actually read stuff from memory ############################################
################################################################################
$proc = Win32::Process::Memory->new({ pid  => $dwarf_pid, access => 'read/query' });   # open process with read access
croak "Couldn't open memory access to Dwarf Fortress." unless ( $proc );

$proc->get_buf( $df_offset, 14, my $df_name );
croak "Wrong DF version." unless ( $df_name eq "Dwarf Fortress" );

print "Processing map data.\n";

loadmap();

undef $proc;                                                # close process

print "Press enter to close...";
my $in = <STDIN>;

################################################################################

sub loadmap {
    print "Loading map data.\n";

    my $map_base;                                   # offset of the address where the map blocks start
    my ($xcount, $ycount, $zcount);                 # dimensions of the map data we're dealing with
    my (@xoffsets,@yoffsets,@zoffsets);             # arrays to store the offsets of the place where other addresses are stored
    @full_map_data=[];                              # array to hold the full extracted map data

    $map_base = $proc->get_u32($map_offset);        # checking whether the game has a map already
    croak "Map data is not yet available." unless ( $map_base );

    $xcount = $proc->get_u32($map_x_count);         # find out how much data we're dealing with
    $ycount = $proc->get_u32($map_y_count);
    $zcount = $proc->get_u32($map_z_count);
                                                    # get the offsets of the address storages for each x-slice and cycle through
    @xoffsets = $proc->get_packs("L", 4, $map_base, $xcount);
    for my $bx ( 0..$#xoffsets ) {
                                                        # get the offsets of the address storages for each y-column in this x-slice and cycle through
        @yoffsets = $proc->get_packs("L", 4, $xoffsets[$bx], $ycount);
        for my $by ( 0..$#yoffsets ) {
                                                            # get the offsets of each z-block in this y-column and cycle through
            @zoffsets = $proc->get_packs("L", 4, $yoffsets[$by], $zcount);
            for my $bz ( 0..$#zoffsets ) {

                next if ( $zoffsets[$bz] == 0 );                # go to the next block if this one is not allocated

                process_block(                                  # process the data in one block
                    $zoffsets[$bz],                             # offset of the current block
                    $bx,                                        # x location of the current block
                    $by,                                        # y location of the current block
                    $bz );                                      # z location of the current block

            }
        }
    }
    print "Done reading DF memory, printing to files.\n";

    print_files( $xcount, $ycount, $zcount );

    print "Files printed, shutting down.\n";
}

sub process_block {
    my ($block_offset, $bx, $by, $bz) = @_;

    my @type_data        = $proc->get_packs(        # extract type/designation/occupation arrays for this block
        "S", 2,                                     # format and size in bytes of each data unit
        $block_offset+$tile_type_offset,            # starting offset
        256);                                       # number of units
    my @designation_data = $proc->get_packs("L", 4, $block_offset+$tile_designation_offset, 256);
    my @ocupation_data   = $proc->get_packs("L", 4, $block_offset+$tile_occupancy_offset,   256);

    for my $y ( 0..15 ) {                           # cycle through 16 x and 16 y values, which generate a total of 256 tile indexes
        for my $x ( 0..15 ) {

            my $tile_index = $y+($x*16);                # this calculates the tile index we are currently at, from the x and y coords in this block

            my $real_x = ($bx*16)+$x;                   # this calculates the real x and y values of this tile on the overall map_base
            my $real_y = ($by*16)+$y;

            $full_map_data[$real_x][$real_y][$bz] =     # store in the array that holds the full map data :
                $type_data[$tile_index] . ":" .         # the type data of the tile with the current index
                $designation_data[$tile_index] . ":" .  # the designation data of the tile with the current index
                $ocupation_data[$tile_index];           # the occupation data of the tile with the current index
        }
    }
}

sub print_files {
    my ($xcount, $ycount, $zcount) = @_;
    
    print "Please enter the name of your fortress (1 word, alphanumeric + _): ";
    my $map_name = <STDIN>;
    $map_name =~ /.*?(\w+).*?/;
    $map_name = $1;
    
    my $page = "$map_name|$xcount|$ycount|$zcount\n";
    my $page2 = "$map_name|$xcount|$ycount|$zcount\n";
    
    for my $z ( 0..$zcount-1 ) {
        my $map1 = "-" . $z . "-\n";
        my $map2 = "-" . $z . "-\n";
        my $allocated;
        for my $y ( 0..($ycount*16)-1 ) {
            my $line1;
            my $line2;
            for my $x ( 0..($xcount*16)-1 ) {
                if ($full_map_data[$x][$y][$z]) {
                    $line1 .= sprintf ( "%4d ", split (/:/, $full_map_data[$x][$y][$z], 2) );
                    $line2 .= $full_map_data[$x][$y][$z]."|";
                    $allocated = 1;
                }
                else {
                    $line1 .= "  -1 ";
                    $line2 .= "-1|";
                }
            }
            $line2 =~ s/\|$//;
            $map1 .= $line1."\n";
            $map2 .= $line2."\n";
        }
        
        if ($allocated) {
            $map1 =~ s/\n$//;
            $map2 =~ s/\n$//;
            $page .= $map1."\n";
            $page2 .= $map2."\n";
        }
        print " ". $z+1 ." / $zcount \n";
    }
        
    $page =~ s/\n$//;
    $page2 =~ s/\n$//;
    
    open my $DAT, ">", "lite_$map_name.txt" or croak( "horribly: $!" );
    print $DAT $page;
    close $DAT;
    
    my $gz = gzopen("full_$map_name.txt.gz", "wb9") or croak( "horribly: ".$gzerrno );
    $gz->gzwrite($page2)  or croak( "horribly: ".$gzerrno );
    $gz->gzclose ;
}

__END__


# some notes:
################################################################################

#print "\nContent of $df_offset -> $df_offset + 0x80\n";           # do a hex dump starting at offset with given length
#print $proc->hexdump( $df_offset, 0x80 );
#
#$proc->get_buf( $df_offset, 10, my $string_buffer );                         # read and output various values
#printf ( "\n0x%X [string of length 10]   : %s\n", $df_offset, $string_buffer );
#printf ( "0x%X [unsigned int8  in hex] : %x\n", $df_offset, $proc->get_u8($df_offset) );
#printf ( "0x%X [unsigned int16 in hex] : %x\n", $df_offset, $proc->get_u16($df_offset) );
#printf ( "0x%X [unsigned int32 in hex] : %x\n", $df_offset, $proc->get_u32($df_offset) );

# Sample Output:
#
# Content of 8995724 -> 8995724 + 0x80
# 00894380 :                                     44 77 61 72 :             Dwar
# 00894390 : 66 20 46 6F 72 74 72 65 73 73 00 00 45 72 72 6F : f Fortress..Erro
# 008943A0 : 72 00 00 00 45 72 72 6F 72 20 52 65 67 69 73 74 : r...Error Regist
# 008943B0 : 65 72 69 6E 67 20 57 69 6E 64 6F 77 20 43 6C 61 : ering Window Cla
# 008943C0 : 73 73 21 00 45 72 72 6F 72 20 43 72 65 61 74 69 : ss!.Error Creati
# 008943D0 : 6E 67 20 4F 70 65 6E 47 4C 20 57 69 6E 64 6F 77 : ng OpenGL Window
# 008943E0 : 00 00 00 00 72 62 00 00 4D 6F 64 65 20 53 77 69 : ....rb..Mode Swi
# 008943F0 : 74 63 68 20 46 61 69 6C 65 64 2E 0A 52 75 6E 6E : tch Failed..Runn
# 00894400 : 69 6E 67 20 49 6E 20 57 69 6E 64 6F             : ing In Windo
#
# 0x89438C [string of length 10]   : Dwarf Fort
# 0x89438C [unsigned int8  in hex] : 44
# 0x89438C [unsigned int16 in hex] : 7744
# 0x89438C [unsigned int32 in hex] : 72617744