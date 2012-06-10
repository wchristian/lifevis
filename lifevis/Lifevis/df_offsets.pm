package Lifevis::df_offsets;
use strict;

use base 'Exporter';

our @EXPORT = (qw( get_df_offsets ));

my @OFFSETS = (
    {
        version             => "v0.34.10 SDL",
        pe_timestamp_offset => 0x130,
        PE                  => 0x4fba073a,
        map_loc             => 0x186A738,
        x_count             => 0x186a750,
        y_count             => 0x186a754,
        z_count             => 0x186a758,
        type_off            => 0x007a,
        designation_off     => 0x027c,
        occupancy_off       => 0x067c,
        mouse_x             => 0xC97848,
        mouse_y             => 0xC9784C,
        mouse_z             => 0xC97850,
        viewport_x          => 0x1014A04,
        viewport_y          => 0x1042C14,
        viewport_z          => 0x1042BEC,
        window_grid_x       => 0x19AF974,
        window_grid_y       => 0x19AF978,
        view_state          => 0xC08920,
        creature_vector     => 0x182898c,
        item_vector         => 0x1828a30,
        building_vector     => 0x18292a8,
        menu_state          => 0x15C1756, # maybe
        creature_race       => 0x8C,
        creature_x          => 0x94,
        creature_y          => 0x96,
    },
);    # OFFSETS END HERE - DO NOT REMOVE THIS COMMENT

sub get_df_offsets {
    return @OFFSETS;
}

1;
