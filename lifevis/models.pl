#!/usr/bin/perl -w
use 5.010;
use strict;

BEGIN {
	eval "use constant base_visual => 0"    unless(defined &base_visual);
	eval "use constant EMPTY => 0"          unless(defined &EMPTY);
	eval "use constant FLOOR => 1"          unless(defined &FLOOR);
	eval "use constant WALL => 2"           unless(defined &WALL);
	eval "use constant RAMP => 3"           unless(defined &RAMP);
	eval "use constant STAIR => 4"          unless(defined &STAIR);
	eval "use constant FORTIF => 5"         unless(defined &FORTIF);
	eval "use constant PILLAR => 6"         unless(defined &PILLAR);
    eval "use constant RAMP_TOP => 7"           unless(defined &RAMP_TOP);
    eval "use constant TREE => 8"           unless(defined &TREE);
    eval "use constant SHRUB => 9"           unless(defined &SHRUB);
    eval "use constant SAPLING => 10"           unless(defined &SAPLING);
    eval "use constant BOULDER => 11"           unless(defined &BOULDER);
}

our $ZCOUNT;

our %DRAW_MODEL;





$DRAW_MODEL{'1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.41421356,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.70710678,1.22474487); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.41421356,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.70710678,1.22474487); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.41421356,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.70710678,1.22474487); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.41421356,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.70710678,1.22474487); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1D_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.6); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,0.6); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.5); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,-0.5); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0.5); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,0.6); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,5.5511151e-017); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(5.5511151e-017,5.5511151e-017); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,5.5511151e-017); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(5.5511151e-017,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(2.220446e-016,1.110223e-016); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(2.220446e-016,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.110223e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(2.220446e-016,1.110223e-016); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1.110223e-016,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.110223e-016,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1.110223e-016,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.66804649,0.60101099); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(-0.20036884,0.83370217); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.032322347,-0.034713159); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(-0.20036884,0.09963116); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.66804649,0.33232235); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.032322347,0.96804649); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1D_1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.6); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,0.6); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.5); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,-0.5); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0.5); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(-1.110223e-016,0.6); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,5.5511151e-017); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,5.5511151e-017); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(5.5511151e-017,5.5511151e-017); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(2.220446e-016,1.110223e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(2.220446e-016,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.110223e-016); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(2.220446e-016,1.110223e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1.110223e-016,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.110223e-016,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1.110223e-016,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.66804649,0.60101099); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(-0.20036884,0.83370217); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.032322347,-0.034713159); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(-0.20036884,0.09963116); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.66804649,0.33232235); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.032322347,0.96804649); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'1S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'1S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_1DL1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0.38890873,0.55); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.38890873,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.38890873,0.55); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DL2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0.38890873,0.55); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.38890873,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.38890873,0.55); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DL3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0.38890873,0.55); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.38890873,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.38890873,0.55); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DL4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0.38890873,0.55); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.38890873,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.38890873,0.55); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_1DR1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1.00237868,1.41757752); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.55002111); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.95806318,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.31755483,1.10315914); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DR2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1.00237868,1.41757752); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.55002111); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.95806318,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.31755483,1.10315914); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DR3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(1.00237868,1.41757752); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.55002111); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0.95806318,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.31755483,1.10315914); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DR4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.41757752); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1.00237868,0.70878876); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1.00237868,1.41757752); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.55002111); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.95806318,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.31755483,1.10315914); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'1S_1S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
};

$DRAW_MODEL{'1S_1S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_2D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0+$x,0.1+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0.5); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.5); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
};

$DRAW_MODEL{'1S_2D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0.5); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0.5); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
};

$DRAW_MODEL{'1S_2D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0.5); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0.5); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_2D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0.5); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0.5); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
};



$DRAW_MODEL{'2D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0,4.4408921e-016); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,4.4408921e-016); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,1.06897265); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.28643036,0); glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    glTexCoord2f(0.451801,0.61717165); glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(3.3306691e-016,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    glTexCoord2f(0,1.3519151); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,2.220446e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,2.220446e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.97487984,1.3519151); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    glTexCoord2f(0.97487984,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.97487984,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    glTexCoord2f(3.3306691e-016,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.61717165); glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.16537064,0); glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    glTexCoord2f(0.451801,1.06897265); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0,4.4408921e-016); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,4.4408921e-016); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,1.06897265); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.28643036,0); glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    glTexCoord2f(0.451801,0.61717165); glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(3.3306691e-016,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    glTexCoord2f(0,1.3519151); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,2.220446e-016); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,2.220446e-016); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.97487984,1.3519151); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    glTexCoord2f(0.97487984,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.97487984,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    glTexCoord2f(3.3306691e-016,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.61717165); glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    glTexCoord2f(0.16537064,0); glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    glTexCoord2f(0.451801,1.06897265); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0,4.4408921e-016); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,4.4408921e-016); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,1.06897265); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.28643036,0); glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    glTexCoord2f(0.451801,0.61717165); glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(3.3306691e-016,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    glTexCoord2f(0,1.3519151); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,2.220446e-016); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,2.220446e-016); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.97487984,1.3519151); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    glTexCoord2f(0.97487984,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.97487984,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    glTexCoord2f(3.3306691e-016,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.61717165); glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.16537064,0); glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    glTexCoord2f(0.451801,1.06897265); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'2D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0,4.4408921e-016); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(3.8857806e-016,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,4.4408921e-016); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    glTexCoord2f(4.4408921e-016,1.1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.5); glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,1.06897265); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.28643036,0); glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    glTexCoord2f(0.451801,0.61717165); glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(3.3306691e-016,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    glTexCoord2f(0,1.3519151); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,2.220446e-016); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,2.220446e-016); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.97487984,1.3519151); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    glTexCoord2f(0.97487984,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.97487984,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.48743992,0.40557453); glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    glTexCoord2f(3.3306691e-016,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.61717165); glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    glTexCoord2f(0.16537064,0); glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    glTexCoord2f(0.451801,1.06897265); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'2S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.70710678,-0.22474487); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.41421356,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'2S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.70710678,-0.22474487); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.41421356,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'2S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.70710678,-0.22474487); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1.41421356,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'2S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.70710678,-0.22474487); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1.41421356,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'2S_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.61); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1.41,0.61); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1.41,0.61); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1.06,0); glVertex3f(0.5+$x,0.1+$y,0+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.35,0.61); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.70479502,0); glVertex3f(0+$x,0.1+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2S_1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.61); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1.41,0.61); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.35,0.61); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.70479502,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(1.41,0.61); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1.06,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
};

$DRAW_MODEL{'2S_1D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0.61); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1.41,0.61); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.35,0.61); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0.70479502,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(1.41,0.61); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1.06,0); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
};

$DRAW_MODEL{'2S_1D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0.61); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1.41,0.61); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.35,0.61); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.70479502,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(1.41,0.61); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.35,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1.06,0); glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
};



$DRAW_MODEL{'3D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.4); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.4); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.4); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.4); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'3S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'4D'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0+$x,0.1+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0.5+$x,0.1+$y,0+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0.5); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.5); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,1); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0,0.5); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.5); glVertex3f(0.5+$x,0.1+$y,0+$z);

    glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.70710678,0); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.35355339,0.61237244); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'4S'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'Boulder'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.24070736,0.00987696); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.24295376); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.00987696); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.24295376); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.24295376); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.00987696); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.00763056,0.00987696); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.24295376); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.24295376); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.24070736,0.00987696); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.24295376); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.00987696); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.24070736,0.1380692); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.1380692); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.00763056,0.11476152); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.24070736,0.11476152); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    glNormal3f( 0.640600035459061,-0.384897891818282,0.664443532170863 );
    glTexCoord2f(0.69841053,0.93715116); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    glTexCoord2f(0.55264044,0.91484076); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    glNormal3f( 0.189307227252031,-0.941771290374991,0.27790215964539 );
    glTexCoord2f(0.35767,0.97606286); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    glTexCoord2f(0.5364198,0.87602364); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    glNormal3f( 0.615059664847828,0.101316783568941,0.78194406324527 );
    glTexCoord2f(0.69841053,0.93715116); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);

    glNormal3f( 0.0490170456103017,-0.640267974828601,0.766586100610049 );
    glTexCoord2f(0.69841053,0.93715116); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    glTexCoord2f(0.80128246,0.92678874); glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);

    glNormal3f( 0.615059691468161,0.101316773707155,0.781944043584107 );
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    glTexCoord2f(0.69841053,0.93715116); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);

    glNormal3f( 0.693641118531241,0.34293237933716,0.633450378391932 );
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    glTexCoord2f(0.66238385,0.83151975); glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);

    glNormal3f( 0.898647060527821,0.0388082265848983,0.436952379732669 );
    glTexCoord2f(0.5364198,0.87602364); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    glNormal3f( 0.288786196930425,-0.953738721796946,-0.0835762107754924 );
    glTexCoord2f(0.5364198,0.87602364); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    glTexCoord2f(0.54566383,0.80355101); glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);

    glNormal3f( 0.189307032246148,-0.941771339766842,0.277902125101488 );
    glTexCoord2f(0.29157227,0.88896406); glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    glTexCoord2f(0.35767,0.97606286); glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);

    glNormal3f( 0.0228360890143053,-0.992501303158065,0.120081956463381 );
    glTexCoord2f(0.29157227,0.88896406); glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    glTexCoord2f(0.32416229,0.780776); glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);

    glNormal3f( -0.0352185914172215,-0.987482099701116,0.153748995406349 );
    glTexCoord2f(0.29157227,0.88896406); glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    glTexCoord2f(0.13384169,0.77153642); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    glTexCoord2f(0.32416229,0.780776); glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);

    glNormal3f( 0.193935618421172,-0.634080468484848,0.748552560207787 );
    glTexCoord2f(0.80128246,0.92678874); glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    glTexCoord2f(0.87798301,0.812148); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);

    glNormal3f( 0.00729031537051618,-0.999871512328208,-0.0142762087509399 );
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    glNormal3f( 0.240392168351923,-0.96970131024586,-0.0434853343384185 );
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    glTexCoord2f(0.5364198,0.87602364); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    glNormal3f( -0.0352185895764157,-0.987482099536529,0.153748996885105 );
    glTexCoord2f(0.32416229,0.780776); glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    glTexCoord2f(0.13384169,0.77153642); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    glNormal3f( 0.00729023791120114,-0.999871515075846,-0.0142760558674439 );
    glTexCoord2f(0.32416229,0.780776); glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.45545208,0.85227352); glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);

    glNormal3f( -0.0824364696990246,-0.980080226307662,0.180684748842516 );
    glTexCoord2f(0.13384169,0.77153642); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    glTexCoord2f(0.028893233,0.58833944); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    glNormal3f( -0.0607774783613331,-0.573245715411729,0.817126335327734 );
    glTexCoord2f(0.87798301,0.812148); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    glTexCoord2f(0.94726943,0.67736193); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    glNormal3f( 0.185329320452526,-0.608697980735779,0.771453051863035 );
    glTexCoord2f(0.87798301,0.812148); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    glTexCoord2f(0.85332201,0.79292146); glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);

    glNormal3f( -0.0879211042577068,-0.99612516211107,-0.00213092357885107 );
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.32416229,0.780776); glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);

    glNormal3f( -0.0694857948494604,-0.976740781601924,0.202852581619759 );
    glTexCoord2f(0.028893233,0.58833944); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    glNormal3f( -0.549406984468949,-0.151753922529128,0.821658513260685 );
    glTexCoord2f(0.94726943,0.67736193); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    glTexCoord2f(0.97792379,0.55280394); glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);

    glNormal3f( -0.0607774109414158,-0.573245584431174,0.817126432230301 );
    glTexCoord2f(0.85332201,0.79292146); glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    glTexCoord2f(0.87798301,0.812148); glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);

    glNormal3f( -0.00128409682494458,0.198138847416126,0.980173121565754 );
    glTexCoord2f(0.85332201,0.79292146); glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    glTexCoord2f(0.83671485,0.74812927); glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);

    glNormal3f( 0.210724201257019,0.252280638364147,0.944430934749159 );
    glTexCoord2f(0.85332201,0.79292146); glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    glTexCoord2f(0.83671485,0.74812927); glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);

    glNormal3f( -0.112340074154598,0.464200953842534,0.878576793564809 );
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);

    glNormal3f( -0.734243285382096,-0.251296994909264,0.630663633184029 );
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    glTexCoord2f(0.94726943,0.67736193); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    glNormal3f( 0.106146278642061,0.603053167220682,0.790607263459896 );
    glTexCoord2f(0.83671485,0.74812927); glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);

    glNormal3f( -0.112340172082223,0.464201003754359,0.878576754671999 );
    glTexCoord2f(0.83671485,0.74812927); glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    glTexCoord2f(0.91696932,0.67438362); glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);

    glNormal3f( 0.552484560292371,0.316151162372175,0.771238778310108 );
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);

    glNormal3f( 0.582841465317735,0.435539845607859,0.686003548966154 );
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);

    glNormal3f( 0.210724081424252,0.252280809925178,0.94443091565842 );
    glTexCoord2f(0.76710515,0.86339989); glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    glTexCoord2f(0.85332201,0.79292146); glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);

    glNormal3f( 0.171961411793547,0.578631883240407,0.797254298546976 );
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    glTexCoord2f(0.83671485,0.74812927); glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);

    glNormal3f( -0.848979985210112,0.517877258780956,0.105052984489542 );
    glTexCoord2f(0.90889348,0.51153926); glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    glTexCoord2f(0.8492942,0.39574297); glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);

    glNormal3f( -0.856882775641672,-0.41881131002961,0.300581096211829 );
    glTexCoord2f(0.90889348,0.51153926); glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    glTexCoord2f(0.86630911,0.34672392); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    glTexCoord2f(0.9682447,0.45018084); glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    glTexCoord2f(0.8492942,0.39574297); glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);
    glTexCoord2f(0.86630911,0.34672392); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    glTexCoord2f(0.90889348,0.51153926); glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);

    glNormal3f( -0.613838857551129,0.641486778264234,0.460104955713909 );
    glTexCoord2f(0.90889348,0.51153926); glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    glNormal3f( -0.699167273588937,-0.385152081496047,-0.602347904172892 );
    glTexCoord2f(0.8492942,0.39574297); glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.86630911,0.34672392); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);

    glNormal3f( -0.6138388462233,0.641486788378303,0.46010495672546 );
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);

    glNormal3f( -0.761608092361733,0.603684273816562,-0.235623452134315 );
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.8492942,0.39574297); glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);

    glNormal3f( 0.898647061612937,0.0388082233750073,0.436952377786081 );
    glTexCoord2f(0.54566383,0.80355101); glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    glTexCoord2f(0.5364198,0.87602364); glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    glNormal3f( 0.913623240265063,0.37493205138581,0.157221282564402 );
    glTexCoord2f(0.54566383,0.80355101); glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    glTexCoord2f(0.53098023,0.75929649); glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);

    glNormal3f( 0.288136321982837,-0.95075182517882,-0.114229710992128 );
    glTexCoord2f(0.54566383,0.80355101); glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);

    glNormal3f( 0.594570414812596,-0.672761318553261,-0.440316057040912 );
    glTexCoord2f(0.54566383,0.80355101); glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    glTexCoord2f(0.5791821,0.76818365); glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);

    glNormal3f( 0.799992982063558,0.375461947632196,0.468016617791819 );
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    glNormal3f( 0.909524712805247,0.384187175032699,0.158634836454442 );
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    glNormal3f( 0.909524799517788,0.384187020138775,0.158634714419686 );
    glTexCoord2f(0.53098023,0.75929649); glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    glTexCoord2f(0.57382836,0.82064545); glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);

    glNormal3f( 0.594570415751239,-0.672761318633218,-0.440316055651271 );
    glTexCoord2f(0.5791821,0.76818365); glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    glTexCoord2f(0.57326236,0.72481515); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    glNormal3f( 0.703704517436082,0.205491262288307,-0.680127409580888 );
    glTexCoord2f(0.53098023,0.75929649); glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    glTexCoord2f(0.51515366,0.71826295); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);

    glNormal3f( 0.173251325294788,0.86869906863809,0.464053775365436 );
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    glTexCoord2f(0.75842861,0.62245326); glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    glNormal3f( 0.370420735150451,0.745615865908208,0.553936331609106 );
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    glNormal3f( -0.0270376580357788,0.758152032781383,0.651517045239337 );
    glTexCoord2f(0.75842861,0.62245326); glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);

    glNormal3f( -0.333544267175588,0.929442071105603,0.157751888398293 );
    glTexCoord2f(0.75842861,0.62245326); glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);

    glNormal3f( 0.370420766623972,0.745615862241916,0.553936315497506 );
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);

    glNormal3f( 0.132417179099996,0.989037103091195,0.0653551787403069 );
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    glTexCoord2f(0.75842861,0.62245326); glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    glNormal3f( 0.406504815914597,0.913648443307297,0.000597227254095913 );
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.67600523,0.64725215); glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);

    glNormal3f( 0.00404020848206433,-0.996101032756082,0.0881272333486508 );
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);
    glTexCoord2f(0.32596171,0.55231497); glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    glNormal3f( -0.00810932840244064,-0.989252785718005,-0.145990289889525 );
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    glNormal3f( 0.0421819674438488,-0.990388866097031,-0.131721583400762 );
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    glNormal3f( 0.114354268931712,-0.936603728640859,-0.331204705089064 );
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    glTexCoord2f(0.46659919,0.77674709); glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    glNormal3f( -0.144838782480458,-0.792757328705007,-0.592079002223589 );
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    glTexCoord2f(0.51468777,0.69099188); glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);

    glNormal3f( 0.907848882999639,0.387899636107212,0.159198862886015 );
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    glTexCoord2f(0.62125557,0.74598318); glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);

    glNormal3f( 0.780080584476411,0.470393186073905,0.412558519749842 );
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    glTexCoord2f(0.66238385,0.83151975); glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);

    glNormal3f( 0.780080596843879,0.470393221511411,0.412558455959656 );
    glTexCoord2f(0.62125557,0.74598318); glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    glNormal3f( 0.416685386805528,0.90514365390732,0.0841917704650132 );
    glTexCoord2f(0.62125557,0.74598318); glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);

    glNormal3f( 0.73851474986134,0.174837955917979,-0.651174057689391 );
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    glTexCoord2f(0.51515366,0.71826295); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
    glTexCoord2f(0.5764281,0.69145457); glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);

    glNormal3f( 0.662862717561145,0.692569064293617,-0.284536656427458 );
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.62125557,0.74598318); glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);

    glNormal3f( -0.0694857865378374,-0.976740782019618,0.202852582455641 );
    glTexCoord2f(0.04722199,0.42217066); glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    glTexCoord2f(0.028893233,0.58833944); glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    glNormal3f( -0.0613575381018331,-0.974317911892198,0.216656084807486 );
    glTexCoord2f(0.04722199,0.42217066); glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    glTexCoord2f(0.17805773,0.31008355); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);

    glNormal3f( -0.484044854843421,-0.201656669596427,0.851489968294923 );
    glTexCoord2f(0.97792379,0.55280394); glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    glTexCoord2f(0.90889348,0.51153926); glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);

    glNormal3f( -0.00233526856119081,-0.997264627559658,0.0738769865319693 );
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    glTexCoord2f(0.31416075,0.35401659); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    glTexCoord2f(0.32596171,0.55231497); glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    glNormal3f( 0.0109504391350984,-0.996160413535144,0.0868591871262842 );
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    glTexCoord2f(0.32596171,0.55231497); glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);
    glTexCoord2f(0.18304305,0.67711051); glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    glNormal3f( -0.00233526862942223,-0.997264627556923,0.0738769865667286 );
    glTexCoord2f(0.17805773,0.31008355); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    glTexCoord2f(0.31416075,0.35401659); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    glTexCoord2f(0.19552426,0.5150661); glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);

    glNormal3f( -0.665448207257968,-0.411044170536024,-0.623074131484776 );
    glTexCoord2f(0.86630911,0.34672392); glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.7495913,0.26653774); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);

    glNormal3f( 0.236633171274748,-0.828673595050312,-0.507252220417857 );
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    glTexCoord2f(0.51468777,0.69099188); glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    glTexCoord2f(0.57326236,0.72481515); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    glNormal3f( 0.11435426901673,-0.936603727955447,-0.331204706997966 );
    glTexCoord2f(0.51468777,0.69099188); glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    glTexCoord2f(0.52601197,0.76397055); glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    glNormal3f( 0.113713079926886,-0.602567706672945,-0.789924992849606 );
    glTexCoord2f(0.48949462,0.66813361); glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    glTexCoord2f(0.51515366,0.71826295); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    glNormal3f( -0.183572255288068,0.624129075442902,0.759449882661944 );
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    glTexCoord2f(0.90236927,0.59669461); glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);

    glNormal3f( -0.0270376196068548,0.758152029502705,0.651517050649424 );
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    glTexCoord2f(0.83309659,0.67159504); glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    glTexCoord2f(0.75842861,0.62245326); glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    glNormal3f( -0.462309768181665,0.883977869308234,0.0696620758884657 );
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    glTexCoord2f(0.74417336,0.4877339); glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    glNormal3f( 0.077342234909126,-0.98957216376503,-0.1215117747408 );
    glTexCoord2f(0.31416075,0.35401659); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    glTexCoord2f(0.32596171,0.55231497); glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    glNormal3f( 0.00617095515875168,-0.745481709584991,-0.666497516864593 );
    glTexCoord2f(0.31416075,0.35401659); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    glTexCoord2f(0.39982566,0.31162603); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);

    glNormal3f( -0.842899812266919,-0.446187531505355,-0.30072677501272 );
    glTexCoord2f(0.7495913,0.26653774); glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.66061458,0.35567921); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);

    glNormal3f( 0.0421818748193015,-0.99038888520901,-0.131721469363136 );
    glTexCoord2f(0.32596171,0.55231497); glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    glTexCoord2f(0.38418993,0.70926066); glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);

    glNormal3f( 0.00617098411386942,-0.745481645592029,-0.666497588173031 );
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    glTexCoord2f(0.39982566,0.31162603); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    glTexCoord2f(0.50356634,0.50299107); glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    glNormal3f( 0.121407501971246,-0.782849814547526,-0.610251084659426 );
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    glTexCoord2f(0.44278899,0.67882182); glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    glNormal3f( 0.813275340817297,0.35978086610687,0.457319306832656 );
    glTexCoord2f(0.66238385,0.83151975); glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    glTexCoord2f(0.59300218,0.882207); glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    glTexCoord2f(0.60476826,0.79888797); glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    glNormal3f( 0.582841537037797,0.43553987958181,0.686003466461563 );
    glTexCoord2f(0.66238385,0.83151975); glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    glTexCoord2f(0.69787908,0.84845996); glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);

    glNormal3f( 0.595964484627425,0.510728944418158,0.619663036170694 );
    glTexCoord2f(0.66238385,0.83151975); glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);

    glNormal3f( 0.267841709541709,0.611610143007963,0.744441973292448 );
    glTexCoord2f(0.73083118,0.78457699); glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    glTexCoord2f(0.76459167,0.70591054); glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    glTexCoord2f(0.76410559,0.81592025); glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);

    glNormal3f( 0.499657975672013,0.863292781576393,0.0711862390173839 );
    glTexCoord2f(0.67643986,0.76323644); glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    glNormal3f( -0.0571616222112343,-0.319598616521682,-0.945827295685426 );
    glTexCoord2f(0.66061458,0.35567921); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    glTexCoord2f(0.59174039,0.48726069); glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    glTexCoord2f(0.50356634,0.50299107); glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    glNormal3f( -0.415749011338237,0.229228468678528,-0.8801176448172 );
    glTexCoord2f(0.66061458,0.35567921); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    glTexCoord2f(0.59174039,0.48726069); glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);

    glNormal3f( 0.0676406285450162,-0.740233044211907,-0.668939298910453 );
    glTexCoord2f(0.50356634,0.50299107); glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    glTexCoord2f(0.41971963,0.53633461); glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);

    glNormal3f( -0.042737126778154,-0.314265675564981,-0.948372618308033 );
    glTexCoord2f(0.50356634,0.50299107); glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);

    glNormal3f( -0.186145414636915,0.50720471632389,-0.841482774837639 );
    glTexCoord2f(0.59174039,0.48726069); glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);

    glNormal3f( -0.0427370019916678,-0.314265794777,-0.948372584427631 );
    glTexCoord2f(0.59174039,0.48726069); glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    glTexCoord2f(0.50356634,0.50299107); glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    glNormal3f( -0.448999438129508,0.891065888190152,0.0663406923635973 );
    glTexCoord2f(0.74417336,0.4877339); glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    glTexCoord2f(0.82137073,0.58500138); glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);

    glNormal3f( -0.761608104823891,0.603684261876473,-0.235623442444125 );
    glTexCoord2f(0.74417336,0.4877339); glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.82106216,0.49696398); glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    glNormal3f( -0.578901089230433,0.611024412497528,-0.539928417681334 );
    glTexCoord2f(0.74417336,0.4877339); glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);

    glNormal3f( -0.328060272695367,0.814833035058542,-0.477936797554162 );
    glTexCoord2f(0.74417336,0.4877339); glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);

    glNormal3f( -0.415749037838546,0.229228483905588,-0.880117628333093 );
    glTexCoord2f(0.74317253,0.36396387); glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    glTexCoord2f(0.66061458,0.35567921); glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);

    glNormal3f( -0.328060276280855,0.814833035009724,-0.477936795176277 );
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    glNormal3f( -0.0957565473338303,0.467799513367747,-0.878632061181245 );
    glTexCoord2f(0.66487866,0.47554972); glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    glTexCoord2f(0.59174039,0.48726069); glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);

    glNormal3f( 0.132417179499332,0.989037103100465,0.0653551777909111 );
    glTexCoord2f(0.67600523,0.64725215); glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    glTexCoord2f(0.71013011,0.69570605); glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    glNormal3f( 0.075225443060936,0.948686270349978,-0.307140836043881 );
    glTexCoord2f(0.67600523,0.64725215); glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    glTexCoord2f(0.7219674,0.57531659); glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);

    glNormal3f( 0.191906993763866,0.881671781089691,-0.431076067735902 );
    glTexCoord2f(0.67600523,0.64725215); glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    glNormal3f( 0.191906994694242,0.881671775254814,-0.43107607925568 );
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.60482777,0.61451489); glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);

    glNormal3f( 0.662862693862111,0.692569038047424,-0.284536775521077 );
    glTexCoord2f(0.5764281,0.69145457); glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    glTexCoord2f(0.5648889,0.74500636); glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);

    glNormal3f( 0.320962962762576,0.764966127142711,-0.558399141169603 );
    glTexCoord2f(0.5764281,0.69145457); glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    glTexCoord2f(0.60482777,0.61451489); glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    glTexCoord2f(0.62739604,0.68866485); glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);

    glNormal3f( 0.209185078644524,0.353803227299244,-0.911627598981691 );
    glTexCoord2f(0.5764281,0.69145457); glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    glTexCoord2f(0.60482777,0.61451489); glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);

    glNormal3f( 0.20918511659579,0.353803260820144,-0.911627577263785 );
    glTexCoord2f(0.60482777,0.61451489); glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);

    glNormal3f( -0.154718261570701,0.52547515000122,-0.836623049089455 );
    glTexCoord2f(0.60482777,0.61451489); glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    glTexCoord2f(0.6551742,0.56770715); glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    glNormal3f( 0.113713107395018,-0.602567708977925,-0.789924987137173 );
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    glTexCoord2f(0.48949462,0.66813361); glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);

    glNormal3f( -0.0188684894844931,-0.305282321975843,-0.952074936122998 );
    glTexCoord2f(0.52763241,0.62813803); glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    glTexCoord2f(0.57261656,0.58672797); glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);

    glNormal3f( 0.585669849954908,0.0809942693030834,-0.806492873616287 );
    glTexCoord2f(0.54878368,0.67141075); glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    glTexCoord2f(0.5764281,0.69145457); glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    glTexCoord2f(0.51515366,0.71826295); glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
};



