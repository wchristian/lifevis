#!/usr/bin/perl -w
use 5.010;
use strict;

our @TILE_TYPES;

BEGIN {
eval "use constant base_visual => 0"    unless(defined &base_visual);
eval "use constant base_texture => 1"    unless(defined &base_texture);
eval "use constant EMPTY => 0"          unless(defined &EMPTY);
eval "use constant FLOOR => 1"          unless(defined &FLOOR);
eval "use constant WALL => 2"           unless(defined &WALL);
eval "use constant RAMP => 3"           unless(defined &RAMP);
eval "use constant STAIR => 4"          unless(defined &STAIR);
eval "use constant FORTIF => 5"         unless(defined &FORTIF);
eval "use constant PILLAR => 6"         unless(defined &PILLAR);
eval "use constant RAMP_TOP => 7"           unless(defined &RAMP_TOP);
    
eval "use constant grass => 0"           unless(defined &grass);
eval "use constant stone => 1"           unless(defined &stone);
eval "use constant cursor => 2"           unless(defined &cursor);
eval "use constant obsidian => 3"           unless(defined &obsidian);
eval "use constant unknown => 4"           unless(defined &unknown);
eval "use constant minstone => 5"           unless(defined &minstone);
eval "use constant pool => 6"           unless(defined &pool);
eval "use constant water => 7"           unless(defined &water);
eval "use constant soil => 8"           unless(defined &soil);
eval "use constant tree => 9"           unless(defined &tree);
eval "use constant shrub => 10"           unless(defined &shrub);
eval "use constant sapling => 11"           unless(defined &sapling);
}

