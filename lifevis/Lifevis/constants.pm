package Lifevis::constants;
use strict;
use base 'Exporter';

our @EXPORT = ( qw(
 PROGRAM_TITLE PI PIOVER180

 base_visual base_texture brightness_mod
                  
 EMPTY FLOOR WALL RAMP STAIR FORTIF PILLAR RAMP_TOP TREE SHRUB SAPLING BOULDER
 STAIR_UP STAIR_DOWN 
                  
 grass stone cursor obsidian unknown minstone pool water soil tree shrub
 sapling creature grassb boulder shrub_dead tree_dead sapling_dead
 constructed_floor_detailed constructed_wall grass_dry lava test
 
 type desig occup
 
 race c_x c_y c_z name cell_x cell_y
 
 cell_ptr
 
 changed z offset creature_list cache_ptr
 
 ) );

use constant PROGRAM_TITLE =>
  'Lifevis - A real-time Dwarf Fortress world viewer';
use constant PI => 4 * atan2 1, 1;
use constant PIOVER180 => PI / 180;

use constant base_visual    => 0;
use constant base_texture   => 1;
use constant brightness_mod => 2;

use constant EMPTY          => 0;
use constant FLOOR          => 1;
use constant WALL           => 2;
use constant RAMP           => 3;
use constant STAIR          => 4;
use constant FORTIF         => 5;
use constant PILLAR         => 6;
use constant RAMP_TOP       => 7;
use constant TREE           => 8;
use constant SHRUB          => 9;
use constant SAPLING        => 10;
use constant BOULDER        => 11;
use constant STAIR_UP       => 12;
use constant STAIR_DOWN     => 13;

use constant grass                      => 0;
use constant stone                      => 1;
use constant cursor                     => 2;
use constant obsidian                   => 3;
use constant unknown                    => 4;
use constant minstone                   => 5;
use constant pool                       => 6;
use constant water                      => 7;
use constant soil                       => 8;
use constant tree                       => 9;
use constant shrub                      => 10;
use constant sapling                    => 11;
use constant creature                   => 12;
use constant grassb                     => 13;
use constant boulder                    => 14;
use constant shrub_dead                 => 15;
use constant tree_dead                  => 16;
use constant sapling_dead               => 17;
use constant constructed_floor_detailed => 18;
use constant constructed_wall           => 19;
use constant grass_dry                  => 20;
use constant lava                       => 21;
use constant test                       => 22;

use constant type  => 0;
use constant desig => 1;
use constant occup => 2;

use constant race   => 0;
use constant c_x    => 1;
use constant c_y    => 2;
use constant c_z    => 3;
use constant name   => 4;
use constant cell_x => 5;
use constant cell_y => 6;

use constant cell_ptr => 0;

use constant changed       => 0;
use constant z             => 1;
use constant offset        => 2;
use constant creature_list => 3;
use constant cache_ptr     => 4;

1;