$DRAW_MODEL{'Creature'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.87238861,0.42701183); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.97586095,0.42570963); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.89030509,0.48011936); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.89030509,0.48011936); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.97586095,0.42570963); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.95928665,0.47925122); glVertex3f(0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.97586095,0.42570963); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.87238861,0.42701183); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.88614433,0.14950708); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.95512589,0.14863894); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.88614433,0.14950708); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.87118065,0.33102762); glVertex3f(0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.87118065,0.33102762); glVertex3f(0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.87238861,0.42701183); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.92695263,0.65901128); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.92842321,0.61637587); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.78937866,0.61412793); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.82407731,0.62185886); glVertex3f(0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.78937866,0.65678958); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.89237509,0.66560913); glVertex3f(0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.92695263,0.65901128); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.89237509,0.66560913); glVertex3f(0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.82407731,0.62185886); glVertex3f(0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.78937866,0.65678958); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.82407731,0.62185886); glVertex3f(0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.27921935,0.66858607); glVertex3f(-0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.21300846,0.62173031); glVertex3f(-0.34416+$x,0.36425+$y,0.1178+$z);

    glNormal3f( 0.716410391181101,0,0.697679117795381 );
    glTexCoord2f(0.87238861,0.42701183); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.8478469,0.38998758); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.87118065,0.33102762); glVertex3f(0.5736+$x,0.1639125+$y,0.1767+$z);

    glNormal3f( 0.572651534569128,0.819798889945347,0 );
    glTexCoord2f(0.37283556,0.52564527); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.27039689,0.59463229); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.27039689,0.52564527); glVertex3f(0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.37283556,0.59463229); glVertex3f(0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.27039689,0.59463229); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.37283556,0.52564527); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);

    glNormal3f( 0.402478686093147,0.281689040607677,0.871012165036896 );
    glTexCoord2f(0.34180297,0.47373665); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.28946838,0.42707494); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.34494369,0.4178146); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);

    glNormal3f( 0.365868001815135,0.523770851291349,-0.769288437834169 );
    glTexCoord2f(0.35094673,0.4726057); glVertex3f(0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.43848894,0.52493002); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);

    glNormal3f( 0.402478686093147,0.281689040607677,-0.871012165036896 );
    glTexCoord2f(0.34788573,0.41658572); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.40361209,0.42603121); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.35094673,0.4726057); glVertex3f(0.5736+$x,0.6738625+$y,-0.1178+$z);

    glNormal3f( 0.367949057354271,0.927080101242158,-0.0716657315104953 );
    glTexCoord2f(0.74988285,0.49690379); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.73181984,0.51368823); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.69569381,0.51266068); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);

    glNormal3f( 0.716410391181101,0,-0.697679117795381 );
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(1,0.43073914); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.97586095,0.42570963); glVertex3f(0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.99946313,0.38807949); glVertex3f(0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(1,0.43073914); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.97465299,0.32972542); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);

    glNormal3f( 0.326774449898195,-0.0894931572136215,-0.94085569228531 );
    glTexCoord2f(0.34788573,0.12282778); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.34881957,0.30725159); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);

    glNormal3f( 0.825130262713416,-0.564942518805665,0 );
    glTexCoord2f(0.88614433,0.14950708); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.88427371,0.00086813244); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.95512589,0.14863894); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.95325527,0); glVertex3f(0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.95512589,0.14863894); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.88427371,0.00086813244); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);

    glNormal3f( 0.349330658788364,-0.239176468480207,0.905959550838681 );
    glTexCoord2f(0.34788573,0.1245845); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.25735572,0.13651423); glVertex3f(0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.25974553,0.00095735221); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);

    glNormal3f( 0.372922607369131,-0.0734071405583162,0.924954118120494 );
    glTexCoord2f(0.34788573,0.1245845); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.25735572,0.13651423); glVertex3f(0.2868+$x,-0.42799375+$y,0.2356+$z);

    glNormal3f( 0.326774449898195,-0.0894931572136215,0.94085569228531 );
    glTexCoord2f(0.3453436,0.30921244); glVertex3f(0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.34788573,0.1245845); glVertex3f(0.5736+$x,-0.4553125+$y,0.1178+$z);

    glNormal3f( 0.327071739165883,-0.179149150629275,0.927862952848002 );
    glTexCoord2f(0.3453436,0.30921244); glVertex3f(0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.3247573,0.37011618); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.54079378,0.52564527); glVertex3f(-0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.54079378,0.59463229); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.37283556,0.52564527); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.37283556,0.52564527); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.54079378,0.59463229); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.37283556,0.59463229); glVertex3f(0.2868+$x,-0.8742+$y,-0.1178+$z);

    glNormal3f( -0.825130262713416,-0.564942518805665,0 );
    glTexCoord2f(0.81142009,0.00086813244); glVertex3f(-0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.80954947,0.14950708); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.74243853,0); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.74243853,0); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.80954947,0.14950708); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.74056791,0.14863894); glVertex3f(-0.5736+$x,-0.4553125+$y,-0.1178+$z);

    glNormal3f( -0.349330658788364,-0.239176468480207,0.905959550838681 );
    glTexCoord2f(0.089698763,0); glVertex3f(-0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(2.7755576e-017,0.1224487); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);

    glNormal3f( 0,-0.255257835985445,0.966873020188291 );
    glTexCoord2f(0.25974553,0.00095735221); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.089698763,0); glVertex3f(-0.2868+$x,-0.8742+$y,0.1178+$z);
    glTexCoord2f(0.25735572,0.13651423); glVertex3f(0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.25974553,0.00095735221); glVertex3f(0.2868+$x,-0.8742+$y,0.1178+$z);

    glNormal3f( 0.349330658788364,-0.239176468480207,-0.905959550838681 );
    glTexCoord2f(0.43701067,0); glVertex3f(0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.34788573,0.12282778); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);

    glNormal3f( 0,-0.255257835985445,-0.966873020188291 );
    glTexCoord2f(0.60709694,0.00037757081); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.43701067,0); glVertex3f(0.2868+$x,-0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.60522221,0.13591175); glVertex3f(-0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.60709694,0.00037757081); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.27039689,0.52564527); glVertex3f(0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.27039689,0.59463229); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.10243867,0.52564527); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.10243867,0.52564527); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.27039689,0.59463229); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.10243867,0.59463229); glVertex3f(-0.2868+$x,0.8742+$y,-0.1178+$z);

    glNormal3f( 0.365868001815135,0.523770851291349,0.769288437834169 );
    glTexCoord2f(0.2540093,0.52564527); glVertex3f(0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.34180297,0.47373665); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);

    glNormal3f( 0,0.562790977082022,0.826599247589219 );
    glTexCoord2f(0.089101427,0.524854); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.2540093,0.52564527); glVertex3f(0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.089101427,0.524854); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);

    glNormal3f( -0.572651534569128,0.819798889945347,0 );
    glTexCoord2f(0.10243867,0.59463229); glVertex3f(-0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0,0.59463229); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.10243867,0.52564527); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(2.7755576e-017,0.52564527); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.10243867,0.52564527); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);
    glTexCoord2f(0,0.59463229); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);

    glNormal3f( -0.365868001815135,0.523770851291349,-0.769288437834169 );
    glTexCoord2f(0.60356305,0.52489295); glVertex3f(-0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.69112471,0.47283539); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);

    glNormal3f( 0,0.562790977082022,-0.826599247589219 );
    glTexCoord2f(0.43848894,0.52493002); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.60356305,0.52489295); glVertex3f(-0.2868+$x,0.8742+$y,-0.1178+$z);
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.43848894,0.52493002); glVertex3f(0.2868+$x,0.8742+$y,-0.1178+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.80954947,0.14950708); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.72104082,0.32972542); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.74056791,0.14863894); glVertex3f(-0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.72104082,0.32972542); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.8233052,0.42701183); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.71983286,0.42570963); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.71983286,0.42570963); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.80538872,0.48011936); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.73640716,0.47925122); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.80538872,0.48011936); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.71983286,0.42570963); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.8233052,0.42701183); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.8233052,0.42701183); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.72104082,0.32972542); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.82451316,0.33102762); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.82451316,0.33102762); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.72104082,0.32972542); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.80954947,0.14950708); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.65031641,0.61472564); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.65109882,0.65737863); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.78869107,0.65735388); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.78937866,0.61469732); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.36108979,0.62173031); glVertex3f(0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.42730067,0.66858607); glVertex3f(0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.68519504,0.62187645); glVertex3f(-0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.65031641,0.61472564); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.68519504,0.62187645); glVertex3f(-0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.75416969,0.66452706); glVertex3f(-0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.75416969,0.66452706); glVertex3f(-0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.78869107,0.65735388); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);

    glNormal3f( -0.326774449898195,-0.0894931572136215,0.94085569228531 );
    glTexCoord2f(2.7755576e-017,0.1224487); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.00018585565,0.30701992); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);

    glNormal3f( -0.349330658788364,-0.239176468480207,-0.905959550838681 );
    glTexCoord2f(0.69569381,0.12370022); glVertex3f(-0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.60522221,0.13591175); glVertex3f(-0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.60709694,0.00037757081); glVertex3f(-0.2868+$x,-0.8742+$y,-0.1178+$z);

    glNormal3f( -0.326774449898195,-0.0894931572136215,-0.94085569228531 );
    glTexCoord2f(0.69377904,0.30812346); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.69569381,0.12370022); glVertex3f(-0.5736+$x,-0.4553125+$y,-0.1178+$z);

    glNormal3f( -0.327071739165883,-0.179149150629275,-0.927862952848002 );
    glTexCoord2f(0.69377904,0.30812346); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);
    glTexCoord2f(0.67352087,0.36908194); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);

    glNormal3f( -0.716410391181101,0,-0.697679117795381 );
    glTexCoord2f(0.71983286,0.42570963); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);
    glTexCoord2f(0.69623068,0.38807949); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.72104082,0.32972542); glVertex3f(-0.5736+$x,0.1639125+$y,-0.1767+$z);

    glNormal3f( -0.402478686093147,0.281689040607677,-0.871012165036896 );
    glTexCoord2f(0.69112471,0.47283539); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.63846346,0.42622023); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.69419007,0.41675282); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);

    glNormal3f( -0.386575366312776,0.3043783529403,0.87058216408418 );
    glTexCoord2f(0.0017842702,0.4718655); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.054604358,0.42611694); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);

    glNormal3f( -0.365868001815135,0.523770851291349,0.769288437834169 );
    glTexCoord2f(0.0017842702,0.4718655); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.089101427,0.524854); glVertex3f(-0.2868+$x,0.8742+$y,0.1178+$z);

    glNormal3f( -0.402478686093147,0.281689040607677,0.871012165036896 );
    glTexCoord2f(0,0.41606378); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.054604358,0.42611694); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.0017842702,0.4718655); glVertex3f(-0.5736+$x,0.6738625+$y,0.1178+$z);

    glNormal3f( -0.716410391181101,0,0.697679117795381 );
    glTexCoord2f(0.82451316,0.33102762); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.84731003,0.43264723); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.8233052,0.42701183); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);
    glTexCoord2f(0.8478469,0.38998758); glVertex3f(-0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.84731003,0.43264723); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.82451316,0.33102762); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);

    glNormal3f( -0.327071739165883,-0.179149150629275,0.927862952848002 );
    glTexCoord2f(0.00018585565,0.30701992); glVertex3f(-0.5736+$x,0.1639125+$y,0.1767+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.01986794,0.36819549); glVertex3f(-0.51624+$x,0.36425+$y,0.2356+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.55480914,0.36004339); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.60522221,0.13591175); glVertex3f(-0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.67352087,0.36908194); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.5971526,0.34953222); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.60522221,0.13591175); glVertex3f(-0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.55480914,0.36004339); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.48751821,0.35993333); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.48751821,0.35993333); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.44526557,0.34918238); glVertex3f(0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.40299309,0.36832345); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.36867076,0.36843903); glVertex3f(0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.44526557,0.34918238); glVertex3f(0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.40299309,0.36832345); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.48751821,0.35993333); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.55480914,0.36004339); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.48751821,0.35993333); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.55422109,0.40219613); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.48794565,0.4022057); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.44615624,0.41293798); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.40361209,0.42603121); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.40361209,0.42603121); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.40320964,0.41229108); glVertex3f(0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.44615624,0.41293798); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.48794565,0.4022057); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.48794565,0.4022057); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.55422109,0.40219613); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.59601599,0.4129949); glVertex3f(-0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.63846346,0.42622023); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.63846346,0.42622023); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.63891938,0.41248581); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.67331711,0.41286241); glVertex3f(-0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.59601599,0.4129949); glVertex3f(-0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.63891938,0.41248581); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.63846346,0.42622023); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.55422109,0.40219613); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.48751821,0.35993333); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.55480914,0.36004339); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.55480914,0.36004339); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.5971526,0.34953222); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.67331711,0.41286241); glVertex3f(-0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.63891938,0.41248581); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.67352087,0.36908194); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.67352087,0.36908194); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.63891938,0.41248581); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.63945216,0.36881236); glVertex3f(-0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.36867076,0.36843903); glVertex3f(0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.40299309,0.36832345); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.3686819,0.4125169); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.3686819,0.4125169); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.40320964,0.41229108); glVertex3f(0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.40361209,0.42603121); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.3686819,0.4125169); glVertex3f(0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.40299309,0.36832345); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.40320964,0.41229108); glVertex3f(0.40152+$x,0.50995+$y,-0.2356+$z);

    glNormal3f( -0.372922607369131,-0.0734071405583162,-0.924954118120494 );
    glTexCoord2f(0.60522221,0.13591175); glVertex3f(-0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.69569381,0.12370022); glVertex3f(-0.5736+$x,-0.4553125+$y,-0.1178+$z);
    glTexCoord2f(0.63976826,0.30663925); glVertex3f(-0.40152+$x,0.15480625+$y,-0.2356+$z);

    glNormal3f( 0.372922607369131,-0.0734071405583162,-0.924954118120494 );
    glTexCoord2f(0.43826049,0.13549932); glVertex3f(0.2868+$x,-0.42799375+$y,-0.2356+$z);
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.34788573,0.12282778); glVertex3f(0.5736+$x,-0.4553125+$y,-0.1178+$z);

    glNormal3f( 0.327071739165883,-0.179149150629275,-0.927862952848002 );
    glTexCoord2f(0.40288024,0.30607894); glVertex3f(0.40152+$x,0.15480625+$y,-0.2356+$z);
    glTexCoord2f(0.36867076,0.36843903); glVertex3f(0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.34881957,0.30725159); glVertex3f(0.5736+$x,0.1639125+$y,-0.1767+$z);

    glNormal3f( -0.400479583186592,0.90093181259272,0.16714655996786 );
    glTexCoord2f(0.51097376,0.73308674); glVertex3f(0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.55596696,0.73905289); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);

    glNormal3f( 0.246164004296765,0.969112373813482,0.0149829873583004 );
    glTexCoord2f(0.46823589,0.73522152); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.51097376,0.73308674); glVertex3f(0.25812+$x,0.30050625+$y,-0.2356+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.48794565,0.4022057); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.44615624,0.41293798); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.59601599,0.4129949); glVertex3f(-0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.55422109,0.40219613); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.63945216,0.36881236); glVertex3f(-0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.5971526,0.34953222); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.67352087,0.36908194); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);

    glNormal3f( 0.201282545559596,-0.792420508805657,0.575808192089374 );
    glTexCoord2f(0.12329268,0.74204888); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.14985256,0.70512071); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.16485257,0.74979504); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);

    glNormal3f( 0.386575366312776,0.3043783529403,-0.87058216408418 );
    glTexCoord2f(0.43959992,0.46506232); glVertex3f(0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.35094673,0.4726057); glVertex3f(0.5736+$x,0.6738625+$y,-0.1178+$z);
    glTexCoord2f(0.40361209,0.42603121); glVertex3f(0.40152+$x,0.55548125+$y,-0.2356+$z);

    glNormal3f( -0.386575366312776,0.3043783529403,-0.87058216408418 );
    glTexCoord2f(0.60252672,0.46509224); glVertex3f(-0.2868+$x,0.70118125+$y,-0.2356+$z);
    glTexCoord2f(0.63846346,0.42622023); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.69112471,0.47283539); glVertex3f(-0.5736+$x,0.6738625+$y,-0.1178+$z);

    glNormal3f( -0.367949057354271,0.927080101242158,-0.0716657315104953 );
    glTexCoord2f(0.8040719,0.49587624); glVertex3f(-0.40152+$x,0.55548125+$y,-0.2356+$z);
    glTexCoord2f(0.76794587,0.49690379); glVertex3f(-0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.74988285,0.48011936); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);

    glNormal3f( 0.05540177669822,-0.872435390915553,0.485579171522736 );
    glTexCoord2f(0.041875043,0.74415712); glVertex3f(-0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.081790966,0.7537692); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);

    glNormal3f( -0.223277635193468,-0.879012021598992,0.421289643246622 );
    glTexCoord2f(0,0.74996296); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.041875043,0.74415712); glVertex3f(-0.25812+$x,0.51905625+$y,-0.2356+$z);

    glNormal3f( -0.777722675739619,0.612356522723741,-0.142010312013236 );
    glTexCoord2f(0.65031641,0.61472564); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);
    glTexCoord2f(0.68539108,0.59463229); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.68519504,0.62187645); glVertex3f(-0.11472+$x,0.36425+$y,-0.1178+$z);

    glNormal3f( -0.238572558240934,0.939225939649963,0.246855765059316 );
    glTexCoord2f(0.60157846,0.73434883); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.62823031,0.70153694); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.64418248,0.73834623); glVertex3f(-0.11472+$x,0.33693125+$y,-0.2356+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.01986794,0.36819549); glVertex3f(-0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.054195132,0.368228); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.019580871,0.41236425); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.01986794,0.36819549); glVertex3f(-0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.054195132,0.368228); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.019580871,0.41236425); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.054195132,0.368228); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.054223585,0.41235226); glVertex3f(-0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.054223585,0.41235226); glVertex3f(-0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.054604358,0.42611694); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.019580871,0.41236425); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.054195132,0.368228); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.096516756,0.34925126); glVertex3f(-0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.25735572,0.13651423); glVertex3f(0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.20610286,0.36053816); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.13879965,0.36014833); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.13879965,0.36014833); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.096516756,0.34925126); glVertex3f(-0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.13879965,0.36014833); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.20610286,0.36053816); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.13879965,0.36014833); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.20533539,0.40269866); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.13912591,0.40236063); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.097238327,0.41295212); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.054604358,0.42611694); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.054223585,0.41235226); glVertex3f(-0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.097238327,0.41295212); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.054604358,0.42611694); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.13912591,0.40236063); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.13912591,0.40236063); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.20533539,0.40269866); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.24702217,0.4136633); glVertex3f(0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.28946838,0.42707494); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.28946838,0.42707494); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.29003924,0.41332387); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.32441961,0.41382051); glVertex3f(0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.24702217,0.4136633); glVertex3f(0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.29003924,0.41332387); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.28946838,0.42707494); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.20533539,0.40269866); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.13879965,0.36014833); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.20610286,0.36053816); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.20610286,0.36053816); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.24846221,0.35018337); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.20610286,0.36053816); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.25735572,0.13651423); glVertex3f(0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.29126052,0.30745978); glVertex3f(0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(0.3247573,0.37011618); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.24846221,0.35018337); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.32441961,0.41382051); glVertex3f(0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.29003924,0.41332387); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.3247573,0.37011618); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.3247573,0.37011618); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.29003924,0.41332387); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.2906835,0.36968789); glVertex3f(0.40152+$x,0.36425+$y,0.2356+$z);

    glNormal3f( -0.367949057354271,0.927080101242158,0.0716657315104952 );
    glTexCoord2f(0.71375682,0.48011936); glVertex3f(-0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.74988285,0.4811469); glVertex3f(-0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.69569381,0.49690379); glVertex3f(-0.5736+$x,0.4917375+$y,0.1767+$z);

    glNormal3f( 0.0633446345056529,-0.997514958200208,0.0308442125232958 );
    glTexCoord2f(0.082973083,0.59958422); glVertex3f(-0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.075838026,0.63633587); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.041919478,0.60010809); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);

    glNormal3f( 0.899079231000472,0,0.437785948134016 );
    glTexCoord2f(0.17471681,0.61935305); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.17207324,0.66193409); glVertex3f(-0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.21300846,0.62173031); glVertex3f(-0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.17471681,0.61935305); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);

    glNormal3f( 0.733817439040958,0.577786798948378,0.357315520402286 );
    glTexCoord2f(0.56224282,0.59463229); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.57187762,0.63128138); glVertex3f(-0.34416+$x,0.36425+$y,0.1178+$z);

    glNormal3f( -0.372922607369131,-0.0734071405583162,0.924954118120494 );
    glTexCoord2f(0.090362857,0.13550796); glVertex3f(-0.2868+$x,-0.42799375+$y,0.2356+$z);
    glTexCoord2f(0.054261789,0.30602025); glVertex3f(-0.40152+$x,0.15480625+$y,0.2356+$z);
    glTexCoord2f(2.7755576e-017,0.1224487); glVertex3f(-0.5736+$x,-0.4553125+$y,0.1178+$z);

    glNormal3f( 0.400479583186592,0.90093181259272,-0.16714655996786 );
    glTexCoord2f(0.60752567,0.59770592); glVertex3f(-0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.56224282,0.59463229); glVertex3f(-0.40152+$x,0.36425+$y,0.2356+$z);

    glNormal3f( -0.246164004296765,0.969112373813482,-0.0149829873583004 );
    glTexCoord2f(0.65031641,0.59789088); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.60752567,0.59770592); glVertex3f(-0.25812+$x,0.30050625+$y,0.2356+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.13912591,0.40236063); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.090568186,0.46505998); glVertex3f(-0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.097238327,0.41295212); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.24702217,0.4136633); glVertex3f(0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.20533539,0.40269866); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.2906835,0.36968789); glVertex3f(0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.24846221,0.35018337); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.3247573,0.37011618); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);

    glNormal3f( -0.777722675739619,-0.612356522723741,-0.142010312013236 );
    glTexCoord2f(0.78869107,0.65735388); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.75438635,0.69159116); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.75416969,0.66452706); glVertex3f(-0.11472+$x,0.50995+$y,0.1178+$z);

    glNormal3f( -0.201282545559596,-0.792420508805657,-0.575808192089374 );
    glTexCoord2f(0.041919478,0.60010809); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.016655373,0.63871624); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(1.3877788e-017,0.59463229); glVertex3f(-0.11472+$x,0.48263125+$y,0.2356+$z);

    glNormal3f( 0.695347615517196,-0.547496763569889,-0.465552346654001 );
    glTexCoord2f(0.041919478,0.60010809); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.075838026,0.63633587); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.049434312,0.63851897); glVertex3f(-0.2868+$x,0.5828+$y,0.1178+$z);

    glNormal3f( 0.386575366312776,0.3043783529403,0.87058216408418 );
    glTexCoord2f(0.2532405,0.46583907); glVertex3f(0.2868+$x,0.70118125+$y,0.2356+$z);
    glTexCoord2f(0.28946838,0.42707494); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.34180297,0.47373665); glVertex3f(0.5736+$x,0.6738625+$y,0.1178+$z);

    glNormal3f( 0.367949057354271,0.927080101242158,0.0716657315104953 );
    glTexCoord2f(0.74988285,0.49793134); glVertex3f(0.40152+$x,0.55548125+$y,0.2356+$z);
    glTexCoord2f(0.78600888,0.49690379); glVertex3f(0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.8040719,0.51368823); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);

    glNormal3f( -0.05540177669822,-0.872435390915553,-0.485579171522736 );
    glTexCoord2f(0.12994453,0.59815351); glVertex3f(0.25812+$x,0.51905625+$y,0.2356+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.088959659,0.5957218); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);

    glNormal3f( 0.223277635193468,-0.879012021598992,-0.421289643246622 );
    glTexCoord2f(0.17207324,0.59463229); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.12994453,0.59815351); glVertex3f(0.25812+$x,0.51905625+$y,0.2356+$z);

    glNormal3f( 0.777722675739619,-0.612356522723741,-0.142010312013236 );
    glTexCoord2f(0.78937866,0.65678958); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.82313018,0.69157811); glVertex3f(0.17208+$x,0.5828+$y,0.1178+$z);

    glNormal3f( 0.777722675739619,0.612356522723741,0.142010312013236 );
    glTexCoord2f(0.78937866,0.61412793); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);
    glTexCoord2f(0.82471608,0.59463229); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.82407731,0.62185886); glVertex3f(0.11472+$x,0.36425+$y,0.1178+$z);

    glNormal3f( 0.238572558240934,0.939225939649963,-0.246855765059316 );
    glTexCoord2f(0.51099396,0.59631447); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.48515777,0.63100598); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.46823589,0.59463229); glVertex3f(0.11472+$x,0.33693125+$y,0.2356+$z);

    glNormal3f( -0.716410391181101,0,-0.697679117795381 );
    glTexCoord2f(0.69569381,0.43073914); glVertex3f(-0.51624+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.69623068,0.38807949); glVertex3f(-0.51624+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.71983286,0.42570963); glVertex3f(-0.5736+$x,0.4917375+$y,-0.1767+$z);

    glNormal3f( 0.398474579775473,0.896421292123585,-0.19402802967675 );
    glTexCoord2f(0.55636779,0.73834623); glVertex3f(-0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.56840947,0.70241597); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.60157846,0.73434883); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);

    glNormal3f( 0.899079231000472,0,-0.437785948134016 );
    glTexCoord2f(0.317511,0.67096334); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.32015457,0.62838229); glVertex3f(-0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.27921935,0.66858607); glVertex3f(-0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.317511,0.67096334); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);

    glNormal3f( -0.0633446345056529,-0.997514958200208,-0.0308442125232958 );
    glTexCoord2f(0.082973083,0.74979504); glVertex3f(0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.09268261,0.71363819); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.12329268,0.74204888); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);

    glNormal3f( -0.899079231000472,0,-0.437785948134016 );
    glTexCoord2f(0.32279814,0.61935305); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.32015457,0.66193409); glVertex3f(0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.36108979,0.62173031); glVertex3f(0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.32279814,0.61935305); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);

    glNormal3f( -0.733817439040958,0.577786798948378,-0.357315520402286 );
    glTexCoord2f(0.55596696,0.73905289); glVertex3f(0.40152+$x,0.36425+$y,-0.2356+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.54550439,0.70263147); glVertex3f(0.34416+$x,0.36425+$y,-0.1178+$z);

    glNormal3f( 0.716410391181101,0,0.697679117795381 );
    glTexCoord2f(0.84838377,0.43264723); glVertex3f(0.51624+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.8478469,0.38998758); glVertex3f(0.51624+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.87238861,0.42701183); glVertex3f(0.5736+$x,0.4917375+$y,0.1767+$z);

    glNormal3f( -0.398474579775473,0.896421292123585,0.19402802967675 );
    glTexCoord2f(0.55636779,0.59521947); glVertex3f(0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.54514316,0.6314133); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.51099396,0.59631447); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);

    glNormal3f( -0.899079231000472,0,0.437785948134016 );
    glTexCoord2f(0.46559232,0.67096334); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.46823589,0.62838229); glVertex3f(0.40152+$x,0.36425+$y,0.2356+$z);
    glTexCoord2f(0.42730067,0.66858607); glVertex3f(0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.46559232,0.67096334); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);

    glNormal3f( -0.733817439040958,-0.577786798948378,0.357315520402286 );
    glTexCoord2f(0.088959659,0.5957218); glVertex3f(0.40152+$x,0.50995+$y,0.2356+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.094378572,0.6327654); glVertex3f(0.34416+$x,0.50995+$y,0.1178+$z);

    glNormal3f( -0.785685457737893,0.618626188824235,0 );
    glTexCoord2f(0.36108979,0.62173031); glVertex3f(0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.36277212,0.59463229); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.43162658,0.598907); glVertex3f(0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.42994424,0.62600502); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.36277212,0.59463229); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);

    glNormal3f( -0.785685457737892,-0.618626188824235,0 );
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.42561834,0.69568409); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.35676388,0.69140938); glVertex3f(0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.42730067,0.66858607); glVertex3f(0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.42561834,0.69568409); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.35844622,0.66431136); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);

    glNormal3f( -0.695347615517196,-0.547496763569889,0.465552346654001 );
    glTexCoord2f(0.11711823,0.7033999); glVertex3f(0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.12329268,0.74204888); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);
    glTexCoord2f(0.09268261,0.71363819); glVertex3f(0.34416+$x,0.50995+$y,-0.1178+$z);

    glNormal3f( 0,-0.879493820034675,0.475910307222711 );
    glTexCoord2f(0.11711823,0.7033999); glVertex3f(0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.14985256,0.70512071); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.12329268,0.74204888); glVertex3f(0.25812+$x,0.51905625+$y,-0.2356+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.11711823,0.7033999); glVertex3f(0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.14985256,0.70512071); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.14985256,0.70512071); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.15338659,0.63789435); glVertex3f(0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.017060514,0.70603421); glVertex3f(-0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.016655373,0.63871624); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.016655373,0.63871624); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.049434312,0.63851897); glVertex3f(-0.2868+$x,0.5828+$y,0.1178+$z);

    glNormal3f( 0.777722675739619,-0.612356522723741,0.142010312013236 );
    glTexCoord2f(0.89215881,0.6926608); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.89237509,0.66560913); glVertex3f(0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.92695263,0.65901128); glVertex3f(0.11472+$x,0.48263125+$y,-0.2356+$z);

    glNormal3f( 0.785685457737893,-0.618626188824235,0 );
    glTexCoord2f(0.89215881,0.6926608); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.89237509,0.66560913); glVertex3f(0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.82313018,0.69157811); glVertex3f(0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.82378115,0.66451696); glVertex3f(0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.89215881,0.6926608); glVertex3f(0.17208+$x,0.5828+$y,-0.1178+$z);

    glNormal3f( 0,-0.761815641946658,-0.647793892905299 );
    glTexCoord2f(0.15338659,0.63789435); glVertex3f(0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.12065226,0.63617353); glVertex3f(0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.17207324,0.59463229); glVertex3f(0.11472+$x,0.48263125+$y,0.2356+$z);

    glNormal3f( 0.777722675739619,0.612356522723741,-0.142010312013236 );
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.89367376,0.59571711); glVertex3f(0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.92842321,0.61637587); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);

    glNormal3f( 0.785685457737893,0.618626188824235,0 );
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.82471608,0.59463229); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.89367376,0.59571711); glVertex3f(0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.82407731,0.62185886); glVertex3f(0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.82471608,0.59463229); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.89343249,0.62296515); glVertex3f(0.11472+$x,0.36425+$y,-0.1178+$z);

    glNormal3f( 0,0.932751240731174,0.36052062758524 );
    glTexCoord2f(0.48577887,0.69914328); glVertex3f(0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.46823589,0.73522152); glVertex3f(0.11472+$x,0.33693125+$y,-0.2356+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.48577887,0.69914328); glVertex3f(0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.48515777,0.63100598); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.51895676,0.69884085); glVertex3f(0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.48515777,0.63100598); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.51833566,0.63070355); glVertex3f(0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.59509721,0.69978725); glVertex3f(-0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.62823031,0.70153694); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.62823031,0.70153694); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.63182366,0.63349163); glVertex3f(-0.17208+$x,0.2914+$y,0.1178+$z);

    glNormal3f( -0.764145114142333,0.601665940249887,-0.232551802563689 );
    glTexCoord2f(0.51833566,0.63070355); glVertex3f(0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.51099396,0.59631447); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);
    glTexCoord2f(0.54514316,0.6314133); glVertex3f(0.34416+$x,0.36425+$y,0.1178+$z);

    glNormal3f( 0,0.997025476096513,-0.0770726930535132 );
    glTexCoord2f(0.51833566,0.63070355); glVertex3f(0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.48515777,0.63100598); glVertex3f(0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.51099396,0.59631447); glVertex3f(0.25812+$x,0.30050625+$y,0.2356+$z);

    glNormal3f( -0.785685457737893,0.618626188824235,0 );
    glTexCoord2f(0.68519504,0.62187645); glVertex3f(-0.11472+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.68539108,0.59463229); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.75435723,0.59463229); glVertex3f(-0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.68539108,0.59463229); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);

    glNormal3f( -0.777722675739619,-0.612356522723741,0.142010312013236 );
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.68534913,0.69158777); glVertex3f(-0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.65109882,0.65737863); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);

    glNormal3f( -0.785685457737893,-0.618626188824235,0 );
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.75438635,0.69159116); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.68534913,0.69158777); glVertex3f(-0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.75416969,0.66452706); glVertex3f(-0.11472+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.75438635,0.69159116); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.68556703,0.66453196); glVertex3f(-0.11472+$x,0.50995+$y,-0.1178+$z);

    glNormal3f( -0.777722675739619,0.612356522723741,0.142010312013236 );
    glTexCoord2f(0.75455906,0.62186971); glVertex3f(-0.11472+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.75435723,0.59463229); glVertex3f(-0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.78937866,0.61469732); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);

    glNormal3f( 0,-0.761815641946658,0.647793892905299 );
    glTexCoord2f(0.017060514,0.70603421); glVertex3f(-0.17208+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0,0.74996296); glVertex3f(-0.11472+$x,0.48263125+$y,-0.2356+$z);

    glNormal3f( 0.785685457737892,-0.618626188824235,0 );
    glTexCoord2f(0.27753701,0.69568409); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.27921935,0.66858607); glVertex3f(-0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.20868256,0.69140938); glVertex3f(-0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.21036489,0.66431136); glVertex3f(-0.34416+$x,0.50995+$y,0.1178+$z);
    glTexCoord2f(0.27753701,0.69568409); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);

    glNormal3f( 0,-0.879493820034675,-0.475910307222711 );
    glTexCoord2f(0.049434312,0.63851897); glVertex3f(-0.2868+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.016655373,0.63871624); glVertex3f(-0.17208+$x,0.5828+$y,0.1178+$z);
    glTexCoord2f(0.041919478,0.60010809); glVertex3f(-0.25812+$x,0.51905625+$y,0.2356+$z);

    glNormal3f( 0.733817439040958,-0.577786798948378,-0.357315520402286 );
    glTexCoord2f(0.073772716,0.71720008); glVertex3f(-0.34416+$x,0.50995+$y,-0.1178+$z);
    glTexCoord2f(0.081790966,0.7537692); glVertex3f(-0.40152+$x,0.50995+$y,-0.2356+$z);
    glTexCoord2f(0.049839452,0.70583694); glVertex3f(-0.2868+$x,0.5828+$y,-0.1178+$z);

    glNormal3f( 0.785685457737893,0.618626188824235,0 );
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);
    glTexCoord2f(0.21469079,0.59463229); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.28354525,0.598907); glVertex3f(-0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.21300846,0.62173031); glVertex3f(-0.34416+$x,0.36425+$y,0.1178+$z);
    glTexCoord2f(0.21469079,0.59463229); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.28186292,0.62600502); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);

    glNormal3f( 0.764145114142333,0.601665940249887,0.232551802563689 );
    glTexCoord2f(0.59509721,0.69978725); glVertex3f(-0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.60157846,0.73434883); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);
    glTexCoord2f(0.56840947,0.70241597); glVertex3f(-0.34416+$x,0.36425+$y,-0.1178+$z);

    glNormal3f( 0,0.997025476096513,0.0770726930535132 );
    glTexCoord2f(0.59509721,0.69978725); glVertex3f(-0.2868+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.62823031,0.70153694); glVertex3f(-0.17208+$x,0.2914+$y,-0.1178+$z);
    glTexCoord2f(0.60157846,0.73434883); glVertex3f(-0.25812+$x,0.30050625+$y,-0.2356+$z);

    glNormal3f( 0,0.932751240731174,-0.36052062758524 );
    glTexCoord2f(0.63182366,0.63349163); glVertex3f(-0.17208+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.59869056,0.63174193); glVertex3f(-0.2868+$x,0.2914+$y,0.1178+$z);
    glTexCoord2f(0.65031641,0.59789088); glVertex3f(-0.11472+$x,0.33693125+$y,0.2356+$z);
};