$TILE_TYPES[1][base_texture]=unknown;    $TILE_TYPES[1][base_visual]=RAMP;    #   MAPTILE_RAMPSPACE,
$TILE_TYPES[2][base_texture]=pool;    $TILE_TYPES[2][base_visual]=WALL;    #   MAPTILE_POOL,
$TILE_TYPES[19][base_texture]=unknown;    $TILE_TYPES[19][base_visual]=FLOOR;    #   MAPTILE_DRIFTWOOD_STACK,
$TILE_TYPES[24][base_texture]=tree;    $TILE_TYPES[24][base_visual]=FLOOR;    #   MAPTILE_TREE,
$TILE_TYPES[25][base_texture]=unknown;    $TILE_TYPES[25][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_FROZEN_LIQUID,
$TILE_TYPES[26][base_texture]=unknown;    $TILE_TYPES[26][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_FROZEN_LIQUID,
$TILE_TYPES[27][base_texture]=unknown;    $TILE_TYPES[27][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_FROZEN_LIQUID,
$TILE_TYPES[32][base_texture]=unknown;    $TILE_TYPES[32][base_visual]=EMPTY;    #   MAPTILE_AIR,
$TILE_TYPES[34][base_texture]=shrub;    $TILE_TYPES[34][base_visual]=FLOOR;    #   MAPTILE_SHRUB,
$TILE_TYPES[35][base_texture]=unknown;    $TILE_TYPES[35][base_visual]=EMPTY;    #   MAPTILE_CHASM,
$TILE_TYPES[36][base_texture]=obsidian;    $TILE_TYPES[36][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_LAVASTONE,
$TILE_TYPES[37][base_texture]=obsidian;    $TILE_TYPES[37][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_LAVASTONE,
$TILE_TYPES[38][base_texture]=obsidian;    $TILE_TYPES[38][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_LAVASTONE,
$TILE_TYPES[39][base_texture]=soil;    $TILE_TYPES[39][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_SOIL,
$TILE_TYPES[40][base_texture]=soil;    $TILE_TYPES[40][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_SOIL,
$TILE_TYPES[41][base_texture]=soil;    $TILE_TYPES[41][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_SOIL,
$TILE_TYPES[42][base_texture]=unknown;    $TILE_TYPES[42][base_visual]=EMPTY;    #   MAPTILE_EERIE_PIT,
$TILE_TYPES[43][base_texture]=stone;    $TILE_TYPES[43][base_visual]=FLOOR;    #   MAPTILE_STONE_FLOOR_DETAILED,
$TILE_TYPES[44][base_texture]=obsidian;    $TILE_TYPES[44][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_FLOOR_DETAILED,
$TILE_TYPES[45][base_texture]=unknown;    $TILE_TYPES[45][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_FLOOR_DETAILED,
$TILE_TYPES[46][base_texture]=minstone;    $TILE_TYPES[46][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_FLOOR_DETAILED,
$TILE_TYPES[47][base_texture]=unknown;    $TILE_TYPES[47][base_visual]=FLOOR;    #   MAPTILE_FROZEN_LIQUID_FLOOR_DETAILED,
$TILE_TYPES[49][base_texture]=grass;    $TILE_TYPES[49][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_GRASS1,
$TILE_TYPES[50][base_texture]=grass;    $TILE_TYPES[50][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_GRASS1,//50
$TILE_TYPES[51][base_texture]=grass;    $TILE_TYPES[51][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_GRASS1,
$TILE_TYPES[52][base_texture]=grass;    $TILE_TYPES[52][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_GRASS2,
$TILE_TYPES[53][base_texture]=grass;    $TILE_TYPES[53][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_GRASS2,
$TILE_TYPES[54][base_texture]=grass;    $TILE_TYPES[54][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_GRASS2,
$TILE_TYPES[55][base_texture]=stone;    $TILE_TYPES[55][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_STONE,
$TILE_TYPES[56][base_texture]=stone;    $TILE_TYPES[56][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_STONE,
$TILE_TYPES[57][base_texture]=stone;    $TILE_TYPES[57][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_STONE,
$TILE_TYPES[58][base_texture]=minstone;    $TILE_TYPES[58][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_MINSTONE,
$TILE_TYPES[59][base_texture]=minstone;    $TILE_TYPES[59][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_MINSTONE,
$TILE_TYPES[60][base_texture]=minstone;    $TILE_TYPES[60][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_MINSTONE,
$TILE_TYPES[61][base_texture]=unknown;    $TILE_TYPES[61][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_FEATSTONE,
$TILE_TYPES[62][base_texture]=unknown;    $TILE_TYPES[62][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_FEATSTONE,
$TILE_TYPES[63][base_texture]=unknown;    $TILE_TYPES[63][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_FEATSTONE,
$TILE_TYPES[65][base_texture]=stone;    $TILE_TYPES[65][base_visual]=FORTIF;    #   MAPTILE_STONE_FORTIFICATION,
$TILE_TYPES[67][base_texture]=unknown;    $TILE_TYPES[67][base_visual]=FLOOR;    #   MAPTILE_CAMPFIRE,
$TILE_TYPES[70][base_texture]=unknown;    $TILE_TYPES[70][base_visual]=FLOOR;    #   MAPTILE_FIRE,
$TILE_TYPES[79][base_texture]=stone;    $TILE_TYPES[79][base_visual]=PILLAR;    #   MAPTILE_STONE_PILLAR,
$TILE_TYPES[80][base_texture]=obsidian;    $TILE_TYPES[80][base_visual]=PILLAR;    #   MAPTILE_LAVASTONE_PILLAR,
$TILE_TYPES[81][base_texture]=unknown;    $TILE_TYPES[81][base_visual]=PILLAR;    #   MAPTILE_FEATSTONE_PILLAR,
$TILE_TYPES[82][base_texture]=minstone;    $TILE_TYPES[82][base_visual]=PILLAR;    #   MAPTILE_MINSTONE_PILLAR,
$TILE_TYPES[83][base_texture]=unknown;    $TILE_TYPES[83][base_visual]=PILLAR;    #   MAPTILE_FROZEN_LIQUID_PILLAR,
$TILE_TYPES[89][base_texture]=unknown;    $TILE_TYPES[89][base_visual]=EMPTY;    #   MAPTILE_WATERFALL_LANDING,
$TILE_TYPES[90][base_texture]=unknown;    $TILE_TYPES[90][base_visual]=EMPTY;    #   MAPTILE_RIVER_SOURCE,//
$TILE_TYPES[176][base_texture]=stone;    $TILE_TYPES[176][base_visual]=WALL;    #   MAPTILE_STONE_WALL_WORN1,
$TILE_TYPES[177][base_texture]=stone;    $TILE_TYPES[177][base_visual]=WALL;    #   MAPTILE_STONE_WALL_WORN2,
$TILE_TYPES[178][base_texture]=stone;    $TILE_TYPES[178][base_visual]=WALL;    #   MAPTILE_STONE_WALL_WORN3,
$TILE_TYPES[219][base_texture]=stone;    $TILE_TYPES[219][base_visual]=WALL;    #   MAPTILE_STONE_WALL,
$TILE_TYPES[231][base_texture]=sapling;    $TILE_TYPES[231][base_visual]=FLOOR;    #   MAPTILE_SAPLING,
$TILE_TYPES[233][base_texture]=unknown;    $TILE_TYPES[233][base_visual]=RAMP;    #   MAPTILE_RAMP_GRASS_DRY,
$TILE_TYPES[234][base_texture]=unknown;    $TILE_TYPES[234][base_visual]=RAMP;    #   MAPTILE_RAMP_GRASS_DEAD,
$TILE_TYPES[235][base_texture]=grass;    $TILE_TYPES[235][base_visual]=RAMP;    #   MAPTILE_RAMP_GRASS1,
$TILE_TYPES[236][base_texture]=grass;    $TILE_TYPES[236][base_visual]=RAMP;    #   MAPTILE_RAMP_GRASS2,
$TILE_TYPES[237][base_texture]=stone;    $TILE_TYPES[237][base_visual]=RAMP;    #   MAPTILE_RAMP_STONE,
$TILE_TYPES[238][base_texture]=obsidian;    $TILE_TYPES[238][base_visual]=RAMP;    #   MAPTILE_RAMP_LAVASTONE,
$TILE_TYPES[239][base_texture]=unknown;    $TILE_TYPES[239][base_visual]=RAMP;    #   MAPTILE_RAMP_FEATSTONE,
$TILE_TYPES[240][base_texture]=minstone;    $TILE_TYPES[240][base_visual]=RAMP;    #   MAPTILE_RAMP_MINSTONE,
$TILE_TYPES[241][base_texture]=soil;    $TILE_TYPES[241][base_visual]=RAMP;    #   MAPTILE_RAMP_SOIL,
$TILE_TYPES[242][base_texture]=unknown;    $TILE_TYPES[242][base_visual]=FLOOR;    #   MAPTILE_ASH1,
$TILE_TYPES[243][base_texture]=unknown;    $TILE_TYPES[243][base_visual]=FLOOR;    #   MAPTILE_ASH2,
$TILE_TYPES[244][base_texture]=unknown;    $TILE_TYPES[244][base_visual]=FLOOR;    #   MAPTILE_ASH3,
$TILE_TYPES[245][base_texture]=unknown;    $TILE_TYPES[245][base_visual]=RAMP;    #   MAPTILE_RAMP_FROZEN_LIQUID,
$TILE_TYPES[258][base_texture]=unknown;    $TILE_TYPES[258][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_1,
$TILE_TYPES[259][base_texture]=unknown;    $TILE_TYPES[259][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_2,
$TILE_TYPES[260][base_texture]=unknown;    $TILE_TYPES[260][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_3,
$TILE_TYPES[261][base_texture]=unknown;    $TILE_TYPES[261][base_visual]=FLOOR;    #   MAPTILE_FURROWED_SOIL,
$TILE_TYPES[262][base_texture]=unknown;    $TILE_TYPES[262][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_0,
$TILE_TYPES[264][base_texture]=unknown;    $TILE_TYPES[264][base_visual]=WALL;    #   MAPTILE_LAVA,
$TILE_TYPES[265][base_texture]=soil;    $TILE_TYPES[265][base_visual]=WALL;    #   MAPTILE_SOIL_WALL,
$TILE_TYPES[269][base_texture]=obsidian;    $TILE_TYPES[269][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_RD2,
$TILE_TYPES[270][base_texture]=obsidian;    $TILE_TYPES[270][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_R2D,
$TILE_TYPES[271][base_texture]=obsidian;    $TILE_TYPES[271][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_R2U,
$TILE_TYPES[272][base_texture]=obsidian;    $TILE_TYPES[272][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_RU2,
$TILE_TYPES[273][base_texture]=obsidian;    $TILE_TYPES[273][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_L2U,
$TILE_TYPES[274][base_texture]=obsidian;    $TILE_TYPES[274][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LU2,
$TILE_TYPES[275][base_texture]=obsidian;    $TILE_TYPES[275][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_L2D,
$TILE_TYPES[276][base_texture]=obsidian;    $TILE_TYPES[276][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LD2,
$TILE_TYPES[277][base_texture]=obsidian;    $TILE_TYPES[277][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LRUD,
$TILE_TYPES[278][base_texture]=obsidian;    $TILE_TYPES[278][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_RUD,
$TILE_TYPES[279][base_texture]=obsidian;    $TILE_TYPES[279][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LRD,
$TILE_TYPES[280][base_texture]=obsidian;    $TILE_TYPES[280][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LRU,
$TILE_TYPES[281][base_texture]=obsidian;    $TILE_TYPES[281][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LUD,
$TILE_TYPES[282][base_texture]=obsidian;    $TILE_TYPES[282][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_RD,
$TILE_TYPES[283][base_texture]=obsidian;    $TILE_TYPES[283][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_RU,
$TILE_TYPES[284][base_texture]=obsidian;    $TILE_TYPES[284][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LU,
$TILE_TYPES[285][base_texture]=obsidian;    $TILE_TYPES[285][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LD,
$TILE_TYPES[286][base_texture]=obsidian;    $TILE_TYPES[286][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_UD,
$TILE_TYPES[287][base_texture]=obsidian;    $TILE_TYPES[287][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_DET_LR,
$TILE_TYPES[288][base_texture]=unknown;    $TILE_TYPES[288][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_RD2,
$TILE_TYPES[289][base_texture]=unknown;    $TILE_TYPES[289][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_R2D,
$TILE_TYPES[290][base_texture]=unknown;    $TILE_TYPES[290][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_R2U,
$TILE_TYPES[291][base_texture]=unknown;    $TILE_TYPES[291][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_RU2,
$TILE_TYPES[292][base_texture]=unknown;    $TILE_TYPES[292][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_L2U,
$TILE_TYPES[293][base_texture]=unknown;    $TILE_TYPES[293][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LU2,
$TILE_TYPES[294][base_texture]=unknown;    $TILE_TYPES[294][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_L2D,
$TILE_TYPES[295][base_texture]=unknown;    $TILE_TYPES[295][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LD2,
$TILE_TYPES[296][base_texture]=unknown;    $TILE_TYPES[296][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LRUD,
$TILE_TYPES[297][base_texture]=unknown;    $TILE_TYPES[297][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_RUD,
$TILE_TYPES[298][base_texture]=unknown;    $TILE_TYPES[298][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LRD,
$TILE_TYPES[299][base_texture]=unknown;    $TILE_TYPES[299][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LRU,
$TILE_TYPES[300][base_texture]=unknown;    $TILE_TYPES[300][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LUD,
$TILE_TYPES[301][base_texture]=unknown;    $TILE_TYPES[301][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_RD,
$TILE_TYPES[302][base_texture]=unknown;    $TILE_TYPES[302][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_RU,
$TILE_TYPES[303][base_texture]=unknown;    $TILE_TYPES[303][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LU,
$TILE_TYPES[304][base_texture]=unknown;    $TILE_TYPES[304][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LD,
$TILE_TYPES[305][base_texture]=unknown;    $TILE_TYPES[305][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_UD,
$TILE_TYPES[306][base_texture]=unknown;    $TILE_TYPES[306][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_DET_LR,
$TILE_TYPES[307][base_texture]=stone;    $TILE_TYPES[307][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_RD2,
$TILE_TYPES[308][base_texture]=stone;    $TILE_TYPES[308][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_R2D,
$TILE_TYPES[309][base_texture]=stone;    $TILE_TYPES[309][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_R2U,
$TILE_TYPES[310][base_texture]=stone;    $TILE_TYPES[310][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_RU2,
$TILE_TYPES[311][base_texture]=stone;    $TILE_TYPES[311][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_L2U,
$TILE_TYPES[312][base_texture]=stone;    $TILE_TYPES[312][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LU2,
$TILE_TYPES[313][base_texture]=stone;    $TILE_TYPES[313][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_L2D,
$TILE_TYPES[314][base_texture]=stone;    $TILE_TYPES[314][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LD2,
$TILE_TYPES[315][base_texture]=stone;    $TILE_TYPES[315][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LRUD,
$TILE_TYPES[316][base_texture]=stone;    $TILE_TYPES[316][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_RUD,
$TILE_TYPES[317][base_texture]=stone;    $TILE_TYPES[317][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LRD,
$TILE_TYPES[318][base_texture]=stone;    $TILE_TYPES[318][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LRU,
$TILE_TYPES[319][base_texture]=stone;    $TILE_TYPES[319][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LUD,
$TILE_TYPES[320][base_texture]=stone;    $TILE_TYPES[320][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_RD,
$TILE_TYPES[321][base_texture]=stone;    $TILE_TYPES[321][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_RU,
$TILE_TYPES[322][base_texture]=stone;    $TILE_TYPES[322][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LU,
$TILE_TYPES[323][base_texture]=stone;    $TILE_TYPES[323][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LD,
$TILE_TYPES[324][base_texture]=stone;    $TILE_TYPES[324][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_UD,
$TILE_TYPES[325][base_texture]=stone;    $TILE_TYPES[325][base_visual]=WALL;    #   MAPTILE_STONE_WALL_DET_LR,
$TILE_TYPES[326][base_texture]=obsidian;    $TILE_TYPES[326][base_visual]=FORTIF;    #   MAPTILE_LAVASTONE_FORTIFICATION,
$TILE_TYPES[327][base_texture]=unknown;    $TILE_TYPES[327][base_visual]=FORTIF;    #   MAPTILE_FEATSTONE_FORTIFICATION,
$TILE_TYPES[328][base_texture]=obsidian;    $TILE_TYPES[328][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_WORN1,
$TILE_TYPES[329][base_texture]=obsidian;    $TILE_TYPES[329][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_WORN2,
$TILE_TYPES[330][base_texture]=obsidian;    $TILE_TYPES[330][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL_WORN3,
$TILE_TYPES[331][base_texture]=obsidian;    $TILE_TYPES[331][base_visual]=WALL;    #   MAPTILE_LAVASTONE_WALL,
$TILE_TYPES[332][base_texture]=unknown;    $TILE_TYPES[332][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_WORN1,
$TILE_TYPES[333][base_texture]=unknown;    $TILE_TYPES[333][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_WORN2,
$TILE_TYPES[334][base_texture]=unknown;    $TILE_TYPES[334][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL_WORN3,
$TILE_TYPES[335][base_texture]=unknown;    $TILE_TYPES[335][base_visual]=WALL;    #   MAPTILE_FEATSTONE_WALL,
$TILE_TYPES[336][base_texture]=stone;    $TILE_TYPES[336][base_visual]=FLOOR;    #   MAPTILE_STONE_FLOOR1,
$TILE_TYPES[337][base_texture]=stone;    $TILE_TYPES[337][base_visual]=FLOOR;    #   MAPTILE_STONE_FLOOR2,
$TILE_TYPES[338][base_texture]=stone;    $TILE_TYPES[338][base_visual]=FLOOR;    #   MAPTILE_STONE_FLOOR3,
$TILE_TYPES[339][base_texture]=stone;    $TILE_TYPES[339][base_visual]=FLOOR;    #   MAPTILE_STONE_FLOOR4,
$TILE_TYPES[340][base_texture]=obsidian;    $TILE_TYPES[340][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_FLOOR1,
$TILE_TYPES[341][base_texture]=obsidian;    $TILE_TYPES[341][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_FLOOR2,
$TILE_TYPES[342][base_texture]=obsidian;    $TILE_TYPES[342][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_FLOOR3,
$TILE_TYPES[343][base_texture]=obsidian;    $TILE_TYPES[343][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_FLOOR4,
$TILE_TYPES[344][base_texture]=unknown;    $TILE_TYPES[344][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_FLOOR1,
$TILE_TYPES[345][base_texture]=unknown;    $TILE_TYPES[345][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_FLOOR2,
$TILE_TYPES[346][base_texture]=unknown;    $TILE_TYPES[346][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_FLOOR3,
$TILE_TYPES[347][base_texture]=unknown;    $TILE_TYPES[347][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_FLOOR4,
$TILE_TYPES[348][base_texture]=grass;    $TILE_TYPES[348][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR1,
$TILE_TYPES[349][base_texture]=grass;    $TILE_TYPES[349][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR2,
$TILE_TYPES[350][base_texture]=grass;    $TILE_TYPES[350][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR3,//350
$TILE_TYPES[351][base_texture]=grass;    $TILE_TYPES[351][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR4,
$TILE_TYPES[352][base_texture]=soil;    $TILE_TYPES[352][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR1,
$TILE_TYPES[353][base_texture]=soil;    $TILE_TYPES[353][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR2,
$TILE_TYPES[354][base_texture]=soil;    $TILE_TYPES[354][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR3,
$TILE_TYPES[355][base_texture]=soil;    $TILE_TYPES[355][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR4,
$TILE_TYPES[356][base_texture]=unknown;    $TILE_TYPES[356][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR1_WET,
$TILE_TYPES[357][base_texture]=unknown;    $TILE_TYPES[357][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR2_WET,
$TILE_TYPES[358][base_texture]=unknown;    $TILE_TYPES[358][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR3_WET,
$TILE_TYPES[359][base_texture]=unknown;    $TILE_TYPES[359][base_visual]=FLOOR;    #   MAPTILE_SOIL_FLOOR4_WET,
$TILE_TYPES[360][base_texture]=unknown;    $TILE_TYPES[360][base_visual]=FORTIF;    #   MAPTILE_FROZEN_LIQUID_FORTIFICATION,
$TILE_TYPES[361][base_texture]=unknown;    $TILE_TYPES[361][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_WORN1,
$TILE_TYPES[362][base_texture]=unknown;    $TILE_TYPES[362][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_WORN2,
$TILE_TYPES[363][base_texture]=unknown;    $TILE_TYPES[363][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_WORN3,
$TILE_TYPES[364][base_texture]=unknown;    $TILE_TYPES[364][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL,
$TILE_TYPES[365][base_texture]=unknown;    $TILE_TYPES[365][base_visual]=EMPTY;    #   MAPTILE_RIVER_N,
$TILE_TYPES[366][base_texture]=unknown;    $TILE_TYPES[366][base_visual]=EMPTY;    #   MAPTILE_RIVER_S,
$TILE_TYPES[367][base_texture]=unknown;    $TILE_TYPES[367][base_visual]=EMPTY;    #   MAPTILE_RIVER_E,
$TILE_TYPES[368][base_texture]=unknown;    $TILE_TYPES[368][base_visual]=EMPTY;    #   MAPTILE_RIVER_W,
$TILE_TYPES[369][base_texture]=unknown;    $TILE_TYPES[369][base_visual]=EMPTY;    #   MAPTILE_RIVER_NW,
$TILE_TYPES[370][base_texture]=unknown;    $TILE_TYPES[370][base_visual]=EMPTY;    #   MAPTILE_RIVER_NE,
$TILE_TYPES[371][base_texture]=unknown;    $TILE_TYPES[371][base_visual]=EMPTY;    #   MAPTILE_RIVER_SW,
$TILE_TYPES[372][base_texture]=unknown;    $TILE_TYPES[372][base_visual]=EMPTY;    #   MAPTILE_RIVER_SE,
$TILE_TYPES[373][base_texture]=water;    $TILE_TYPES[373][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_N,
$TILE_TYPES[374][base_texture]=water;    $TILE_TYPES[374][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_S,
$TILE_TYPES[375][base_texture]=water;    $TILE_TYPES[375][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_E,
$TILE_TYPES[376][base_texture]=water;    $TILE_TYPES[376][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_W,
$TILE_TYPES[377][base_texture]=water;    $TILE_TYPES[377][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_NW,
$TILE_TYPES[378][base_texture]=water;    $TILE_TYPES[378][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_NE,
$TILE_TYPES[379][base_texture]=water;    $TILE_TYPES[379][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_SW,
$TILE_TYPES[380][base_texture]=water;    $TILE_TYPES[380][base_visual]=WALL;    #   MAPTILE_STREAM_BED_WALL_SE,
$TILE_TYPES[381][base_texture]=water;    $TILE_TYPES[381][base_visual]=FLOOR;    #   MAPTILE_STREAM_BED_TOP,
$TILE_TYPES[387][base_texture]=unknown;    $TILE_TYPES[387][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR1_DRY,
$TILE_TYPES[388][base_texture]=unknown;    $TILE_TYPES[388][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR2_DRY,
$TILE_TYPES[389][base_texture]=unknown;    $TILE_TYPES[389][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR3_DRY,
$TILE_TYPES[390][base_texture]=unknown;    $TILE_TYPES[390][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR4_DRY,//390
$TILE_TYPES[391][base_texture]=unknown;    $TILE_TYPES[391][base_visual]=FLOOR;    #   MAPTILE_TREE_DEAD,
$TILE_TYPES[392][base_texture]=unknown;    $TILE_TYPES[392][base_visual]=FLOOR;    #   MAPTILE_SAPLING_DEAD,
$TILE_TYPES[393][base_texture]=unknown;    $TILE_TYPES[393][base_visual]=FLOOR;    #   MAPTILE_SHRUB_DEAD,
$TILE_TYPES[394][base_texture]=unknown;    $TILE_TYPES[394][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR1_DEAD,
$TILE_TYPES[395][base_texture]=unknown;    $TILE_TYPES[395][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR2_DEAD,
$TILE_TYPES[396][base_texture]=unknown;    $TILE_TYPES[396][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR3_DEAD,
$TILE_TYPES[397][base_texture]=unknown;    $TILE_TYPES[397][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR4_DEAD,
$TILE_TYPES[398][base_texture]=grass;    $TILE_TYPES[398][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR1B,
$TILE_TYPES[399][base_texture]=grass;    $TILE_TYPES[399][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR2B,
$TILE_TYPES[400][base_texture]=grass;    $TILE_TYPES[400][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR3B,//400
$TILE_TYPES[401][base_texture]=grass;    $TILE_TYPES[401][base_visual]=FLOOR;    #   MAPTILE_GRASS_FLOOR4B,
$TILE_TYPES[402][base_texture]=stone;    $TILE_TYPES[402][base_visual]=FLOOR;    #   MAPTILE_STONE_BOULDER,
$TILE_TYPES[403][base_texture]=obsidian;    $TILE_TYPES[403][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_BOULDER,
$TILE_TYPES[404][base_texture]=unknown;    $TILE_TYPES[404][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_BOULDER,
$TILE_TYPES[405][base_texture]=stone;    $TILE_TYPES[405][base_visual]=FLOOR;    #   MAPTILE_STONE_PEBBLE1,
$TILE_TYPES[406][base_texture]=stone;    $TILE_TYPES[406][base_visual]=FLOOR;    #   MAPTILE_STONE_PEBBLE2,
$TILE_TYPES[407][base_texture]=stone;    $TILE_TYPES[407][base_visual]=FLOOR;    #   MAPTILE_STONE_PEBBLE3,
$TILE_TYPES[408][base_texture]=stone;    $TILE_TYPES[408][base_visual]=FLOOR;    #   MAPTILE_STONE_PEBBLE4,
$TILE_TYPES[409][base_texture]=obsidian;    $TILE_TYPES[409][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_PEBBLE1,
$TILE_TYPES[410][base_texture]=obsidian;    $TILE_TYPES[410][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_PEBBLE2,
$TILE_TYPES[411][base_texture]=obsidian;    $TILE_TYPES[411][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_PEBBLE3,
$TILE_TYPES[412][base_texture]=obsidian;    $TILE_TYPES[412][base_visual]=FLOOR;    #   MAPTILE_LAVASTONE_PEBBLE4,
$TILE_TYPES[413][base_texture]=unknown;    $TILE_TYPES[413][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_PEBBLE1,
$TILE_TYPES[414][base_texture]=unknown;    $TILE_TYPES[414][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_PEBBLE2,
$TILE_TYPES[415][base_texture]=unknown;    $TILE_TYPES[415][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_PEBBLE3,
$TILE_TYPES[416][base_texture]=unknown;    $TILE_TYPES[416][base_visual]=FLOOR;    #   MAPTILE_FEATSTONE_PEBBLE4,
$TILE_TYPES[417][base_texture]=minstone;    $TILE_TYPES[417][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_RD2,
$TILE_TYPES[418][base_texture]=minstone;    $TILE_TYPES[418][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_R2D,
$TILE_TYPES[419][base_texture]=minstone;    $TILE_TYPES[419][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_R2U,
$TILE_TYPES[420][base_texture]=minstone;    $TILE_TYPES[420][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_RU2,
$TILE_TYPES[421][base_texture]=minstone;    $TILE_TYPES[421][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_L2U,
$TILE_TYPES[422][base_texture]=minstone;    $TILE_TYPES[422][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LU2,
$TILE_TYPES[423][base_texture]=minstone;    $TILE_TYPES[423][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_L2D,
$TILE_TYPES[424][base_texture]=minstone;    $TILE_TYPES[424][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LD2,
$TILE_TYPES[425][base_texture]=minstone;    $TILE_TYPES[425][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LRUD,
$TILE_TYPES[426][base_texture]=minstone;    $TILE_TYPES[426][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_RUD,
$TILE_TYPES[427][base_texture]=minstone;    $TILE_TYPES[427][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LRD,
$TILE_TYPES[428][base_texture]=minstone;    $TILE_TYPES[428][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LRU,
$TILE_TYPES[429][base_texture]=minstone;    $TILE_TYPES[429][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LUD,
$TILE_TYPES[430][base_texture]=minstone;    $TILE_TYPES[430][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_RD,
$TILE_TYPES[431][base_texture]=minstone;    $TILE_TYPES[431][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_RU,
$TILE_TYPES[432][base_texture]=minstone;    $TILE_TYPES[432][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LU,
$TILE_TYPES[433][base_texture]=minstone;    $TILE_TYPES[433][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LD,
$TILE_TYPES[434][base_texture]=minstone;    $TILE_TYPES[434][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_UD,
$TILE_TYPES[435][base_texture]=minstone;    $TILE_TYPES[435][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_DET_LR,
$TILE_TYPES[436][base_texture]=minstone;    $TILE_TYPES[436][base_visual]=FORTIF;    #   MAPTILE_MINSTONE_FORTIFICATION,
$TILE_TYPES[437][base_texture]=minstone;    $TILE_TYPES[437][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_WORN1,
$TILE_TYPES[438][base_texture]=minstone;    $TILE_TYPES[438][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_WORN2,
$TILE_TYPES[439][base_texture]=minstone;    $TILE_TYPES[439][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL_WORN3,
$TILE_TYPES[440][base_texture]=minstone;    $TILE_TYPES[440][base_visual]=WALL;    #   MAPTILE_MINSTONE_WALL,
$TILE_TYPES[441][base_texture]=minstone;    $TILE_TYPES[441][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_FLOOR1,
$TILE_TYPES[442][base_texture]=minstone;    $TILE_TYPES[442][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_FLOOR2,
$TILE_TYPES[443][base_texture]=minstone;    $TILE_TYPES[443][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_FLOOR3,
$TILE_TYPES[444][base_texture]=minstone;    $TILE_TYPES[444][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_FLOOR4,
$TILE_TYPES[445][base_texture]=minstone;    $TILE_TYPES[445][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_BOULDER,
$TILE_TYPES[446][base_texture]=minstone;    $TILE_TYPES[446][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_PEBBLE1,
$TILE_TYPES[447][base_texture]=minstone;    $TILE_TYPES[447][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_PEBBLE2,
$TILE_TYPES[448][base_texture]=minstone;    $TILE_TYPES[448][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_PEBBLE3,
$TILE_TYPES[449][base_texture]=minstone;    $TILE_TYPES[449][base_visual]=FLOOR;    #   MAPTILE_MINSTONE_PEBBLE4,
$TILE_TYPES[450][base_texture]=unknown;    $TILE_TYPES[450][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_RD2,//450
$TILE_TYPES[451][base_texture]=unknown;    $TILE_TYPES[451][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_R2D,
$TILE_TYPES[452][base_texture]=unknown;    $TILE_TYPES[452][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_R2U,
$TILE_TYPES[453][base_texture]=unknown;    $TILE_TYPES[453][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_RU2,
$TILE_TYPES[454][base_texture]=unknown;    $TILE_TYPES[454][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_L2U,
$TILE_TYPES[455][base_texture]=unknown;    $TILE_TYPES[455][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LU2,
$TILE_TYPES[456][base_texture]=unknown;    $TILE_TYPES[456][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_L2D,
$TILE_TYPES[457][base_texture]=unknown;    $TILE_TYPES[457][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LD2,
$TILE_TYPES[458][base_texture]=unknown;    $TILE_TYPES[458][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LRUD,
$TILE_TYPES[459][base_texture]=unknown;    $TILE_TYPES[459][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_RUD,
$TILE_TYPES[460][base_texture]=unknown;    $TILE_TYPES[460][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LRD,
$TILE_TYPES[461][base_texture]=unknown;    $TILE_TYPES[461][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LRU,
$TILE_TYPES[462][base_texture]=unknown;    $TILE_TYPES[462][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LUD,
$TILE_TYPES[463][base_texture]=unknown;    $TILE_TYPES[463][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_RD,
$TILE_TYPES[464][base_texture]=unknown;    $TILE_TYPES[464][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_RU,
$TILE_TYPES[465][base_texture]=unknown;    $TILE_TYPES[465][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LU,
$TILE_TYPES[466][base_texture]=unknown;    $TILE_TYPES[466][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LD,
$TILE_TYPES[467][base_texture]=unknown;    $TILE_TYPES[467][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_UD,
$TILE_TYPES[468][base_texture]=unknown;    $TILE_TYPES[468][base_visual]=WALL;    #   MAPTILE_FROZEN_LIQUID_WALL_DET_LR,
$TILE_TYPES[493][base_texture]=unknown;    $TILE_TYPES[493][base_visual]=FLOOR;    #   MAPTILE_CONSTRUCTED_FLOOR_DETAILED,
$TILE_TYPES[494][base_texture]=unknown;    $TILE_TYPES[494][base_visual]=FORTIF;    #   MAPTILE_CONSTRUCTED_FORTIFICATION,
$TILE_TYPES[495][base_texture]=unknown;    $TILE_TYPES[495][base_visual]=PILLAR;    #   MAPTILE_CONSTRUCTED_PILLAR,
$TILE_TYPES[496][base_texture]=unknown;    $TILE_TYPES[496][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_RD2,
$TILE_TYPES[497][base_texture]=unknown;    $TILE_TYPES[497][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_R2D,
$TILE_TYPES[498][base_texture]=unknown;    $TILE_TYPES[498][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_R2U,
$TILE_TYPES[499][base_texture]=unknown;    $TILE_TYPES[499][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_RU2,
$TILE_TYPES[500][base_texture]=unknown;    $TILE_TYPES[500][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_L2U,//500
$TILE_TYPES[501][base_texture]=unknown;    $TILE_TYPES[501][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LU2,
$TILE_TYPES[502][base_texture]=unknown;    $TILE_TYPES[502][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_L2D,
$TILE_TYPES[503][base_texture]=unknown;    $TILE_TYPES[503][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LD2,
$TILE_TYPES[504][base_texture]=unknown;    $TILE_TYPES[504][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LRUD,
$TILE_TYPES[505][base_texture]=unknown;    $TILE_TYPES[505][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_RUD,
$TILE_TYPES[506][base_texture]=unknown;    $TILE_TYPES[506][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LRD,
$TILE_TYPES[507][base_texture]=unknown;    $TILE_TYPES[507][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LRU,
$TILE_TYPES[508][base_texture]=unknown;    $TILE_TYPES[508][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LUD,
$TILE_TYPES[509][base_texture]=unknown;    $TILE_TYPES[509][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_RD,
$TILE_TYPES[510][base_texture]=unknown;    $TILE_TYPES[510][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_RU,
$TILE_TYPES[511][base_texture]=unknown;    $TILE_TYPES[511][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LU,
$TILE_TYPES[512][base_texture]=unknown;    $TILE_TYPES[512][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LD,
$TILE_TYPES[513][base_texture]=unknown;    $TILE_TYPES[513][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_UD,
$TILE_TYPES[514][base_texture]=unknown;    $TILE_TYPES[514][base_visual]=WALL;    #   MAPTILE_CONSTRUCTED_WALL_DET_LR,
$TILE_TYPES[515][base_texture]=unknown;    $TILE_TYPES[515][base_visual]=STAIR;    #   MAPTILE_STAIR_UPDOWN_CONSTRUCTED,
$TILE_TYPES[516][base_texture]=unknown;    $TILE_TYPES[516][base_visual]=STAIR;    #   MAPTILE_STAIR_DOWN_CONSTRUCTED,
$TILE_TYPES[517][base_texture]=unknown;    $TILE_TYPES[517][base_visual]=STAIR;    #   MAPTILE_STAIR_UP_CONSTRUCTED,
$TILE_TYPES[518][base_texture]=unknown;    $TILE_TYPES[518][base_visual]=RAMP;    #   MAPTILE_RAMP_CONSTRUCTED,

1;