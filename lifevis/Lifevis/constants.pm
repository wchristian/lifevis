package Lifevis::constants;
use strict;
use base 'Exporter';

our @EXPORT = (
    qw(
    PROGRAM_TITLE PI PIOVER180

    base_visual base_texture brightness_mod

    EMPTY FLOOR WALL RAMP STAIR FORTIF PILLAR RAMP_TOP TREE SHRUB SAPLING BOULDER
    STAIR_UP STAIR_DOWN

    grass stone cursor obsidian unknown minstone pool water soil tree shrub
    sapling creature grassb boulder shrub_dead tree_dead sapling_dead
    constructed_floor_detailed constructed_wall grass_dry lava test metal
    stone_detailed minstone_detailed ui items wood red

    BUILDING_OCCUPANCY_NONE BUILDING_OCCUPANCY_CONST BUILDING_OCCUPANCY_NO_BLOCK
    BUILDING_OCCUPANCY_BLOCK_FLOOR BUILDING_OCCUPANCY_BLOCK
    BUILDING_OCCUPANCY_FLOOR BUILDING_OCCUPANCY_TOTAL BUILDING_OCCUPANCY_SPECIAL

    type desig occup

    flags race c_x c_y c_z name cell_x cell_y id c_vtable_id c_vtable_const

    b_x b_y b_z  b_cell_x b_cell_y b_vtable_id b_vtable_const

    i_id i_x i_y i_z i_cell_x i_cell_y i_state i_type i_address i_vtable_id i_vtable_const

    cell_ptr use_counter display_lists mask_lists

    changed z offset creature_list cache_ptr building_list item_list

    version PE map_loc x_count y_count z_count pe_timestamp_offset type_off designation_off occupancy_off mouse_x
    mouse_y mouse_z creature_vector creature_race creature_x creature_y viewport_x viewport_y viewport_z window_grid_x
    window_grid_y menu_state view_state building_vector item_vector

    main north south west east top bottom
    )
);

use constant PROGRAM_TITLE => 'Lifevis - A real-time Dwarf Fortress world viewer';
use constant PI            => 4 * atan2 1, 1;
use constant PIOVER180     => PI / 180;

use constant base_visual    => 0;
use constant base_texture   => 1;
use constant brightness_mod => 2;

use constant EMPTY      => 0;
use constant FLOOR      => 1;
use constant WALL       => 2;
use constant RAMP       => 3;
use constant STAIR      => 4;
use constant FORTIF     => 5;
use constant PILLAR     => 6;
use constant RAMP_TOP   => 7;
use constant TREE       => 8;
use constant SHRUB      => 9;
use constant SAPLING    => 10;
use constant BOULDER    => 11;
use constant STAIR_UP   => 12;
use constant STAIR_DOWN => 13;

use enum qw(
  grass stone cursor obsidian unknown minstone pool water soil tree shrub
  sapling creature grassb boulder shrub_dead tree_dead sapling_dead
  constructed_floor_detailed constructed_wall grass_dry lava test metal
  stone_detailed minstone_detailed ui items wood red
);

use enum qw(
  BUILDING_OCCUPANCY_NONE BUILDING_OCCUPANCY_CONST BUILDING_OCCUPANCY_NO_BLOCK
  BUILDING_OCCUPANCY_BLOCK_FLOOR BUILDING_OCCUPANCY_BLOCK
  BUILDING_OCCUPANCY_FLOOR BUILDING_OCCUPANCY_TOTAL BUILDING_OCCUPANCY_SPECIAL
);

use constant type  => 0;
use constant desig => 1;
use constant occup => 2;

use enum qw(
  flags race c_x c_y c_z name cell_x cell_y id
);

use enum qw(
  b_x b_y b_z  b_cell_x b_cell_y b_vtable_id b_vtable_const
);

use enum qw(
  i_id i_x i_y i_z i_cell_x i_cell_y i_state i_type i_address i_vtable_id i_vtable_const
);

use enum qw(
  cell_ptr use_counter display_lists mask_lists
);

use enum qw(
  changed z offset creature_list cache_ptr building_list item_list
);

use enum qw(
  version PE map_loc x_count y_count z_count pe_timestamp_offset type_off designation_off occupancy_off mouse_x
  mouse_y mouse_z creature_vector creature_race creature_x creature_y viewport_x viewport_y viewport_z window_grid_x
  window_grid_y menu_state view_state building_vector item_vector
);

use enum qw (
  main north south west east top bottom
);

1;