$DRAW_MODEL{'Cursor'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'Floor'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}
};



$DRAW_MODEL{'N'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
};



$DRAW_MODEL{'Sapling'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.15000276,0.10361004); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.24340308); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.24340308); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.10361004); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    glNormal3f( 0,0.999234513896439,0.0391201511819484 );
    glTexCoord2f(0.61840762,0.53439169); glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.61705267,0.52757992); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.58416256,0.54120346); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.58280762,0.53439169); glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    glNormal3f( 0.979253696964734,0.0634406526299195,-0.192451242071314 );
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    glNormal3f( 0,0.99923451390125,0.0391201511821367 );
    glTexCoord2f(0.61705267,0.52757992); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    glNormal3f( 0.979253700925903,0.0482005021893658,0.196822002864555 );
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    glNormal3f( 0.979253708876079,0.0482005055688002,0.196821962482229 );
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.19887348); glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);

    glNormal3f( 0.830171195095948,0.0341204450084621,0.556463459775563 );
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.25176752,0.19887348); glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    glNormal3f( 0,0.999234512202863,0.0391201945583273 );
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    glNormal3f( 0,0.999234512203072,0.0391201945583355 );
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    glNormal3f( 0.830171252695131,0.0341204438669332,0.556463373915049 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    glNormal3f( 0,0.999234503253314,0.0391204231582761 );
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    glNormal3f( 0,0.9992345032532,0.0391204231582716 );
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    glNormal3f( 0.554702615193727,0.0233440284060303,0.831721146199265 );
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    glNormal3f( 0.554702690956925,0.0233440343693552,0.831721095502878 );
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.21276391); glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( 0.194785730661177,0.017511883374407,0.98068947841377 );
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    glTexCoord2f(0.25176752,0.21276391); glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,0.999234505353034,0.0391203695261294 );
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    glNormal3f( 0,0.999234505353034,0.0391203695261294 );
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);

    glNormal3f( 0.194785718170122,0.0175118838325021,0.980689480886579 );
    glTexCoord2f(0.44753904,0.21970913); glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    glNormal3f( 0,0.9992345032532,0.0391204231582716 );
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    glNormal3f( -0.194785718170122,0.0175118838325021,0.980689480886579 );
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    glTexCoord2f(0.44753904,0.21970913); glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);

    glNormal3f( -0.194785730661177,0.017511883374407,0.98068947841377 );
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.22665434); glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    glNormal3f( -0.554702690956925,0.0233440343693552,0.831721095502878 );
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    glTexCoord2f(0.25176752,0.23359956); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.25176752,0.22665434); glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,0.999234512203072,0.0391201945583355 );
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    glNormal3f( 0,0.999234512202864,0.0391201945583273 );
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    glNormal3f( -0.554702615193727,0.0233440284060303,0.831721146199265 );
    glTexCoord2f(0.44753904,0.23359956); glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    glTexCoord2f(0.25176752,0.23359956); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    glNormal3f( 0,0.999234513901249,0.0391201511821367 );
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.58416256,0.54120346); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    glNormal3f( -0.830171252695131,0.0341204438669332,0.556463373915049 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    glNormal3f( -0.830171195095948,0.0341204450084621,0.556463459775563 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( -0.979253708876079,0.0482005055688002,0.196821962482229 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    glNormal3f( -0.979253700925903,0.0482005021893658,0.196822002864555 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    glNormal3f( -0.979253696964734,0.0634406526299195,-0.192451242071314 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    glNormal3f( -0.97925370673822,0.063440652890506,-0.19245119225477 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);

    glNormal3f( -0.830171207446931,0.0775207115069962,-0.552092660351099 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);

    glNormal3f( -0.830171235041929,0.0775207077458453,-0.552092619385137 );
    glTexCoord2f(0.44753904,0.21970912); glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    glNormal3f( -0.554702676867285,0.088297120594236,-0.827350324089521 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    glNormal3f( -0.554702667234012,0.0882971203422769,-0.827350330575104 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);

    glNormal3f( -0.194785714988963,0.094129271895914,-0.976318700736897 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);

    glNormal3f( -0.194785705826057,0.0941292723727401,-0.97631870251902 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    glNormal3f( 0.194785705826057,0.0941292723727401,-0.97631870251902 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);

    glNormal3f( 0.194785714988963,0.0941292718959139,-0.976318700736898 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);

    glNormal3f( 0.554702667234012,0.0882971203422769,-0.827350330575104 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);

    glNormal3f( 0.554702676867285,0.088297120594236,-0.827350324089521 );
    glTexCoord2f(0.44753904,0.21970912); glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    glNormal3f( 0.830171235041929,0.0775207077458453,-0.552092619385137 );
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.25176752,0.17803783); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.44753904,0.17803783); glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    glNormal3f( 0.830171207446931,0.0775207115069962,-0.552092660351098 );
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    glTexCoord2f(0.25176752,0.18498305); glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.25176752,0.17803783); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);

    glNormal3f( 0.97925370673822,0.063440652890506,-0.19245119225477 );
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.25176752,0.18498305); glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    glNormal3f( 0,-0.999234512592127,-0.0391201845773796 );
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    glTexCoord2f(0.82508346,0.35855901); glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.82372851,0.35174724); glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.85932851,0.35174724); glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.85797357,0.34493548); glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    glNormal3f( 0,-0.999234508603607,-0.0391202864978603 );
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    glNormal3f( 0,-0.999234509279886,-0.0391202692223623 );
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( 0,-0.999234505528077,-0.039120365055047 );
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,-0.999234509279957,-0.0391202692223651 );
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    glNormal3f( 0,-0.99923450860355,-0.0391202864978581 );
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,-0.999234512593773,-0.0391201845774441 );
    glTexCoord2f(0.85797357,0.34493548); glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( 0,-0.999234508603608,-0.0391202864978603 );
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( 0,-0.999234509279853,-0.039120269222361 );
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,-0.999234505527907,-0.0391203650550403 );
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    glNormal3f( 0,-0.999234509279772,-0.0391202692223579 );
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    glNormal3f( 0,-0.999234508603508,-0.0391202864978564 );
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    glNormal3f( 0,-0.999234512593774,-0.0391201845774441 );
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    glTexCoord2f(0.82508346,0.35855901); glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    glNormal3f( 0.878183960296039,0.445285571646999,-0.174681686394914 );
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    glNormal3f( 0.644162108715998,0.754080506454736,0.128131836323089 );
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);
    glTexCoord2f(0.63474982,0.99807288); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);

    glNormal3f( 0.878183960296039,0.445285571646999,0.174681686394914 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);

    glNormal3f( 0.8781839593158,0.445285565699255,0.174681706484448 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    glNormal3f( 0.744488411701077,0.44528555242655,0.497451285698399 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);

    glNormal3f( 0.54609427773606,0.75408050728672,0.364888514966056 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.6190637,0.99107142); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);

    glNormal3f( 0.744488442328843,0.445285538945063,0.497451251928446 );
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);

    glNormal3f( 0.364888514966056,0.75408050728672,0.54609427773606 );
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);
    glTexCoord2f(0.60097156,0.98553187); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);

    glNormal3f( 0.497451251928446,0.445285538945063,0.744488442328843 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);

    glNormal3f( 0.497451285698399,0.44528555242655,0.744488411701077 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);

    glNormal3f( 0.174681706484448,0.445285565699255,0.8781839593158 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);

    glNormal3f( 0.128131836323089,0.754080506454736,0.644162108715998 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.5808086,0.98202248); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);

    glNormal3f( 0.174681686394914,0.445285571646999,0.878183960296039 );
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);

    glNormal3f( -0.128131836323089,0.754080506454736,0.644162108715998 );
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);
    glTexCoord2f(0.55871849,0.98091334); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);

    glNormal3f( -0.174681686394914,0.445285571646999,0.878183960296039 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);

    glNormal3f( -0.174681706484448,0.445285565699255,0.8781839593158 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);

    glNormal3f( -0.497451285698399,0.44528555242655,0.744488411701077 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);

    glNormal3f( -0.364888514966056,0.75408050728672,0.54609427773606 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    glTexCoord2f(0.53489502,0.98197441); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);

    glNormal3f( -0.497451251928446,0.445285538945063,0.744488442328843 );
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);

    glNormal3f( -0.54609427773606,0.75408050728672,0.364888514966056 );
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);
    glTexCoord2f(0.50928954,0.9857555); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);

    glNormal3f( -0.744488442328843,0.445285538945063,0.497451251928446 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);

    glNormal3f( -0.744488411701077,0.44528555242655,0.497451285698399 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);

    glNormal3f( -0.8781839593158,0.445285565699255,0.174681706484448 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);

    glNormal3f( -0.644162108715998,0.754080506454736,0.128131836323089 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    glTexCoord2f(0.46801984,0.9857555); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);

    glNormal3f( -0.878183960296039,0.445285571646999,0.174681686394914 );
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);

    glNormal3f( -0.644162108715998,0.754080506454736,-0.128131836323089 );
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);
    glTexCoord2f(0.44241434,0.98197441); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    glNormal3f( -0.878183960296039,0.445285571646999,-0.174681686394914 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);

    glNormal3f( -0.8781839593158,0.445285565699255,-0.174681706484448 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);

    glNormal3f( -0.744488411701077,0.44528555242655,-0.497451285698399 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    glNormal3f( -0.54609427773606,0.75408050728672,-0.364888514966056 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.4185909,0.98091334); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    glNormal3f( -0.744488442328843,0.445285538945063,-0.497451251928446 );
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    glNormal3f( -0.364888514966056,0.75408050728672,-0.54609427773606 );
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    glTexCoord2f(0.39650076,0.98202248); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    glNormal3f( -0.497451251928446,0.445285538945063,-0.744488442328843 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    glNormal3f( -0.497451285698399,0.44528555242655,-0.744488411701077 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    glNormal3f( -0.174681706484448,0.445285565699255,-0.8781839593158 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    glNormal3f( -0.128131836323089,0.754080506454736,-0.644162108715998 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.37633783,0.98553186); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);

    glNormal3f( -0.174681686394914,0.445285571646999,-0.878183960296039 );
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    glNormal3f( 0.128131836323089,0.754080506454736,-0.644162108715998 );
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);
    glTexCoord2f(0.35824565,0.99107143); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    glNormal3f( 0.174681686394914,0.445285571646999,-0.878183960296039 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);

    glNormal3f( 0.174681706484448,0.445285565699255,-0.8781839593158 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);

    glNormal3f( 0.497451285698399,0.44528555242655,-0.744488411701077 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    glNormal3f( 0.364888514966056,0.75408050728672,-0.54609427773606 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    glTexCoord2f(0.34255958,0.99807286); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    glNormal3f( 0.497451251928446,0.445285538945063,-0.744488442328843 );
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    glNormal3f( 0.54609427773606,0.75408050728672,-0.364888514966056 );
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    glTexCoord2f(0.33057252,1.00599943); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    glNormal3f( 0.744488442328843,0.445285538945063,-0.497451251928446 );
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    glNormal3f( 0.744488411701077,0.44528555242655,-0.497451285698399 );
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.18086972,0.87319155); glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    glNormal3f( 0.644162108715998,0.754080506454736,-0.128131836323089 );
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    glTexCoord2f(0.64673683,1.00599941); glVertex3f(0+$x,0.13145591+$y,0+$z);
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);

    glNormal3f( 0.8781839593158,0.445285565699255,-0.174681706484448 );
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.79643966,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    glNormal3f( 0.942179486742844,0.277803666525894,0.187411145948579 );
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);

    glNormal3f( 0.942179466633407,0.27780369257129,-0.187411208437874 );
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.79643966,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    glNormal3f( 0.942179466633407,0.27780369257129,0.187411208437874 );
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    glNormal3f( 0.798741176077898,0.277803697324677,0.533701826294829 );
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);

    glNormal3f( 0.798741213751524,0.27780373006808,0.533701752868588 );
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    glNormal3f( 0.533701752868588,0.27780373006808,0.798741213751524 );
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    glNormal3f( 0.533701826294829,0.277803697324677,0.798741176077898 );
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);

    glNormal3f( 0.187411208437874,0.27780369257129,0.942179466633407 );
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);

    glNormal3f( 0.187411145948579,0.277803666525894,0.942179486742845 );
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    glNormal3f( -0.187411145948579,0.277803666525894,0.942179486742845 );
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);

    glNormal3f( -0.187411208437874,0.27780369257129,0.942179466633407 );
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);

    glNormal3f( -0.533701826294829,0.277803697324677,0.798741176077898 );
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);

    glNormal3f( -0.533701752868588,0.27780373006808,0.798741213751524 );
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    glNormal3f( -0.798741213751524,0.27780373006808,0.533701752868588 );
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    glNormal3f( -0.798741176077898,0.277803697324677,0.533701826294829 );
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);

    glNormal3f( -0.942179466633407,0.27780369257129,0.187411208437874 );
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);

    glNormal3f( -0.942179486742844,0.277803666525894,0.187411145948579 );
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    glNormal3f( -0.942179486742844,0.277803666525894,-0.187411145948579 );
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);

    glNormal3f( -0.942179466633407,0.27780369257129,-0.187411208437874 );
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);

    glNormal3f( -0.798741176077898,0.277803697324677,-0.533701826294829 );
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    glNormal3f( -0.798741213751524,0.27780373006808,-0.533701752868588 );
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    glNormal3f( -0.533701752868588,0.27780373006808,-0.798741213751524 );
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    glNormal3f( -0.533701826294829,0.277803697324677,-0.798741176077898 );
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    glNormal3f( -0.187411208437874,0.27780369257129,-0.942179466633407 );
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    glNormal3f( -0.187411145948579,0.277803666525894,-0.942179486742845 );
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    glNormal3f( 0.187411145948579,0.277803666525894,-0.942179486742845 );
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);

    glNormal3f( 0.187411208437874,0.27780369257129,-0.942179466633407 );
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);

    glNormal3f( 0.533701826294829,0.277803697324677,-0.798741176077898 );
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    glNormal3f( 0.533701752868588,0.27780373006808,-0.798741213751524 );
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    glNormal3f( 0.798741213751524,0.27780373006808,-0.533701752868588 );
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    glNormal3f( 0.798741176077898,0.277803697324677,-0.533701826294829 );
    glTexCoord2f(0.18086972,0.87319155); glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    glNormal3f( 0.942179486742844,0.277803666525894,-0.187411145948579 );
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    glNormal3f( 0.962917055651036,0.190012274653134,-0.191536104736111 );
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    glNormal3f( 0.962917055651036,0.190012274653134,0.191536104736111 );
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);

    glNormal3f( 0.962917049505553,0.190012244334688,0.191536165708764 );
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    glNormal3f( 0.81632170804583,0.190012244506253,0.545448637280206 );
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    glNormal3f( 0.81632169487454,0.190012254806661,0.545448653404192 );
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    glNormal3f( 0.545448653404192,0.190012254806661,0.81632169487454 );
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    glNormal3f( 0.545448637280206,0.190012244506253,0.81632170804583 );
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    glNormal3f( 0.191536165708764,0.190012244334688,0.962917049505553 );
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    glNormal3f( 0.191536104736111,0.190012274653134,0.962917055651036 );
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    glNormal3f( -0.191536104736111,0.190012274653134,0.962917055651036 );
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);

    glNormal3f( -0.191536165708764,0.190012244334688,0.962917049505553 );
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);

    glNormal3f( -0.545448637280206,0.190012244506253,0.81632170804583 );
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    glNormal3f( -0.545448653404192,0.190012254806661,0.81632169487454 );
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    glNormal3f( -0.81632169487454,0.190012254806661,0.545448653404192 );
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    glNormal3f( -0.81632170804583,0.190012244506253,0.545448637280206 );
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    glNormal3f( -0.962917049505553,0.190012244334688,0.191536165708764 );
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    glNormal3f( -0.962917055651036,0.190012274653134,0.191536104736111 );
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    glNormal3f( -0.962917055651036,0.190012274653134,-0.191536104736111 );
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);

    glNormal3f( -0.962917049505553,0.190012244334688,-0.191536165708764 );
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);

    glNormal3f( -0.81632170804583,0.190012244506253,-0.545448637280206 );
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    glNormal3f( -0.81632169487454,0.190012254806661,-0.545448653404192 );
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    glNormal3f( -0.545448653404192,0.190012254806661,-0.81632169487454 );
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    glNormal3f( -0.545448637280206,0.190012244506253,-0.81632170804583 );
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    glNormal3f( -0.191536165708764,0.190012244334688,-0.962917049505553 );
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    glNormal3f( -0.191536104736111,0.190012274653134,-0.962917055651036 );
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    glNormal3f( 0.191536104736111,0.190012274653134,-0.962917055651036 );
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);

    glNormal3f( 0.191536165708764,0.190012244334688,-0.962917049505553 );
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);

    glNormal3f( 0.545448637280206,0.190012244506253,-0.81632170804583 );
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    glNormal3f( 0.545448653404192,0.190012254806661,-0.81632169487454 );
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    glNormal3f( 0.81632169487454,0.190012254806661,-0.545448653404192 );
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    glNormal3f( 0.81632170804583,0.190012244506253,-0.545448637280206 );
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    glTexCoord2f(0.071592505,0.67046678); glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    glNormal3f( 0.962917049505553,0.190012244334688,-0.191536165708764 );
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.90571687,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    glNormal3f( 0.975318207039005,-0.105438682182075,0.194002781727292 );
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);

    glNormal3f( 0.975318189387232,-0.105438615850187,-0.194002906519485 );
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.90571687,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    glNormal3f( 0.975318189387232,-0.105438615850187,0.194002906519485 );
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    glNormal3f( 0.826834886635256,-0.10543862537532,0.552473317474995 );
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    glNormal3f( 0.826834805542256,-0.1054386963768,0.552473425288729 );
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    glNormal3f( 0.552473425288729,-0.1054386963768,0.826834805542256 );
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    glNormal3f( 0.552473317474995,-0.10543862537532,0.826834886635256 );
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    glNormal3f( 0.194002906519485,-0.105438615850187,0.975318189387232 );
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    glNormal3f( 0.194002781727292,-0.105438682182075,0.975318207039005 );
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    glNormal3f( -0.194002781727292,-0.105438682182075,0.975318207039005 );
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);

    glNormal3f( -0.194002906519485,-0.105438615850187,0.975318189387232 );
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);

    glNormal3f( -0.552473317474995,-0.10543862537532,0.826834886635256 );
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    glNormal3f( -0.552473425288729,-0.1054386963768,0.826834805542256 );
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    glNormal3f( -0.826834805542256,-0.1054386963768,0.552473425288729 );
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    glNormal3f( -0.826834886635256,-0.10543862537532,0.552473317474995 );
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    glNormal3f( -0.975318189387232,-0.105438615850187,0.194002906519485 );
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    glNormal3f( -0.975318207039005,-0.105438682182075,0.194002781727292 );
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    glNormal3f( -0.975318207039005,-0.105438682182075,-0.194002781727292 );
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);

    glNormal3f( -0.975318189387232,-0.105438615850187,-0.194002906519485 );
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);

    glNormal3f( -0.826834886635256,-0.10543862537532,-0.552473317474995 );
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    glNormal3f( -0.826834805542256,-0.1054386963768,-0.552473425288729 );
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    glNormal3f( -0.552473425288729,-0.1054386963768,-0.826834805542256 );
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    glNormal3f( -0.552473317474995,-0.10543862537532,-0.826834886635256 );
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    glNormal3f( -0.194002906519485,-0.105438615850187,-0.975318189387232 );
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    glNormal3f( -0.194002781727292,-0.105438682182075,-0.975318207039005 );
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    glNormal3f( 0.194002781727292,-0.105438682182075,-0.975318207039005 );
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);

    glNormal3f( 0.194002906519485,-0.105438615850187,-0.975318189387232 );
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);

    glNormal3f( 0.552473317474995,-0.10543862537532,-0.826834886635256 );
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    glNormal3f( 0.552473425288729,-0.1054386963768,-0.826834805542256 );
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    glNormal3f( 0.826834805542256,-0.1054386963768,-0.552473425288729 );
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    glNormal3f( 0.826834886635256,-0.10543862537532,-0.552473317474995 );
    glTexCoord2f(0.071592505,0.67046678); glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    glNormal3f( 0.975318207039005,-0.105438682182075,-0.194002781727292 );
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    glNormal3f( 0.923930781119175,-0.335524046154038,-0.183781190966142 );
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    glNormal3f( 0.923930781119175,-0.335524046154038,0.183781190966142 );
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);

    glNormal3f( 0.923930729091407,-0.335524114454675,0.183781327832907 );
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    glNormal3f( 0.783270688656413,-0.335524105075374,0.523364694266893 );
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    glNormal3f( 0.783270648931591,-0.335524059847498,0.523364782714443 );
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    glNormal3f( 0.523364782714443,-0.335524059847498,0.783270648931591 );
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    glNormal3f( 0.523364694266893,-0.335524105075374,0.783270688656413 );
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    glNormal3f( 0.183781327832907,-0.335524114454675,0.923930729091407 );
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    glNormal3f( 0.183781190966142,-0.335524046154038,0.923930781119175 );
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    glNormal3f( -0.183781190966142,-0.335524046154038,0.923930781119175 );
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);

    glNormal3f( -0.183781327832907,-0.335524114454675,0.923930729091407 );
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);

    glNormal3f( -0.523364694266893,-0.335524105075374,0.783270688656413 );
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    glNormal3f( -0.523364782714443,-0.335524059847498,0.783270648931591 );
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    glNormal3f( -0.783270648931591,-0.335524059847498,0.523364782714443 );
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    glNormal3f( -0.783270688656413,-0.335524105075374,0.523364694266893 );
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    glNormal3f( -0.923930729091407,-0.335524114454675,0.183781327832907 );
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    glNormal3f( -0.923930781119175,-0.335524046154038,0.183781190966142 );
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    glNormal3f( -0.923930781119175,-0.335524046154038,-0.183781190966142 );
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);

    glNormal3f( -0.923930729091407,-0.335524114454675,-0.183781327832907 );
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);

    glNormal3f( -0.783270688656413,-0.335524105075374,-0.523364694266893 );
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    glNormal3f( -0.783270648931591,-0.335524059847498,-0.523364782714443 );
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    glNormal3f( -0.523364782714443,-0.335524059847498,-0.783270648931591 );
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    glNormal3f( -0.523364694266893,-0.335524105075374,-0.783270688656413 );
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    glNormal3f( -0.183781327832907,-0.335524114454675,-0.923930729091407 );
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    glNormal3f( -0.183781190966142,-0.335524046154038,-0.923930781119175 );
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    glNormal3f( 0.183781190966142,-0.335524046154038,-0.923930781119175 );
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);

    glNormal3f( 0.183781327832907,-0.335524114454675,-0.923930729091407 );
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);

    glNormal3f( 0.523364694266893,-0.335524105075374,-0.783270688656413 );
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    glNormal3f( 0.523364782714443,-0.335524059847498,-0.783270648931591 );
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    glNormal3f( 0.783270648931591,-0.335524059847498,-0.523364782714443 );
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    glNormal3f( 0.783270688656413,-0.335524105075374,-0.523364694266893 );
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    glTexCoord2f(0.070228823,0.45795639); glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    glNormal3f( 0.923930729091407,-0.335524114454675,-0.183781327832907 );
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.90708053,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    glNormal3f( 0.671498852777226,-0.728867952169112,0.133569453916961 );
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.84919307,0.38385446); glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);

    glNormal3f( 0.671498857303792,-0.728867942308,-0.133569484970946 );
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.90708053,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    glNormal3f( 0.671498857303792,-0.728867942308,0.133569484970946 );
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    glNormal3f( 0.569269270970117,-0.728867939801861,0.380373531489959 );
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    glNormal3f( 0.569269258080571,-0.728867944853889,0.380373541099883 );
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.77619885,0.37859741); glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    glNormal3f( 0.380373541099883,-0.728867944853889,0.569269258080571 );
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.75518378,0.374797); glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    glNormal3f( 0.380373531489959,-0.728867939801861,0.569269270970117 );
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    glNormal3f( 0.133569484970946,-0.728867942308,0.671498857303792 );
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    glNormal3f( 0.133569453916961,-0.728867952169112,0.671498852777226 );
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.67818786,0.36245149); glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    glNormal3f( -0.133569453916961,-0.728867952169112,0.671498852777226 );
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.65589456,0.35595595); glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);

    glNormal3f( -0.133569484970946,-0.728867942308,0.671498857303792 );
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);

    glNormal3f( -0.380373531489959,-0.728867939801861,0.569269270970117 );
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    glNormal3f( -0.380373541099883,-0.728867944853889,0.569269258080571 );
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.57086482,0.34094282); glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    glNormal3f( -0.569269258080571,-0.728867944853889,0.380373541099883 );
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.54245419,0.33267348); glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    glNormal3f( -0.569269270970117,-0.728867939801861,0.380373531489959 );
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    glNormal3f( -0.671498857303792,-0.728867942308,0.133569484970946 );
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    glNormal3f( -0.671498852777226,-0.728867952169112,0.133569453916961 );
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.4348549,0.33267337); glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    glNormal3f( -0.671498852777226,-0.728867952169112,-0.133569453916961 );
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.40644448,0.34094235); glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);

    glNormal3f( -0.671498857303792,-0.728867942308,-0.133569484970946 );
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);

    glNormal3f( -0.569269270970117,-0.728867939801861,-0.380373531489959 );
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    glNormal3f( -0.569269258080571,-0.728867944853889,-0.380373541099883 );
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.32141542,0.35595561); glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    glNormal3f( -0.380373541099883,-0.728867944853889,-0.569269258080571 );
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.29912214,0.36245196); glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    glNormal3f( -0.380373531489959,-0.728867939801861,-0.569269270970117 );
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    glNormal3f( -0.133569484970946,-0.728867942308,-0.671498857303792 );
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    glNormal3f( -0.133569453916961,-0.728867952169112,-0.671498852777226 );
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.22212535,0.3747977); glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    glNormal3f( 0.133569453916961,-0.728867952169112,-0.671498852777226 );
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.20110988,0.37859758); glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);

    glNormal3f( 0.133569484970946,-0.728867942308,-0.671498857303792 );
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);

    glNormal3f( 0.380373531489959,-0.728867939801861,-0.569269270970117 );
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    glNormal3f( 0.380373541099883,-0.728867944853889,-0.569269258080571 );
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.12811605,0.38385414); glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    glNormal3f( 0.569269258080571,-0.728867944853889,-0.380373541099883 );
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.11168619,0.38378728); glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    glNormal3f( 0.569269270970117,-0.728867939801861,-0.380373531489959 );
    glTexCoord2f(0.070228823,0.45795639); glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    glNormal3f( 0.671498852777226,-0.728867952169112,-0.133569453916961 );
    glTexCoord2f(0.86562334,0.38378742); glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    glNormal3f( 0.342894574756044,-0.936894473314623,-0.0682059856272723 );
    glTexCoord2f(0.86562334,0.38378742); glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);
    glTexCoord2f(0.87692441,0.31094667); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    glNormal3f( 0.342894574756044,-0.936894473314623,0.0682059856272723 );
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.83919279,0.31126907); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.84919307,0.38385446); glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);

    glNormal3f( 0.290691989577293,-0.936894473607523,0.194234169288719 );
    glTexCoord2f(0.77619885,0.37859741); glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    glTexCoord2f(0.79707636,0.3089041); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    glNormal3f( 0.194234169288719,-0.936894473607523,0.290691989577293 );
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.75093491,0.30094888); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.75518378,0.374797); glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    glNormal3f( 0.0682059856272723,-0.936894473314623,0.342894574756044 );
    glTexCoord2f(0.67818786,0.36245149); glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);
    glTexCoord2f(0.70267303,0.29107259); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    glNormal3f( -0.0682059856272723,-0.936894473314623,0.342894574756044 );
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    glTexCoord2f(0.65363307,0.27763999); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.65589456,0.35595595); glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);

    glNormal3f( -0.194234169288719,-0.936894473607523,0.290691989577293 );
    glTexCoord2f(0.57086482,0.34094282); glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    glTexCoord2f(0.59626992,0.2641011); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    glNormal3f( -0.290691989577293,-0.936894473607523,0.194234169288719 );
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    glTexCoord2f(0.53490917,0.24713356); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.54245419,0.33267348); glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    glNormal3f( -0.342894574756044,-0.936894473314623,0.0682059856272723 );
    glTexCoord2f(0.4348549,0.33267337); glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);
    glTexCoord2f(0.44239984,0.2471346); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    glNormal3f( -0.342894574756044,-0.936894473314623,-0.0682059856272723 );
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.38104115,0.26410093); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.40644448,0.34094235); glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);

    glNormal3f( -0.290691989577293,-0.936894473607523,-0.194234169288719 );
    glTexCoord2f(0.32141542,0.35595561); glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    glTexCoord2f(0.32367495,0.27763785); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    glNormal3f( -0.194234169288719,-0.936894473607523,-0.290691989577293 );
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.27463456,0.29107476); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.29912214,0.36245196); glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    glNormal3f( -0.0682059856272723,-0.936894473314623,-0.342894574756044 );
    glTexCoord2f(0.22212535,0.3747977); glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);
    glTexCoord2f(0.22637703,0.30094966); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    glNormal3f( 0.0682059856272723,-0.936894473314623,-0.342894574756044 );
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    glTexCoord2f(0.18023255,0.30890174); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.20110988,0.37859758); glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);

    glNormal3f( 0.194234169288719,-0.936894473607523,-0.290691989577293 );
    glTexCoord2f(0.12811605,0.38385414); glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    glTexCoord2f(0.13811544,0.31127004); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    glNormal3f( 0.290691989577293,-0.936894473607523,-0.194234169288719 );
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    glTexCoord2f(0.10038548,0.31094724); glVertex3f(0+$x,-0.309663+$y,0+$z);
    glTexCoord2f(0.11168619,0.38378728); glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
};



