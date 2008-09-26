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
}

our $ZCOUNT;

our %DRAW_MODEL;





$DRAW_MODEL{'1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1D_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(5.5511151e-017,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_1DL1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.59787551); glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_2D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'2S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'2S_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0.5,0.6); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0); glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.7); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0.7); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,1.4); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0.7); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0.5,0); glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0.7); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'3S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'4D'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
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

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1.1); glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1.1); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0,1.1); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(0,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(0,0.70710678); glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    glTexCoord2f(0.5,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0.70710678); glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'Cursor'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
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
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
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

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'N'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0.1); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,0.1); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0,0.1); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 );# top left face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
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

    glNormal3f( 0.707106781186547,0.707106781186547,0 );# top right face
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    glTexCoord2f(0.5,0.70710678); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
};



$DRAW_MODEL{'Wall'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    glNormal3f( 1,0,0 );# right face
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    glTexCoord2f(1,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,0); glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    glTexCoord2f(1,1); glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(0,1); glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    glTexCoord2f(1,0); glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