$DRAW_MODEL{'Shrub'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.0074533333,0.1501283); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.1501283); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.1501283); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.1030322,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.055242766,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.055242766,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.1030322,0.02109683); glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.0087933422,0.0081000089); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.058034241,0.060858114); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.0087933422,0.054996102); glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.0087933422,0.0081000089); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.079137483,0.054996102); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.058034241,0.060858114); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.14948162,0.0081000089); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.10024073,0.060858114); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.0087933422,0.0081000089); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0087933422,0.14878829); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.10024073,0.096030186); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.14948162,0.14878829); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0087933422,0.14878829); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.079137483,0.1018922); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.10024073,0.096030186); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.14948162,0.14878829); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.10024073,0.096030186); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.14948162,0.1018922); glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.0087933422,0.1018922); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.058034241,0.096030186); glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.0087933422,0.14878829); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0087933422,0.1018922); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.050999827,0.07844415); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.058034241,0.096030186); glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.14948162,0.054996102); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.10024073,0.060858114); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.14948162,0.0081000089); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.14948162,0.054996102); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.10727514,0.07844415); glVertex3f(0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.10024073,0.060858114); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.058034241,0.060858114); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.050999827,0.07844415); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.0087933422,0.1018922); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.079137483,0.1018922); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.0087933422,0.14878829); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.058034241,0.096030186); glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.10727514,0.07844415); glVertex3f(0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.14948162,0.054996102); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.10024073,0.096030186); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.079137483,0.054996102); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.0087933422,0.0081000089); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.10024073,0.060858114); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.055242766,0.02109683); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.1030322,0.02109683); glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.055242766,0.02109683); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.1030322,0.02109683); glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.0074533333,0.00676); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.00676); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15082163,0.02109683); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0074533333,0.02109683); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.0087933422,0.054996102); glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.058034241,0.060858114); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.0087933422,0.1018922); glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.14948162,0.1018922); glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.10024073,0.096030186); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.14948162,0.054996102); glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
}

    glNormal3f( -0.262483110323801,-0.195429458680657,-0.944939121570553 );
    glTexCoord2f(0.30034109,0.96363191); glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.51506351,0.99605022); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);

    glNormal3f( 0.928476690885259,0,-0.371390676354104 );
    glTexCoord2f(0.92015794,0.75673844); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.89403246,0.56010743); glVertex3f(0.2+$x,-0.4+$y,0+$z);

    glNormal3f( 0.176708409866431,-0.131566655794025,-0.975430342446683 );
    glTexCoord2f(0.73908489,0.97334538); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);

    glNormal3f( 0.90476677156459,-0.224545370302313,0.361906708625836 );
    glTexCoord2f(0.8269528,0.37703254); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.89403246,0.56010743); glVertex3f(0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);

    glNormal3f( 0.262483110323801,-0.195429458680657,0.944939121570553 );
    glTexCoord2f(0.69891764,0.28441387); glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.48240691,0.25464786); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);

    glNormal3f( -0.176708409866431,-0.131566655794025,0.975430342446683 );
    glTexCoord2f(0.25931383,0.27826082); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    glNormal3f( 0.383561553011393,0.71394337692172,-0.585803200401892 );
    glTexCoord2f(0.65289765,0.73029341); glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);

    glNormal3f( -0.119835344791728,0.334583736075777,-0.934715579035796 );
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    glNormal3f( -0.905881109439556,0.389114789276421,-0.16723963742763 );
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);

    glNormal3f( -0.311951558006999,0.580651911045146,0.752017010217605 );
    glTexCoord2f(0.33934164,0.51446499); glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    glNormal3f( -0.650193491769631,0.638567424755678,0.411679568719795 );
    glTexCoord2f(0.33934164,0.51446499); glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    glNormal3f( 0.207547541120402,0.35949825569901,0.909771961715816 );
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    glNormal3f( 0.134573882740895,0.978157951754866,0.158419984543509 );
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    glNormal3f( 0.883241313849124,0.403117265026277,0.239543841807314 );
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);

    glNormal3f( -0.341163391279438,-0.366488825782845,-0.865617398754799 );
    glTexCoord2f(0.51506351,0.99605022); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.4338309,0.88613372); glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);

    glNormal3f( 0.267643883663828,0,-0.963517904108348 );
    glTexCoord2f(0.51506351,0.99605022); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    glTexCoord2f(0.73908489,0.97334538); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);

    glNormal3f( -0.90476677156459,-0.224545370302313,-0.361906708625836 );
    glTexCoord2f(0.10672194,0.69221941); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.17554203,0.8731049); glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);

    glNormal3f( -0.645488440644096,-0.561982845713747,-0.517223311654002 );
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.10672194,0.69221941); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.22833401,0.73306801); glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);

    glNormal3f( -0.929001569771096,0.266030755559964,-0.257261968543805 );
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    glNormal3f( 0.670227113438415,0.623764450737793,-0.402136203801385 );
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.72339625,0.66881691); glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);

    glNormal3f( 0.955964174052732,-0.154729263967988,-0.24938194160685 );
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.92015794,0.75673844); glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);

    glNormal3f( 0.16492923477811,-0.0010145825530033,0.986304880925645 );
    glTexCoord2f(0.48240691,0.25464786); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.565208,0.36406494); glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);

    glNormal3f( -0.267643883663828,0,0.963517904108348 );
    glTexCoord2f(0.48240691,0.25464786); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    glTexCoord2f(0.25931383,0.27826082); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    glNormal3f( 0.916937623996139,-0.196951524780328,0.347038168775452 );
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.89403246,0.56010743); glVertex3f(0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.77220061,0.51768602); glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);

    glNormal3f( 0.88933350553576,0.374909325403606,0.261780277440625 );
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    glNormal3f( -0.670227113438415,0.623764450737793,0.402136203801385 );
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.27613587,0.58236756); glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);

    glNormal3f( -0.955964174052732,-0.154729263967988,0.24938194160685 );
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.078853106,0.49570944); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    glNormal3f( 0.312734722361293,0.582109656221635,-0.750563349467008 );
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.5974624,0.80472281); glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);

    glNormal3f( 0.352406905887475,0.834850203552426,-0.422888295311291 );
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.65289765,0.73029341); glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);

    glNormal3f( 0.49826779781017,0.728712288158119,-0.46979527749091 );
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.65289765,0.73029341); glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);

    glNormal3f( 0.247699907715026,0.922113442319399,-0.297239895054209 );
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.56970699,0.67271676); glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);

    glNormal3f( 0.132025358739482,0.977975356175003,0.16165861364025 );
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    glNormal3f( -0.247699907715026,0.922113442319399,0.297239895054209 );
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    glTexCoord2f(0.42886541,0.57761023); glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);

    glNormal3f( -0.122445642125336,0.987629276894256,-0.0979565012944218 );
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    glNormal3f( -0.312734722361293,0.582109656221635,0.750563349467008 );
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    glTexCoord2f(0.40055082,0.44616798); glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);

    glNormal3f( -0.26530731240058,0.91008425390991,0.318368781088887 );
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.33934164,0.51446499); glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);

    glNormal3f( -0.928476690885259,0,0.371390676354104 );
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.10672194,0.69221941); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.078853106,0.49570944); glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    glNormal3f( -0.0814812404319664,0.985824435120814,-0.146666255752292 );
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    glNormal3f( -0.183866307077927,0.228160017576006,-0.956104694843218 );
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.37228833,0.74994668); glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    glNormal3f( 0.191809730289227,0.384482954930314,0.902984985885384 );
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.62786707,0.50660024); glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    glNormal3f( 0.190676476131653,-0.35491613831717,-0.915246970064388 );
    glTexCoord2f(0.5974624,0.80472281); glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    glNormal3f( -0.190676478527532,0.354916142776746,-0.915246967835904 );
    glTexCoord2f(0.5974624,0.80472281); glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);

    glNormal3f( 0.874860322293886,0.407105849038198,0.262458080757148 );
    glTexCoord2f(0.72339625,0.66881691); glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);

    glNormal3f( 0.874860316751887,-0.407105857451153,-0.262458086180917 );
    glTexCoord2f(0.72339625,0.66881691); glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.73594437,0.78949876); glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);

    glNormal3f( -0.190676476131653,-0.35491613831717,0.915246970064388 );
    glTexCoord2f(0.40055082,0.44616798); glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    glNormal3f( 0.190676478527532,0.354916142776746,0.915246967835904 );
    glTexCoord2f(0.40055082,0.44616798); glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    glNormal3f( -0.874860322293886,0.407105849038198,-0.262458080757148 );
    glTexCoord2f(0.27613587,0.58236756); glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);

    glNormal3f( -0.874860316751887,-0.407105857451153,0.262458086180917 );
    glTexCoord2f(0.27613587,0.58236756); glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.26308277,0.46134073); glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    glNormal3f( 0.131449180501891,0.97869275905759,0.15773901328975 );
    glTexCoord2f(0.42886541,0.57761023); glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);
    glTexCoord2f(0.44879384,0.49425597); glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);

    glNormal3f( -0.131449175213788,0.9786927607906,-0.157739006944027 );
    glTexCoord2f(0.42886541,0.57761023); glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.33448922,0.61074027); glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);

    glNormal3f( -0.946385128651128,0,0.323040536570858 );
    glTexCoord2f(0.22833401,0.73306801); glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);
    glTexCoord2f(0.10672194,0.69221941); glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);

    glNormal3f( -0.770697745511202,0.58175297233223,-0.259977814912286 );
    glTexCoord2f(0.22833401,0.73306801); glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);
    glTexCoord2f(0.24357991,0.65608459); glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);

    glNormal3f( -0.131449180501891,0.97869275905759,-0.15773901328975 );
    glTexCoord2f(0.56970699,0.67271676); glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);
    glTexCoord2f(0.54819781,0.75627186); glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);

    glNormal3f( 0.131449175213788,0.9786927607906,0.157739006944027 );
    glTexCoord2f(0.56970699,0.67271676); glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);
    glTexCoord2f(0.49955821,0.62471065); glVertex3f(0+$x,-0.1851025+$y,0+$z);
    glTexCoord2f(0.66523661,0.64040398); glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);

    glNormal3f( 0.99359121487026,0,0.11303317093951 );
    glTexCoord2f(0.77220061,0.51768602); glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);
    glTexCoord2f(0.89403246,0.56010743); glVertex3f(0.2+$x,-0.4+$y,0+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);

    glNormal3f( 0.967354177437774,0.0755473896227836,0.241905947249901 );
    glTexCoord2f(0.77220061,0.51768602); glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);
    glTexCoord2f(0.75629284,0.59546408); glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);

    glNormal3f( -0.192615368979999,0.409206782478953,-0.891879548372941 );
    glTexCoord2f(0.4338309,0.88613372); glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);
    glTexCoord2f(0.30242002,0.83510814); glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    glNormal3f( 0.0279181356746902,0,-0.999610212883227 );
    glTexCoord2f(0.4338309,0.88613372); glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);
    glTexCoord2f(0.51820943,0.85688082); glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    glTexCoord2f(0.51506351,0.99605022); glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);

    glNormal3f( 0.164464174658085,0.000623752907321731,0.986382859840106 );
    glTexCoord2f(0.565208,0.36406494); glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);
    glTexCoord2f(0.69863663,0.41370795); glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    glNormal3f( 0.164086062874053,0,0.986446026891736 );
    glTexCoord2f(0.565208,0.36406494); glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);
    glTexCoord2f(0.47980427,0.39429239); glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    glTexCoord2f(0.48240691,0.25464786); glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
};



$DRAW_MODEL{'Stair_Down'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.29145882,0.94328043); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.29145891,0.94328041); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.29145891,0.94328041); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.29145882,0.94328043); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.29145882,0.94328043); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.29145891,0.94328041); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.29145882,0.94328043); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.29145882,0.94328043); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.29145891,0.94328041); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.29145891,0.94328041); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.18170058,1.07304199); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.18170068,1.07304196); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);

    glNormal3f( 0.999999999999875,0,0 );
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);

    glNormal3f( -0.999999999999875,0,0 );
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,0.624694957087903,0.780868881816239 );
    glTexCoord2f(0.66463731,-0.13251723); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.66463731,-0.13251733); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536196,-0.13251733); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    glNormal3f( -0.999999999999572,0,0 );
    glTexCoord2f(0.10486952,-0.043304327); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0.999999999999572,0,0 );
    glTexCoord2f(0.10486967,-0.043304327); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    glNormal3f( -0.99999999999958,0,0 );
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,-0.043304327); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    glNormal3f( 0.99999999999958,0,0 );
    glTexCoord2f(0.89513048,0.055478278); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,-0.043304327); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,-0.043304327); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.66463813,-0.3242368); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536278,-0.32423681); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.66463813,-0.32423669); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.66463813,-0.3242368); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.66463731,-0.13251733); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Stair_Up'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,-0.043304327); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,-0.043304327); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,-0.043304327); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    glNormal3f( 0,0.624694957087903,0.780868881816239 );
    glTexCoord2f(0.66463731,-0.13251723); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.66463731,-0.13251733); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536196,-0.13251733); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    glNormal3f( -0.999999999999572,0,0 );
    glTexCoord2f(0.10486952,-0.043304327); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0.999999999999572,0,0 );
    glTexCoord2f(0.10486967,-0.043304327); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    glNormal3f( -0.99999999999958,0,0 );
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,-0.043304327); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    glNormal3f( 0.99999999999958,0,0 );
    glTexCoord2f(0.89513048,0.055478278); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,-0.043304327); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,0.055478278); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.66463813,-0.3242368); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536278,-0.32423681); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.66463813,-0.32423669); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536196,-0.13251733); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536278,-0.32423681); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Stairs'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,1.03958045); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.6646374,1.03958045); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060868111,0.0060869244); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.1707247,0.10486951); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.50000015,0.10486951); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391299,0.0060869244); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.17072464,0.89513063); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.49999993,0.89513049); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.0060871581,0.99391319); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.82927518,0.89513034); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.82927556,0.1048695); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.99391308,0.99391275); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391294,0.99391313); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.82927541,0.89513059); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.17072438,0.10486955); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.0060870017); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.82927527,0.10486951); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.49999979,0.10486952); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.9939131,0.0060868782); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.1707249,0.89513044); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.50000012,0.89513051); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.0060869711,0.99391284); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.4506087); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.5493913); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.0060869754,0.5493913); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.99391302,0.4506087); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.66463767,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.66463767,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.5493913); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536233,0.4506087); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,1.03958038); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536205,1.03958038); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    glNormal3f( 0.999999999999875,0,0 );
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);

    glNormal3f( -0.999999999999875,0,0 );
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.5493913); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513049,0.4506087); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486951,0.5493913); glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486951,0.4506087); glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,0.624694957087903,0.780868881816239 );
    glTexCoord2f(0.66463731,-0.13251723); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.33536269,1.13251723); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.33536196,-0.13251723); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.66463804,1.13251723); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.66463731,-0.13251733); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.33536196,-0.13251733); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    glNormal3f( -0.999999999999572,0,0 );
    glTexCoord2f(0.10486952,-0.043304327); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,1.04330433); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.10486952,0.055478278); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.89513048,0.94452172); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    glNormal3f( 0.999999999999572,0,0 );
    glTexCoord2f(0.10486967,-0.043304327); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.055478278); glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,1.04330433); glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,-0.043304327); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.89513033,0.94452172); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    glNormal3f( -0.99999999999958,0,0 );
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,-0.043304327); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.10486967,1.04330433); glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    glTexCoord2f(0.10486967,0.94452172); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.89513033,0.055478278); glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    glNormal3f( 0.99999999999958,0,0 );
    glTexCoord2f(0.89513048,0.055478278); glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,-0.043304327); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,0.94452172); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.89513048,-0.043304327); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.10486952,1.04330433); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.66463813,-0.3242368); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536278,-0.32423681); glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.66463813,-0.32423669); glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    glTexCoord2f(0.6646374,0.94079785); glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.33536205,0.94079785); glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    glTexCoord2f(0.66463813,-0.3242368); glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);

    glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    glTexCoord2f(0.33536269,1.13251733); glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    glTexCoord2f(0.66463731,-0.13251733); glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    glTexCoord2f(0.66463804,1.13251733); glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    glTexCoord2f(0.33536205,0.94079778); glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    glTexCoord2f(0.33536278,-0.32423669); glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    glTexCoord2f(0.6646374,0.94079778); glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Tree'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.15000276,0.10361004); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.24340308); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.24340308); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.10361004); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.24340308); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.10361004); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.15000276,0.18049621); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.18049621); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.01020972,0.16651691); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.15000276,0.16651691); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    glNormal3f( 0.852949898907319,0.493650865949391,-0.169662289567867 );
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( 0.594969430303541,0.794987683041385,0.11834678202964 );
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.63474982,0.99807288); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( 0.852949898907319,0.493650865949391,0.169662289567867 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);

    glNormal3f( 0.7230960078548,0.493650840686481,0.48315733556884 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);

    glNormal3f( 0.504390727878012,0.794987683180421,0.337023110813065 );
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.6190637,0.99107142); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);

    glNormal3f( 0.723096024396823,0.493650833159972,0.48315731850193 );
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( 0.337023110813065,0.794987683180421,0.504390727878013 );
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);
    glTexCoord2f(0.60097156,0.98553187); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( 0.48315731850193,0.493650833159972,0.723096024396823 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.64463275,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);

    glNormal3f( 0.169662336840592,0.493650850977916,0.852949898169036 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);

    glNormal3f( 0.11834678202964,0.794987683041384,0.594969430303541 );
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.5808086,0.98202248); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);

    glNormal3f( 0.169662289567867,0.493650865949391,0.852949898907319 );
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( -0.11834678202964,0.794987683041384,0.594969430303541 );
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);
    glTexCoord2f(0.55871849,0.98091334); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( -0.169662289567867,0.493650865949391,0.852949898907319 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.58586785,0.94655254); glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);

    glNormal3f( -0.48315733556884,0.493650840686481,0.7230960078548 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);

    glNormal3f( -0.337023110813065,0.794987683180421,0.504390727878013 );
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    glTexCoord2f(0.53489502,0.98197441); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);

    glNormal3f( -0.48315731850193,0.493650833159972,0.723096024396823 );
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( -0.504390727878013,0.794987683180421,0.337023110813065 );
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);
    glTexCoord2f(0.50928954,0.9857555); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( -0.723096024396823,0.493650833159972,0.48315731850193 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.5221988,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);

    glNormal3f( -0.852949898169036,0.493650850977917,0.169662336840592 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);

    glNormal3f( -0.594969430303541,0.794987683041384,0.11834678202964 );
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    glTexCoord2f(0.46801984,0.9857555); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);

    glNormal3f( -0.852949898907319,0.493650865949391,0.169662289567867 );
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( -0.594969430303541,0.794987683041384,-0.11834678202964 );
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);
    glTexCoord2f(0.44241434,0.98197441); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( -0.852949898907319,0.493650865949391,-0.169662289567867 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.45511058,0.94655254); glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);

    glNormal3f( -0.7230960078548,0.493650840686481,-0.48315733556884 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    glNormal3f( -0.504390727878013,0.794987683180421,-0.337023110813065 );
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.4185909,0.98091334); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    glNormal3f( -0.723096024396823,0.493650833159972,-0.48315731850193 );
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( -0.337023110813065,0.794987683180421,-0.504390727878013 );
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    glTexCoord2f(0.39650076,0.98202248); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( -0.48315731850193,0.493650833159972,-0.723096024396823 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.39144152,0.94655254); glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    glNormal3f( -0.169662336840592,0.493650850977916,-0.852949898169036 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    glNormal3f( -0.11834678202964,0.794987683041384,-0.594969430303541 );
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.37633783,0.98553186); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);

    glNormal3f( -0.169662289567867,0.493650865949391,-0.852949898907319 );
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( 0.11834678202964,0.794987683041384,-0.594969430303541 );
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);
    glTexCoord2f(0.35824565,0.99107143); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( 0.169662289567867,0.493650865949391,-0.852949898907319 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.33267662,0.94655254); glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);

    glNormal3f( 0.48315733556884,0.493650840686481,-0.7230960078548 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    glNormal3f( 0.337023110813065,0.794987683180421,-0.504390727878013 );
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    glTexCoord2f(0.34255958,0.99807286); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    glNormal3f( 0.48315731850193,0.493650833159972,-0.723096024396823 );
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( 0.504390727878012,0.794987683180421,-0.337023110813065 );
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    glTexCoord2f(0.33057252,1.00599943); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( 0.852949898169036,0.493650850977916,-0.169662336840592 );
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.79643966,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    glNormal3f( 0.723096024396823,0.493650833159972,-0.48315731850193 );
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.28083544,0.94655254); glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    glNormal3f( 0.594969430303541,0.794987683041384,-0.11834678202964 );
    glTexCoord2f(0.71832119,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    glTexCoord2f(0.64673683,1.00599941); glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.69647393,0.94655254); glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);

    glNormal3f( 0.931359139010414,0.313447461780265,0.185258853729829 );
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);

    glNormal3f( 0.931359120462821,0.313447486131001,-0.185258905774798 );
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.79643966,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    glNormal3f( 0.852949898169036,0.493650850977916,0.169662336840592 );
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.67167514,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( 0.931359120462821,0.313447486131001,0.185258905774798 );
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);

    glNormal3f( 0.789568131042117,0.313447487805829,0.527572591053471 );
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.72081993,0.87319156); glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);

    glNormal3f( 0.527572503462268,0.313447530535408,0.78956817260564 );
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);

    glNormal3f( 0.48315733556884,0.493650840686481,0.7230960078548 );
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.61595449,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( 0.527572591053471,0.313447487805829,0.789568131042117 );
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);

    glNormal3f( 0.185258905774798,0.313447486131001,0.931359120462822 );
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.64418163,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);

    glNormal3f( -0.185258853729829,0.313447461780265,0.931359139010414 );
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);

    glNormal3f( -0.169662336840592,0.493650850977916,0.852949898169036 );
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    glTexCoord2f(0.55459223,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    glNormal3f( -0.185258905774798,0.313447486131001,0.931359120462821 );
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);

    glNormal3f( -0.527572591053471,0.313447487805829,0.789568131042117 );
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.56682798,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);

    glNormal3f( -0.78956817260564,0.313447530535408,0.527572503462268 );
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);

    glNormal3f( -0.7230960078548,0.493650840686481,0.48315733556884 );
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    glTexCoord2f(0.48865469,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    glNormal3f( -0.789568131042117,0.313447487805829,0.527572591053471 );
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);

    glNormal3f( -0.931359120462821,0.313447486131001,0.185258905774798 );
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.48865469,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);

    glNormal3f( -0.931359139010414,0.313447461780265,-0.185258853729829 );
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);

    glNormal3f( -0.852949898169036,0.493650850977917,-0.169662336840592 );
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    glTexCoord2f(0.42271714,0.94655254); glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( -0.931359120462822,0.313447486131001,-0.185258905774798 );
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);

    glNormal3f( -0.789568131042117,0.313447487805829,-0.527572591053471 );
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.41048139,0.87319156); glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    glNormal3f( -0.527572503462268,0.313447530535408,-0.78956817260564 );
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    glNormal3f( -0.48315733556884,0.493650840686481,-0.7230960078548 );
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.36135488,0.94655254); glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( -0.527572591053471,0.313447487805829,-0.789568131042117 );
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    glNormal3f( -0.185258905774798,0.313447486131001,-0.931359120462821 );
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.33312775,0.87319156); glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    glNormal3f( 0.185258853729829,0.313447461780265,-0.931359139010414 );
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);

    glNormal3f( 0.169662336840592,0.493650850977917,-0.852949898169036 );
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    glTexCoord2f(0.30563423,0.94655254); glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    glNormal3f( 0.185258905774797,0.313447486131001,-0.931359120462822 );
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);

    glNormal3f( 0.527572591053471,0.313447487805829,-0.789568131042117 );
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.25648944,0.87319156); glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    glNormal3f( 0.78956817260564,0.313447530535408,-0.527572503462268 );
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    glNormal3f( 0.7230960078548,0.493650840686481,-0.48315733556884 );
    glTexCoord2f(0.18086972,0.87319155); glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    glTexCoord2f(0.25898819,0.94655254); glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    glNormal3f( 0.789568131042117,0.313447487805829,-0.527572591053471 );
    glTexCoord2f(0.18086972,0.87319155); glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    glNormal3f( 0.931359139010414,0.313447461780265,-0.185258853729829 );
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.75886466,0.87319156); glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);

    glNormal3f( 0.957695834075037,0.215706684037452,-0.190497548165026 );
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    glNormal3f( 0.957695834075037,0.215706684037452,0.190497548165026 );
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.81014554,0.7761601); glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);

    glNormal3f( 0.811895349615271,0.215706674378969,0.542491080020181 );
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);

    glNormal3f( 0.78956817260564,0.313447530535408,0.527572503462268 );
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.68258438,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);

    glNormal3f( 0.811895369424797,0.215706657501,0.542491057084187 );
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);

    glNormal3f( 0.542491057084187,0.215706657501,0.811895369424797 );
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.71324045,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);

    glNormal3f( 0.190497562148215,0.215706676229254,0.957695833052287 );
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);

    glNormal3f( 0.185258853729829,0.313447461780265,0.931359139010414 );
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.60561381,0.87319156); glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);

    glNormal3f( 0.190497548165026,0.215706684037452,0.957695834075037 );
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);

    glNormal3f( -0.190497548165026,0.215706684037452,0.957695834075037 );
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.62217874,0.7761601); glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);

    glNormal3f( -0.542491080020181,0.215706674378969,0.811895349615271 );
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);

    glNormal3f( -0.527572503462268,0.313447530535408,0.78956817260564 );
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    glTexCoord2f(0.52783221,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);

    glNormal3f( -0.542491057084187,0.215706657501,0.811895369424797 );
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);

    glNormal3f( -0.811895369424797,0.215706657501,0.542491057084187 );
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.53306431,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);

    glNormal3f( -0.957695833052287,0.215706676229254,0.190497562148215 );
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);

    glNormal3f( -0.931359139010414,0.313447461780265,0.185258853729829 );
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    glTexCoord2f(0.44947716,0.87319156); glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);

    glNormal3f( -0.957695834075037,0.215706684037452,0.190497548165026 );
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);

    glNormal3f( -0.957695834075037,0.215706684037452,-0.190497548165026 );
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.44424507,0.7761601); glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);

    glNormal3f( -0.811895349615271,0.215706674378969,-0.542491080020181 );
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    glNormal3f( -0.78956817260564,0.313447530535408,-0.527572503462268 );
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.37169556,0.87319156); glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    glNormal3f( -0.811895369424797,0.215706657501,-0.542491057084187 );
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    glNormal3f( -0.542491057084187,0.215706657501,-0.811895369424797 );
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.35513063,0.7761601); glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    glNormal3f( -0.190497562148215,0.215706676229254,-0.957695833052287 );
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    glNormal3f( -0.185258853729829,0.313447461780265,-0.931359139010414 );
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.29472499,0.87319156); glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);

    glNormal3f( -0.190497548165026,0.215706684037452,-0.957695834075037 );
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    glNormal3f( 0.190497548165026,0.215706684037452,-0.957695834075037 );
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.26406892,0.7761601); glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);

    glNormal3f( 0.542491080020181,0.215706674378969,-0.811895349615271 );
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    glNormal3f( 0.527572503462268,0.313447530535408,-0.78956817260564 );
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    glTexCoord2f(0.21844471,0.87319156); glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    glNormal3f( 0.542491057084187,0.215706657501,-0.811895369424797 );
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    glNormal3f( 0.957695833052287,0.215706676229254,-0.190497562148215 );
    glTexCoord2f(0.86251781,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.90571687,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    glNormal3f( 0.811895369424797,0.215706657501,-0.542491057084187 );
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.16716383,0.7761601); glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    glNormal3f( 0.973680575432198,-0.120147099626964,0.193677080412869 );
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);

    glNormal3f( 0.973680569967618,-0.120147073182655,-0.193677124289825 );
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.90571687,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    glNormal3f( 0.957695833052287,0.215706676229254,0.190497562148215 );
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.76063077,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);

    glNormal3f( 0.973680569967618,-0.120147073182655,0.193677124289825 );
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);

    glNormal3f( 0.82544655493486,-0.120147077001901,0.551545705117963 );
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.78618012,0.67046677); glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);

    glNormal3f( 0.551545793876656,-0.120147144275624,0.82544648583623 );
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    glNormal3f( 0.542491080020181,0.215706674378969,0.811895349615271 );
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.66724769,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);

    glNormal3f( 0.551545705117963,-0.120147077001901,0.82544655493486 );
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);

    glNormal3f( 0.193677124289825,-0.120147073182655,0.973680569967618 );
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.68327389,0.67046677); glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);

    glNormal3f( -0.193677080412869,-0.120147099626964,0.973680575432198 );
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);

    glNormal3f( -0.190497562148215,0.215706676229254,0.957695833052287 );
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    glTexCoord2f(0.57755196,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);

    glNormal3f( -0.193677124289825,-0.120147073182655,0.973680569967618 );
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);

    glNormal3f( -0.551545705117963,-0.120147077001901,0.82544655493486 );
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.58561474,0.67046677); glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);

    glNormal3f( -0.82544648583623,-0.120147144275624,0.551545793876656 );
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    glNormal3f( -0.811895349615271,0.215706674378969,0.542491080020181 );
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    glTexCoord2f(0.48865469,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);

    glNormal3f( -0.82544655493486,-0.120147077001901,0.551545705117963 );
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);

    glNormal3f( -0.973680569967618,-0.120147073182655,0.193677124289825 );
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.48865469,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);

    glNormal3f( -0.973680575432198,-0.120147099626964,-0.193677080412869 );
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);

    glNormal3f( -0.957695833052287,0.215706676229254,-0.190497562148215 );
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    glTexCoord2f(0.39975741,0.7761601); glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    glNormal3f( -0.973680569967618,-0.120147073182655,-0.193677124289825 );
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);

    glNormal3f( -0.82544655493486,-0.120147077001901,-0.551545705117963 );
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.39169463,0.67046678); glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    glNormal3f( -0.551545793876656,-0.120147144275624,-0.82544648583623 );
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    glNormal3f( -0.542491080020181,0.215706674378969,-0.811895349615271 );
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.31006169,0.7761601); glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    glNormal3f( -0.551545705117963,-0.120147077001901,-0.82544655493486 );
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    glNormal3f( -0.193677124289825,-0.120147073182655,-0.973680569967618 );
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.29403548,0.67046678); glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    glNormal3f( 0.193677080412869,-0.120147099626964,-0.973680575432198 );
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);

    glNormal3f( 0.190497562148214,0.215706676229254,-0.957695833052287 );
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    glTexCoord2f(0.2166786,0.7761601); glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    glNormal3f( 0.193677124289825,-0.120147073182655,-0.973680569967618 );
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);

    glNormal3f( 0.551545705117963,-0.120147077001901,-0.82544655493486 );
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.19112925,0.67046678); glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    glNormal3f( 0.82544648583623,-0.120147144275624,-0.551545793876656 );
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    glNormal3f( 0.811895349615271,0.215706674378969,-0.542491080020181 );
    glTexCoord2f(0.071592505,0.67046678); glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    glTexCoord2f(0.11479157,0.7761601); glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    glNormal3f( 0.82544655493486,-0.120147077001901,-0.551545705117963 );
    glTexCoord2f(0.071592505,0.67046678); glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    glNormal3f( 0.973680575432198,-0.120147099626964,-0.193677080412869 );
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.84266568,0.67046677); glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);

    glNormal3f( 0.908573417652906,-0.376606280038167,-0.18072646339242 );
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    glNormal3f( 0.908573417652906,-0.376606280038167,0.18072646339242 );
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.85651769,0.56001899); glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);

    glNormal3f( 0.770251357334272,-0.376606328144515,0.514665444853468 );
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    glNormal3f( 0.82544648583623,-0.120147144275624,0.551545793876656 );
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.7335797,0.67046677); glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);

    glNormal3f( 0.770251313983723,-0.376606268434297,0.514665553425078 );
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    glNormal3f( 0.514665553425078,-0.376606268434297,0.770251313983723 );
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.74698157,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    glNormal3f( 0.180726563579611,-0.376606335725282,0.908573374641961 );
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    glNormal3f( 0.193677080412869,-0.120147099626964,0.973680575432198 );
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.63418383,0.67046677); glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);

    glNormal3f( 0.18072646339242,-0.376606280038167,0.908573417652906 );
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    glNormal3f( -0.18072646339242,-0.376606280038167,0.908573417652906 );
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.6442054,0.56001899); glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);

    glNormal3f( -0.514665444853468,-0.376606328144515,0.770251357334272 );
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    glNormal3f( -0.551545793876656,-0.120147144275624,0.82544648583623 );
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    glTexCoord2f(0.53712915,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);

    glNormal3f( -0.514665553425078,-0.376606268434297,0.770251313983723 );
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    glNormal3f( -0.770251313983723,-0.376606268434297,0.514665553425078 );
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.54107387,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    glNormal3f( -0.908573374641961,-0.376606335725282,0.180726563579612 );
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    glNormal3f( -0.973680575432198,-0.120147099626964,0.193677080412869 );
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    glTexCoord2f(0.44018022,0.67046678); glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);

    glNormal3f( -0.908573417652906,-0.376606280038167,0.18072646339242 );
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    glNormal3f( -0.908573417652906,-0.376606280038167,-0.18072646339242 );
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.4362355,0.56001899); glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);

    glNormal3f( -0.770251357334272,-0.376606328144515,-0.514665444853468 );
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    glNormal3f( -0.82544648583623,-0.120147144275624,-0.551545793876656 );
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.34312555,0.67046678); glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    glNormal3f( -0.770251313983723,-0.376606268434297,-0.514665553425078 );
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    glNormal3f( -0.514665553425078,-0.376606268434297,-0.770251313983723 );
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.33310398,0.56001899); glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    glNormal3f( -0.180726563579612,-0.376606335725282,-0.908573374641961 );
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    glNormal3f( -0.19367708041287,-0.120147099626964,-0.973680575432198 );
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.24372968,0.67046678); glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);

    glNormal3f( -0.18072646339242,-0.376606280038167,-0.908573417652906 );
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    glNormal3f( 0.18072646339242,-0.376606280038167,-0.908573417652906 );
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.2303278,0.56001899); glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);

    glNormal3f( 0.514665444853468,-0.376606328144515,-0.770251357334272 );
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    glNormal3f( 0.551545793876656,-0.120147144275624,-0.82544648583623 );
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    glTexCoord2f(0.1346437,0.67046678); glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    glNormal3f( 0.514665553425078,-0.376606268434297,-0.770251313983723 );
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    glNormal3f( 0.908573374641961,-0.376606335725282,-0.180726563579612 );
    glTexCoord2f(0.91779901,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.90708053,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    glNormal3f( 0.770251313983723,-0.376606268434297,-0.514665553425078 );
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.12079168,0.56001899); glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    glNormal3f( 0.623235819575763,-0.772145531445475,0.123969316633238 );
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.84919307,0.38385446); glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);

    glNormal3f( 0.623235829629093,-0.772145514597524,-0.123969371029544 );
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.90708053,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    glNormal3f( 0.908573374641961,-0.376606335725282,0.180726563579612 );
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.80024957,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    glNormal3f( 0.623235829629093,-0.772145514597524,0.123969371029544 );
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);

    glNormal3f( 0.528353852482258,-0.772145513899506,0.353034717743204 );
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.80684273,0.45795642); glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    glNormal3f( 0.353034738588375,-0.772145525100142,0.528353822185156 );
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.75518378,0.374797); glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    glNormal3f( 0.514665444853468,-0.376606328144515,0.770251357334272 );
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.6953124,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    glNormal3f( 0.353034717743204,-0.772145513899506,0.528353852482258 );
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);

    glNormal3f( 0.123969371029544,-0.772145514597524,0.623235829629093 );
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.70654887,0.45795641); glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    glNormal3f( -0.123969316633238,-0.772145531445475,0.623235819575763 );
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.65589456,0.35595595); glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);

    glNormal3f( -0.180726563579612,-0.376606335725282,0.908573374641961 );
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    glTexCoord2f(0.59291331,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    glNormal3f( -0.123969371029544,-0.772145514597524,0.623235829629093 );
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);

    glNormal3f( -0.353034717743204,-0.772145513899506,0.528353852482258 );
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.60234152,0.45795641); glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    glNormal3f( -0.528353822185156,-0.772145525100142,0.353034738588375 );
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.54245419,0.33267348); glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    glNormal3f( -0.770251357334272,-0.376606328144515,0.514665444853468 );
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    glTexCoord2f(0.48865468,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    glNormal3f( -0.528353852482258,-0.772145513899506,0.353034717743204 );
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);

    glNormal3f( -0.623235829629093,-0.772145514597524,0.123969371029544 );
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.48865469,0.45795641); glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    glNormal3f( -0.623235819575763,-0.772145531445475,-0.123969316633238 );
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.40644448,0.34094235); glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);

    glNormal3f( -0.908573374641961,-0.376606335725282,-0.180726563579611 );
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    glTexCoord2f(0.38439606,0.56001899); glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    glNormal3f( -0.623235829629093,-0.772145514597524,-0.123969371029544 );
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);

    glNormal3f( -0.528353852482258,-0.772145513899506,-0.353034717743204 );
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.37496786,0.4579564); glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    glNormal3f( -0.353034738588375,-0.772145525100142,-0.528353822185156 );
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.29912214,0.36245196); glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    glNormal3f( -0.514665444853468,-0.376606328144515,-0.770251357334272 );
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.28199698,0.56001899); glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    glNormal3f( -0.353034717743204,-0.772145513899506,-0.528353852482258 );
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);

    glNormal3f( -0.123969371029544,-0.772145514597524,-0.623235829629093 );
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.2707605,0.4579564); glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    glNormal3f( 0.123969316633238,-0.772145531445475,-0.623235819575763 );
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.20110988,0.37859758); glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);

    glNormal3f( 0.180726563579611,-0.376606335725282,-0.908573374641961 );
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    glTexCoord2f(0.17705981,0.56001899); glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    glNormal3f( 0.123969371029544,-0.772145514597524,-0.623235829629093 );
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);

    glNormal3f( 0.353034717743204,-0.772145513899506,-0.528353852482258 );
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.17046663,0.4579564); glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    glNormal3f( 0.528353822185156,-0.772145525100142,-0.353034738588375 );
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.11168619,0.38378728); glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    glNormal3f( 0.770251357334272,-0.376606328144515,-0.514665444853468 );
    glTexCoord2f(0.070228823,0.45795639); glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    glTexCoord2f(0.059510376,0.56001899); glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    glNormal3f( 0.528353852482258,-0.772145513899506,-0.353034717743204 );
    glTexCoord2f(0.070228823,0.45795639); glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);

    glNormal3f( 0.623235819575763,-0.772145531445475,-0.123969316633238 );
    glTexCoord2f(0.86562334,0.38378742); glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.85693278,0.45795642); glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);

    glNormal3f( 0.304772613607861,-0.95049381928895,-0.0606230442005259 );
    glTexCoord2f(0.86562334,0.38378742); glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.87692441,0.31094667); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.89296828,0.38285837); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);

    glNormal3f( 0.304772613607861,-0.95049381928895,0.0606230442005259 );
    glTexCoord2f(0.82199662,0.38250436); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.83919279,0.31126907); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.84919307,0.38385446); glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);

    glNormal3f( 0.528353822185156,-0.772145525100142,0.353034738588375 );
    glTexCoord2f(0.77619885,0.37859741); glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.75693081,0.45795641); glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);

    glNormal3f( 0.258373745885895,-0.950493819332569,0.172639818256034 );
    glTexCoord2f(0.77619885,0.37859741); glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    glTexCoord2f(0.79707636,0.3089041); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.80310571,0.38139168); glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);

    glNormal3f( 0.172639818256034,-0.950493819332569,0.258373745885895 );
    glTexCoord2f(0.72792485,0.37125113); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.75093491,0.30094888); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.75518378,0.374797); glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    glNormal3f( 0.123969316633238,-0.772145531445475,0.623235819575763 );
    glTexCoord2f(0.67818786,0.36245149); glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.65535627,0.45795641); glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);

    glNormal3f( 0.0606230442005257,-0.95049381928895,0.304772613607861 );
    glTexCoord2f(0.67818786,0.36245149); glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);
    glTexCoord2f(0.70267303,0.29107259); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.70592598,0.36647373); glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);

    glNormal3f( -0.0606230442005258,-0.95049381928895,0.304772613607861 );
    glTexCoord2f(0.62714796,0.35137963); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.65363307,0.27763999); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.65589456,0.35595595); glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);

    glNormal3f( -0.353034738588375,-0.772145525100142,0.528353822185156 );
    glTexCoord2f(0.57086482,0.34094282); glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    glTexCoord2f(0.54709445,0.45795641); glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);

    glNormal3f( -0.172639818256034,-0.950493819332569,0.258373745885895 );
    glTexCoord2f(0.57086482,0.34094282); glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    glTexCoord2f(0.59626992,0.2641011); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.60067338,0.3449307); glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);

    glNormal3f( -0.258373745885895,-0.950493819332569,0.172639818256034 );
    glTexCoord2f(0.51074328,0.32952243); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.53490917,0.24713356); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.54245419,0.33267348); glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    glNormal3f( -0.623235819575763,-0.772145531445475,0.123969316633238 );
    glTexCoord2f(0.4348549,0.33267337); glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    glTexCoord2f(0.4302149,0.4579564); glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);

    glNormal3f( -0.304772613607861,-0.95049381928895,0.0606230442005259 );
    glTexCoord2f(0.4348549,0.33267337); glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);
    glTexCoord2f(0.44239984,0.2471346); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.46656638,0.32952251); glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);

    glNormal3f( -0.304772613607861,-0.95049381928895,-0.0606230442005259 );
    glTexCoord2f(0.37663601,0.34493118); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.38104115,0.26410093); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.40644448,0.34094235); glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);

    glNormal3f( -0.528353822185156,-0.772145525100142,-0.353034738588375 );
    glTexCoord2f(0.32141542,0.35595561); glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.32195311,0.4579564); glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);

    glNormal3f( -0.258373745885895,-0.950493819332569,-0.172639818256034 );
    glTexCoord2f(0.32141542,0.35595561); glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    glTexCoord2f(0.32367495,0.27763785); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.35016083,0.35138003); glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);

    glNormal3f( -0.172639818256034,-0.950493819332569,-0.258373745885895 );
    glTexCoord2f(0.27138281,0.36647321); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.27463456,0.29107476); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.29912214,0.36245196); glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    glNormal3f( -0.123969316633238,-0.772145531445475,-0.623235819575763 );
    glTexCoord2f(0.22212535,0.3747977); glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.22037856,0.4579564); glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);

    glNormal3f( -0.0606230442005259,-0.95049381928895,-0.304772613607861 );
    glTexCoord2f(0.22212535,0.3747977); glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);
    glTexCoord2f(0.22637703,0.30094966); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.2493847,0.37125042); glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);

    glNormal3f( 0.0606230442005257,-0.95049381928895,-0.304772613607861 );
    glTexCoord2f(0.17420432,0.38139158); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.18023255,0.30890174); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.20110988,0.37859758); glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);

    glNormal3f( 0.353034738588375,-0.772145525100142,-0.528353822185156 );
    glTexCoord2f(0.12811605,0.38385414); glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    glTexCoord2f(0.12037663,0.45795639); glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);

    glNormal3f( 0.172639818256034,-0.950493819332569,-0.258373745885895 );
    glTexCoord2f(0.12811605,0.38385414); glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    glTexCoord2f(0.13811544,0.31127004); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.15531303,0.38250466); glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);

    glNormal3f( 0.258373745885895,-0.950493819332569,-0.172639818256034 );
    glTexCoord2f(0.084340929,0.38285852); glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    glTexCoord2f(0.10038548,0.31094724); glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    glTexCoord2f(0.11168619,0.38378728); glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    glNormal3f( -0.00453782273431179,0.999989704029412,0 );
    glTexCoord2f(0.61840762,0.53439169); glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    glTexCoord2f(0.61705267,0.52757992); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    glNormal3f( 0.980775164337572,0.00445064486016523,-0.195090411806777 );
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);

    glNormal3f( -0.00453783896691178,0.999989703955751,0 );
    glTexCoord2f(0.61705267,0.52757992); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);

    glNormal3f( 0.980775164337572,0.00445064486016523,0.195090411806777 );
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);

    glNormal3f( 0.831461062795286,0.00377307683658746,0.555570216036208 );
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.25176752,0.19887348); glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);

    glNormal3f( -0.0045377836269756,0.999989704206876,0 );
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);

    glNormal3f( 0.831461062946238,0.00377307682763593,0.555570215810355 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    glNormal3f( -0.0045378840169434,0.999989703751318,0 );
    glTexCoord2f(0.60741938,0.51794663); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);

    glNormal3f( 0.555564525681146,0.00252108935886468,0.831469603721704 );
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);

    glNormal3f( 0.195088336315928,0.000885288935368095,0.980785275836146 );
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.25176752,0.21276391); glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);

    glNormal3f( -0.00453781057607134,0.999989704084585,0 );
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    glNormal3f( 0.195088337844137,0.000885288887033798,0.980785275532213 );
    glTexCoord2f(0.44753904,0.21970913); glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);

    glNormal3f( -0.00453787020924549,0.999989703813976,0 );
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    glNormal3f( -0.195088336253671,-0.00088528887981644,0.98078527584858 );
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.44753904,0.21970913); glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);

    glNormal3f( -0.555564525530471,-0.00252108930666955,0.83146960382254 );
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.23359956); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.25176752,0.22665434); glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);

    glNormal3f( -0.00453783896691177,0.999989703955751,0 );
    glTexCoord2f(0.58802112,0.52180519); glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    glTexCoord2f(0.58416256,0.54120346); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    glTexCoord2f(0.58802112,0.54697819); glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);

    glNormal3f( -0.555564525530471,-0.00252108930666955,0.831469603822539 );
    glTexCoord2f(0.44753904,0.23359956); glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    glTexCoord2f(0.25176752,0.23359956); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    glNormal3f( -0.00453782440883781,0.999989704021814,0 );
    glTexCoord2f(0.58416256,0.52757992); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    glTexCoord2f(0.58416256,0.54120346); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    glTexCoord2f(0.58280762,0.53439169); glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);

    glNormal3f( -0.831461062946588,-0.00377307675054529,0.555570215810355 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);

    glNormal3f( -0.980775164138318,-0.00445064744375367,0.195090412749541 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);

    glNormal3f( -0.98077517811216,-0.00445064496814094,0.195090342555518 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);

    glNormal3f( -0.98077517811216,-0.00445064496814094,-0.195090342555517 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);

    glNormal3f( -0.831461064304374,-0.00377307684343553,-0.555570213777676 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);

    glNormal3f( -0.831461062946588,-0.00377307675054529,-0.555570215810355 );
    glTexCoord2f(0.44753904,0.21970912); glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);

    glNormal3f( -0.00453781057607134,0.999989704084585,0 );
    glTexCoord2f(0.59379585,0.55083675); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    glTexCoord2f(0.59379585,0.51794663); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);

    glNormal3f( -0.555564525530471,-0.00252108930666955,-0.831469603822539 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.19192826); glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);

    glNormal3f( -0.19508833734389,-0.000885288924205527,-0.980785275631683 );
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);

    glNormal3f( -0.0045378840169434,0.999989703751318,0 );
    glTexCoord2f(0.60060762,0.55219169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    glTexCoord2f(0.60060762,0.51659169); glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    glTexCoord2f(0.60741938,0.55083675); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    glNormal3f( -0.195088336253671,-0.00088528887981644,-0.98078527584858 );
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    glNormal3f( 0.195088337844137,0.000885288887033798,-0.980785275532213 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.44753904,0.20581869); glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);

    glNormal3f( 0.555564525530266,0.00252108935174108,-0.831469603822539 );
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);

    glNormal3f( -0.00453783896691177,0.999989703955751,0 );
    glTexCoord2f(0.61319412,0.54697819); glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    glTexCoord2f(0.61319412,0.52180519); glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    glTexCoord2f(0.61705267,0.54120346); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);

    glNormal3f( 0.555564525681146,0.00252108935886468,-0.831469603721704 );
    glTexCoord2f(0.44753904,0.21970912); glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    glTexCoord2f(0.25176752,0.21970912); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    glNormal3f( 0.980775178538197,0.0044506475090987,-0.195090340355736 );
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.25176752,0.18498305); glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);

    glNormal3f( 0.831461062946238,0.00377307682763593,-0.555570215810355 );
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.17803783); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.17803783); glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);

    glNormal3f( 0.980775178538197,0.0044506475090987,0.195090340355736 );
    glTexCoord2f(0.25176752,0.19887348); glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    glTexCoord2f(0.44753904,0.19887348); glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    glNormal3f( 0.00453524133026469,-0.999989715740155,0 );
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    glTexCoord2f(0.82508346,0.35855901); glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    glTexCoord2f(0.82372851,0.35174724); glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);

    glNormal3f( 0.00453796854644008,-0.999989703367725,0 );
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);

    glNormal3f( 0.555564525530266,0.00252108935174108,0.831469603822539 );
    glTexCoord2f(0.25176752,0.21276391); glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.21276391); glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);

    glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);

    glNormal3f( 0.00453773717516903,-0.999989704417665,0 );
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    glTexCoord2f(0.83471675,0.33530219); glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);

    glNormal3f( -0.19508833734389,-0.000885288924205527,0.980785275631683 );
    glTexCoord2f(0.25176752,0.22665434); glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    glTexCoord2f(0.25176752,0.21970913); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.44753904,0.22665434); glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    glNormal3f( 0.00453847122415697,-0.99998970108644,0 );
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);

    glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    glTexCoord2f(0.84834028,0.33530219); glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);

    glNormal3f( -0.831461064304374,-0.00377307684343553,0.555570213777676 );
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);

    glNormal3f( 0.00453667275114226,-0.999989709247225,0 );
    glTexCoord2f(0.85797357,0.34493548); glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);

    glNormal3f( 0.00453892976756193,-0.999989699005227,0 );
    glTexCoord2f(0.85932851,0.35174724); glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    glTexCoord2f(0.85797357,0.34493548); glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);

    glNormal3f( -0.980775164138318,-0.00445064744375367,-0.195090412749541 );
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);

    glNormal3f( 0.00453667275114226,-0.999989709247225,0 );
    glTexCoord2f(0.85411502,0.36433374); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.85411502,0.33916074); glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    glTexCoord2f(0.85797357,0.35855901); glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);

    glNormal3f( -0.555564525530471,-0.00252108930666955,-0.83146960382254 );
    glTexCoord2f(0.25176752,0.19887347); glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.19192826); glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.19887347); glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    glNormal3f( 0.00453847122415697,-0.99998970108644,0 );
    glTexCoord2f(0.84152851,0.36954724); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.84152851,0.33394724); glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    glTexCoord2f(0.84834028,0.3681923); glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);

    glNormal3f( 0.195088336315928,0.000885288935368095,-0.980785275836146 );
    glTexCoord2f(0.25176752,0.2127639); glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    glTexCoord2f(0.25176752,0.20581869); glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    glTexCoord2f(0.44753904,0.2127639); glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.82894201,0.33916074); glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    glTexCoord2f(0.83471675,0.3681923); glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);

    glNormal3f( 0.00453796854644008,-0.999989703367726,0 );
    glTexCoord2f(0.82508346,0.35855901); glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    glTexCoord2f(0.82508346,0.34493548); glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    glTexCoord2f(0.82894201,0.36433374); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);

    glNormal3f( 0.831461062795286,0.00377307683658746,-0.555570216036208 );
    glTexCoord2f(0.25176752,0.18498305); glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    glTexCoord2f(0.25176752,0.17803783); glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    glTexCoord2f(0.44753904,0.18498305); glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
};



$DRAW_MODEL{'Wall'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        glColor3f($brightness, $brightness, $brightness);

if ( $south != WALL ) {

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $west != WALL ) {

    glNormal3f( -1,0,0 );# west face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
}

if ( $top != WALL ) {

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
}

if ( $east != WALL ) {

    glNormal3f( 1,0,0 );# east face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $north != WALL ) {

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}
};

