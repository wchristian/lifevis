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



$DRAW_MODEL{'Creature'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator) = @_;
        my $brightness = ($y/($ZCOUNT-15)) * $brightness_modificator;
        glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -0.106268403739577,-0.876115466235509,0.470243252146779 );
    glTexCoord2f(0.20280386,0.08802961); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.19233865,0.10545201); glVertex3f(-0.047862402+$x,-0.4715314+$y,0.046313888+$z);

    glNormal3f( -0.0840847660298682,-0.582501551754645,0.808468734290407 );
    glTexCoord2f(0.3901149,0.73639929); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);
    glTexCoord2f(0.43057749,0.74620214); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.36294264,0.74918978); glVertex3f(-0.25066798+$x,-0.43575059+$y,0.046313888+$z);

    glNormal3f( -0.200038053835492,-0.637771305852345,0.743796032826946 );
    glTexCoord2f(0.20280386,0.08802961); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.20368849,0.069280203); glVertex3f(-0.25066798+$x,-0.4715314+$y,0.0088156086+$z);

    glNormal3f( -0.00416695267439352,0.215600521792012,0.976472760249062 );
    glTexCoord2f(0.094886327,0.68393692); glVertex3f(-0.23763047+$x,0.57147892+$y,0.048188801+$z);
    glTexCoord2f(0.13522486,0.66968256); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.18712671,0.68947711); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);

    glNormal3f( 0.0168708528184641,0.979958612222282,0.198485497345669 );
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.50039007,0.23875933); glVertex3f(0.0028389911+$x,0.5929474+$y,-0.00055896092+$z);
    glTexCoord2f(0.50283358,0.22693707); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);

    glNormal3f( 0.477549077338356,0.875181817800788,0.0774833177154468 );
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.47640619,0.31453315); glVertex3f(0.25634596+$x,0.58400221+$y,-0.0099335305+$z);

    glNormal3f( 0.0270900083637105,0.988837661921313,0.146513514096299 );
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.50039007,0.23875933); glVertex3f(0.0028389911+$x,0.5929474+$y,-0.00055896092+$z);

    glNormal3f( 0.238526874543764,0.187432252329291,0.952876739619114 );
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.33124671,0.66574384); glVertex3f(0.29690707+$x,0.53033101+$y,0.046313888+$z);

    glNormal3f( -0.0369591449009589,0.191528411183761,0.980790950874657 );
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.28446896,0.66177043); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.30496595,0.66572553); glVertex3f(0.23751401+$x,0.53033101+$y,0.055688457+$z);

    glNormal3f( -0.0308767694430502,0.230012276270699,0.972697783421723 );
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.27550147,0.66572583); glVertex3f(0.1708779+$x,0.53033101+$y,0.055688457+$z);

    glNormal3f( 0.771499028694934,0.460300631646084,0.439218143100885 );
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.45948859,0.32509084); glVertex3f(0.30704735+$x,0.5392762+$y,-0.00055896092+$z);

    glNormal3f( 0.49292257144286,-0.447021646258939,0.746457625279631 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.18297638,0.20128107); glVertex3f(0.25634596+$x,-0.4178602+$y,0.046313888+$z);

    glNormal3f( 0.0487761576472401,-0.987368883632126,0.150743404765252 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.1646894,0.1982503); glVertex3f(0.25634596+$x,-0.4715314+$y,-0.0099335305+$z);

    glNormal3f( 0.0348352526380079,-0.197446104898103,0.979694616109639 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.19874453,0.15622009); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.20186529,0.12427707); glVertex3f(0.0028389911+$x,-0.4268054+$y,0.055688457+$z);

    glNormal3f( 0.0333529165357921,-0.98303028627137,0.180385806625092 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.18357831,0.1212463); glVertex3f(0.0028389911+$x,-0.4804766+$y,-0.00055896092+$z);

    glNormal3f( 0.553013199849775,-0.602784408976738,0.575175935767898 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.17421605,0.21707536); glVertex3f(0.30704735+$x,-0.4268054+$y,-0.00055896092+$z);

    glNormal3f( 0.0283752894133991,-0.281454401003641,0.959154973456525 );
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);
    glTexCoord2f(0.20498604,0.092334048); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.19233865,0.10545201); glVertex3f(-0.047862402+$x,-0.4715314+$y,0.046313888+$z);

    glNormal3f( -0.0333529163220354,-0.983030286512093,-0.180385805352771 );
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.18357831,0.1212463); glVertex3f(0.0028389911+$x,-0.4804766+$y,-0.00055896092+$z);

    glNormal3f( -0.0283752862230259,-0.281454437960423,-0.95915496270631 );
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.1836084,0.156421); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.1830526,0.13920043); glVertex3f(0.053540384+$x,-0.4715314+$y,-0.047431809+$z);

    glNormal3f( -0.492922562883874,-0.447021626814268,-0.746457642576134 );
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.21755825,0.075643117); glVertex3f(-0.25066798+$x,-0.4178602+$y,-0.047431809+$z);

    glNormal3f( -0.0348352526132132,-0.19744610319985,-0.979694616452784 );
    glTexCoord2f(0.14743906,0.18802063); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.13035954,0.13229987); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.14499269,0.089285945); glVertex3f(0.0028389911+$x,-0.4268054+$y,-0.056806379+$z);

    glNormal3f( -0.0487761568448478,-0.9873688837976,-0.150743403941031 );
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.20368849,0.069280203); glVertex3f(-0.25066798+$x,-0.4715314+$y,0.0088156086+$z);

    glNormal3f( -0.553013200682515,-0.602784406125349,-0.575175937955501 );
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.22095914,0.058283216); glVertex3f(-0.30136937+$x,-0.4268054+$y,-0.00055896092+$z);

    glNormal3f( -0.646192585823762,0.755358395812452,-0.108944187096141 );
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);

    glNormal3f( -0.0222352511344451,0.969732244133197,-0.243156263121849 );
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.49225036,0.24399407); glVertex3f(0.021670937+$x,0.58400221+$y,-0.047431809+$z);

    glNormal3f( 0.047779444467653,0.247600995928206,-0.96768324957174 );
    glTexCoord2f(0.61170523,0.28712711); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.615434,0.32434555); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.60286382,0.30769012); glVertex3f(-0.23183603+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( -0.220884063503343,0.239606278641957,-0.945409467757545 );
    glTexCoord2f(0.61170523,0.28712711); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.59075291,0.30248891); glVertex3f(-0.26080825+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.58335771,0.29013519); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);

    glNormal3f( -0.0292311270590236,0.986991375760133,-0.158093533662761 );
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.51022401,0.20772269); glVertex3f(-0.098563797+$x,0.5929474+$y,0.018190179+$z);
    glTexCoord2f(0.50039007,0.23875933); glVertex3f(0.0028389911+$x,0.5929474+$y,-0.00055896092+$z);

    glNormal3f( -0.0302744322870529,0.208365812862808,-0.977582296678759 );
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);
    glTexCoord2f(0.4902607,0.22937897); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.49519864,0.1909265); glVertex3f(-0.14636796+$x,0.5392762+$y,-0.056806379+$z);

    glNormal3f( 0.474465408339747,0.655203670792816,-0.587869650576228 );
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.4584961,0.32344149); glVertex3f(0.29690707+$x,0.5392762+$y,-0.047431809+$z);

    glNormal3f( 0.0731744548701194,0.959625004610281,-0.271597771863429 );
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.47640619,0.31453315); glVertex3f(0.25634596+$x,0.58400221+$y,-0.0099335305+$z);

    glNormal3f( 0.0303532134045174,0.068816703253583,-0.997167460253958 );
    glTexCoord2f(0.77206831,0.43481649); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.73907641,0.43581228); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.73506609,0.42687378); glVertex3f(0.1708779+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( -0.00135511756243592,0.331809667242205,-0.943345381279311 );
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.4902607,0.22937897); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.49225036,0.24399407); glVertex3f(0.021670937+$x,0.58400221+$y,-0.047431809+$z);

    glNormal3f( 0.024071323370467,0.0350836120584347,-0.999094445763827 );
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.46888095,0.26443648); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.47642103,0.25819076); glVertex3f(0.078166776+$x,0.5392762+$y,-0.056806379+$z);

    glNormal3f( 0.0354168743520865,0.114710048779291,-0.992767470115828 );
    glTexCoord2f(0.77206831,0.43481649); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.75694129,0.44659481); glVertex3f(0.23751401+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( 0.10626840254448,-0.876115457948911,-0.470243267855707 );
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.1830526,0.13920043); glVertex3f(0.053540384+$x,-0.4715314+$y,-0.047431809+$z);

    glNormal3f( 0.0840847727871347,-0.58250153973813,-0.808468742245515 );
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);
    glTexCoord2f(0.1836084,0.156421); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.17393592,0.20249224); glVertex3f(0.25634596+$x,-0.43575059+$y,-0.047431809+$z);

    glNormal3f( 0.200038053865414,-0.637771308026502,-0.743796030954658 );
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.1646894,0.1982503); glVertex3f(0.25634596+$x,-0.4715314+$y,-0.0099335305+$z);

    glNormal3f( -0.756470187181942,0.16576058217786,0.632673917038607 );
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.23666941,0.063257738); glVertex3f(-0.30136937+$x,-0.3731342+$y,-0.0099335305+$z);

    glNormal3f( -0.833101949539718,0.400171277684449,0.381843017730478 );
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.22095914,0.058283216); glVertex3f(-0.30136937+$x,-0.4268054+$y,-0.00055896092+$z);

    glNormal3f( -0.0285573336881985,-0.0404657550610116,0.998772747605762 );
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.24604123,0.25041966); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.22362244,0.26624108); glVertex3f(0.053540384+$x,-0.3731342+$y,0.055688457+$z);

    glNormal3f( -0.0156059580991715,-0.0884545719890295,0.995957952308251 );
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.20120357,0.28997311); glVertex3f(0.0028389911+$x,-0.319463+$y,0.055688457+$z);

    glNormal3f( -0.833101949498503,-0.400171276101877,0.381843019478932 );
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.25394641,0.065711693); glVertex3f(-0.30136937+$x,-0.319463+$y,-0.00055896092+$z);

    glNormal3f( -0.0622426606033551,0.0124881752920015,0.997982914021524 );
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.089129312,0.29394813); glVertex3f(-0.25066798+$x,-0.3105178+$y,0.046313888+$z);

    glNormal3f( -0.0156059581663733,0.0884545716720823,0.995957952335347 );
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.20498604,0.092334048); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.20186529,0.12427707); glVertex3f(0.0028389911+$x,-0.4268054+$y,0.055688457+$z);

    glNormal3f( -0.480417288203707,-0.032513436421513,0.876437165829394 );
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.21587981,0.07130072); glVertex3f(-0.25066798+$x,-0.43575059+$y,0.046313888+$z);

    glNormal3f( -0.0769068418032388,-0.01383836336298,0.996942243755016 );
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);
    glTexCoord2f(0.13074413,0.37699043); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.082723463,0.3453671); glVertex3f(-0.26515409+$x,-0.1942302+$y,0.046313888+$z);

    glNormal3f( -0.0134680653567358,-0.0436211401865884,0.998957360123228 );
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.16917606,0.37699003); glVertex3f(-0.069591572+$x,-0.1226686+$y,0.055688457+$z);

    glNormal3f( -0.424997304710897,-0.229417615652067,0.87563967967252 );
    glTexCoord2f(0.27172473,0.093638778); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.27137747,0.072972422); glVertex3f(-0.30136937+$x,-0.2657918+$y,0.0088156086+$z);

    glNormal3f( -0.467558664709071,0.108168305279755,0.877318934475015 );
    glTexCoord2f(0.27172473,0.093638778); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.25339601,0.08226002); glVertex3f(-0.25066798+$x,-0.3105178+$y,0.046313888+$z);

    glNormal3f( -0.0331207595535208,0.0536367051041765,0.998011081678037 );
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.19479792,0.32161558); glVertex3f(-0.011647121+$x,-0.24790139+$y,0.055688457+$z);

    glNormal3f( -0.956306272107178,0.0740990735355399,0.282820864204973 );
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.3009829,0.082045111); glVertex3f(-0.30136937+$x,-0.1584494+$y,-0.0099335305+$z);

    glNormal3f( -0.977403475369359,0.152931010907871,0.145926530276698 );
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.28502938,0.077267731); glVertex3f(-0.30136937+$x,-0.2121206+$y,-0.00055896092+$z);

    glNormal3f( 0.0855174621055841,-0.115407879466743,0.989630125366043 );
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.089109161,0.41258855); glVertex3f(-0.25066798+$x,-0.042161799+$y,0.055688457+$z);

    glNormal3f( 0.0203743253258542,-0.0989842972167856,0.994880392696537 );
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.11793308,0.41654356); glVertex3f(-0.18548047+$x,-0.033216598+$y,0.055688457+$z);

    glNormal3f( -0.3201760498537,-0.0533752731675479,0.945853253583436 );
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.069912333,0.39283083); glVertex3f(-0.29412631+$x,-0.086887798+$y,0.046313888+$z);

    glNormal3f( -0.956622049002221,-0.210773036253194,0.201119324162055 );
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.31742938,0.086464276); glVertex3f(-0.30136937+$x,-0.1047782+$y,-0.00055896092+$z);

    glNormal3f( -0.0785159644633185,0.0635755040770387,0.994883610582537 );
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.30216394,0.12662889); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.31668193,0.14729724); glVertex3f(-0.10580685+$x,-0.060052198+$y,0.055688457+$z);

    glNormal3f( -0.488050363083578,-0.17768934666926,0.854536915044774 );
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.28944395,0.088096885); glVertex3f(-0.26515409+$x,-0.1942302+$y,0.046313888+$z);

    glNormal3f( -0.348650170189956,-0.0664251685734055,0.934896120329157 );
    glTexCoord2f(0.070717521,0.41360079); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);
    glTexCoord2f(0.079500894,0.44027575); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.069911928,0.43238382); glVertex3f(-0.29412631+$x,0.0025642017+$y,0.046313888+$z);

    glNormal3f( -0.473265475452121,0.0766420028462153,0.877579508161396 );
    glTexCoord2f(0.070717521,0.41360079); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.083007476,0.4285382); glVertex3f(-0.26515409+$x,-0.0063809978+$y,0.055688457+$z);

    glNormal3f( -0.967201516709678,0.0497241779952693,0.249095829345241 );
    glTexCoord2f(0.33784873,0.093532925); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.32402361,0.088811313); glVertex3f(-0.29412631+$x,-0.086887798+$y,0.046313888+$z);

    glNormal3f( -0.960316386185375,-0.0706892711578015,0.269806347899824 );
    glTexCoord2f(0.33784873,0.093532925); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.33387585,0.09088344); glVertex3f(-0.30136937+$x,-0.051106998+$y,0.0088156086+$z);

    glNormal3f( -0.996556881669306,0.0210136589477038,0.0802047862360952 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.37628549,0.10608244); glVertex3f(-0.30136937+$x,0.092016197+$y,-0.019308101+$z);
    glTexCoord2f(0.36431503,0.10275598); glVertex3f(-0.30136937+$x,0.056235402+$y,-0.0099335305+$z);

    glNormal3f( -0.998194597591907,0.0434543225365642,0.0414640469710782 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.34826304,0.096311053); glVertex3f(-0.30136937+$x,0.0025642017+$y,-0.00055896092+$z);

    glNormal3f( -0.447661113489127,-0.0768890713590787,0.890891462623373 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.3761691,0.11069922); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.38297765,0.10603307); glVertex3f(-0.29412631+$x,0.1099066+$y,0.046313888+$z);

    glNormal3f( -0.998194597388825,-0.0434543135732645,0.0414640612535504 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.38250839,0.10636173); glVertex3f(-0.30136937+$x,0.1099066+$y,-0.00055896092+$z);

    glNormal3f( -0.43494759722494,0.0880458665976184,0.896140900217887 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.35473127,0.10443676); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.36484446,0.10973781); glVertex3f(-0.26515409+$x,0.056235402+$y,0.055688457+$z);

    glNormal3f( -0.963781130709629,-0.026910122662822,0.265333332595702 );
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.3508209,0.096639385); glVertex3f(-0.29412631+$x,0.0025642017+$y,0.046313888+$z);

    glNormal3f( -0.069307895509076,0.0561195741768914,0.996015566652604 );
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.3761691,0.11069922); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.3803171,0.11660447); glVertex3f(-0.25791104+$x,0.1099066+$y,0.055688457+$z);

    glNormal3f( -0.41856583670629,0.0327986534053072,0.907594010930637 );
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.069910956,0.52731102); glVertex3f(-0.29412631+$x,0.217249+$y,0.046313888+$z);

    glNormal3f( -0.13356349400475,-0.0270370515925194,0.990671383916194 );
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.089108229,0.50356044); glVertex3f(-0.25066798+$x,0.1635778+$y,0.055688457+$z);

    glNormal3f( -0.957954180684195,-0.0727189286946304,0.277553139270983 );
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.40927636,0.11252436); glVertex3f(-0.30136937+$x,0.1993586+$y,0.018190179+$z);
    glTexCoord2f(0.39818934,0.10967081); glVertex3f(-0.30136937+$x,0.1635778+$y,0.0088156086+$z);

    glNormal3f( -0.9558886704219,0.063740656414551,0.286729800472317 );
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.38297765,0.10603307); glVertex3f(-0.29412631+$x,0.1099066+$y,0.046313888+$z);

    glNormal3f( -0.0693078887778391,-0.0561195781370758,0.996015566897865 );
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.085905325,0.52729228); glVertex3f(-0.25791104+$x,0.217249+$y,0.055688457+$z);

    glNormal3f( -0.992599607335738,-0.020894003161615,0.119622155760635 );
    glTexCoord2f(0.43211105,0.12021526); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);

    glNormal3f( -0.245044917161373,0.011944781245704,0.96943814179883 );
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.085904893,0.56948214); glVertex3f(-0.25791104+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.069910443,0.57741148); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);

    glNormal3f( -0.988225885652188,-0.00950707701949745,0.152706301158448 );
    glTexCoord2f(0.43211105,0.12021526); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.41513439,0.11542676); glVertex3f(-0.29412631+$x,0.217249+$y,0.046313888+$z);

    glNormal3f( -0.147386249411606,-0.119340515627999,0.981852908950227 );
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.089107649,0.56025308); glVertex3f(-0.25066798+$x,0.29179234+$y,0.055688457+$z);

    glNormal3f( -0.208887941310452,0.101483724246831,0.972659694697007 );
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.086006451,0.54848263); glVertex3f(-0.25791104+$x,0.26495674+$y,0.055688457+$z);

    glNormal3f( -0.0659339388465459,-0.160162839900986,0.984886074844716 );
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.085904893,0.56948214); glVertex3f(-0.25791104+$x,0.31266447+$y,0.055688457+$z);

    glNormal3f( -0.233293931499237,0.0171729004091267,0.972254613266076 );
    glTexCoord2f(0.071828045,0.59744793); glVertex3f(-0.28978049+$x,0.37587721+$y,0.048188801+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.069910025,0.61828291); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);

    glNormal3f( -0.954935735415281,0.0797385776414802,0.285901207522092 );
    glTexCoord2f(0.4623651,0.13055489); glVertex3f(-0.28978049+$x,0.37587721+$y,0.048188801+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.44907762,0.12534232); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);

    glNormal3f( -0.229067171852425,0,0.973410617765972 );
    glTexCoord2f(0.071828045,0.59744793); glVertex3f(-0.28978049+$x,0.37587721+$y,0.048188801+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);

    glNormal3f( -0.988179765741059,0.00299284795289224,0.15327032798646 );
    glTexCoord2f(0.49436222,0.13860951); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.47676816,0.13343132); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);

    glNormal3f( -0.218487018561651,-0.0242089964187158,0.975539515966647 );
    glTexCoord2f(0.069848647,0.64435978); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.071190565,0.6697018); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);

    glNormal3f( -0.99146676962421,-0.0224299094962126,0.128415512656862 );
    glTexCoord2f(0.49436222,0.13860951); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);

    glNormal3f( 0.293476191270583,-0.0831710810841388,0.952341480997551 );
    glTexCoord2f(0.33013072,0.64597199); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.31329308,0.64594894); glVertex3f(0.25634596+$x,0.485605+$y,0.055688457+$z);

    glNormal3f( 0.311858500542866,0.0673376492952767,0.947739371676909 );
    glTexCoord2f(0.33013072,0.64597199); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.33124712,0.62619083); glVertex3f(0.29690707+$x,0.440879+$y,0.046313888+$z);

    glNormal3f( 0.937026833740284,0.0885177767031296,0.337853986299103 );
    glTexCoord2f(0.44621872,0.31527785); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.44367879,0.32057955); glVertex3f(0.30704735+$x,0.485605+$y,0.0088156086+$z);

    glNormal3f( 0.930832823399579,-0.0715382420603676,0.358374852361156 );
    glTexCoord2f(0.44621872,0.31527785); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.45949739,0.31988189); glVertex3f(0.29690707+$x,0.53033101+$y,0.046313888+$z);

    glNormal3f( 0.0868221342179679,0.0515541767945222,0.994888980673159 );
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.31201278,0.57079826); glVertex3f(0.25344874+$x,0.31564621+$y,0.055688457+$z);

    glNormal3f( 0.993691531122223,-0.0811368331112253,0.077420638647928 );
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.42672623,0.31588077); glVertex3f(0.30704735+$x,0.4319338+$y,-0.00055896092+$z);

    glNormal3f( 0.989180354939288,-0.0371816369310579,0.14191459148837 );
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.41088537,0.31127798); glVertex3f(0.30704735+$x,0.3782626+$y,-0.0099335305+$z);

    glNormal3f( 0,0.0673147816530737,0.997731787691962 );
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31620041,0.55101955); glVertex3f(0.26358902+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31620041,0.55101955); glVertex3f(0.26358902+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.11898641250866,0.0433552118235905,0.99194886927001 );
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.30560717,0.59848542); glVertex3f(0.23896262+$x,0.3782626+$y,0.055688457+$z);

    glNormal3f( 0.0585646314525629,-0.0663888047509963,0.996073647149928 );
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.30880959,0.62221719); glVertex3f(0.24620568+$x,0.4319338+$y,0.055688457+$z);

    glNormal3f( 0.93662427735234,0.034380628437277,0.348644425543367 );
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.43270009,0.31205382); glVertex3f(0.29690707+$x,0.440879+$y,0.046313888+$z);

    glNormal3f( 0.429222967179949,-0.0241072903028293,0.902876781736852 );
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.33252879,0.56686132); glVertex3f(0.2998043+$x,0.306701+$y,0.046313888+$z);

    glNormal3f( 0.992494515542121,0.0884738688108651,0.0844216273027791 );
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.39517509,0.30630346); glVertex3f(0.30704735+$x,0.3245914+$y,-0.00055896092+$z);

    glNormal3f( 0.960316383270105,0.0706892903402113,0.269806353250292 );
    glTexCoord2f(0.3782527,0.29659687); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.37946482,0.30132894); glVertex3f(0.30704735+$x,0.2709202+$y,0.0088156086+$z);

    glNormal3f( 0.348649976117138,0.0664252455791807,0.934896187233248 );
    glTexCoord2f(0.33173307,0.54610065); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.3325292,0.52730833); glVertex3f(0.2998043+$x,0.217249+$y,0.046313888+$z);

    glNormal3f( 0.473265475303869,-0.0766420031649254,0.877579508213513 );
    glTexCoord2f(0.33173307,0.54610065); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31913488,0.53125511); glVertex3f(0.27083207+$x,0.2261942+$y,0.055688457+$z);

    glNormal3f( 0.967201590486809,-0.0497243705782082,0.249095504436327 );
    glTexCoord2f(0.3782527,0.29659687); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.39226187,0.30117964); glVertex3f(0.2998043+$x,0.306701+$y,0.046313888+$z);

    glNormal3f( 0.996556881607813,-0.0210136618828514,0.0802047862311462 );
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.35071005,0.26901831); glVertex3f(0.30704735+$x,0.1635778+$y,-0.0099335305+$z);

    glNormal3f( 0.998194597583675,-0.0434543229828134,0.0414640467015875 );
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.36301835,0.29690978); glVertex3f(0.30704735+$x,0.217249+$y,-0.00055896092+$z);

    glNormal3f( 0.44766102291352,0.0768891617261512,0.890891500337202 );
    glTexCoord2f(0.33396547,0.5035889); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.33252968,0.47984473); glVertex3f(0.2998043+$x,0.1099066+$y,0.046313888+$z);

    glNormal3f( 0.963781240749905,0.0269099948761536,0.265332945851696 );
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.36546458,0.29335157); glVertex3f(0.2998043+$x,0.217249+$y,0.046313888+$z);

    glNormal3f( 0.43494759722494,-0.0880458665976191,0.896140900217887 );
    glTexCoord2f(0.33396547,0.5035889); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.31893596,0.50361277); glVertex3f(0.27083207+$x,0.1635778+$y,0.055688457+$z);

    glNormal3f( 0.998194597547364,0.0434543197699887,0.041464050942768 );
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.33499978,0.26404379); glVertex3f(0.30704735+$x,0.1099066+$y,-0.00055896092+$z);

    glNormal3f( 0.0827908515432985,-0.10055535270735,0.991480860098992 );
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.31329478,0.47982635); glVertex3f(0.25634596+$x,0.1099066+$y,0.055688457+$z);

    glNormal3f( 0.116823362909043,0.0236484020813951,0.992871116992341 );
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);
    glTexCoord2f(0.29728155,0.47191591); glVertex3f(0.22013067+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.30048437,0.45609468); glVertex3f(0.22737373+$x,0.056235402+$y,0.055688457+$z);

    glNormal3f( 0.916776341348965,0.101226430401357,0.386360388408291 );
    glTexCoord2f(0.32443307,0.25332171); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.31928951,0.25906927); glVertex3f(0.30704735+$x,0.056235402+$y,0.0088156086+$z);

    glNormal3f( 0.206112157168235,-0.0238416534347042,0.978237882229551 );
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.32932747,0.43633647); glVertex3f(0.29256124+$x,0.011509401+$y,0.046313888+$z);

    glNormal3f( 0.916615320896264,-0.185549384146198,0.354101369019106 );
    glTexCoord2f(0.32443307,0.25332171); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.33744601,0.26048559); glVertex3f(0.2998043+$x,0.1099066+$y,0.046313888+$z);

    glNormal3f( 0.985717690543115,-0.0426818049014031,0.16290763665558 );
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.28639656,0.25023094); glVertex3f(0.30704735+$x,-0.051106998+$y,-0.0099335305+$z);

    glNormal3f( 0.992009311242248,-0.0912777380976634,0.0870970776573799 );
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.30284303,0.25465011); glVertex3f(0.30704735+$x,0.0025642017+$y,-0.00055896092+$z);

    glNormal3f( 0.290339717310785,0.0822822815133858,0.953379501930289 );
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.2938191,0.23092868); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.27641798,0.24031121); glVertex3f(0.29256124+$x,-0.095832998+$y,0.046313888+$z);

    glNormal3f( 0.881747429700274,0.0475975354925826,0.46931433478213 );
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.30857472,0.24970489); glVertex3f(0.29256124+$x,0.011509401+$y,0.046313888+$z);

    glNormal3f( 0.993541907602111,0.0820903104963159,0.0783304459388391 );
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.27068629,0.24525642); glVertex3f(0.30704735+$x,-0.1047782+$y,-0.00055896092+$z);

    glNormal3f( 0.178236116870014,-0.0962135377705208,0.979272608517556 );
    glTexCoord2f(0.33218716,0.41085911); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.30368732,0.42840755); glVertex3f(0.2346168+$x,-0.0063809978+$y,0.055688457+$z);

    glNormal3f( 0.302428989800401,0.067553425429725,0.950775073737748 );
    glTexCoord2f(0.32773154,0.37107868); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.32932836,0.34931987); glVertex3f(0.29256124+$x,-0.185285+$y,0.046313888+$z);

    glNormal3f( 0.106833097811045,-0.0865042659765733,0.990506790072612 );
    glTexCoord2f(0.32773154,0.37107868); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);
    glTexCoord2f(0.31009285,0.40863099); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.30368761,0.40072045); glVertex3f(0.2346168+$x,-0.068997399+$y,0.055688457+$z);

    glNormal3f( 0.838889769967961,-0.106550804126599,0.533770437531975 );
    glTexCoord2f(0.26457004,0.23577308); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.27641798,0.24031121); glVertex3f(0.29256124+$x,-0.095832998+$y,0.046313888+$z);

    glNormal3f( 0.909728629226835,0.105231472659952,0.401646807938121 );
    glTexCoord2f(0.26457004,0.23577308); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.25497601,0.2402819); glVertex3f(0.30704735+$x,-0.1584494+$y,0.0088156086+$z);

    glNormal3f( 0.82840534780892,-0.141962302266229,0.541840644891885 );
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.22208307,0.23144357); glVertex3f(0.30704735+$x,-0.2657918+$y,-0.0099335305+$z);

    glNormal3f( 0.881323740340248,-0.341854090675219,0.326196636097454 );
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.23852954,0.23586273); glVertex3f(0.30704735+$x,-0.2121206+$y,-0.00055896092+$z);

    glNormal3f( 0,-0.0637723637643206,0.997964471121047 );
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.28126921,0.37698888); glVertex3f(0.18391539+$x,-0.1226686+$y,0.055688457+$z);

    glNormal3f( 0.0627844011903655,-0.0219055503232585,0.997786683531206 );
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.3133157,0.28603524); glVertex3f(0.25634596+$x,-0.32840819+$y,0.046313888+$z);

    glNormal3f( 0.0302394793190145,-0.0195882729654943,0.999350725947975 );
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.19479792,0.32161558); glVertex3f(-0.011647121+$x,-0.24790139+$y,0.055688457+$z);

    glNormal3f( 0.0145026316780289,0.0822008711337251,0.996510256073297 );
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.20120357,0.28997311); glVertex3f(0.0028389911+$x,-0.319463+$y,0.055688457+$z);

    glNormal3f( 0.901945273323636,0.312435490785371,0.298125456858109 );
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.20637279,0.22646905); glVertex3f(0.30704735+$x,-0.319463+$y,-0.00055896092+$z);

    glNormal3f( 0.830903609195286,-0.237064094052944,0.503388326778744 );
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.24962069,0.23248313); glVertex3f(0.29256124+$x,-0.185285+$y,0.046313888+$z);

    glNormal3f( 0.472815457922112,0.223326579529176,0.85239121395384 );
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.19066252,0.22149452); glVertex3f(0.30704735+$x,-0.3731342+$y,0.0088156086+$z);

    glNormal3f( 0.0655045616544632,0.0707200077465359,0.995343072968706 );
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);
    glTexCoord2f(0.19874453,0.15622009); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.18297638,0.20128107); glVertex3f(0.25634596+$x,-0.4178602+$y,0.046313888+$z);

    glNormal3f( 0.0612834539265191,-0.0868386583244701,0.994335650419536 );
    glTexCoord2f(0.30771597,0.26626344); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.22362244,0.26624108); glVertex3f(0.053540384+$x,-0.3731342+$y,0.055688457+$z);

    glNormal3f( 0.453918629247337,-0.174427858727949,0.87380363933884 );
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.20977367,0.20910915); glVertex3f(0.25634596+$x,-0.32840819+$y,0.046313888+$z);

    glNormal3f( -0.453918599471289,-0.174427932282472,-0.873803640123846 );
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.24435555,0.083471189); glVertex3f(-0.25066798+$x,-0.32840819+$y,-0.047431809+$z);

    glNormal3f( -0.47281540078896,0.223326589528201,-0.852391243025453 );
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.23666941,0.063257738); glVertex3f(-0.30136937+$x,-0.3731342+$y,-0.0099335305+$z);

    glNormal3f( -0.0655045665481646,0.0707200015311836,-0.995343073088253 );
    glTexCoord2f(0.10563879,0.19102443); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);
    glTexCoord2f(0.13035954,0.13229987); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.12422247,0.1994354); glVertex3f(-0.25066798+$x,-0.4178602+$y,-0.047431809+$z);

    glNormal3f( -0.0612834564850934,-0.086838660237223,-0.994335650094798 );
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);
    glTexCoord2f(0.2285874,0.12853217); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.21362838,0.14058965); glVertex3f(-0.047862402+$x,-0.3731342+$y,-0.056806379+$z);

    glNormal3f( -0.01914738454992,0.00193798905692424,-0.999814793780985 );
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.4773565,0.62571277); glVertex3f(0.039054272+$x,-0.1942302+$y,-0.056806379+$z);

    glNormal3f( -0.0089348272200247,0.0506425732249925,-0.998676873988629 );
    glTexCoord2f(0.43906305,0.67843164); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.35862192,0.74038403); glVertex3f(0.0028389911+$x,-0.319463+$y,-0.056806379+$z);

    glNormal3f( -0.0156026219141224,-0.015160399249433,-0.999763332236186 );
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.47453695,0.53800136); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.47556667,0.56554515); glVertex3f(-0.055105459+$x,-0.095832998+$y,-0.056806379+$z);

    glNormal3f( -0.895349685198948,0.322212237972794,-0.307454411116037 );
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.25394641,0.065711693); glVertex3f(-0.30136937+$x,-0.319463+$y,-0.00055896092+$z);

    glNormal3f( -0.815343487919023,-0.277393059470503,-0.508200833593999 );
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.29025985,0.085147032); glVertex3f(-0.28688326+$x,-0.185285+$y,-0.047431809+$z);

    glNormal3f( -0.0170600060480738,0.0241740297144218,-0.999562190401881 );
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.2479219,0.17520837); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.23730491,0.18036074); glVertex3f(0.053540384+$x,-0.2657918+$y,-0.056806379+$z);

    glNormal3f( 0.0241349310619103,-0.0455989411041216,-0.998668234036119 );
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.40580343,0.51862113); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.43038963,0.52481692); glVertex3f(-0.19272352+$x,-0.095832998+$y,-0.056806379+$z);

    glNormal3f( -0.852010281557754,-0.378760389922615,-0.361412571925142 );
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.28502938,0.077267731); glVertex3f(-0.30136937+$x,-0.2121206+$y,-0.00055896092+$z);

    glNormal3f( -0.806441433628868,-0.149865979001888,-0.572007344764403 );
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.27137747,0.072972422); glVertex3f(-0.30136937+$x,-0.2657918+$y,0.0088156086+$z);

    glNormal3f( -0.0649141554182867,-0.0598961382972917,-0.996091664980388 );
    glTexCoord2f(0.43906305,0.67843164); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);
    glTexCoord2f(0.37496274,0.69778236); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.40885981,0.66555703); glVertex3f(-0.25066798+$x,-0.32840819+$y,-0.047431809+$z);

    glNormal3f( -0.838889654114243,-0.10655099720243,-0.533770581069483 );
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.31705714,0.092975104); glVertex3f(-0.28688326+$x,-0.095832998+$y,-0.047431809+$z);

    glNormal3f( -0.909728543130011,0.105231521520817,-0.401646990145528 );
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.3009829,0.082045111); glVertex3f(-0.30136937+$x,-0.1584494+$y,-0.0099335305+$z);

    glNormal3f( -0.302429072752394,0.0675534722662294,-0.950775044024034 );
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);
    glTexCoord2f(0.30501548,0.10392325); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.29025985,0.085147032); glVertex3f(-0.28688326+$x,-0.185285+$y,-0.047431809+$z);

    glNormal3f( -0.106833061081663,-0.0865042959515718,-0.990506791416315 );
    glTexCoord2f(0.38874404,0.5112642); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.42644296,0.50528962); glVertex3f(-0.22893881+$x,-0.068997399+$y,-0.056806379+$z);

    glNormal3f( -0.18557375874138,0.050087267622367,-0.981352966923075 );
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.4473521,0.48687807); glVertex3f(-0.22169575+$x,-0.0063809978+$y,-0.056806379+$z);

    glNormal3f( -0.970537529911803,-0.0375844843610937,-0.238000650352068 );
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.34981962,0.10019898); glVertex3f(-0.29412631+$x,0.011509401+$y,-0.047431809+$z);

    glNormal3f( -0.993083892998666,0.0849416571871509,-0.0810511958018826 );
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.31742938,0.086464276); glVertex3f(-0.30136937+$x,-0.1047782+$y,-0.00055896092+$z);

    glNormal3f( -0.984940045857997,-0.0438197930010674,-0.167251104051935 );
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.33387585,0.09088344); glVertex3f(-0.30136937+$x,-0.051106998+$y,0.0088156086+$z);

    glNormal3f( -0.99066471193153,-0.098625677404137,-0.0941084708737373 );
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.34826304,0.096311053); glVertex3f(-0.30136937+$x,0.0025642017+$y,-0.00055896092+$z);

    glNormal3f( -0.0642149066026883,-0.155987173692792,-0.985669542703508 );
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.44313583,0.47243081); glVertex3f(-0.25066798+$x,0.011509401+$y,-0.056806379+$z);

    glNormal3f( -0.22561038687879,0.0150442352358461,-0.974101444572674 );
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.39947037,0.49697276); glVertex3f(-0.28688326+$x,-0.095832998+$y,-0.047431809+$z);

    glNormal3f( -0.96285670271105,-0.0528567834057561,-0.26478884132909 );
    glTexCoord2f(0.36315886,0.10458605); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);
    glTexCoord2f(0.37628549,0.10608244); glVertex3f(-0.30136937+$x,0.092016197+$y,-0.019308101+$z);
    glTexCoord2f(0.37661691,0.10802705); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);

    glNormal3f( -0.966338618680491,0.065204853828247,-0.248873464001123 );
    glTexCoord2f(0.36315886,0.10458605); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.36431503,0.10275598); glVertex3f(-0.30136937+$x,0.056235402+$y,-0.0099335305+$z);

    glNormal3f( -0.394866486434056,-0.0799323115439733,-0.915254764239149 );
    glTexCoord2f(0.44268973,0.44545107); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);
    glTexCoord2f(0.45982869,0.439572); glVertex3f(-0.27239715+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.45195696,0.45368385); glVertex3f(-0.26515409+$x,0.056235402+$y,-0.056806379+$z);

    glNormal3f( -0.417544864241817,0.0643984366531103,-0.90637140715157 );
    glTexCoord2f(0.44268973,0.44545107); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.42886074,0.45959178); glVertex3f(-0.29412631+$x,0.011509401+$y,-0.047431809+$z);

    glNormal3f( -0.257125879228184,0.028674017755162,-0.965952422708753 );
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.37589989,0.11993661); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.37661691,0.10802705); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);

    glNormal3f( -0.988122185864781,0.0173269822471297,-0.152690279612081 );
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.41145338,0.11820354); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);

    glNormal3f( -0.144512688195806,0.117013902845164,-0.982559835069277 );
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.38004789,0.12584185); glVertex3f(-0.24342493+$x,0.12779701+$y,-0.056806379+$z);
    glTexCoord2f(0.37589989,0.11993661); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);

    glNormal3f( -0.996679745166858,-0.0589070129702938,-0.0562089796833595 );
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.40927636,0.11252436); glVertex3f(-0.30136937+$x,0.1993586+$y,0.018190179+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);

    glNormal3f( -0.28037577408637,-0.113512115568973,-0.953154984734657 );
    glTexCoord2f(0.79967638,0.12936417); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.78740307,0.14619564); glVertex3f(-0.27239715+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.78224487,0.1300198); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);

    glNormal3f( -0.993903318666258,-0.027943687098213,-0.106655255358354 );
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.39818934,0.10967081); glVertex3f(-0.30136937+$x,0.1635778+$y,0.0088156086+$z);

    glNormal3f( -0.970893280887737,-0.0491340551229266,-0.234418603686278 );
    glTexCoord2f(0.42412269,0.12239491); glVertex3f(-0.29231555+$x,0.2597387+$y,-0.045088166+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);

    glNormal3f( -0.325547414697284,0.0659000701607724,-0.94322641053817 );
    glTexCoord2f(0.79598541,0.17343232); glVertex3f(-0.29231555+$x,0.2597387+$y,-0.045088166+$z);
    glTexCoord2f(0.78373943,0.15788844); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.79741676,0.1546746); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);

    glNormal3f( -0.117874512875796,0.0272699074430065,-0.992653993777461 );
    glTexCoord2f(0.53653702,0.3410386); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);
    glTexCoord2f(0.55738344,0.35718103); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);

    glNormal3f( -0.978119447787151,0.0301663073848244,-0.205845426860359 );
    glTexCoord2f(0.45815758,0.13238131); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.47820431,0.13864165); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);

    glNormal3f( -0.988865116597611,0.0256052932093862,-0.146595191381077 );
    glTexCoord2f(0.45815758,0.13238131); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);

    glNormal3f( -0.277446615092533,-0.0292177846967564,-0.960296671258997 );
    glTexCoord2f(0.53653702,0.3410386); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.51622304,0.36268897); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);

    glNormal3f( -0.938351206036278,-0.0709141025780218,-0.338331500433845 );
    glTexCoord2f(0.49148298,0.1432457); glVertex3f(-0.28869403+$x,0.485605+$y,-0.045088166+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.5050016,0.14646972); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);

    glNormal3f( -0.293842293131189,0.0666198759375131,-0.953529495557151 );
    glTexCoord2f(0.57095103,0.30557332); glVertex3f(-0.28869403+$x,0.485605+$y,-0.045088166+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.55688428,0.31949968); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);

    glNormal3f( 0.968233762709317,0.0185014083865674,-0.249361341505597 );
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.42078233,0.31083828); glVertex3f(0.2998043+$x,0.4140434+$y,-0.047431809+$z);

    glNormal3f( 0.993922692354096,-0.079641006740841,-0.0759933659531553 );
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.45948859,0.32509084); glVertex3f(0.30704735+$x,0.5392762+$y,-0.00055896092+$z);

    glNormal3f( 0.150508683739754,-0.00487475597202261,-0.988596668451366 );
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.72564872,0.48226092); glVertex3f(0.23896262+$x,0.42298861+$y,-0.056806379+$z);

    glNormal3f( 0.151837028521864,-0.0860612202466487,-0.984651706513175 );
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.74655786,0.46384937); glVertex3f(0.24620568+$x,0.485605+$y,-0.056806379+$z);

    glNormal3f( 0.991494726445653,0.0941587521154026,-0.0898461842847521 );
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.42672623,0.31588077); glVertex3f(0.30704735+$x,0.4319338+$y,-0.00055896092+$z);

    glNormal3f( 0.987015349752814,0.0407099472072597,-0.155381464630477 );
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.44367879,0.32057955); glVertex3f(0.30704735+$x,0.485605+$y,0.0088156086+$z);

    glNormal3f( 0.285780444781234,0.0161343583282877,-0.958159287311862 );
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.77907743,0.46125833); glVertex3f(0.29690707+$x,0.5392762+$y,-0.047431809+$z);

    glNormal3f( 0,0.0884653395980433,-0.996079255727075 );
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);
    glTexCoord2f(0.41146778,0.30398712); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.41292153,0.29877956); glVertex3f(0.26069179+$x,0.3782626+$y,-0.056806379+$z);

    glNormal3f( 0.971104536900676,-0.0604859439725213,-0.230862359410705 );
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.41088537,0.31127798); glVertex3f(0.30704735+$x,0.3782626+$y,-0.0099335305+$z);

    glNormal3f( 0.957608943514095,0.0563921063647911,-0.282497861304401 );
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.39394032,0.30552204); glVertex3f(0.2998043+$x,0.3245914+$y,-0.047431809+$z);

    glNormal3f( 0.306798746703992,0.082806485798783,-0.948165394290741 );
    glTexCoord2f(0.72847059,0.51811214); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.70963735,0.52105721); glVertex3f(0.27083207+$x,0.3335366+$y,-0.056806379+$z);

    glNormal3f( 0.479928058563849,-0.0621767984837904,-0.875101767986695 );
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);
    glTexCoord2f(0.41146778,0.30398712); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.42078233,0.31083828); glVertex3f(0.2998043+$x,0.4140434+$y,-0.047431809+$z);

    glNormal3f( 0.213473154232165,-0.0864261407938201,-0.973118561435171 );
    glTexCoord2f(0.75795317,0.26724718); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.77762232,0.25019736); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.77506502,0.26710604); glVertex3f(0.26358902+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( 0.968358072939937,-0.00925182249570111,-0.249393356672868 );
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.35642411,0.29456274); glVertex3f(0.2998043+$x,0.1993586+$y,-0.047431809+$z);

    glNormal3f( 0.996199179256431,-0.0630184333858256,-0.0601321237144499 );
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.39517509,0.30630346); glVertex3f(0.30704735+$x,0.3245914+$y,-0.00055896092+$z);

    glNormal3f( 0.242516024764065,-0.0392736953993293,-0.969352131365231 );
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.66781908,0.55788031); glVertex3f(0.25634596+$x,0.20830381+$y,-0.056806379+$z);

    glNormal3f( 0.388087950988873,0.0115317569387436,-0.921550194443669 );
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.71649231,0.53259054); glVertex3f(0.2998043+$x,0.3245914+$y,-0.047431809+$z);

    glNormal3f( 0.994673395953899,0.0745741094163161,-0.0711585383935177 );
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.36301835,0.29690978); glVertex3f(0.30704735+$x,0.217249+$y,-0.00055896092+$z);

    glNormal3f( 0.991847478602981,0.0322967494151732,-0.12327002541625 );
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.37946482,0.30132894); glVertex3f(0.30704735+$x,0.2709202+$y,0.0088156086+$z);

    glNormal3f( 0,0.0884653395980433,-0.996079255727075 );
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.6569601,0.57470614); glVertex3f(0.26358902+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.6569601,0.57470614); glVertex3f(0.26358902+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.957608943514095,0.0563921063647911,-0.282497861304401 );
    glTexCoord2f(0.34673717,0.26636883); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.333765,0.26326237); glVertex3f(0.2998043+$x,0.1099066+$y,-0.047431809+$z);

    glNormal3f( 0.971104536900676,-0.0604859439725213,-0.230862359410705 );
    glTexCoord2f(0.34673717,0.26636883); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.35071005,0.26901831); glVertex3f(0.30704735+$x,0.1635778+$y,-0.0099335305+$z);

    glNormal3f( 0.306798754647703,0.0828064786857444,-0.948165392341592 );
    glTexCoord2f(0.66493437,0.58858691); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.64575953,0.59134686); glVertex3f(0.27083207+$x,0.1188518+$y,-0.056806379+$z);

    glNormal3f( 0.47992805856385,-0.0621767984837905,-0.875101767986695 );
    glTexCoord2f(0.66493437,0.58858691); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.67942951,0.57370082); glVertex3f(0.2998043+$x,0.1993586+$y,-0.047431809+$z);

    glNormal3f( 0.43494759722494,0.0880458665976191,-0.896140900217887 );
    glTexCoord2f(0.63812304,0.62165172); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.62702331,0.61158867); glVertex3f(0.27083207+$x,0.056235402+$y,-0.056806379+$z);

    glNormal3f( 0.96378123978213,-0.0269099992537281,-0.265332948923016 );
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.30160826,0.25386868); glVertex3f(0.2998043+$x,0.0025642017+$y,-0.047431809+$z);

    glNormal3f( 0.998194597396531,-0.0434543136573351,-0.0414640609799276 );
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.33499978,0.26404379); glVertex3f(0.30704735+$x,0.1099066+$y,-0.00055896092+$z);

    glNormal3f( 0.44766102714677,-0.0768891476323227,-0.890891499426431 );
    glTexCoord2f(0.63812304,0.62165172); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.65295609,0.60306531); glVertex3f(0.2998043+$x,0.1099066+$y,-0.047431809+$z);

    glNormal3f( 0.998194597596096,0.0434543223094654,-0.0414640471082236 );
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.30284303,0.25465011); glVertex3f(0.30704735+$x,0.0025642017+$y,-0.00055896092+$z);

    glNormal3f( 0.996556881687703,0.0210136586819065,-0.0802047860771589 );
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.31928951,0.25906927); glVertex3f(0.30704735+$x,0.056235402+$y,0.0088156086+$z);

    glNormal3f( 0.348650027340776,-0.066425225254254,-0.934896169574567 );
    glTexCoord2f(0.60801651,0.65172056); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.62118798,0.63830269); glVertex3f(0.2998043+$x,0.0025642017+$y,-0.047431809+$z);

    glNormal3f( 0.967201588586736,0.0497243656183788,-0.249095512804113 );
    glTexCoord2f(0.289123,0.24953847); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.27481097,0.24604061); glVertex3f(0.2998043+$x,-0.086887798+$y,-0.047431809+$z);

    glNormal3f( 0.960316386293566,-0.0706892717690078,-0.269806347354606 );
    glTexCoord2f(0.289123,0.24953847); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.28639656,0.25023094); glVertex3f(0.30704735+$x,-0.051106998+$y,-0.0099335305+$z);

    glNormal3f( 0.473265475452121,0.0766420028462158,-0.877579508161397 );
    glTexCoord2f(0.60801651,0.65172056); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.60883207,0.63229895); glVertex3f(0.27083207+$x,-0.0063809978+$y,-0.056806379+$z);

    glNormal3f( 0.451387986619405,-0.18563311295937,-0.872805380888943 );
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.23824941,0.22127962); glVertex3f(0.25634596+$x,-0.2210658+$y,-0.047431809+$z);

    glNormal3f( 0.945197442479621,-0.236216006606976,-0.225396967487666 );
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.27068629,0.24525642); glVertex3f(0.30704735+$x,-0.1047782+$y,-0.00055896092+$z);

    glNormal3f( -0.0741833804862229,-0.100112262721493,-0.992206813578913 );
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.59369349,0.64010088); glVertex3f(0.25634596+$x,-0.042161799+$y,-0.056806379+$z);

    glNormal3f( 0.0297062882556594,-0.0618521271487423,-0.997643148027012 );
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.56224368,0.62239427); glVertex3f(0.17667234+$x,-0.060052198+$y,-0.056806379+$z);

    glNormal3f( 0.929632527960262,0.0933916569032211,-0.356456675318452 );
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.25497601,0.2402819); glVertex3f(0.30704735+$x,-0.1584494+$y,0.0088156086+$z);

    glNormal3f( 0.0269313258409059,0.0490650298122083,-0.998432434638408 );
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.2479219,0.17520837); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.26409238,0.15881127); glVertex3f(0.039054272+$x,-0.1942302+$y,-0.056806379+$z);

    glNormal3f( 0.960054267157223,0.202440000967106,-0.193167932436119 );
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.23852954,0.23586273); glVertex3f(0.30704735+$x,-0.2121206+$y,-0.00055896092+$z);

    glNormal3f( 0.303097729608891,-0.0650265133914739,-0.950738301985401 );
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.59471456,0.66766718); glVertex3f(0.2998043+$x,-0.086887798+$y,-0.047431809+$z);

    glNormal3f( 0.453918612519905,0.174427873748005,-0.873803645030023 );
    glTexCoord2f(0.22600282,0.21349898); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.21145212,0.21345154); glVertex3f(0.25634596+$x,-0.3105178+$y,-0.047431809+$z);

    glNormal3f( 0.472815465305413,-0.223326522348344,-0.852391224839756 );
    glTexCoord2f(0.22600282,0.21349898); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.22208307,0.23144357); glVertex3f(0.30704735+$x,-0.2657918+$y,-0.0099335305+$z);

    glNormal3f( 0.0612834537973617,0.0868386824110854,-0.994335648323932 );
    glTexCoord2f(0.31983728,0.8676351); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.36330271,0.79536552); glVertex3f(0.053540384+$x,-0.2657918+$y,-0.056806379+$z);

    glNormal3f( 0.0655045623497583,-0.070719985768771,-0.995343074484487 );
    glTexCoord2f(0.31983728,0.8676351); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);
    glTexCoord2f(0.36532592,0.82279137); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.33395145,0.88264871); glVertex3f(0.25634596+$x,-0.2210658+$y,-0.047431809+$z);

    glNormal3f( 0.833102003513962,0.40017121724133,-0.381842963314259 );
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.17421605,0.21707536); glVertex3f(0.30704735+$x,-0.4268054+$y,-0.00055896092+$z);

    glNormal3f( 0.833102003555176,-0.400171218823901,-0.381842961565804 );
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.20637279,0.22646905); glVertex3f(0.30704735+$x,-0.319463+$y,-0.00055896092+$z);

    glNormal3f( 0.0156059578838964,0.0884545707688502,-0.995957952419993 );
    glTexCoord2f(0.086729616,0.082479463); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.11645785,0.15234746); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.10714676,0.19703524); glVertex3f(0.0028389911+$x,-0.4268054+$y,-0.056806379+$z);

    glNormal3f( 0.0622426698851991,0.0124882016315851,-0.997982913113031 );
    glTexCoord2f(0.27960694,0.82566929); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.29997269,0.86223199); glVertex3f(0.25634596+$x,-0.3105178+$y,-0.047431809+$z);

    glNormal3f( 0.756470256048938,0.165760560335336,-0.632673840419035 );
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.19066252,0.22149452); glVertex3f(0.30704735+$x,-0.3731342+$y,0.0088156086+$z);

    glNormal3f( 0.0285573329476921,-0.0404657532135946,-0.998772747701784 );
    glTexCoord2f(0.72842043,0.017363077); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.75333872,0.17506179); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.73622548,0.15352212); glVertex3f(-0.047862402+$x,-0.3731342+$y,-0.056806379+$z);

    glNormal3f( 0.48041726143112,-0.0325135258937055,-0.876437177185554 );
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.17393592,0.20249224); glVertex3f(0.25634596+$x,-0.43575059+$y,-0.047431809+$z);

    glNormal3f( 0.0156059579510982,-0.0884545704519027,-0.995957952447089 );
    glTexCoord2f(0.27960694,0.82566929); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);
    glTexCoord2f(0.37496274,0.69778236); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.35862192,0.74038403); glVertex3f(0.0028389911+$x,-0.319463+$y,-0.056806379+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.10960405,0.62221923); glVertex3f(-0.20431242+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.11067193,0.59057682); glVertex3f(-0.20189806+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.11366097,0.60112425); glVertex3f(-0.19513788+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.10960405,0.62221923); glVertex3f(-0.20431242+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.092309973,0.59321388); glVertex3f(-0.24342493+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.10277203,0.5905769); glVertex3f(-0.21976427+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.11793271,0.45214125); glVertex3f(-0.18548047+$x,0.047290202+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.085905811,0.47982868); glVertex3f(-0.25791104+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.10512178,0.47982848); glVertex3f(-0.21445269+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.079500894,0.44027575); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.083007476,0.4285382); glVertex3f(-0.26515409+$x,-0.0063809978+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.089109161,0.41258855); glVertex3f(-0.25066798+$x,-0.042161799+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.12412342,0.56025272); glVertex3f(-0.17147723+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11472881,0.57343715); glVertex3f(-0.19272352+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.107256,0.56684505); glVertex3f(-0.20962399+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.13949591,0.58793966); glVertex3f(-0.13671056+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.13095567,0.56948168); glVertex3f(-0.15602537+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.11472881,0.57343715); glVertex3f(-0.19272352+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.10234533,0.55893451); glVertex3f(-0.22073002+$x,0.28881061+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.10234519,0.57211884); glVertex3f(-0.22073002+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.089107649,0.56025308); glVertex3f(-0.25066798+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.079919605,0.61422046); glVertex3f(-0.27239715+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.092309973,0.59321388); glVertex3f(-0.24342493+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.092309973,0.59321388); glVertex3f(-0.24342493+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.11793271,0.45214125); glVertex3f(-0.18548047+$x,0.047290202+$y,0.055688457+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.10960405,0.62221923); glVertex3f(-0.20431242+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.097433856,0.63012995); glVertex3f(-0.23183603+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.083007476,0.4285382); glVertex3f(-0.26515409+$x,-0.0063809978+$y,0.055688457+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.11045874,0.55893442); glVertex3f(-0.20238094+$x,0.28881061+$y,0.055688457+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10277203,0.5905769); glVertex3f(-0.21976427+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.10277203,0.5905769); glVertex3f(-0.21976427+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.10512178,0.47982848); glVertex3f(-0.21445269+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.085905811,0.47982868); glVertex3f(-0.25791104+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.07950057,0.47191814); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.11472881,0.57343715); glVertex3f(-0.19272352+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.12092043,0.59189514); glVertex3f(-0.17872028+$x,0.36335393+$y,0.055688457+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.10234519,0.57211884); glVertex3f(-0.22073002+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10234533,0.55893451); glVertex3f(-0.22073002+$x,0.28881061+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.12412342,0.56025272); glVertex3f(-0.17147723+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.13949591,0.58793966); glVertex3f(-0.13671056+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.13095567,0.56948168); glVertex3f(-0.15602537+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.107256,0.56684505); glVertex3f(-0.20962399+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.107256,0.56684505); glVertex3f(-0.20962399+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.10810996,0.57475565); glVertex3f(-0.20769251+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.10810996,0.57475565); glVertex3f(-0.20769251+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.11067193,0.59057682); glVertex3f(-0.20189806+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.11366097,0.60112425); glVertex3f(-0.19513788+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.1034599,0.60141734); glVertex3f(-0.21820836+$x,0.38488868+$y,0.055688457+$z);
    glTexCoord2f(0.089107649,0.56025308); glVertex3f(-0.25066798+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.082703393,0.45609691); glVertex3f(-0.26515409+$x,0.056235402+$y,0.055688457+$z);
    glTexCoord2f(0.079500894,0.44027575); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.089109161,0.41258855); glVertex3f(-0.25066798+$x,-0.042161799+$y,0.055688457+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.097433856,0.63012995); glVertex3f(-0.23183603+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.10981796,0.58266623); glVertex3f(-0.20382955+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.084622888,0.66177248); glVertex3f(-0.26080825+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10810996,0.57475565); glVertex3f(-0.20769251+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.10810996,0.57475565); glVertex3f(-0.20769251+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.079918539,0.57743986); glVertex3f(-0.27239715+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.085904893,0.56948214); glVertex3f(-0.25791104+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.079918539,0.57743986); glVertex3f(-0.27239715+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.092309973,0.59321388); glVertex3f(-0.24342493+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10277203,0.5905769); glVertex3f(-0.21976427+$x,0.3603722+$y,0.055688457+$z);

    glNormal3f( 0.0124180089918622,-0.0663633319033478,-0.99771824741826 );
    glTexCoord2f(0.53467349,0.39633561); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.55243699,0.38466024); glVertex3f(-0.19996658+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( 0.091604776987596,0.00890081346241784,-0.995755662978002 );
    glTexCoord2f(0.53467349,0.39633561); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);
    glTexCoord2f(0.5222865,0.38941738); glVertex3f(-0.24342493+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);

    glNormal3f( 0.820447009633204,-0.191917008578072,-0.538548573670359 );
    glTexCoord2f(0.64020173,0.86956116); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);
    glTexCoord2f(0.63927364,0.88259426); glVertex3f(-0.21445269+$x,0.23513941+$y,-0.042093878+$z);
    glTexCoord2f(0.63405162,0.88528921); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);

    glNormal3f( 0.0264650525854541,-0.137146468946859,-0.9901971758428 );
    glTexCoord2f(0.53467349,0.39633561); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.54728119,0.40663953); glVertex3f(-0.1753402+$x,0.2798654+$y,-0.053128253+$z);

    glNormal3f( 0.14750379238484,-0.660879711434386,-0.73585367991639 );
    glTexCoord2f(0.64020173,0.86956116); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.63966878,0.8760239); glVertex3f(-0.20720963+$x,0.26197501+$y,-0.038415754+$z);

    glNormal3f( -0.836214042250842,0.199847883990582,-0.51069256780082 );
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.66862391,0.88008768); glVertex3f(-0.13477908+$x,0.26197501+$y,-0.031059503+$z);

    glNormal3f( -0.0168121834113306,0.00748718593482904,-0.999830631925088 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.62227885,0.45827062); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.60645845,0.46530051); glVertex3f(0.01297927+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( -0.00820375825210511,-0.0318849247482125,-0.999457878014047 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.59027486,0.41344894); glVertex3f(-0.092769351+$x,0.3335366+$y,-0.056806379+$z);

    glNormal3f( 0,-1,0 );# bottom face
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.64480637,0.87667896); glVertex3f(-0.17099436+$x,0.2709202+$y,-0.034737629+$z);
    glTexCoord2f(0.64480637,0.87667896); glVertex3f(-0.17099436+$x,0.2709202+$y,-0.034737629+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.00991487964305241,0.0240846459503774,-0.999660754951953 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.57773461,0.47134381); glVertex3f(-0.026133234+$x,0.217249+$y,-0.056806379+$z);

    glNormal3f( -0.126567292490981,-0.106915078188261,-0.986179439314925 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.5584397,0.45928395); glVertex3f(-0.076834627+$x,0.20830381+$y,-0.053128253+$z);

    glNormal3f( -0.0121265304453021,-0.0176742347220837,-0.99977025795247 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.6133071,0.43953617); glVertex3f(-0.014544344+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( 0.0222588848775962,-0.0270349947975936,-0.999386637443337 );
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.56813006,0.39880794); glVertex3f(-0.15216242+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( -0.128991343534007,-0.709004964829058,-0.693305988104126 );
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.65427147,0.87103929); glVertex3f(-0.1753402+$x,0.2798654+$y,-0.053128253+$z);

    glNormal3f( 0.451247584843601,-0.395954379242176,-0.799747301797112 );
    glTexCoord2f(0.76505919,0.89358938); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);
    glTexCoord2f(0.74570522,0.90952043); glVertex3f(0.075269554+$x,0.217249+$y,-0.053128253+$z);

    glNormal3f( 0.0101863088699327,-0.07753111092231,-0.99693789473104 );
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);
    glTexCoord2f(0.62227885,0.45827062); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.64727694,0.47548392); glVertex3f(0.096998722+$x,0.31564621+$y,-0.056806379+$z);

    glNormal3f( 0.0388385257078092,0.00471721796894007,-0.999234365289484 );
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.60645845,0.46530051); glVertex3f(0.01297927+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( 0.0261609195533017,-0.116313225629357,-0.992867987111993 );
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);
    glTexCoord2f(0.66032266,0.49256807); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.65903491,0.50738831); glVertex3f(0.16508346+$x,0.2798654+$y,-0.053128253+$z);

    glNormal3f( 0.208274735869386,-0.871322831331869,-0.444317631878764 );
    glTexCoord2f(0.76505919,0.89358938); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.77332092,0.89838758); glVertex3f(0.14045706+$x,0.26197501+$y,-0.034737629+$z);

    glNormal3f( -0.565501737618581,0.759140233542556,0.322356775277515 );
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.80137388,0.90060064); glVertex3f(0.21288762+$x,0.26197501+$y,-0.031059503+$z);

    glNormal3f( -0.131392118502286,-0.0440234868481578,-0.990352484624142 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.67338337,0.54692737); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.66095207,0.54637833); glVertex3f(0.22737373+$x,0.217249+$y,-0.053128253+$z);

    glNormal3f( 0,-0.0216362082290434,-0.999765909847635 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.71954523,0.50337394); glVertex3f(0.26069179+$x,0.3782626+$y,-0.056806379+$z);

    glNormal3f( 0,-0.0333207423177251,-0.999444709892146 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.6894584,0.49754228); glVertex3f(0.20129873+$x,0.34248181+$y,-0.056806379+$z);

    glNormal3f( 0.0654656973114266,-0.989492159297879,-0.128916675273411 );
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.78734989,0.89500667); glVertex3f(0.17667234+$x,0.2709202+$y,-0.034737629+$z);

    glNormal3f( 0.0255943033320079,-0.0103620276097181,-0.999618707318328 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.66032266,0.49256807); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.66799509,0.48883876); glVertex3f(0.15204594+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( -0.0468153076546788,0.0189535084841456,-0.998723731311787 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.68872821,0.53946876); glVertex3f(0.26358902+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( -0.0513978295750927,0.00832351570634916,-0.998643571151017 );
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.7252518,0.50851856); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.70963735,0.52105721); glVertex3f(0.27083207+$x,0.3335366+$y,-0.056806379+$z);

    glNormal3f( -0.0686830633709335,-0.766077897349506,-0.639067517558626 );
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.78346918,0.89103398); glVertex3f(0.16508346+$x,0.2798654+$y,-0.053128253+$z);

    glNormal3f( -0.231236715621434,0.859755463149018,-0.455357139983584 );
    glTexCoord2f(0.79528697,0.93804406); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.79531499,0.9344735); glVertex3f(0.21288762+$x,0.172523+$y,-0.034737629+$z);

    glNormal3f( -0.0827907714743233,-0.0223456042468622,-0.996316396597752 );
    glTexCoord2f(0.6407485,0.56010555); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);
    glTexCoord2f(0.67338337,0.54692737); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.66781908,0.55788031); glVertex3f(0.25634596+$x,0.20830381+$y,-0.056806379+$z);

    glNormal3f( -0.127604383185555,0.0826585166279983,-0.988374772553758 );
    glTexCoord2f(0.6407485,0.56010555); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.62945695,0.57652684); glVertex3f(0.22013067+$x,0.1188518+$y,-0.056806379+$z);

    glNormal3f( 0.0842726333523135,0.0381986838574335,-0.995710291108526 );
    glTexCoord2f(0.50212587,0.43248751); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);
    glTexCoord2f(0.49840833,0.46371821); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);

    glNormal3f( 0.0523755587177694,0.00605845737811086,-0.998609080643271 );
    glTexCoord2f(0.77609514,0.2833356); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);
    glTexCoord2f(0.79637138,0.28606614); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.79315891,0.31383807); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);

    glNormal3f( 0.964124459876243,0.137458084106909,-0.227088751333042 );
    glTexCoord2f(0.63376607,0.91133515); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);

    glNormal3f( 0.138281543217918,0.0382280758988653,-0.989654904003583 );
    glTexCoord2f(0.50212587,0.43248751); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.51882695,0.40760279); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.60883207,0.63229895); glVertex3f(0.27083207+$x,-0.0063809978+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.59876726,0.59144407); glVertex3f(0.19115845+$x,0.047290202+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.61200397,0.57676182); glVertex3f(0.19115845+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.62945695,0.57652684); glVertex3f(0.22013067+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.62702331,0.61158867); glVertex3f(0.27083207+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.64575953,0.59134686); glVertex3f(0.27083207+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.59369349,0.64010088); glVertex3f(0.25634596+$x,-0.042161799+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.44313583,0.47243081); glVertex3f(-0.25066798+$x,0.011509401+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.45982869,0.439572); glVertex3f(-0.27239715+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.46987886,0.43798628); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.48836156,0.46529509); glVertex3f(-0.18548047+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.47777219,0.47704089); glVertex3f(-0.18548047+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.45195696,0.45368385); glVertex3f(-0.26515409+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.59876726,0.59144407); glVertex3f(0.19115845+$x,0.047290202+$y,-0.056806379+$z);
    glTexCoord2f(0.61200397,0.57676182); glVertex3f(0.19115845+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.47777219,0.47704089); glVertex3f(-0.18548047+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.60883207,0.63229895); glVertex3f(0.27083207+$x,-0.0063809978+$y,-0.056806379+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.44313583,0.47243081); glVertex3f(-0.25066798+$x,0.011509401+$y,-0.056806379+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.55243699,0.38466024); glVertex3f(-0.19996658+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.54726962,0.36935554); glVertex3f(-0.23183603+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.55738344,0.35718103); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.54726962,0.36935554); glVertex3f(-0.23183603+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.62945695,0.57652684); glVertex3f(0.22013067+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.64575953,0.59134686); glVertex3f(0.27083207+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.46987886,0.43798628); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.48836156,0.46529509); glVertex3f(-0.18548047+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.79315891,0.31383807); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.79637138,0.28606614); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.79899953,0.30298301); glVertex3f(-0.27239715+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.62702331,0.61158867); glVertex3f(0.27083207+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.45195696,0.45368385); glVertex3f(-0.26515409+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.45982869,0.439572); glVertex3f(-0.27239715+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.46657473,0.46268761); glVertex3f(-0.22604159+$x,0.063391566+$y,-0.056806379+$z);
    glTexCoord2f(0.5222865,0.38941738); glVertex3f(-0.24342493+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.47992902,0.43640056); glVertex3f(-0.24342493+$x,0.12779701+$y,-0.056806379+$z);
    glTexCoord2f(0.48576291,0.42036759); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.57225274,0.3492937); glVertex3f(-0.22024715+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.55738344,0.35718103); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.51277554,0.38084302); glVertex3f(-0.27239715+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.50191657,0.39766886); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);

    glNormal3f( 0,0,-1 );# north face
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.6569601,0.57470614); glVertex3f(0.26358902+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.60286382,0.30769012); glVertex3f(-0.23183603+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.59075291,0.30248891); glVertex3f(-0.26080825+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.6569601,0.57470614); glVertex3f(0.26358902+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.59369349,0.64010088); glVertex3f(0.25634596+$x,-0.042161799+$y,-0.056806379+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.61588813,0.59938317); glVertex3f(0.23195608+$x,0.059886498+$y,-0.056806379+$z);
    glTexCoord2f(0.47992902,0.43640056); glVertex3f(-0.24342493+$x,0.12779701+$y,-0.056806379+$z);
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.46987886,0.43798628); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.56976358,0.32567514); glVertex3f(-0.26080825+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);

    glNormal3f( -0.301972287191563,0.576903034405174,-0.758943757245818 );
    glTexCoord2f(0.75310762,0.97749093); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);
    glTexCoord2f(0.75033958,0.9685948); glVertex3f(0.11148483+$x,0.065180597+$y,-0.034737629+$z);

    glNormal3f( -0.0443341932266723,0.0483574956925397,-0.997845695446589 );
    glTexCoord2f(0.57526626,0.57146201); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);
    glTexCoord2f(0.61253979,0.56661058); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.59876726,0.59144407); glVertex3f(0.19115845+$x,0.047290202+$y,-0.056806379+$z);

    glNormal3f( -0.0190410731892886,0.0185013920474813,-0.999647505886003 );
    glTexCoord2f(0.57526626,0.57146201); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.56224368,0.62239427); glVertex3f(0.17667234+$x,-0.060052198+$y,-0.056806379+$z);

    glNormal3f( 0.00423002959037052,0.015983870747005,-0.999863302019635 );
    glTexCoord2f(0.57526626,0.57146201); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.47556667,0.56554515); glVertex3f(-0.055105459+$x,-0.095832998+$y,-0.056806379+$z);

    glNormal3f( -0.0120691337579887,0.0586352744563355,-0.998206512000279 );
    glTexCoord2f(0.80182696,0.12820222); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);
    glTexCoord2f(0.70730292,0.177309); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.74341446,0.1391077); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);

    glNormal3f( 0.497958725622511,0.329788259282351,-0.802045392490924 );
    glTexCoord2f(0.65740249,0.96185794); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);
    glTexCoord2f(0.6680608,0.95646883); glVertex3f(-0.10580685+$x,0.065180597+$y,-0.031059503+$z);

    glNormal3f( -0.0113514362425534,0.0238976902081784,-0.999649961385457 );
    glTexCoord2f(0.69001794,0.13464797); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);
    glTexCoord2f(0.70730292,0.177309); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.66693866,0.19984674); glVertex3f(-0.19272352+$x,-0.095832998+$y,-0.056806379+$z);

    glNormal3f( 0.0442143749136606,-0.0358010049289299,-0.998380376959139 );
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.47777219,0.47704089); glVertex3f(-0.18548047+$x,0.056235402+$y,-0.056806379+$z);

    glNormal3f( 0.0409892786522489,-0.0110632070497159,-0.999098335743456 );
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);
    glTexCoord2f(0.40580343,0.51862113); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.42644296,0.50528962); glVertex3f(-0.22893881+$x,-0.068997399+$y,-0.056806379+$z);

    glNormal3f( 0.0422242697400927,-0.0205137672371389,-0.998897540490843 );
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.4473521,0.48687807); glVertex3f(-0.22169575+$x,-0.0063809978+$y,-0.056806379+$z);

    glNormal3f( -0.818218944888052,0.486530478437536,0.306277409838898 );
    glTexCoord2f(0.98273724,0.935285); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( -0.0476257360316186,-0.00964081742245424,0.998818724247235 );
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.31893596,0.50361277); glVertex3f(0.27083207+$x,0.1635778+$y,0.055688457+$z);

    glNormal3f( -0.244094550269587,0.0486742258978562,0.96852912721401 );
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.30049099,0.53520797); glVertex3f(0.22737373+$x,0.23513941+$y,0.052010331+$z);

    glNormal3f( -0.0156755431712029,0.0317317805447218,0.999373489467151 );
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.29728155,0.47191591); glVertex3f(0.22013067+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.31329478,0.47982635); glVertex3f(0.25634596+$x,0.1099066+$y,0.055688457+$z);

    glNormal3f( -0.0359477035805313,-0.00970246142795406,0.99930657200357 );
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.31913488,0.53125511); glVertex3f(0.27083207+$x,0.2261942+$y,0.055688457+$z);

    glNormal3f( -0.999473685936944,0.0123366087347733,-0.0300026532917354 );
    glTexCoord2f(0.98273724,0.935285); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.98317589,0.95401288); glVertex3f(0.22013067+$x,0.217249+$y,0.033619707+$z);

    glNormal3f( 0,-0.0236246800060393,0.999720898298426 );
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31620041,0.55101955); glVertex3f(0.26358902+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31620041,0.55101955); glVertex3f(0.26358902+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.0515675748304662,0.0835100008443756,0.995171776622045 );
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.10512178,0.47982848); glVertex3f(-0.21445269+$x,0.1099066+$y,0.055688457+$z);

    glNormal3f( 0.11962392141797,0.106086055836865,0.98713518131083 );
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.12434518,0.47983557); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( 0.470151296735481,0.699974878274311,0.537580624616261 );
    glTexCoord2f(0.82029571,0.93221355); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.82078666,0.93701659); glVertex3f(-0.20720963+$x,0.172523+$y,0.033619707+$z);

    glNormal3f( 0.10446650022457,-0.0211469862175126,0.994303552897578 );
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.089108229,0.50356044); glVertex3f(-0.25066798+$x,0.1635778+$y,0.055688457+$z);

    glNormal3f( 0.888991677189609,0.235046197166311,0.39299756116961 );
    glTexCoord2f(0.82029571,0.93221355); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.81529727,0.95059603); glVertex3f(-0.22169575+$x,0.20830381+$y,0.052010331+$z);

    glNormal3f( 0.0795014070997731,-0.0948435999193762,0.992312560549089 );
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10234533,0.55893451); glVertex3f(-0.22073002+$x,0.28881061+$y,0.055688457+$z);

    glNormal3f( 0.0630919422313486,-0.0510864668281106,0.996699342696932 );
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.086006451,0.54848263); glVertex3f(-0.25791104+$x,0.26495674+$y,0.055688457+$z);

    glNormal3f( 0.0328035410098664,0.0265614764255507,0.999108810724492 );
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.085905325,0.52729228); glVertex3f(-0.25791104+$x,0.217249+$y,0.055688457+$z);

    glNormal3f( 0.0627679561479042,-0.990344476108031,-0.123604216446385 );
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.83454855,0.97440751); glVertex3f(-0.17099436+$x,0.2709202+$y,0.033619707+$z);

    glNormal3f( 0.902069403860702,-0.287581900396654,0.321818957152382 );
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.82078369,0.97101175); glVertex3f(-0.20720963+$x,0.26197501+$y,0.029941581+$z);

    glNormal3f( -0.0294243490689439,-0.10244863941668,0.994303014157928 );
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.11045874,0.55893442); glVertex3f(-0.20238094+$x,0.28881061+$y,0.055688457+$z);

    glNormal3f( 0.182789002247932,-0.0401004353811406,0.982334024524982 );
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.10192611,0.5233441); glVertex3f(-0.22169575+$x,0.20830381+$y,0.052010331+$z);

    glNormal3f( 0.171290167038024,-0.877922550801768,0.447114832531647 );
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.83493083,0.97552334); glVertex3f(-0.17002861+$x,0.27390193+$y,0.052010331+$z);

    glNormal3f( 0.999978473238304,-0.0024952707573796,-0.00606849930689187 );
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.81735589,0.95234657); glVertex3f(-0.21445269+$x,0.217249+$y,0.033619707+$z);

    glNormal3f( -0.437505277625503,-0.455364350873483,0.775391797740602 );
    glTexCoord2f(0.85279937,0.97438904); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
    glTexCoord2f(0.87309682,0.95399536); glVertex3f(-0.069591572+$x,0.217249+$y,0.052010331+$z);

    glNormal3f( -0.00888428346021854,-0.0394216384266237,0.999183168358614 );
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.16042011,0.57343668); glVertex3f(-0.089389259+$x,0.32160967+$y,0.055688457+$z);

    glNormal3f( -0.0541446266705701,-0.438932661332223,0.896887104500068 );
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.12477146,0.5523494); glVertex3f(-0.17002861+$x,0.27390193+$y,0.052010331+$z);

    glNormal3f( 0.0253839286323511,-0.0349413387197853,0.999066944211276 );
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.13095567,0.56948168); glVertex3f(-0.15602537+$x,0.31266447+$y,0.055688457+$z);

    glNormal3f( 0.0509174605251455,0.00824571563231598,0.998668824179158 );
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.12412342,0.56025272); glVertex3f(-0.17147723+$x,0.29179234+$y,0.055688457+$z);

    glNormal3f( -0.0198635468607668,0.00241257008030373,0.999799789463729 );
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.19671717,0.55102294); glVertex3f(-0.0073012877+$x,0.2709202+$y,0.055688457+$z);

    glNormal3f( -0.182911157307493,-0.850237813768224,0.493598185340126 );
    glTexCoord2f(0.85279937,0.97438904); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.84831034,0.97100838); glVertex3f(-0.13477908+$x,0.26197501+$y,0.033619707+$z);

    glNormal3f( 0.522192764643853,-0.434711836889556,0.733716795106748 );
    glTexCoord2f(0.94664114,0.9743892); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.95348876,0.95678585); glVertex3f(0.14045706+$x,0.2261942+$y,0.015229082+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);

    glNormal3f( 0.0610105068680172,-0.0637723176764647,0.996097791158017 );
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.23643789,0.52334273); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);

    glNormal3f( 0.00820375874026165,-0.0318849248112696,0.999457878008029 );
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.24347574,0.57870956); glVertex3f(0.098447333+$x,0.3335366+$y,0.055688457+$z);

    glNormal3f( 0.156575295610154,-0.962852317198809,0.219999072883222 );
    glTexCoord2f(0.94664114,0.9743892); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.96832851,0.97778981); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);

    glNormal3f( 0.0168121837058396,0.00748718620694636,0.999830631918098 );
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.19671717,0.55102294); glVertex3f(-0.0073012877+$x,0.2709202+$y,0.055688457+$z);

    glNormal3f( 0.0121265303785383,-0.0176742353025994,0.999770257943017 );
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.20888704,0.57475461); glVertex3f(0.020222326+$x,0.3245914+$y,0.055688457+$z);

    glNormal3f( 0.0099148798658332,0.0240846459373426,0.999660754950058 );
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);

    glNormal3f( 0.0309025189943787,-0.055048838118601,0.998005340537612 );
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.29087517,0.57475377); glVertex3f(0.20564456+$x,0.3245914+$y,0.055688457+$z);

    glNormal3f( -0.0916048008243825,0.00890083625985475,0.99575566058135 );
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.31201278,0.57079826); glVertex3f(0.25344874+$x,0.31564621+$y,0.055688457+$z);

    glNormal3f( -0.820447039720492,-0.191916824534247,0.538548593419918 );
    glTexCoord2f(0.9823111,0.97710933); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.98594356,0.96079401); glVertex3f(0.22737373+$x,0.23513941+$y,0.052010331+$z);

    glNormal3f( -0.147503731608102,-0.660879727699147,0.73585367749165 );
    glTexCoord2f(0.9823111,0.97710933); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);
    glTexCoord2f(0.96950287,0.97345078); glVertex3f(0.19115845+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);

    glNormal3f( -0.0264650449358261,-0.137146458890925,0.990197177440041 );
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);
    glTexCoord2f(0.27934568,0.56684329); glVertex3f(0.17956957+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.27999376,0.55498467); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);

    glNormal3f( -0.0289678461544022,0.718947114048512,0.694460878012931 );
    glTexCoord2f(0.94697969,0.88775212); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);
    glTexCoord2f(0.88685843,0.88601197); glVertex3f(-0.03337629+$x,0.038345001+$y,0.052010331+$z);

    glNormal3f( -0.509597591051073,0.469480702140635,0.721039642122734 );
    glTexCoord2f(0.94697969,0.88775212); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.94188729,0.89623031); glVertex3f(0.11148483+$x,0.065180597+$y,0.029941581+$z);

    glNormal3f( 0.00852386586918454,-0.00138037860832118,0.999962718437814 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.15316247,0.4046773); glVertex3f(-0.10580685+$x,-0.060052198+$y,0.055688457+$z);

    glNormal3f( -0.0229139334257617,-0.0061845785813189,0.999718311647202 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.30368761,0.40072045); glVertex3f(0.2346168+$x,-0.068997399+$y,0.055688457+$z);

    glNormal3f( -0.0194375188211019,-0.0062955335713108,0.999791252771863 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.31009285,0.40863099); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.30368732,0.42840755); glVertex3f(0.2346168+$x,-0.0063809978+$y,0.055688457+$z);

    glNormal3f( 0,0.0110131969464249,0.999939352907475 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.13074413,0.37699043); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.16917606,0.37699003); glVertex3f(-0.069591572+$x,-0.1226686+$y,0.055688457+$z);

    glNormal3f( -0.00262038296836854,0.0100783666990202,0.999945778588909 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.28126921,0.37698888); glVertex3f(0.18391539+$x,-0.1226686+$y,0.055688457+$z);

    glNormal3f( -0.0164844029535194,-0.0100107476347526,0.999814007398906 );
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.30048437,0.45609468); glVertex3f(0.22737373+$x,0.056235402+$y,0.055688457+$z);

    glNormal3f( 0.0205435561488187,0.0332688180026577,0.999235281627639 );
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.11793308,0.41654356); glVertex3f(-0.18548047+$x,-0.033216598+$y,0.055688457+$z);

    glNormal3f( 0.00680379781921631,0.0601413831344237,0.998166680655047 );
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.18519607,0.44819255); glVertex3f(-0.03337629+$x,0.038345001+$y,0.052010331+$z);

    glNormal3f( 0.0755763861000448,0,0.99714001517543 );
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.11793271,0.45214125); glVertex3f(-0.18548047+$x,0.047290202+$y,0.055688457+$z);

    glNormal3f( 0.584439541063955,0.424144157952273,0.691760186853733 );
    glTexCoord2f(0.84954835,0.8928106); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);
    glTexCoord2f(0.85105641,0.90643102); glVertex3f(-0.12753602+$x,0.092016197+$y,0.026263457+$z);
    glTexCoord2f(0.83456368,0.9132052); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( 0,0,1 );# south face
    glTexCoord2f(0.099784277,0.45389935); glVertex3f(-0.22652446+$x,0.051265845+$y,0.055688457+$z);
    glTexCoord2f(0.07950057,0.47191814); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.082703393,0.45609691); glVertex3f(-0.26515409+$x,0.056235402+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.10981796,0.58266623); glVertex3f(-0.20382955+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.12092043,0.59189514); glVertex3f(-0.17872028+$x,0.36335393+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.11067193,0.59057682); glVertex3f(-0.20189806+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.11472881,0.57343715); glVertex3f(-0.19272352+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10234519,0.57211884); glVertex3f(-0.22073002+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10165136,0.56519707); glVertex3f(-0.22229933+$x,0.30297383+$y,0.055688457+$z);
    glTexCoord2f(0.10981796,0.58266623); glVertex3f(-0.20382955+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.11024504,0.57739249); glVertex3f(-0.20286381+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.11067193,0.59057682); glVertex3f(-0.20189806+$x,0.3603722+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.11809744,0.58266615); glVertex3f(-0.18510491+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.092309973,0.59321388); glVertex3f(-0.24342493+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.11793057,0.66177214); glVertex3f(-0.18548047+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.13522486,0.66968256); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.10682892,0.57211879); glVertex3f(-0.21058973+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.10853685,0.58793997); glVertex3f(-0.20672676+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.10234519,0.57211884); glVertex3f(-0.22073002+$x,0.31862794+$y,0.055688457+$z);
    glTexCoord2f(0.88419217,0.91943212); glVertex3f(-0.040619346+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.89100473,0.91314308); glVertex3f(-0.026133234+$x,0.1099066+$y,0.011550957+$z);

    glNormal3f( 0.0162429407807543,-0.00984286493686319,-0.999819626174955 );
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.96991453,0.84286693); glVertex3f(0.14335428+$x,0.4945502+$y,-0.053128253+$z);

    glNormal3f( 0.0223914896177983,-0.116036408364613,-0.992992534275327 );
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.73907641,0.43581228); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.75694129,0.44659481); glVertex3f(0.23751401+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( -0.117352765677137,-0.0046226968828589,-0.993079533099669 );
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.71402624,0.46647176); glVertex3f(0.19550429+$x,0.4319338+$y,-0.053128253+$z);

    glNormal3f( -0.821973174932165,-0.329859808499344,-0.464276433204091 );
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.9612634,0.85311844); glVertex3f(0.17667234+$x,0.47665981+$y,-0.031059503+$z);

    glNormal3f( -0.0778913672634628,0.0441488107687648,-0.995983843952065 );
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.74655786,0.46384937); glVertex3f(0.24620568+$x,0.485605+$y,-0.056806379+$z);

    glNormal3f( -0.999438320175564,0.012744244142208,-0.0309940059671385 );
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.94518539,0.85286461); glVertex3f(0.18536401+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( -0.0400442706542706,-0.996081401535451,0.0788561849377652 );
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.96810846,0.83389045); glVertex3f(0.11583067+$x,0.485605+$y,-0.042093878+$z);

    glNormal3f( 0.457851283959128,-0.803899776494934,-0.379627911419028 );
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.9671243,0.82549076); glVertex3f(0.089755666+$x,0.47665981+$y,-0.038415754+$z);

    glNormal3f( 0.050714334600141,-0.00821282514549789,-0.998679430933267 );
    glTexCoord2f(0.69614708,0.41841231); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.67712789,0.40125651); glVertex3f(0.034708438+$x,0.485605+$y,-0.056806379+$z);

    glNormal3f( 0.0548133565686883,-0.230792359603096,-0.971457864598619 );
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.97572147,0.86132883); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.96991453,0.84286693); glVertex3f(0.14335428+$x,0.4945502+$y,-0.053128253+$z);

    glNormal3f( 0.0114980595617792,-0.0856532240971272,-0.996258661105679 );
    glTexCoord2f(0.69614708,0.41841231); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.71054355,0.41008919); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.73506609,0.42687378); glVertex3f(0.1708779+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( 0.736648564884134,-0.414393067761708,-0.534441088657288 );
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.956843,0.81293775); glVertex3f(0.068026497+$x,0.440879+$y,-0.053128253+$z);

    glNormal3f( -0.0184160020074316,0.0268410453282057,-0.999470064161879 );
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.65078178,0.4094434); glVertex3f(0.0028389911+$x,0.4319338+$y,-0.056806379+$z);

    glNormal3f( 0.0137172341935485,-0.0299890141957423,-0.999456100343405 );
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.78266619,0.82448924); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.7967024,0.81747857); glVertex3f(-0.14636796+$x,0.5392762+$y,-0.056806379+$z);

    glNormal3f( -0.762439149478705,-0.323732270682237,-0.560253478580108 );
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.82019781,0.83967519); glVertex3f(-0.084077684+$x,0.47665981+$y,-0.031059503+$z);

    glNormal3f( -0.0213643694121231,-0.998496258905174,0.0504854897172937 );
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.80424135,0.83693626); glVertex3f(-0.12753602+$x,0.485605+$y,-0.034737629+$z);

    glNormal3f( -0.00585696416383945,-0.0331972545866421,-0.999431657622818 );
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.67928472,0.36061619); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.70727837,0.39649936); glVertex3f(0.078166776+$x,0.5392762+$y,-0.056806379+$z);

    glNormal3f( -0.0270792699517271,0.0526235338132116,-0.998247202263994 );
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.71054355,0.41008919); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.67712789,0.40125651); glVertex3f(0.034708438+$x,0.485605+$y,-0.056806379+$z);

    glNormal3f( -0.989899198941878,0.053914938259495,-0.131121147671547 );
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.82291874,0.85587554); glVertex3f(-0.075386016+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( -0.1214647351443,-0.778799297370492,-0.615400660165028 );
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.79726186,0.83380426); glVertex3f(-0.14636796+$x,0.4945502+$y,-0.053128253+$z);

    glNormal3f( -0.100026116772951,-0.0284044588521273,-0.994579289288009 );
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.6267314,0.39309637); glVertex3f(-0.062348515+$x,0.42298861+$y,-0.053128253+$z);

    glNormal3f( 0.0334748576678017,-0.0140946363392835,-0.999340169877396 );
    glTexCoord2f(0.60131129,0.33586984); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.60286382,0.30769012); glVertex3f(-0.23183603+$x,0.53033101+$y,-0.056806379+$z);

    glNormal3f( 0.0537647282483911,-0.0582686495874808,-0.996852104613131 );
    glTexCoord2f(0.60131129,0.33586984); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);
    glTexCoord2f(0.615434,0.32434555); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.62032837,0.34473912); glVertex3f(-0.14636796+$x,0.4945502+$y,-0.053128253+$z);

    glNormal3f( 0.731337108766839,0.00611258620286155,-0.681988760633542 );
    glTexCoord2f(0.78088717,0.83943466); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.78220031,0.85717364); glVertex3f(-0.18982631+$x,0.4319338+$y,-0.053128253+$z);

    glNormal3f( 0.221287739633234,-0.845132133688982,-0.486603958979294 );
    glTexCoord2f(0.78088717,0.83943466); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.78898544,0.84217603); glVertex3f(-0.17099436+$x,0.47665981+$y,-0.038415754+$z);

    glNormal3f( 0.0611169314354529,0.00247436118785278,-0.998127546072458 );
    glTexCoord2f(0.75732704,0.20967564); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.78629144,0.20700189); glVertex3f(-0.23183603+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.77946334,0.22133826); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);

    glNormal3f( -0.0348797505778797,0.0480124653169545,-0.998237549971856 );
    glTexCoord2f(0.57586718,0.37385573); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.56813006,0.39880794); glVertex3f(-0.15216242+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.80558317,0.87606678); glVertex3f(-0.12753602+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.73378352,0.82389761); glVertex3f(0.133214+$x,0.3782626+$y,0.033619707+$z);

    glNormal3f( 0.869432434562479,0.331772226600998,-0.366079815596239 );
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.78962744,0.87337046); glVertex3f(-0.17099436+$x,0.3872078+$y,-0.031059503+$z);

    glNormal3f( 0.119079600754261,0.697769899663004,-0.706354879510637 );
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.80727759,0.87916681); glVertex3f(-0.12319019+$x,0.36931741+$y,-0.053128253+$z);

    glNormal3f( 0.103173100419622,0.0289726692496431,-0.994241366965966 );
    glTexCoord2f(0.75732704,0.20967564); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.76696559,0.23268068); glVertex3f(-0.22024715+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.75125989,0.23338665); glVertex3f(-0.18982631+$x,0.4319338+$y,-0.053128253+$z);

    glNormal3f( 0.997405421273981,0.0273767566635257,0.066580318472187 );
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.78589913,0.85715341); glVertex3f(-0.17968603+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( 0.0340046427106247,0.0495612763649522,-0.998192047733901 );
    glTexCoord2f(0.57586718,0.37385573); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.55243699,0.38466024); glVertex3f(-0.19996658+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( -0.0418495890526442,0.142322132882211,-0.988935297371867 );
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.59087434,0.39270889); glVertex3f(-0.12319019+$x,0.36931741+$y,-0.053128253+$z);

    glNormal3f( -0.0120600195515623,0.0703091464497839,-0.997452344653076 );
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.59027486,0.41344894); glVertex3f(-0.092769351+$x,0.3335366+$y,-0.056806379+$z);

    glNormal3f( -0.713512824881254,0.21893359102387,-0.665558060165577 );
    glTexCoord2f(0.8245944,0.8753041); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.82878866,0.858841); glVertex3f(-0.062348515+$x,0.42298861+$y,-0.053128253+$z);

    glNormal3f( -0.193245165163643,0.798014212701354,-0.570814875828859 );
    glTexCoord2f(0.8245944,0.8753041); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.82053058,0.8709384); glVertex3f(-0.084077684+$x,0.3872078+$y,-0.038415754+$z);

    glNormal3f( -0.0483034463551026,-0.011733597878593,-0.998763785762701 );
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.62919115,0.42191748); glVertex3f(-0.014544344+$x,0.3782626+$y,-0.056806379+$z);

    glNormal3f( 0.102938679492835,0.0414501938511025,-0.99382368139121 );
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.67482538,0.42580811); glVertex3f(0.068026497+$x,0.440879+$y,-0.053128253+$z);

    glNormal3f( 0.00985078704370037,0.0239289693305433,-0.999665127140783 );
    glTexCoord2f(0.54153824,0.036004087); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.51930797,0.06775834); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.50003317,0.059826715); glVertex3f(-0.014544344+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( -0.0213303049165282,0.0120900235177406,-0.999699379525419 );
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.66799509,0.48883876); glVertex3f(0.15204594+$x,0.3245914+$y,-0.056806379+$z);

    glNormal3f( 0.806222294333382,0.328556967729889,-0.491991799805604 );
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.93667043,0.81658441); glVertex3f(0.089755666+$x,0.3872078+$y,-0.031059503+$z);

    glNormal3f( 0,1,0 );# top face
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.93042961,0.83094419); glVertex3f(0.133214+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.73378352,0.82389761); glVertex3f(0.133214+$x,0.3782626+$y,0.033619707+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.80558317,0.87606678); glVertex3f(-0.12753602+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);
    glTexCoord2f(0.93042961,0.83094419); glVertex3f(0.133214+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( 0.0235726572519806,-0.0171784101186897,-0.999574525513668 );
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.62919115,0.42191748); glVertex3f(-0.014544344+$x,0.3782626+$y,-0.056806379+$z);

    glNormal3f( 0.00696409706896991,0.0372168866078433,-0.999282945267872 );
    glTexCoord2f(0.54153824,0.036004087); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.57070743,0.06775834); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.54950516,0.063792524); glVertex3f(0.096998722+$x,0.31564621+$y,-0.056806379+$z);

    glNormal3f( 0.1155883675104,0.741041430181182,-0.661435505587135 );
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.9265368,0.83426583); glVertex3f(0.14480289+$x,0.36931741+$y,-0.053128253+$z);

    glNormal3f( 0.998635357931677,-0.0198605658565716,-0.0483009297273742 );
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.95276452,0.81682519); glVertex3f(0.081063998+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( 0.014286641757234,-0.0208225768070287,-0.999681105234272 );
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.65078178,0.4094434); glVertex3f(0.0028389911+$x,0.4319338+$y,-0.056806379+$z);

    glNormal3f( -0.0524763069532235,0.0531135324199644,-0.997208699261305 );
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.6894584,0.49754228); glVertex3f(0.20129873+$x,0.34248181+$y,-0.056806379+$z);

    glNormal3f( -0.0536661247654986,0.10139315417305,-0.993397893766387 );
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.67885067,0.47202176); glVertex3f(0.14480289+$x,0.36931741+$y,-0.053128253+$z);

    glNormal3f( -0.0429859174350132,-0.0208837689002597,-0.998857386766895 );
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.72564872,0.48226092); glVertex3f(0.23896262+$x,0.42298861+$y,-0.056806379+$z);

    glNormal3f( -0.824240308251593,0.12680602146237,-0.551858810905655 );
    glTexCoord2f(0.92890193,0.85065139); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.94448873,0.85633582); glVertex3f(0.19550429+$x,0.4319338+$y,-0.053128253+$z);

    glNormal3f( -0.267629971611743,0.910155606466867,-0.316213488504249 );
    glTexCoord2f(0.92890193,0.85065139); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.9323289,0.84614889); glVertex3f(0.17667234+$x,0.3872078+$y,-0.038415754+$z);

    glNormal3f( 0.0355518556583526,0.0546949684169781,0.997869994532912 );
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.097433856,0.63012995); glVertex3f(-0.23183603+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.10960405,0.62221923); glVertex3f(-0.20431242+$x,0.4319338+$y,0.055688457+$z);

    glNormal3f( -0.0163272071816266,-0.0846102922279432,0.996280342451235 );
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.11793057,0.66177214); glVertex3f(-0.18548047+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);

    glNormal3f( 0.833651862387592,-0.33064134036284,0.442380917740317 );
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.85761174,0.8559413); glVertex3f(-0.17099436+$x,0.47665981+$y,0.029941581+$z);

    glNormal3f( 0.173028217220085,-0.508274199684516,0.843634146997799 );
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.86948672,0.86240059); glVertex3f(-0.1376763+$x,0.4945502+$y,0.052010331+$z);

    glNormal3f( 0.399541968766603,-0.011307340198473,0.9166451654003 );
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.1192195,0.61827112); glVertex3f(-0.18258325+$x,0.42298861+$y,0.052010331+$z);

    glNormal3f( 0.998702100483207,0.0193691353817255,0.0471057436518558 );
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.85453118,0.84007158); glVertex3f(-0.17968603+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( -0.027445673716102,-0.0872258784626414,0.99581041424595 );
    glTexCoord2f(0.89504843,0.86099529); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.8664051,0.87830544); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.86948672,0.86240059); glVertex3f(-0.1376763+$x,0.4945502+$y,0.052010331+$z);

    glNormal3f( -0.13049712451129,-0.677885074808381,0.723493141533712 );
    glTexCoord2f(0.89504843,0.86099529); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.88879824,0.85654593); glVertex3f(-0.084077684+$x,0.47665981+$y,0.037297832+$z);

    glNormal3f( -0.021809319665864,0.0273719503107576,0.999387377302664 );
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.20952684,0.64595); glVertex3f(0.021670937+$x,0.485605+$y,0.055688457+$z);

    glNormal3f( -0.00950828254405575,-0.0138581868135639,0.999858761636514 );
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.23450736,0.66968155); glVertex3f(0.078166776+$x,0.5392762+$y,0.055688457+$z);

    glNormal3f( 0.00491114767633961,-0.033801303620396,0.999416506018418 );
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.18967002,0.67759261); glVertex3f(-0.023236012+$x,0.55716661+$y,0.055688457+$z);
    glTexCoord2f(0.13522486,0.66968256); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);

    glNormal3f( -0.671980888713828,-0.0699573286141755,0.737256846273089 );
    glTexCoord2f(0.89504843,0.86099529); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.89624686,0.84333495); glVertex3f(-0.062348515+$x,0.440879+$y,0.052010331+$z);

    glNormal3f( 0.168484326281032,-0.776409297349706,0.607290403996772 );
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.74047198,0.8652332); glVertex3f(0.15204594+$x,0.4945502+$y,0.052010331+$z);

    glNormal3f( 0.903477500774663,-0.330099802164376,0.273427369158627 );
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.7183627,0.85879094); glVertex3f(0.089755666+$x,0.47665981+$y,0.029941581+$z);

    glNormal3f( 0.100988974230468,-0.0327089045089627,0.994349714461517 );
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.23003159,0.61826999); glVertex3f(0.068026497+$x,0.42298861+$y,0.052010331+$z);

    glNormal3f( -0.017163560847034,-0.0389131673752002,0.999095179441819 );
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.75435059,0.87476965); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.74715496,0.87794326); glVertex3f(0.1708779+$x,0.53033101+$y,0.055688457+$z);

    glNormal3f( 0.0227467148483664,0.0331529942682123,0.999191406055246 );
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.20120017,0.62221829); glVertex3f(0.0028389911+$x,0.4319338+$y,0.055688457+$z);

    glNormal3f( 0.0453953395150724,-0.104758179024246,0.993461115030596 );
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.20952684,0.64595); glVertex3f(0.021670937+$x,0.485605+$y,0.055688457+$z);

    glNormal3f( 0.0594235876369334,-0.988306875522736,-0.140422067449683 );
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.73378327,0.86198027); glVertex3f(0.133214+$x,0.485605+$y,0.033619707+$z);

    glNormal3f( 0.996041048019223,-0.0338057453744412,-0.082215583926931 );
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.71581229,0.84263114); glVertex3f(0.081063998+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( -0.0101583917004553,-0.0329015371569548,0.999406972124354 );
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.30496595,0.66572553); glVertex3f(0.23751401+$x,0.53033101+$y,0.055688457+$z);

    glNormal3f( -0.221287739633234,-0.845132133688982,0.486603958979294 );
    glTexCoord2f(0.75657711,0.86030351); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.74880613,0.85747601); glVertex3f(0.17667234+$x,0.47665981+$y,0.037297832+$z);

    glNormal3f( -0.0537647282483911,-0.0582686495874808,0.996852104613131 );
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.28446896,0.66177043); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.26718214,0.649912); glVertex3f(0.15204594+$x,0.4945502+$y,0.052010331+$z);

    glNormal3f( -0.731337108766839,0.00611258620286155,0.681988760633542 );
    glTexCoord2f(0.75657711,0.86030351); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.7558913,0.84301821); glVertex3f(0.19550429+$x,0.4319338+$y,0.052010331+$z);

    glNormal3f( -0.0196435821548893,0.0222679565616946,0.999559036671017 );
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.30880959,0.62221719); glVertex3f(0.24620568+$x,0.4319338+$y,0.055688457+$z);

    glNormal3f( -0.0338558651613771,-0.00959474661738764,0.999380668830213 );
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.31329308,0.64594894); glVertex3f(0.25634596+$x,0.485605+$y,0.055688457+$z);

    glNormal3f( -0.0611169314354529,0.00247436118785278,0.998127546072458 );
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.30560717,0.59848542); glVertex3f(0.23896262+$x,0.3782626+$y,0.055688457+$z);

    glNormal3f( 0.0348797505778797,0.0480124653169545,0.998237549971856 );
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.26973761,0.57475399); glVertex3f(0.1578404+$x,0.3245914+$y,0.055688457+$z);

    glNormal3f( -0.869432434562479,0.331772226600998,0.366079815596239 );
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.74920125,0.82705518); glVertex3f(0.17667234+$x,0.3872078+$y,0.029941581+$z);

    glNormal3f( -0.0340046527845183,0.0495612720403003,0.998192047605445 );
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.27934568,0.56684329); glVertex3f(0.17956957+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.29087517,0.57475377); glVertex3f(0.20564456+$x,0.3245914+$y,0.055688457+$z);

    glNormal3f( -0.119079600754261,0.697769899663004,0.706354879510637 );
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.73224872,0.82080348); glVertex3f(0.12886817+$x,0.36931741+$y,0.052010331+$z);

    glNormal3f( -0.997405421273981,0.0273767566635257,-0.066580318472187 );
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.7522864,0.84293882); glVertex3f(0.18536401+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( -0.103173100419622,0.0289726692496431,0.994241366965966 );
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.28639839,0.62222471); glVertex3f(0.19550429+$x,0.4319338+$y,0.052010331+$z);

    glNormal3f( 0.0418495908533311,0.142322133157936,0.988935297255985 );
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.25693419,0.59453791); glVertex3f(0.12886817+$x,0.36931741+$y,0.052010331+$z);

    glNormal3f( 0.0120600197992193,0.0703091465453986,0.997452344643342 );
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.24347574,0.57870956); glVertex3f(0.098447333+$x,0.3335366+$y,0.055688457+$z);

    glNormal3f( 0.0483034463551026,-0.011733597878593,0.998763785762701 );
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.2088868,0.59848641); glVertex3f(0.020222326+$x,0.3782626+$y,0.055688457+$z);

    glNormal3f( 0.193245177530938,0.798014207064165,0.57081487952294 );
    glTexCoord2f(0.71528789,0.82398032); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.71924451,0.82840162); glVertex3f(0.089755666+$x,0.3872078+$y,0.037297832+$z);

    glNormal3f( 0.713512824881254,0.21893359102387,0.665558060165577 );
    glTexCoord2f(0.71528789,0.82398032); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.71066175,0.83984495); glVertex3f(0.068026497+$x,0.42298861+$y,0.052010331+$z);

    glNormal3f( -0.807770641123258,0.328696605960572,0.489351747283405 );
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.88848915,0.8241657); glVertex3f(-0.084077684+$x,0.3872078+$y,0.029941581+$z);

    glNormal3f( -0.0117453781806361,0.999545745837242,-0.0277551449296581 );
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.8710173,0.8217408); glVertex3f(-0.12753602+$x,0.3782626+$y,0.033619707+$z);

    glNormal3f( -0.00974163953233419,0.0236638344290984,0.999672508074187 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.20888704,0.57475461); glVertex3f(0.020222326+$x,0.3245914+$y,0.055688457+$z);

    glNormal3f( -0.0238929272531687,-0.0174118053236151,0.999562882995686 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.2088868,0.59848641); glVertex3f(0.020222326+$x,0.3782626+$y,0.055688457+$z);

    glNormal3f( 0.0247560443921509,0.0250566387062727,0.999379459025848 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.13949591,0.58793966); glVertex3f(-0.13671056+$x,0.35440873+$y,0.055688457+$z);

    glNormal3f( 0.00765544388803187,0.035952584835149,0.999324174541249 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.16042011,0.57343668); glVertex3f(-0.089389259+$x,0.32160967+$y,0.055688457+$z);

    glNormal3f( -0.0144858179844177,-0.0211128731583735,0.999672150089378 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.20120017,0.62221829); glVertex3f(0.0028389911+$x,0.4319338+$y,0.055688457+$z);

    glNormal3f( -0.102975077803642,0.0416137038754747,0.993813077495511 );
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.1723836,0.62618117); glVertex3f(-0.062348515+$x,0.440879+$y,0.052010331+$z);

    glNormal3f( -0.068728409146833,0.94992911637989,0.304813188083894 );
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.86965967,0.8200345); glVertex3f(-0.13719343+$x,0.37528087+$y,0.052010331+$z);

    glNormal3f( -0.998021761041646,-0.0239086436683876,0.0581458618069289 );
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.89088534,0.84038283); glVertex3f(-0.075386016+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( 0.0768334287413371,0.292401559377568,0.953204045470547 );
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.13928973,0.59717598); glVertex3f(-0.13719343+$x,0.37528087+$y,0.052010331+$z);

    glNormal3f( 0.264855695446289,0.906848347918389,0.327837664808897 );
    glTexCoord2f(0.85593807,0.82279225); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.86101816,0.82676771); glVertex3f(-0.17099436+$x,0.3872078+$y,0.037297832+$z);

    glNormal3f( 0.0261636511571789,0.144058287858129,0.989223267547579 );
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.12092043,0.59189514); glVertex3f(-0.17872028+$x,0.36335393+$y,0.055688457+$z);

    glNormal3f( 0.149410074702554,-0.0193567511334424,0.988585831257426 );
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.11366097,0.60112425); glVertex3f(-0.19513788+$x,0.38422607+$y,0.055688457+$z);

    glNormal3f( 0.978387242522709,0.16776283381639,0.12088852409846 );
    glTexCoord2f(0.85593807,0.82279225); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.85353479,0.83698147); glVertex3f(-0.18258325+$x,0.42298861+$y,0.052010331+$z);

    glNormal3f( 0.139356203240679,0.067703162693733,0.987925164361961 );
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.82281732,0.95680858); glVertex3f(-0.20720963+$x,0.2261942+$y,0.015229082+$z);

    glNormal3f( 0.920052696247486,0.148995788419784,0.362357959980043 );
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.81735589,0.95234657); glVertex3f(-0.21445269+$x,0.217249+$y,0.033619707+$z);

    glNormal3f( 0.268967970725949,0.544468078730039,0.794487722981032 );
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.83547337,0.9384581); glVertex3f(-0.17099436+$x,0.172523+$y,0.015229082+$z);

    glNormal3f( 0.100706506117998,0.0815434828366606,0.991568888193036 );
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);
    glTexCoord2f(0.84003484,0.94723483); glVertex3f(-0.15650825+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.83453014,0.95403316); glVertex3f(-0.17099436+$x,0.217249+$y,0.011550957+$z);

    glNormal3f( 0.920052742949297,0.148996264345471,0.362357645707346 );
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.82078666,0.93701659); glVertex3f(-0.20720963+$x,0.172523+$y,0.033619707+$z);

    glNormal3f( -0.0641950915279326,0.0965335347463508,0.993257402133553 );
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);
    glTexCoord2f(0.83547337,0.9384581); glVertex3f(-0.17099436+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.85105036,0.93363128); glVertex3f(-0.12753602+$x,0.1635778+$y,0.018907206+$z);

    glNormal3f( -0.100706506162062,-0.0815434775064421,0.991568888626901 );
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);
    glTexCoord2f(0.83453014,0.95403316); glVertex3f(-0.17099436+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);

    glNormal3f( -0.100706533348782,-0.0815434593063617,0.991568887362458 );
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.83453014,0.95403316); glVertex3f(-0.17099436+$x,0.217249+$y,0.011550957+$z);

    glNormal3f( -0.168133225515383,-0.816839290365459,0.551819528644146 );
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.83113756,0.96926356); glVertex3f(-0.17823741+$x,0.26197501+$y,0.015229082+$z);

    glNormal3f( -0.216834567016401,-0.877870793147181,0.42699606682726 );
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.83454855,0.97440751); glVertex3f(-0.17099436+$x,0.2709202+$y,0.033619707+$z);

    glNormal3f( 0.322023546584424,-0.213338624637119,0.92238141063398 );
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.83113756,0.96926356); glVertex3f(-0.17823741+$x,0.26197501+$y,0.015229082+$z);

    glNormal3f( 0.335862329077834,-0.483471512732321,0.808363651015268 );
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.82078369,0.97101175); glVertex3f(-0.20720963+$x,0.26197501+$y,0.029941581+$z);

    glNormal3f( 0.627843289651583,-0.349506390288363,0.695455308979 );
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.82281732,0.95680858); glVertex3f(-0.20720963+$x,0.2261942+$y,0.015229082+$z);

    glNormal3f( 0.208125734457966,-0.533654332647525,0.819693071767023 );
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.93089635,0.95059634); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.93251357,0.92500023); glVertex3f(0.089755666+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( 0.119519346107538,0.502858216163451,0.856065850471176 );
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.96990993,0.93843606); glVertex3f(0.18391539+$x,0.172523+$y,0.015229082+$z);

    glNormal3f( 0.14531874856237,0.0532301526417576,0.987951928064317 );
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.95953679,0.95952183); glVertex3f(0.16218623+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.95348876,0.95678585); glVertex3f(0.14045706+$x,0.2261942+$y,0.015229082+$z);

    glNormal3f( -0.598663709770628,0.350094721106606,0.720441148781049 );
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.94465098,0.92476412); glVertex3f(0.12741956+$x,0.14926549+$y,0.020378457+$z);

    glNormal3f( 0.0911403574734461,0.0737976369337556,0.993099866087296 );
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.97145518,0.94716734); glVertex3f(0.19115845+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);

    glNormal3f( -0.513075023514066,0.326420062408082,0.793853867600041 );
    glTexCoord2f(0.97644231,0.94148581); glVertex3f(0.204035+$x,0.18345602+$y,0.019724568+$z);
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);

    glNormal3f( -0.322023546584423,0.21333862463712,0.92238141063398 );
    glTexCoord2f(0.97644231,0.94148581); glVertex3f(0.204035+$x,0.18345602+$y,0.019724568+$z);
    glTexCoord2f(0.97145518,0.94716734); glVertex3f(0.19115845+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.96990993,0.93843606); glVertex3f(0.18391539+$x,0.172523+$y,0.015229082+$z);

    glNormal3f( -0.338589299766765,0.244269990813478,0.908674560924556 );
    glTexCoord2f(0.94465098,0.92476412); glVertex3f(0.12741956+$x,0.14926549+$y,0.020378457+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);

    glNormal3f( 0.129800321812603,-0.0459817396810877,0.990473399982678 );
    glTexCoord2f(0.85257842,0.92985558); glVertex3f(-0.1235121+$x,0.15363869+$y,0.017681165+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);

    glNormal3f( 0.0520106173310918,0.921118815503149,0.385791424750363 );
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);
    glTexCoord2f(0.94697969,0.88775212); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);
    glTexCoord2f(0.90622424,0.89801055); glVertex3f(0.017325104+$x,0.065180597+$y,0.015229082+$z);

    glNormal3f( 0.071143634806824,0.0636698243404771,0.995431934737341 );
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);

    glNormal3f( 0.02558916685626,0.0621597323647626,0.997738123062331 );
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.89100473,0.91314308); glVertex3f(-0.026133234+$x,0.1099066+$y,0.011550957+$z);

    glNormal3f( -0.408235676100651,0.401850239151761,0.819670676584393 );
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);
    glTexCoord2f(0.94188729,0.89623031); glVertex3f(0.11148483+$x,0.065180597+$y,0.029941581+$z);
    glTexCoord2f(0.94401516,0.91159902); glVertex3f(0.12597095+$x,0.1099066+$y,0.015229082+$z);

    glNormal3f( -0.117686012835296,0.647191876077364,0.753188341600155 );
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);
    glTexCoord2f(0.90622424,0.89801055); glVertex3f(0.017325104+$x,0.065180597+$y,0.015229082+$z);
    glTexCoord2f(0.94188729,0.89623031); glVertex3f(0.11148483+$x,0.065180597+$y,0.029941581+$z);

    glNormal3f( -0.0630184933569822,0.102053895451138,0.992780777371452 );
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.92811025,0.91324335); glVertex3f(0.075269554+$x,0.1099066+$y,0.011550957+$z);

    glNormal3f( -0.0342827932122592,0.135712034663421,0.990155004904323 );
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.90622424,0.89801055); glVertex3f(0.017325104+$x,0.065180597+$y,0.015229082+$z);

    glNormal3f( 0.557877352385691,-0.372669680692146,0.741545796824407 );
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.85893905,0.84435205); glVertex3f(-0.17099436+$x,0.440879+$y,0.015229082+$z);

    glNormal3f( 0.284837068285488,-0.49202531413023,0.822665749126324 );
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.85761174,0.8559413); glVertex3f(-0.17099436+$x,0.47665981+$y,0.029941581+$z);

    glNormal3f( 0.272708245603548,-0.216801020511448,0.937351337698427 );
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.8699361,0.85587103); glVertex3f(-0.13622769+$x,0.47665981+$y,0.015229082+$z);

    glNormal3f( 0.897509667202049,0.167706138010621,0.407861555619587 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.85453118,0.84007158); glVertex3f(-0.17968603+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( 0.134863441583362,0.819006068721357,0.557710419054439 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.87735348,0.82563841); glVertex3f(-0.11884435+$x,0.3872078+$y,0.015229082+$z);

    glNormal3f( 0.0808615543070012,0.0785696844582304,0.99362377876095 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.87301772,0.83996618); glVertex3f(-0.12753602+$x,0.4319338+$y,0.011550957+$z);

    glNormal3f( 0.117416452440761,0.0651934656750083,0.990940557616605 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.85893905,0.84435205); glVertex3f(-0.17099436+$x,0.440879+$y,0.015229082+$z);

    glNormal3f( 0.176465277867138,0.89161145992131,0.417000012283289 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.8710173,0.8217408); glVertex3f(-0.12753602+$x,0.3782626+$y,0.033619707+$z);

    glNormal3f( 0.906483063828351,0.246621467188693,0.342733580079427 );
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.86101816,0.82676771); glVertex3f(-0.17099436+$x,0.3872078+$y,0.037297832+$z);

    glNormal3f( -0.557877277219078,0.372669845837695,0.741545770378294 );
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.8854105,0.83672086); glVertex3f(-0.084077684+$x,0.42298861+$y,0.015229082+$z);

    glNormal3f( -0.284837134946251,0.492025108335803,0.822665849128766 );
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.88848915,0.8241657); glVertex3f(-0.084077684+$x,0.3872078+$y,0.029941581+$z);

    glNormal3f( -0.272708358712145,0.216800953149006,0.937351320371509 );
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.87735348,0.82563841); glVertex3f(-0.11884435+$x,0.3872078+$y,0.015229082+$z);

    glNormal3f( -0.176465334007366,-0.891611498956916,0.416999905061705 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.87305635,0.8591357); glVertex3f(-0.12753602+$x,0.485605+$y,0.033619707+$z);

    glNormal3f( -0.897509786217479,-0.167706126080755,0.407861298628395 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.89088534,0.84038283); glVertex3f(-0.075386016+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( -0.117416426433527,-0.0651934640395302,0.990940560805796 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.8854105,0.83672086); glVertex3f(-0.084077684+$x,0.42298861+$y,0.015229082+$z);

    glNormal3f( -0.134863634570781,-0.819006494224661,0.557709747528398 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.8699361,0.85587103); glVertex3f(-0.13622769+$x,0.47665981+$y,0.015229082+$z);

    glNormal3f( -0.0808615525882107,-0.0785696840692161,0.993623778931587 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.87301772,0.83996618); glVertex3f(-0.12753602+$x,0.4319338+$y,0.011550957+$z);

    glNormal3f( -0.906483112769436,-0.24662142950694,0.342733477751717 );
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.88879824,0.85654593); glVertex3f(-0.084077684+$x,0.47665981+$y,0.037297832+$z);

    glNormal3f( 0.557877205749994,-0.372669929648778,0.741545782025731 );
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.72127817,0.84641038); glVertex3f(0.089755666+$x,0.440879+$y,0.015229082+$z);

    glNormal3f( 0.272708365591501,-0.216801053542101,0.937351295150035 );
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.73069236,0.85872733); glVertex3f(0.12452234+$x,0.47665981+$y,0.015229082+$z);

    glNormal3f( 0.284836985817275,-0.49202514867797,0.822665876634585 );
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.7183627,0.85879094); glVertex3f(0.089755666+$x,0.47665981+$y,0.029941581+$z);

    glNormal3f( 0.080861532116965,0.0785697080954101,0.993623778697701 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.73377488,0.84284365); glVertex3f(0.133214+$x,0.4319338+$y,0.011550957+$z);

    glNormal3f( 0.134863447222434,0.819006123696969,0.557710336958306 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.73686024,0.82699173); glVertex3f(0.14190567+$x,0.3872078+$y,0.015229082+$z);

    glNormal3f( 0.897509751545614,0.167706072731657,0.407861396861059 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.71581229,0.84263114); glVertex3f(0.081063998+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( 0.176465337732017,0.891611494103297,0.416999913863315 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.73378352,0.82389761); glVertex3f(0.133214+$x,0.3782626+$y,0.033619707+$z);

    glNormal3f( 0.117416439490893,0.0651934519217168,0.990940560055855 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.72127817,0.84641038); glVertex3f(0.089755666+$x,0.440879+$y,0.015229082+$z);

    glNormal3f( 0.906483146568001,0.246621455244461,0.342733369839122 );
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.71924451,0.82840162); glVertex3f(0.089755666+$x,0.3872078+$y,0.037297832+$z);

    glNormal3f( -0.272708245603548,0.216801020511448,0.937351337698427 );
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.73686024,0.82699173); glVertex3f(0.14190567+$x,0.3872078+$y,0.015229082+$z);

    glNormal3f( -0.284837217597401,0.492025190075246,0.822665771624655 );
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.74920125,0.82705518); glVertex3f(0.17667234+$x,0.3872078+$y,0.029941581+$z);

    glNormal3f( -0.557877352385691,0.372669680692146,0.741545796824407 );
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.74919549,0.83968588); glVertex3f(0.17667234+$x,0.42298861+$y,0.015229082+$z);

    glNormal3f( -0.176465259243899,-0.8916114841894,0.416999968275249 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.73378327,0.86198027); glVertex3f(0.133214+$x,0.485605+$y,0.033619707+$z);

    glNormal3f( -0.117416456076544,-0.0651934551834902,0.990940557876033 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.74919549,0.83968588); glVertex3f(0.17667234+$x,0.42298861+$y,0.015229082+$z);

    glNormal3f( -0.897509822364706,-0.167706098104039,0.407861230589023 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.7522864,0.84293882); glVertex3f(0.18536401+$x,0.4319338+$y,0.033619707+$z);

    glNormal3f( -0.0808615662997045,-0.0785696521938089,0.993623780336251 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.73377488,0.84284365); glVertex3f(0.133214+$x,0.4319338+$y,0.011550957+$z);

    glNormal3f( -0.134863637478411,-0.81900649492105,0.557709745802625 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.73069236,0.85872733); glVertex3f(0.12452234+$x,0.47665981+$y,0.015229082+$z);

    glNormal3f( -0.906483154259965,-0.246621536052142,0.342733291347932 );
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.74880613,0.85747601); glVertex3f(0.17667234+$x,0.47665981+$y,0.037297832+$z);

    glNormal3f( -0.557877352385691,-0.372669680692146,-0.741545796824407 );
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.94886767,0.85054407); glVertex3f(0.17667234+$x,0.440879+$y,-0.016347004+$z);

    glNormal3f( -0.284837068285488,-0.49202531413023,-0.822665749126324 );
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.9612634,0.85311844); glVertex3f(0.17667234+$x,0.47665981+$y,-0.031059503+$z);

    glNormal3f( -0.272708245603548,-0.216801020511448,-0.937351337698427 );
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.96375761,0.8411314); glVertex3f(0.14190567+$x,0.47665981+$y,-0.016347004+$z);

    glNormal3f( -0.897509787692851,0.167706044754953,-0.407861328821676 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.94518539,0.85286461); glVertex3f(0.18536401+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( -0.134863444314808,0.81900612300058,-0.557710338684075 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.9341119,0.82862365); glVertex3f(0.12452234+$x,0.3872078+$y,-0.016347004+$z);

    glNormal3f( -0.0808615437088312,0.0785696741604458,-0.99362378043772 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.94892671,0.83488405); glVertex3f(0.133214+$x,0.4319338+$y,-0.012668879+$z);

    glNormal3f( -0.906483188058524,0.246621561789672,-0.342733183435275 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.9323289,0.84614889); glVertex3f(0.17667234+$x,0.3872078+$y,-0.038415754+$z);

    glNormal3f( -0.117416460615334,0.0651934420862277,-0.990940558199894 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.94886767,0.85054407); glVertex3f(0.17667234+$x,0.440879+$y,-0.016347004+$z);

    glNormal3f( -0.176465259243899,0.8916114841894,-0.416999968275249 );
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.93042961,0.83094419); glVertex3f(0.133214+$x,0.3782626+$y,-0.034737629+$z);

    glNormal3f( 0.557877205749994,0.372669929648778,-0.741545782025731 );
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.94900184,0.81921098); glVertex3f(0.089755666+$x,0.42298861+$y,-0.016347004+$z);

    glNormal3f( 0.284837135129092,0.492025024622935,-0.822665899132966 );
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.93667043,0.81658441); glVertex3f(0.089755666+$x,0.3872078+$y,-0.031059503+$z);

    glNormal3f( 0.272708365591501,0.216801053542101,-0.937351295150035 );
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.9341119,0.82862365); glVertex3f(0.12452234+$x,0.3872078+$y,-0.016347004+$z);

    glNormal3f( 0.201755291335494,-0.895235301884116,-0.397301594105266 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);
    glTexCoord2f(0.96810846,0.83389045); glVertex3f(0.11583067+$x,0.485605+$y,-0.042093878+$z);

    glNormal3f( 0.134863640386041,-0.819006495617439,-0.557709744076852 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.96375761,0.8411314); glVertex3f(0.14190567+$x,0.47665981+$y,-0.016347004+$z);

    glNormal3f( 0.897509786217479,-0.167706126080755,-0.407861298628395 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.95276452,0.81682519); glVertex3f(0.081063998+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( 0.117416434952102,-0.065193465018981,-0.990940559731994 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.94900184,0.81921098); glVertex3f(0.089755666+$x,0.42298861+$y,-0.016347004+$z);

    glNormal3f( 0.0808615547078449,-0.0785696861287733,-0.993623778596233 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.94892671,0.83488405); glVertex3f(0.133214+$x,0.4319338+$y,-0.012668879+$z);

    glNormal3f( 0.176465337732017,-0.891611494103297,-0.416999913863315 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.96810846,0.83389045); glVertex3f(0.11583067+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.9675203,0.83874561); glVertex3f(0.133214+$x,0.485605+$y,-0.034737629+$z);

    glNormal3f( 0.906483112769436,-0.24662142950694,-0.342733477751717 );
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.9671243,0.82549076); glVertex3f(0.089755666+$x,0.47665981+$y,-0.038415754+$z);

    glNormal3f( 0.78680460336539,-0.234716205277732,-0.570829938863627 );
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);
    glTexCoord2f(0.77332092,0.89838758); glVertex3f(0.14045706+$x,0.26197501+$y,-0.034737629+$z);

    glNormal3f( 0.168133225515383,-0.816839290365459,-0.551819528644145 );
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.78991523,0.90057574); glVertex3f(0.18391539+$x,0.26197501+$y,-0.016347004+$z);

    glNormal3f( 0.216834567016401,-0.877870793147181,-0.42699606682726 );
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.78734989,0.89500667); glVertex3f(0.17667234+$x,0.2709202+$y,-0.034737629+$z);

    glNormal3f( -0.668736766877685,-0.426419657201432,-0.609062732875846 );
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.7991702,0.91098132); glVertex3f(0.22013067+$x,0.23513941+$y,-0.027381379+$z);

    glNormal3f( -0.335862164250268,-0.483471442338276,-0.808363761600229 );
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.80137388,0.90060064); glVertex3f(0.21288762+$x,0.26197501+$y,-0.031059503+$z);

    glNormal3f( -0.320945760289223,0.705373351981823,-0.632014440710258 );
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);
    glTexCoord2f(0.79531499,0.9344735); glVertex3f(0.21288762+$x,0.172523+$y,-0.034737629+$z);
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);

    glNormal3f( -0.116823381605515,0.0654878388090613,-0.990991241373187 );
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( -0.9200527159538,0.148995848556349,-0.362357885217101 );
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);
    glTexCoord2f(0.79962527,0.92466377); glVertex3f(0.22013067+$x,0.1993586+$y,-0.042093878+$z);
    glTexCoord2f(0.79531499,0.9344735); glVertex3f(0.21288762+$x,0.172523+$y,-0.034737629+$z);

    glNormal3f( 0.0641950915279328,0.0965335347463503,-0.993257402133554 );
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.76473749,0.93325026); glVertex3f(0.133214+$x,0.1635778+$y,-0.020025128+$z);

    glNormal3f( -0.490537496265105,0.0595793026150078,-0.869380970264401 );
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.7531607,0.95217679); glVertex3f(0.11148483+$x,0.1099066+$y,-0.016347004+$z);

    glNormal3f( -0.0248510249231137,-0.162036840795692,-0.986471737448784 );
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);
    glTexCoord2f(0.72922306,0.9434899); glVertex3f(0.046297329+$x,0.12779701+$y,-0.012668879+$z);
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);

    glNormal3f( 0.145658722512786,0.423203414229332,-0.894249633346629 );
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);

    glNormal3f( -0.419323308314995,0.252611936145644,-0.8719834704973 );
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.75033958,0.9685948); glVertex3f(0.11148483+$x,0.065180597+$y,-0.034737629+$z);

    glNormal3f( -0.033721169535939,0.0819135382224565,-0.996068800325061 );
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);
    glTexCoord2f(0.72922306,0.9434899); glVertex3f(0.046297329+$x,0.12779701+$y,-0.012668879+$z);
    glTexCoord2f(0.7531607,0.95217679); glVertex3f(0.11148483+$x,0.1099066+$y,-0.016347004+$z);

    glNormal3f( 0.195408769830207,0.372959282988128,-0.907037367425635 );
    glTexCoord2f(0.67878658,0.9538229); glVertex3f(-0.079248979+$x,0.076113618+$y,-0.02084249+$z);
    glTexCoord2f(0.6680608,0.95646883); glVertex3f(-0.10580685+$x,0.065180597+$y,-0.031059503+$z);
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);

    glNormal3f( 0.049397199405677,0.615257696791723,-0.786776895459838 );
    glTexCoord2f(0.67878658,0.9538229); glVertex3f(-0.079248979+$x,0.076113618+$y,-0.02084249+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.6680608,0.95646883); glVertex3f(-0.10580685+$x,0.065180597+$y,-0.031059503+$z);

    glNormal3f( 0.0236102193499632,-0.883920590821846,-0.467040626352147 );
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);
    glTexCoord2f(0.69019548,0.9189916); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);

    glNormal3f( 0.264056790474061,0.319247703047891,-0.91014005268595 );
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);

    glNormal3f( -0.498639887241112,-0.326222130226456,-0.803079936620685 );
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.69019548,0.9189916); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);

    glNormal3f( 0.0376108645966093,-0.0463599954584572,-0.998216496400148 );
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);

    glNormal3f( 0.14047437698845,-0.0649965903267566,-0.987948577940979 );
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.6484148,0.90079628); glVertex3f(-0.18548047+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.64083104,0.89692108); glVertex3f(-0.20720963+$x,0.20830381+$y,-0.016347004+$z);

    glNormal3f( 0.16119262250953,-0.815748800254902,-0.555491524085821 );
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.65943939,0.87964403); glVertex3f(-0.1637513+$x,0.26197501+$y,-0.016347004+$z);

    glNormal3f( 0.932231404356842,-0.211355710525443,-0.293723292163144 );
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.63927364,0.88259426); glVertex3f(-0.21445269+$x,0.23513941+$y,-0.042093878+$z);
    glTexCoord2f(0.63966878,0.8760239); glVertex3f(-0.20720963+$x,0.26197501+$y,-0.038415754+$z);

    glNormal3f( 0.21032240075528,-0.88556531179099,-0.414172145723325 );
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.64480637,0.87667896); glVertex3f(-0.17099436+$x,0.2709202+$y,-0.034737629+$z);

    glNormal3f( -0.335862117513613,-0.483471281194517,-0.808363877396439 );
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.66862391,0.88008768); glVertex3f(-0.13477908+$x,0.26197501+$y,-0.031059503+$z);

    glNormal3f( -0.118446181119966,0.492701434563714,-0.862099645375727 );
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);

    glNormal3f( -0.113828690781451,0.0529116578704829,-0.99209041201716 );
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( 0.322023546584424,0.21333862463712,-0.92238141063398 );
    glTexCoord2f(0.64133243,0.90594988); glVertex3f(-0.19835702+$x,0.18345602+$y,-0.02084249+$z);
    glTexCoord2f(0.6484148,0.90079628); glVertex3f(-0.18548047+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);

    glNormal3f( -0.557877277219078,-0.372669845837695,-0.741545770378294 );
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.81698506,0.85268169); glVertex3f(-0.084077684+$x,0.440879+$y,-0.016347004+$z);

    glNormal3f( -0.284836985634406,-0.492025232390809,-0.822665826630398 );
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.82019781,0.83967519); glVertex3f(-0.084077684+$x,0.47665981+$y,-0.031059503+$z);

    glNormal3f( -0.272708358712145,-0.216800953149006,-0.937351320371509 );
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.80904131,0.84125231); glVertex3f(-0.11884435+$x,0.47665981+$y,-0.016347004+$z);

    glNormal3f( -0.080861529997332,0.0785697060358529,-0.993623779033055 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.80491445,0.85662935); glVertex3f(-0.12753602+$x,0.4319338+$y,-0.012668879+$z);

    glNormal3f( -0.134863441407183,0.819006122304191,-0.557710340409844 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.8030736,0.87214476); glVertex3f(-0.13622769+$x,0.3872078+$y,-0.016347004+$z);

    glNormal3f( -0.897509751545614,0.167706072731657,-0.407861396861059 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.82291874,0.85587554); glVertex3f(-0.075386016+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( -0.906483146568001,0.246621455244461,-0.342733369839122 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.82053058,0.8709384); glVertex3f(-0.084077684+$x,0.3872078+$y,-0.038415754+$z);

    glNormal3f( -0.176465334007366,0.891611498956916,-0.416999905061705 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.80558317,0.87606678); glVertex3f(-0.12753602+$x,0.3782626+$y,-0.034737629+$z);

    glNormal3f( -0.117416430972317,0.0651934509422662,-0.990940561129658 );
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.81698506,0.85268169); glVertex3f(-0.084077684+$x,0.440879+$y,-0.016347004+$z);

    glNormal3f( 0.272708245603548,0.216801020511448,-0.937351337698427 );
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.8030736,0.87214476); glVertex3f(-0.13622769+$x,0.3872078+$y,-0.016347004+$z);

    glNormal3f( 0.284837217597401,0.492025190075246,-0.822665771624655 );
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.78962744,0.87337046); glVertex3f(-0.17099436+$x,0.3872078+$y,-0.031059503+$z);

    glNormal3f( 0.557877352385691,0.372669680692146,-0.741545796824407 );
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.79034067,0.86188474); glVertex3f(-0.17099436+$x,0.42298861+$y,-0.016347004+$z);

    glNormal3f( 0.117416447901969,-0.0651934787722747,-0.990940557292744 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.79034067,0.86188474); glVertex3f(-0.17099436+$x,0.42298861+$y,-0.016347004+$z);

    glNormal3f( 0.134863634746958,-0.819006440641781,-0.557709826173182 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.80904131,0.84125231); glVertex3f(-0.11884435+$x,0.47665981+$y,-0.016347004+$z);

    glNormal3f( 0.897509701873938,-0.167706191359744,-0.407861457386897 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.78589913,0.85715341); glVertex3f(-0.17968603+$x,0.4319338+$y,-0.034737629+$z);

    glNormal3f( 0.906483030029765,-0.246621441451164,-0.342733687992011 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.78898544,0.84217603); glVertex3f(-0.17099436+$x,0.47665981+$y,-0.038415754+$z);

    glNormal3f( 0.0808615768978804,-0.0785696624915935,-0.993623778659481 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.80491445,0.85662935); glVertex3f(-0.12753602+$x,0.4319338+$y,-0.012668879+$z);

    glNormal3f( 0.176465277867138,-0.89161145992131,-0.417000012283289 );
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.80424135,0.83693626); glVertex3f(-0.12753602+$x,0.485605+$y,-0.034737629+$z);

    glNormal3f( 0.832306437648728,-0.550389206935839,-0.0658613296026084 );
    glTexCoord2f(0.92050282,0.93499005); glVertex3f(0.055166377+$x,0.1672289+$y,0.049683354+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.93089635,0.95059634); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);

    glNormal3f( 0.0415176566133443,-0.0840435753530327,0.995596786671801 );
    glTexCoord2f(0.22435109,0.50518537); glVertex3f(0.055166377+$x,0.1672289+$y,0.049683354+$z);
    glTexCoord2f(0.23643789,0.52334273); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.20441143,0.50752185); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);

    glNormal3f( -0.239313190025158,-0.690373579199583,0.682725067815105 );
    glTexCoord2f(0.88410417,0.93737952); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( -0.0492030755594868,-0.84750771625433,0.528497614228161 );
    glTexCoord2f(0.88410417,0.93737952); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.88389358,0.9323507); glVertex3f(-0.040619346+$x,0.1635778+$y,0.033619707+$z);

    glNormal3f( -0.0421874390884337,-0.847780026998329,0.528667424574158 );
    glTexCoord2f(0.88410417,0.93737952); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);
    glTexCoord2f(0.88389358,0.9323507); glVertex3f(-0.040619346+$x,0.1635778+$y,0.033619707+$z);
    glTexCoord2f(0.90337272,0.93699958); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);

    glNormal3f( -0.0381712087827675,-0.0811329148744927,0.995972092452409 );
    glTexCoord2f(0.18199775,0.50796642); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.16918195,0.52729871); glVertex3f(-0.069591572+$x,0.217249+$y,0.052010331+$z);

    glNormal3f( -0.0974613339256215,-0.879347920437101,0.466099263260933 );
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.90337272,0.93699958); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);
    glTexCoord2f(0.89742614,0.92536039); glVertex3f(-0.0044040652+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( 0,-0.135791866947968,0.990737386430322 );
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.93251357,0.92500023); glVertex3f(0.089755666+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( 0.0181020300410221,-0.0586298796405258,0.998115651476186 );
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.92811025,0.91324335); glVertex3f(0.075269554+$x,0.1099066+$y,0.011550957+$z);

    glNormal3f( -0.029849361593629,-0.0241694402293636,0.999262154677867 );
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.88419217,0.91943212); glVertex3f(-0.040619346+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.89100473,0.91314308); glVertex3f(-0.026133234+$x,0.1099066+$y,0.011550957+$z);

    glNormal3f( -0.0205319087355561,-0.914385125515735,0.404324477318957 );
    glTexCoord2f(0.88390599,0.92763557); glVertex3f(-0.040619346+$x,0.15642164+$y,0.017435957+$z);
    glTexCoord2f(0.89742614,0.92536039); glVertex3f(-0.0044040652+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.88389358,0.9323507); glVertex3f(-0.040619346+$x,0.1635778+$y,0.033619707+$z);

    glNormal3f( 0.0171110256061625,-0.914444022084956,0.40435052031102 );
    glTexCoord2f(0.88390599,0.92763557); glVertex3f(-0.040619346+$x,0.15642164+$y,0.017435957+$z);
    glTexCoord2f(0.88389358,0.9323507); glVertex3f(-0.040619346+$x,0.1635778+$y,0.033619707+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( 0.297500129415141,-0.2408900029341,-0.923832062381678 );
    glTexCoord2f(0.72908781,0.92392784); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);

    glNormal3f( 0.0353441973807349,-0.884574765133,-0.465057278839295 );
    glTexCoord2f(0.72908781,0.92392784); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);
    glTexCoord2f(0.70734271,0.9209626); glVertex3f(-0.018890177+$x,0.172523+$y,-0.053128253+$z);

    glNormal3f( 0.0364370967987803,-0.0866669482302705,-0.995570780035919 );
    glTexCoord2f(0.58592184,0.50476865); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.61101956,0.50136292); glVertex3f(0.075269554+$x,0.217249+$y,-0.053128253+$z);

    glNormal3f( 0.0612381207641708,-0.0495853796482641,-0.996890757651213 );
    glTexCoord2f(0.58592184,0.50476865); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.57773461,0.47134381); glVertex3f(-0.026133234+$x,0.217249+$y,-0.056806379+$z);

    glNormal3f( -0.41615457492406,-0.196563678490551,-0.887793945726168 );
    glTexCoord2f(0.69019548,0.9189916); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.68745319,0.90398115); glVertex3f(-0.076834627+$x,0.20830381+$y,-0.053128253+$z);

    glNormal3f( -0.0416739004711455,-0.168719687828219,-0.984782693267235 );
    glTexCoord2f(0.55159876,0.4754808); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.56687224,0.48817848); glVertex3f(-0.018890177+$x,0.172523+$y,-0.053128253+$z);

    glNormal3f( -0.0622426607189844,-0.0124881772919455,0.997982913989286 );
    glTexCoord2f(0.21587981,0.07130072); glVertex3f(-0.25066798+$x,-0.43575059+$y,0.046313888+$z);
    glTexCoord2f(0.20498604,0.092334048); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( -0.198263762913924,-0.772584054301546,0.603162796725891 );
    glTexCoord2f(0.21587981,0.07130072); glVertex3f(-0.25066798+$x,-0.43575059+$y,0.046313888+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.20280386,0.08802961); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);

    glNormal3f( 0.0272619276234956,-0.965753351592876,0.258025679321611 );
    glTexCoord2f(0.19233865,0.10545201); glVertex3f(-0.047862402+$x,-0.4715314+$y,0.046313888+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( -0.108855318757542,-0.504811583664452,0.856338592249808 );
    glTexCoord2f(0.45289196,0.7333201); glVertex3f(-0.047862402+$x,-0.4715314+$y,0.046313888+$z);
    glTexCoord2f(0.43057749,0.74620214); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.3901149,0.73639929); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);

    glNormal3f( -0.0826953910461675,-0.833275534647507,0.546638231061122 );
    glTexCoord2f(0.20368849,0.069280203); glVertex3f(-0.25066798+$x,-0.4715314+$y,0.0088156086+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.20280386,0.08802961); glVertex3f(-0.18869961+$x,-0.46059838+$y,0.034856079+$z);

    glNormal3f( -0.484074801989236,-0.768245979399837,-0.418891037401216 );
    glTexCoord2f(0.20368849,0.069280203); glVertex3f(-0.25066798+$x,-0.4715314+$y,0.0088156086+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( -0.053943652084914,0.946272356946991,0.318839628775548 );
    glTexCoord2f(0.50283358,0.22693707); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);
    glTexCoord2f(0.51660059,0.16329494); glVertex3f(-0.23763047+$x,0.57147892+$y,0.048188801+$z);

    glNormal3f( 0.0016770963795313,0.20899075886939,0.977916177417538 );
    glTexCoord2f(0.18712671,0.68947711); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);
    glTexCoord2f(0.23450736,0.66968155); glVertex3f(0.078166776+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( -0.0465606794333167,0.32045700231732,0.946118075504588 );
    glTexCoord2f(0.18712671,0.68947711); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);
    glTexCoord2f(0.13522486,0.66968256); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.18967002,0.67759261); glVertex3f(-0.023236012+$x,0.55716661+$y,0.055688457+$z);

    glNormal3f( 0.0394004858226521,0.976237050427885,0.21309346092455 );
    glTexCoord2f(0.50283358,0.22693707); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);
    glTexCoord2f(0.50039007,0.23875933); glVertex3f(0.0028389911+$x,0.5929474+$y,-0.00055896092+$z);
    glTexCoord2f(0.51022401,0.20772269); glVertex3f(-0.098563797+$x,0.5929474+$y,0.018190179+$z);

    glNormal3f( -0.480971810539079,0.776876427820438,0.406360841326667 );
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);
    glTexCoord2f(0.51136234,0.14447574); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);
    glTexCoord2f(0.51660059,0.16329494); glVertex3f(-0.23763047+$x,0.57147892+$y,0.048188801+$z);

    glNormal3f( -0.45473050634287,0.644352984133737,-0.614840953775125 );
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.51309213,0.14349976); glVertex3f(-0.30136937+$x,0.55716661+$y,0.018190179+$z);

    glNormal3f( -0.0518522511697555,0.992992128237152,-0.1061978215769 );
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);
    glTexCoord2f(0.51022401,0.20772269); glVertex3f(-0.098563797+$x,0.5929474+$y,0.018190179+$z);
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( 0.311858496800133,-0.0673376341484754,0.947739373984666 );
    glTexCoord2f(0.33124671,0.66574384); glVertex3f(0.29690707+$x,0.53033101+$y,0.046313888+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.33013072,0.64597199); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);

    glNormal3f( 0.76636899477634,0.638201435998689,0.0733313775590826 );
    glTexCoord2f(0.45949739,0.31988189); glVertex3f(0.29690707+$x,0.53033101+$y,0.046313888+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( 0.392795675874103,0.857865703739171,-0.331327619378014 );
    glTexCoord2f(0.47640619,0.31453315); glVertex3f(0.25634596+$x,0.58400221+$y,-0.0099335305+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( 0.0530702814674554,0.994700028637867,0.0880647389866769 );
    glTexCoord2f(0.47640619,0.31453315); glVertex3f(0.25634596+$x,0.58400221+$y,-0.0099335305+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( 0.0826953930724396,-0.833275533089417,-0.546638233129683 );
    glTexCoord2f(0.1646894,0.1982503); glVertex3f(0.25634596+$x,-0.4715314+$y,-0.0099335305+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);

    glNormal3f( 0.484074802524156,-0.768245978469291,0.418891038489678 );
    glTexCoord2f(0.1646894,0.1982503); glVertex3f(0.25634596+$x,-0.4715314+$y,-0.0099335305+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( -0.45391859132775,0.174427968813372,-0.873803637061939 );
    glTexCoord2f(0.21755825,0.075643117); glVertex3f(-0.25066798+$x,-0.4178602+$y,-0.047431809+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);

    glNormal3f( -0.0509920944916458,-0.16515614410405,-0.984948351114939 );
    glTexCoord2f(0.12422247,0.1994354); glVertex3f(-0.25066798+$x,-0.4178602+$y,-0.047431809+$z);
    glTexCoord2f(0.13035954,0.13229987); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.14743906,0.18802063); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( -0.0272619266271482,-0.965753349155929,-0.258025688548026 );
    glTexCoord2f(0.1830526,0.13920043); glVertex3f(0.053540384+$x,-0.4715314+$y,-0.047431809+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( 0.108855314975375,-0.504811607703201,-0.856338578559744 );
    glTexCoord2f(0.1830526,0.13920043); glVertex3f(0.053540384+$x,-0.4715314+$y,-0.047431809+$z);
    glTexCoord2f(0.1836084,0.156421); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);

    glNormal3f( 0.0373247814857265,0.915426433534358,-0.400750926977854 );
    glTexCoord2f(0.49225036,0.24399407); glVertex3f(0.021670937+$x,0.58400221+$y,-0.047431809+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( -0.0146739818589809,0.351550435734077,-0.936053932950224 );
    glTexCoord2f(0.49225036,0.24399407); glVertex3f(0.021670937+$x,0.58400221+$y,-0.047431809+$z);
    glTexCoord2f(0.4902607,0.22937897); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( 0.934885014515069,0.0265289593753151,-0.35395794093313 );
    glTexCoord2f(0.4584961,0.32344149); glVertex3f(0.29690707+$x,0.5392762+$y,-0.047431809+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( 0.193147311890471,0.177246613592763,-0.965027333229159 );
    glTexCoord2f(0.77907743,0.46125833); glVertex3f(0.29690707+$x,0.5392762+$y,-0.047431809+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.77206831,0.43481649); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( -0.480417288982527,0.0325134312662422,0.876437165593732 );
    glTexCoord2f(0.25339601,0.08226002); glVertex3f(-0.25066798+$x,-0.3105178+$y,0.046313888+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( -0.0608704303260393,-0.010952797431068,0.998085580970067 );
    glTexCoord2f(0.089129312,0.29394813); glVertex3f(-0.25066798+$x,-0.3105178+$y,0.046313888+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);

    glNormal3f( -0.0641719024782478,-0.0332307860266408,0.997385422889453 );
    glTexCoord2f(0.28944395,0.088096885); glVertex3f(-0.26515409+$x,-0.1942302+$y,0.046313888+$z);
    glTexCoord2f(0.30216394,0.12662889); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.426561923290089,-0.251195141964656,0.868876243346782 );
    glTexCoord2f(0.28944395,0.088096885); glVertex3f(-0.26515409+$x,-0.1942302+$y,0.046313888+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.27172473,0.093638778); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);

    glNormal3f( -0.479928096343066,0.0621767156400434,0.875101753153734 );
    glTexCoord2f(0.069912333,0.39283083); glVertex3f(-0.29412631+$x,-0.086887798+$y,0.046313888+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.070717521,0.41360079); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);

    glNormal3f( -0.951490068939832,-0.186057549283117,0.245049458403063 );
    glTexCoord2f(0.32402361,0.088811313); glVertex3f(-0.29412631+$x,-0.086887798+$y,0.046313888+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.447661104231407,0.0768890691829366,0.890891467463068 );
    glTexCoord2f(0.3508209,0.096639385); glVertex3f(-0.29412631+$x,0.0025642017+$y,0.046313888+$z);
    glTexCoord2f(0.35473127,0.10443676); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( -0.957608906290259,-0.0563918957299445,0.282498029532167 );
    glTexCoord2f(0.3508209,0.096639385); glVertex3f(-0.29412631+$x,0.0025642017+$y,0.046313888+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.33784873,0.093532925); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);

    glNormal3f( -0.418565828580289,-0.03279865442445,0.907594014641371 );
    glTexCoord2f(0.38297765,0.10603307); glVertex3f(-0.29412631+$x,0.1099066+$y,0.046313888+$z);
    glTexCoord2f(0.3761691,0.11069922); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( -0.963781128413483,0.0269101227076326,0.265333340931541 );
    glTexCoord2f(0.38297765,0.10603307); glVertex3f(-0.29412631+$x,0.1099066+$y,0.046313888+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( -0.975851880709135,0.158032326963914,0.150794199327476 );
    glTexCoord2f(0.41513439,0.11542676); glVertex3f(-0.29412631+$x,0.217249+$y,0.046313888+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.40927636,0.11252436); glVertex3f(-0.30136937+$x,0.1993586+$y,0.018190179+$z);

    glNormal3f( -0.38728909254682,-0.0126704236201322,0.921871259536573 );
    glTexCoord2f(0.069910956,0.52731102); glVertex3f(-0.29412631+$x,0.217249+$y,0.046313888+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);

    glNormal3f( -0.955888676239314,-0.0637406584790994,0.286729780619492 );
    glTexCoord2f(0.41513439,0.11542676); glVertex3f(-0.29412631+$x,0.217249+$y,0.046313888+$z);
    glTexCoord2f(0.40927636,0.11252436); glVertex3f(-0.30136937+$x,0.1993586+$y,0.018190179+$z);
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( -0.957954060735022,0.0727190492121156,0.277553521690805 );
    glTexCoord2f(0.44907762,0.12534232); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.45215203,0.12504928); glVertex3f(-0.30136937+$x,0.34248181+$y,0.018190179+$z);

    glNormal3f( -0.988407020136347,0.00943409521610539,0.151534023877941 );
    glTexCoord2f(0.44907762,0.12534232); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.43211105,0.12021526); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);

    glNormal3f( -0.377204859879472,-0.305428111878361,0.874316968929305 );
    glTexCoord2f(0.069910443,0.57741148); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);
    glTexCoord2f(0.085904893,0.56948214); glVertex3f(-0.25791104+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.079918539,0.57743986); glVertex3f(-0.27239715+$x,0.33055487+$y,0.055688457+$z);

    glNormal3f( -0.239962039488228,-0.0171442298608513,0.970630874734123 );
    glTexCoord2f(0.069910443,0.57741148); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.071828045,0.59744793); glVertex3f(-0.28978049+$x,0.37587721+$y,0.048188801+$z);

    glNormal3f( -0.462522966955134,-0.22470685929419,0.857659216953424 );
    glTexCoord2f(0.069910025,0.61828291); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);
    glTexCoord2f(0.085904569,0.60112454); glVertex3f(-0.25791104+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.079919605,0.61422046); glVertex3f(-0.27239715+$x,0.4140434+$y,0.055688457+$z);

    glNormal3f( -0.240297128353244,0.0340209376851711,0.970103018191473 );
    glTexCoord2f(0.069910025,0.61828291); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.069848647,0.64435978); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);

    glNormal3f( -0.957696993659454,-0.0773115290047527,0.277199198805824 );
    glTexCoord2f(0.47676816,0.13343132); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.4623651,0.13055489); glVertex3f(-0.28978049+$x,0.37587721+$y,0.048188801+$z);

    glNormal3f( -0.96301447355684,0.194941695745069,0.186013061315806 );
    glTexCoord2f(0.47676816,0.13343132); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.47358985,0.13131174); glVertex3f(-0.30136937+$x,0.4140434+$y,0.018190179+$z);

    glNormal3f( -0.130347163340779,0.159982472225632,0.978475970880015 );
    glTexCoord2f(0.071190565,0.6697018); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.094886327,0.68393692); glVertex3f(-0.23763047+$x,0.57147892+$y,0.048188801+$z);

    glNormal3f( -0.38899542916552,-0.18898493112847,0.901646966331446 );
    glTexCoord2f(0.071190565,0.6697018); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.084622888,0.66177248); glVertex3f(-0.26080825+$x,0.5213858+$y,0.055688457+$z);

    glNormal3f( -0.976438482157567,0.0441146542394127,0.21123869873478 );
    glTexCoord2f(0.51136234,0.14447574); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.49436222,0.13860951); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);

    glNormal3f( 0.305387927110841,0.0415802986201107,0.951319763666038 );
    glTexCoord2f(0.33124712,0.62619083); glVertex3f(0.29690707+$x,0.440879+$y,0.046313888+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.930832820590576,0.0715382581103604,0.358374856453307 );
    glTexCoord2f(0.43270009,0.31205382); glVertex3f(0.29690707+$x,0.440879+$y,0.046313888+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.44621872,0.31527785); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);

    glNormal3f( 0.479928050138989,-0.062176816958153,0.875101771294482 );
    glTexCoord2f(0.33252879,0.56686132); glVertex3f(0.2998043+$x,0.306701+$y,0.046313888+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.33173307,0.54610065); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);

    glNormal3f( 0.968347980676393,0.0103171131364153,0.249390748618474 );
    glTexCoord2f(0.39226187,0.30117964); glVertex3f(0.2998043+$x,0.306701+$y,0.046313888+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.957608944803422,0.0563921127569062,0.282497855657861 );
    glTexCoord2f(0.36546458,0.29335157); glVertex3f(0.2998043+$x,0.217249+$y,0.046313888+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.3782527,0.29659687); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);

    glNormal3f( 0.447660995881375,-0.0768891648973386,0.890891513646799 );
    glTexCoord2f(0.3325292,0.52730833); glVertex3f(0.2998043+$x,0.217249+$y,0.046313888+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.33396547,0.5035889); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( 0.366173766312467,-0.0423566887098311,0.929581994116754 );
    glTexCoord2f(0.33252968,0.47984473); glVertex3f(0.2998043+$x,0.1099066+$y,0.046313888+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);

    glNormal3f( 0.963781242325756,-0.0269099956462989,0.265332940049553 );
    glTexCoord2f(0.33744601,0.26048559); glVertex3f(0.2998043+$x,0.1099066+$y,0.046313888+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( 0.884275855001581,0.0325460795289458,0.465829330300828 );
    glTexCoord2f(0.30857472,0.24970489); glVertex3f(0.29256124+$x,0.011509401+$y,0.046313888+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.32443307,0.25332171); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);

    glNormal3f( 0.193489231987365,-0.0843613236595407,0.977468712632455 );
    glTexCoord2f(0.32932747,0.43633647); glVertex3f(0.29256124+$x,0.011509401+$y,0.046313888+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.33218716,0.41085911); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( 0.140814782555693,-0.0701660493341998,0.987546415382398 );
    glTexCoord2f(0.32932795,0.38887287); glVertex3f(0.29256124+$x,-0.095832998+$y,0.046313888+$z);
    glTexCoord2f(0.31009285,0.40863099); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.32773154,0.37107868); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);

    glNormal3f( 0.867580938408913,-0.0501780140268607,0.494758003692542 );
    glTexCoord2f(0.27641798,0.24031121); glVertex3f(0.29256124+$x,-0.095832998+$y,0.046313888+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( 0.157955133272978,-0.038097444443922,0.986711082637445 );
    glTexCoord2f(0.32932836,0.34931987); glVertex3f(0.29256124+$x,-0.185285+$y,0.046313888+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.89660793652201,0.0866861639302541,0.434257662164757 );
    glTexCoord2f(0.24962069,0.23248313); glVertex3f(0.29256124+$x,-0.185285+$y,0.046313888+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.26457004,0.23577308); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);

    glNormal3f( 0.0655045607873596,-0.0707199917515093,0.995343074162231 );
    glTexCoord2f(0.3133157,0.28603524); glVertex3f(0.25634596+$x,-0.32840819+$y,0.046313888+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.30771597,0.26626344); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);

    glNormal3f( 0.46779984077253,-0.106889782710346,0.877347071189806 );
    glTexCoord2f(0.20977367,0.20910915); glVertex3f(0.25634596+$x,-0.32840819+$y,0.046313888+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.453918621103802,0.174427895258836,0.873803636276936 );
    glTexCoord2f(0.18297638,0.20128107); glVertex3f(0.25634596+$x,-0.4178602+$y,0.046313888+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);

    glNormal3f( 0.0509920879561971,-0.165156159818294,0.984948348818323 );
    glTexCoord2f(0.18297638,0.20128107); glVertex3f(0.25634596+$x,-0.4178602+$y,0.046313888+$z);
    glTexCoord2f(0.19874453,0.15622009); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( -0.467315624074658,-0.109452231812098,-0.877289186327441 );
    glTexCoord2f(0.24435555,0.083471189); glVertex3f(-0.25066798+$x,-0.32840819+$y,-0.047431809+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( -0.0655045656810611,-0.0707199855361581,-0.995343074281778 );
    glTexCoord2f(0.24435555,0.083471189); glVertex3f(-0.25066798+$x,-0.32840819+$y,-0.047431809+$z);
    glTexCoord2f(0.2285874,0.12853217); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);

    glNormal3f( -0.896607938421623,0.086686335666134,-0.434257623960831 );
    glTexCoord2f(0.29025985,0.085147032); glVertex3f(-0.28688326+$x,-0.185285+$y,-0.047431809+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);

    glNormal3f( -0.187151998456931,-0.0171554524830449,-0.982181154331358 );
    glTexCoord2f(0.37299695,0.52633724); glVertex3f(-0.28688326+$x,-0.185285+$y,-0.047431809+$z);
    glTexCoord2f(0.40580343,0.51862113); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( -0.857108597916825,-0.0719021962703963,-0.510093055773697 );
    glTexCoord2f(0.31705714,0.092975104); glVertex3f(-0.28688326+$x,-0.095832998+$y,-0.047431809+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.140814793181385,-0.0701660606041844,-0.987546413066532 );
    glTexCoord2f(0.39947037,0.49697276); glVertex3f(-0.28688326+$x,-0.095832998+$y,-0.047431809+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.38874404,0.5112642); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);

    glNormal3f( -0.962856707509349,0.0528567908800902,-0.264788822388927 );
    glTexCoord2f(0.34981962,0.10019898); glVertex3f(-0.29412631+$x,0.011509401+$y,-0.047431809+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.36315886,0.10458605); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);

    glNormal3f( -0.379574680782675,-0.0463125339341716,-0.924001196378731 );
    glTexCoord2f(0.42886074,0.45959178); glVertex3f(-0.29412631+$x,0.011509401+$y,-0.047431809+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.298715107116531,0.241873808004876,-0.923182726106581 );
    glTexCoord2f(0.37661691,0.10802705); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);
    glTexCoord2f(0.37589989,0.11993661); glVertex3f(-0.25791104+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.37175189,0.11403136); glVertex3f(-0.27239715+$x,0.092016197+$y,-0.056806379+$z);

    glNormal3f( -0.988611920235778,-0.0169681033660837,-0.149527772122392 );
    glTexCoord2f(0.37661691,0.10802705); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);
    glTexCoord2f(0.38250839,0.10636173); glVertex3f(-0.30136937+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);

    glNormal3f( -0.417544890855739,-0.064398427045014,-0.9063713955738 );
    glTexCoord2f(0.45533417,0.43022729); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);
    glTexCoord2f(0.45982869,0.439572); glVertex3f(-0.27239715+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.44268973,0.44545107); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);

    glNormal3f( -0.962478984245227,0.0556665517067032,-0.265585089768536 );
    glTexCoord2f(0.41145338,0.11820354); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.42412269,0.12239491); glVertex3f(-0.29231555+$x,0.2597387+$y,-0.045088166+$z);

    glNormal3f( -0.331522961695082,0.0894796726339328,-0.939194289832645 );
    glTexCoord2f(0.79741676,0.1546746); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);
    glTexCoord2f(0.78373943,0.15788844); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.78740307,0.14619564); glVertex3f(-0.27239715+$x,0.1993586+$y,-0.056806379+$z);

    glNormal3f( -0.975851893289204,-0.158032244848297,-0.150794203973776 );
    glTexCoord2f(0.41145338,0.11820354); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.41652725,0.1178907); glVertex3f(-0.30136937+$x,0.23513941+$y,-0.019308101+$z);

    glNormal3f( -0.412518051093692,-0.0238586657192961,-0.91063693181858 );
    glTexCoord2f(0.79741676,0.1546746); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);
    glTexCoord2f(0.78740307,0.14619564); glVertex3f(-0.27239715+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.79967638,0.12936417); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);

    glNormal3f( -0.966338582447752,-0.0652048883203806,-0.248873595650475 );
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.44235201,0.12548043); glVertex3f(-0.30136937+$x,0.306701+$y,-0.019308101+$z);

    glNormal3f( -0.458871275762003,-0.0619257416675495,-0.886342120628076 );
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);
    glTexCoord2f(0.41134209,0.12794328); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.42412269,0.12239491); glVertex3f(-0.29231555+$x,0.2597387+$y,-0.045088166+$z);

    glNormal3f( -0.987352893437599,0.0140076958422138,-0.157917852941308 );
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.45815758,0.13238131); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);

    glNormal3f( 0,0.253445615666899,-0.967349636842454 );
    glTexCoord2f(0.51622304,0.36268897); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.51277554,0.38084302); glVertex3f(-0.27239715+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( -0.938351204981234,0.0709141183535192,-0.338331500053439 );
    glTexCoord2f(0.47820431,0.13864165); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.49148298,0.1432457); glVertex3f(-0.28869403+$x,0.485605+$y,-0.045088166+$z);

    glNormal3f( -0.174890506048446,0.0397284883485734,-0.983786032685795 );
    glTexCoord2f(0.55688428,0.31949968); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.53653702,0.3410386); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);

    glNormal3f( -0.317361655035217,0.0899402408304558,-0.944029836918658 );
    glTexCoord2f(0.55688428,0.31949968); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.56976358,0.32567514); glVertex3f(-0.26080825+$x,0.44982421+$y,-0.056806379+$z);

    glNormal3f( -0.931112269859939,-0.263877081135294,-0.251791236876485 );
    glTexCoord2f(0.47820431,0.13864165); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.48056036,0.1371665); glVertex3f(-0.30136937+$x,0.44982421+$y,-0.019308101+$z);

    glNormal3f( -0.92634889931382,-0.0954644994640898,-0.364368283584267 );
    glTexCoord2f(0.5050016,0.14646972); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.5073564,0.14503329); glVertex3f(-0.30136937+$x,0.5213858+$y,-0.019308101+$z);

    glNormal3f( -0.293842293422772,-0.0666198611085124,-0.953529496503348 );
    glTexCoord2f(0.58335771,0.29013519); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.57095103,0.30557332); glVertex3f(-0.28869403+$x,0.485605+$y,-0.045088166+$z);

    glNormal3f( -0.709121914015455,0.648337302580855,-0.277136885212413 );
    glTexCoord2f(0.5050016,0.14646972); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( 0.967201588586736,-0.0497243656183788,-0.249095512804113 );
    glTexCoord2f(0.42078233,0.31083828); glVertex3f(0.2998043+$x,0.4140434+$y,-0.047431809+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);

    glNormal3f( 0.396133903393211,0,-0.91819275241229 );
    glTexCoord2f(0.42078233,0.31083828); glVertex3f(0.2998043+$x,0.4140434+$y,-0.047431809+$z);
    glTexCoord2f(0.41146778,0.30398712); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( 0.96688613116425,0.00946103006403821,-0.255032739608773 );
    glTexCoord2f(0.39394032,0.30552204); glVertex3f(0.2998043+$x,0.3245914+$y,-0.047431809+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.348650028456402,0.0664252248115871,-0.93489616918997 );
    glTexCoord2f(0.71649231,0.53259054); glVertex3f(0.2998043+$x,0.3245914+$y,-0.047431809+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.72847059,0.51811214); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);

    glNormal3f( 0.967201588586736,-0.0497243656183788,-0.249095512804113 );
    glTexCoord2f(0.35642411,0.29456274); glVertex3f(0.2998043+$x,0.1993586+$y,-0.047431809+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.34673717,0.26636883); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);

    glNormal3f( 0.411878179180025,-0.0114018325222027,-0.911167582681958 );
    glTexCoord2f(0.67942951,0.57370082); glVertex3f(0.2998043+$x,0.1993586+$y,-0.047431809+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.963781237485998,0.026909999298539,-0.265332957258819 );
    glTexCoord2f(0.333765,0.26326237); glVertex3f(0.2998043+$x,0.1099066+$y,-0.047431809+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( 0.348650020682136,0.0664252246408593,-0.93489617210135 );
    glTexCoord2f(0.65295609,0.60306531); glVertex3f(0.2998043+$x,0.1099066+$y,-0.047431809+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.66493437,0.58858691); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);

    glNormal3f( 0.447661017889042,0.0768891454561762,-0.890891504266129 );
    glTexCoord2f(0.62118798,0.63830269); glVertex3f(0.2998043+$x,0.0025642017+$y,-0.047431809+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.63812304,0.62165172); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( 0.957608948706471,-0.0563921060172199,-0.28249784377271 );
    glTexCoord2f(0.30160826,0.25386868); glVertex3f(0.2998043+$x,0.0025642017+$y,-0.047431809+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.289123,0.24953847); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);

    glNormal3f( 0.943007707005233,-0.227493450386718,-0.242864560115054 );
    glTexCoord2f(0.27481097,0.24604061); glVertex3f(0.2998043+$x,-0.086887798+$y,-0.047431809+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.479928058563849,0.0621767984837905,-0.875101767986696 );
    glTexCoord2f(0.59471456,0.66766718); glVertex3f(0.2998043+$x,-0.086887798+$y,-0.047431809+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.60801651,0.65172056); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);

    glNormal3f( 0.453918637798537,-0.174427880156837,-0.873803630619095 );
    glTexCoord2f(0.23824941,0.22127962); glVertex3f(0.25634596+$x,-0.2210658+$y,-0.047431809+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.22600282,0.21349898); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);

    glNormal3f( 0.0634328555470126,-0.0333053644659695,-0.997430210859357 );
    glTexCoord2f(0.23824941,0.22127962); glVertex3f(0.25634596+$x,-0.2210658+$y,-0.047431809+$z);
    glTexCoord2f(0.2479219,0.17520837); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.480417262209942,0.0325135207384207,-0.876437176949892 );
    glTexCoord2f(0.21145212,0.21345154); glVertex3f(0.25634596+$x,-0.3105178+$y,-0.047431809+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( 0.0655045670515108,0.0707199870801516,-0.995343074081885 );
    glTexCoord2f(0.29997269,0.86223199); glVertex3f(0.25634596+$x,-0.3105178+$y,-0.047431809+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.31983728,0.8676351); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);

    glNormal3f( 0.0622426700008287,-0.0124882036315333,-0.997982913080793 );
    glTexCoord2f(0.11441469,0.084686652); glVertex3f(0.25634596+$x,-0.43575059+$y,-0.047431809+$z);
    glTexCoord2f(0.11645785,0.15234746); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.086729616,0.082479463); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( 0.198263763572487,-0.772584040010643,-0.603162814814463 );
    glTexCoord2f(0.17393592,0.20249224); glVertex3f(0.25634596+$x,-0.43575059+$y,-0.047431809+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.17287858,0.18142464); glVertex3f(0.19437759+$x,-0.46059838+$y,-0.035974001+$z);

    glNormal3f( -0.0482768671410867,0.0351814313562548,-0.998214210972157 );
    glTexCoord2f(0.62919115,0.42191748); glVertex3f(-0.014544344+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);

    glNormal3f( 0.0235757495221375,0.00572688670173885,-0.99970565008065 );
    glTexCoord2f(0.62919115,0.42191748); glVertex3f(-0.014544344+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.0463936296540521,-0.133187050888601,-0.990004464941002 );
    glTexCoord2f(0.54728119,0.40663953); glVertex3f(-0.1753402+$x,0.2798654+$y,-0.053128253+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( 0.0508091712848438,-0.798136438321843,-0.60033045394705 );
    glTexCoord2f(0.65427147,0.87103929); glVertex3f(-0.1753402+$x,0.2798654+$y,-0.053128253+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.64020173,0.86956116); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);

    glNormal3f( -0.0379948305907193,-0.163823352466036,-0.985757729888623 );
    glTexCoord2f(0.65903491,0.50738831); glVertex3f(0.16508346+$x,0.2798654+$y,-0.053128253+$z);
    glTexCoord2f(0.66032266,0.49256807); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0.230448456718685,-0.784619272235715,-0.575557213865201 );
    glTexCoord2f(0.78346918,0.89103398); glVertex3f(0.16508346+$x,0.2798654+$y,-0.053128253+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.76505919,0.89358938); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);

    glNormal3f( -0.246098152700388,0,-0.969244911896605 );
    glTexCoord2f(0.59876726,0.59144407); glVertex3f(0.19115845+$x,0.047290202+$y,-0.056806379+$z);
    glTexCoord2f(0.61253979,0.56661058); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.61200397,0.57676182); glVertex3f(0.19115845+$x,0.092016197+$y,-0.056806379+$z);

    glNormal3f( -0.0424230869872011,-0.0196288989728478,-0.998906896570241 );
    glTexCoord2f(0.59876726,0.59144407); glVertex3f(0.19115845+$x,0.047290202+$y,-0.056806379+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.57526626,0.57146201); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);

    glNormal3f( 0.0584943661049272,0.0525306923665883,-0.996904677235226 );
    glTexCoord2f(0.47777219,0.47704089); glVertex3f(-0.18548047+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.49840833,0.46371821); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( 0.0748302484064484,-0.294763070917107,0.952635904187401 );
    glTexCoord2f(0.12477146,0.5523494); glVertex3f(-0.17002861+$x,0.27390193+$y,0.052010331+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.0675523821727601,-0.980920649487142,0.182294692935668 );
    glTexCoord2f(0.83493083,0.97552334); glVertex3f(-0.17002861+$x,0.27390193+$y,0.052010331+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.85279937,0.97438904); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.0356665088741118,-0.0635352867255211,0.997342051397332 );
    glTexCoord2f(0.27999376,0.55498467); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);
    glTexCoord2f(0.26973761,0.57475399); glVertex3f(0.1578404+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( -0.238562441950891,-0.849936344579502,0.469783111077082 );
    glTexCoord2f(0.96832851,0.97778981); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.96950287,0.97345078); glVertex3f(0.19115845+$x,0.2709202+$y,0.040975956+$z);

    glNormal3f( -0.0508091573800684,-0.798136432901108,0.600330462330725 );
    glTexCoord2f(0.96832851,0.97778981); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);
    glTexCoord2f(0.96950287,0.97345078); glVertex3f(0.19115845+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.9823111,0.97710933); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);

    glNormal3f( 0.0817608440707112,-0.0378302349539754,0.995933751662314 );
    glTexCoord2f(0.11793271,0.45214125); glVertex3f(-0.18548047+$x,0.047290202+$y,0.055688457+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);

    glNormal3f( 0.0242924014579335,-0.0213309030813978,-0.999477299294556 );
    glTexCoord2f(0.80343185,0.91845423); glVertex3f(0.22737373+$x,0.217249+$y,-0.053128253+$z);
    glTexCoord2f(0.79528697,0.93804406); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( -0.192430969124845,0.0320793411541574,-0.980786030688033 );
    glTexCoord2f(0.66095207,0.54637833); glVertex3f(0.22737373+$x,0.217249+$y,-0.053128253+$z);
    glTexCoord2f(0.67338337,0.54692737); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.6407485,0.56010555); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( 0.960340610030408,0.142330410469481,-0.239766484275875 );
    glTexCoord2f(0.63405162,0.88528921); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.63376607,0.91133515); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);

    glNormal3f( 0,-0.102257250868063,-0.994757987977431 );
    glTexCoord2f(0.51882695,0.40760279); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.5222865,0.38941738); glVertex3f(-0.24342493+$x,0.2709202+$y,-0.056806379+$z);

    glNormal3f( 0.102587113791119,-0.0398718438007037,-0.993924604864946 );
    glTexCoord2f(0.51882695,0.40760279); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);
    glTexCoord2f(0.5222865,0.38941738); glVertex3f(-0.24342493+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.53467349,0.39633561); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);

    glNormal3f( -0.0136372052109054,-0.111894947402767,-0.993626462701033 );
    glTexCoord2f(0.71543792,0.43048276); glVertex3f(0.14335428+$x,0.4945502+$y,-0.053128253+$z);
    glTexCoord2f(0.73907641,0.43581228); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( -0.0404959901374476,-0.193381947852574,-0.980287456324691 );
    glTexCoord2f(0.79726186,0.83380426); glVertex3f(-0.14636796+$x,0.4945502+$y,-0.053128253+$z);
    glTexCoord2f(0.78266619,0.82448924); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( 0.248378973708772,-0.736259251578936,-0.629468188142818 );
    glTexCoord2f(0.79726186,0.83380426); glVertex3f(-0.14636796+$x,0.4945502+$y,-0.053128253+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.78088717,0.83943466); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);

    glNormal3f( 0.0261236121654149,0.1315918367448,-0.990959709266507 );
    glTexCoord2f(0.59087434,0.39270889); glVertex3f(-0.12319019+$x,0.36931741+$y,-0.053128253+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.57586718,0.37385573); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( -0.16725435007531,0.853198841900849,-0.494042223458619 );
    glTexCoord2f(0.80727759,0.87916681); glVertex3f(-0.12319019+$x,0.36931741+$y,-0.053128253+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.8245944,0.8753041); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);

    glNormal3f( -0.140681823851167,0.0358009871184267,-0.989407354813605 );
    glTexCoord2f(0.71402624,0.46647176); glVertex3f(0.19550429+$x,0.4319338+$y,-0.053128253+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);

    glNormal3f( -0.643795741718,-0.102775760082889,-0.758263929041303 );
    glTexCoord2f(0.94448873,0.85633582); glVertex3f(0.19550429+$x,0.4319338+$y,-0.053128253+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( 0.0797792492551546,-0.0602918587525439,-0.994987519095816 );
    glTexCoord2f(0.67482538,0.42580811); glVertex3f(0.068026497+$x,0.440879+$y,-0.053128253+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.69614708,0.41841231); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);

    glNormal3f( 0.590798499523909,0.122613406953311,-0.797447857477591 );
    glTexCoord2f(0.956843,0.81293775); glVertex3f(0.068026497+$x,0.440879+$y,-0.053128253+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.60692449940492,-0.0895505066978382,-0.789698270716258 );
    glTexCoord2f(0.82878866,0.858841); glVertex3f(-0.062348515+$x,0.42298861+$y,-0.053128253+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.0842634621166421,0.0409376076824165,-0.995602220381894 );
    glTexCoord2f(0.6267314,0.39309637); glVertex3f(-0.062348515+$x,0.42298861+$y,-0.053128253+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);

    glNormal3f( 0.0723208618805792,-0.0305942371373518,-0.996912075155494 );
    glTexCoord2f(0.58753053,0.35243272); glVertex3f(-0.18982631+$x,0.4319338+$y,-0.053128253+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.60131129,0.33586984); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);

    glNormal3f( 0.5983351368652,0.146699419356036,-0.787701938777038 );
    glTexCoord2f(0.78220031,0.85717364); glVertex3f(-0.18982631+$x,0.4319338+$y,-0.053128253+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( 0.32467686490677,0.0722962164043965,0.943057893497488 );
    glTexCoord2f(0.1192195,0.61827112); glVertex3f(-0.18258325+$x,0.42298861+$y,0.052010331+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);

    glNormal3f( 0.963051888689839,-0.0194310353597777,0.268614025240271 );
    glTexCoord2f(0.85353479,0.83698147); glVertex3f(-0.18258325+$x,0.42298861+$y,0.052010331+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.0848207990698902,-0.0385208723114141,0.995651331763039 );
    glTexCoord2f(0.1723836,0.62618117); glVertex3f(-0.062348515+$x,0.440879+$y,0.052010331+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);

    glNormal3f( -0.591417032326108,0.121379193631481,0.797178138955122 );
    glTexCoord2f(0.89624686,0.84333495); glVertex3f(-0.062348515+$x,0.440879+$y,0.052010331+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.0842634621166421,0.0409376076824165,0.995602220381894 );
    glTexCoord2f(0.23003159,0.61826999); glVertex3f(0.068026497+$x,0.42298861+$y,0.052010331+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);

    glNormal3f( 0.568819247544274,-0.164903138616446,0.805761514654064 );
    glTexCoord2f(0.71066175,0.83984495); glVertex3f(0.068026497+$x,0.42298861+$y,0.052010331+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.5983351368652,0.146699419356036,0.787701938777038 );
    glTexCoord2f(0.7558913,0.84301821); glVertex3f(0.19550429+$x,0.4319338+$y,0.052010331+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( -0.136109710614045,-0.0278425606596365,0.990302447988732 );
    glTexCoord2f(0.28639839,0.62222471); glVertex3f(0.19550429+$x,0.4319338+$y,0.052010331+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( -0.102587142347276,-0.0398718262284256,0.993924602622468 );
    glTexCoord2f(0.30049099,0.53520797); glVertex3f(0.22737373+$x,0.23513941+$y,0.052010331+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);

    glNormal3f( -0.830484677128053,0.114544451001792,0.545137386169956 );
    glTexCoord2f(0.98594356,0.96079401); glVertex3f(0.22737373+$x,0.23513941+$y,0.052010331+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.98273724,0.935285); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.156540462148092,0.0257179809181216,0.987336654423382 );
    glTexCoord2f(0.10192611,0.5233441); glVertex3f(-0.22169575+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);

    glNormal3f( 0.786409579399424,-0.112468109331253,0.607380356788293 );
    glTexCoord2f(0.81529727,0.95059603); glVertex3f(-0.22169575+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.0654269399860977,0.170084404674334,0.983255109730243 );
    glTexCoord2f(0.83547337,0.9384581); glVertex3f(-0.17099436+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);
    glTexCoord2f(0.84003484,0.94723483); glVertex3f(-0.15650825+$x,0.1993586+$y,0.011550957+$z);

    glNormal3f( 0.100706499051666,0.081543505260353,0.991568887066658 );
    glTexCoord2f(0.83547337,0.9384581); glVertex3f(-0.17099436+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.84003484,0.94723483); glVertex3f(-0.15650825+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);

    glNormal3f( 0.469080545082978,0.633035285931034,0.615816343556154 );
    glTexCoord2f(0.82078666,0.93701659); glVertex3f(-0.20720963+$x,0.172523+$y,0.033619707+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);

    glNormal3f( 0.956072737387473,0.199066038286272,0.215168848176106 );
    glTexCoord2f(0.82078666,0.93701659); glVertex3f(-0.20720963+$x,0.172523+$y,0.033619707+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.82029571,0.93221355); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);

    glNormal3f( -0.78680460336539,-0.234716205277732,0.570829938863627 );
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
    glTexCoord2f(0.84831034,0.97100838); glVertex3f(-0.13477908+$x,0.26197501+$y,0.033619707+$z);
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);

    glNormal3f( -0.100706506117998,-0.0815434828366606,0.991568888193036 );
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
    glTexCoord2f(0.83453014,0.95403316); glVertex3f(-0.17099436+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.84003484,0.94723483); glVertex3f(-0.15650825+$x,0.1993586+$y,0.011550957+$z);

    glNormal3f( -0.0837932278437227,-0.11308091345261,0.990046161540084 );
    glTexCoord2f(0.83113756,0.96926356); glVertex3f(-0.17823741+$x,0.26197501+$y,0.015229082+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);

    glNormal3f( 0.447973520640942,-0.527608560197908,0.721767921156413 );
    glTexCoord2f(0.83113756,0.96926356); glVertex3f(-0.17823741+$x,0.26197501+$y,0.015229082+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);

    glNormal3f( -0.784359364717782,-0.235896825122506,0.573701206968087 );
    glTexCoord2f(0.84831034,0.97100838); glVertex3f(-0.13477908+$x,0.26197501+$y,0.033619707+$z);
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
    glTexCoord2f(0.85279937,0.97438904); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( -0.216834373011332,-0.877870794276534,0.426996163023825 );
    glTexCoord2f(0.84831034,0.97100838); glVertex3f(-0.13477908+$x,0.26197501+$y,0.033619707+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);

    glNormal3f( 0.265043141213342,-0.262299788566936,0.927874428041589 );
    glTexCoord2f(0.82281732,0.95680858); glVertex3f(-0.20720963+$x,0.2261942+$y,0.015229082+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);

    glNormal3f( 0.871237087972098,0.117575250483077,0.476573181175505 );
    glTexCoord2f(0.82281732,0.95680858); glVertex3f(-0.20720963+$x,0.2261942+$y,0.015229082+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);

    glNormal3f( 0.405163791081322,-0.874307085815538,0.267262833348285 );
    glTexCoord2f(0.82078369,0.97101175); glVertex3f(-0.20720963+$x,0.26197501+$y,0.029941581+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( 0.57350797415899,-0.261212333330962,0.776438484679788 );
    glTexCoord2f(0.82078369,0.97101175); glVertex3f(-0.20720963+$x,0.26197501+$y,0.029941581+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.82474343,0.96636883); glVertex3f(-0.19835702+$x,0.25104199+$y,0.019724568+$z);

    glNormal3f( -0.410309276204624,0.422842724272387,0.807991539801218 );
    glTexCoord2f(0.96990993,0.93843606); glVertex3f(0.18391539+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.97644231,0.94148581); glVertex3f(0.204035+$x,0.18345602+$y,0.019724568+$z);

    glNormal3f( 0.0731657369945315,0.116018191990184,0.990548612667433 );
    glTexCoord2f(0.96990993,0.93843606); glVertex3f(0.18391539+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.97145518,0.94716734); glVertex3f(0.19115845+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);

    glNormal3f( -0.68464730808267,0.277184125127693,0.674112026529974 );
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.98316976,0.94722143); glVertex3f(0.22013067+$x,0.1993586+$y,0.026263457+$z);

    glNormal3f( -0.125292788523205,-0.101451343555979,0.986919116257643 );
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.97145518,0.94716734); glVertex3f(0.19115845+$x,0.1993586+$y,0.011550957+$z);

    glNormal3f( -0.232454564265912,-0.639954544983666,0.732409076887155 );
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);

    glNormal3f( -0.265043051008282,0.262299863904546,0.927874432511144 );
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);
    glTexCoord2f(0.97145518,0.94716734); glVertex3f(0.19115845+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.97644231,0.94148581); glVertex3f(0.204035+$x,0.18345602+$y,0.019724568+$z);

    glNormal3f( -0.912548816133892,0.286325007700668,0.292014808079735 );
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.98273724,0.935285); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);
    glTexCoord2f(0.98316976,0.94722143); glVertex3f(0.22013067+$x,0.1993586+$y,0.026263457+$z);

    glNormal3f( -0.401096160423658,0.463961944706994,0.789848836143412 );
    glTexCoord2f(0.98042043,0.93702046); glVertex3f(0.21288762+$x,0.172523+$y,0.029941581+$z);
    glTexCoord2f(0.96990993,0.93843606); glVertex3f(0.18391539+$x,0.172523+$y,0.015229082+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( -0.255088232820621,-0.826195128408704,0.50232619210049 );
    glTexCoord2f(0.95781131,0.97015177); glVertex3f(0.16942928+$x,0.26197501+$y,0.015229082+$z);
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);

    glNormal3f( 0.684647567704282,-0.277184181030052,0.674111739864624 );
    glTexCoord2f(0.95781131,0.97015177); glVertex3f(0.16942928+$x,0.26197501+$y,0.015229082+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.95953679,0.95952183); glVertex3f(0.16218623+$x,0.23513941+$y,0.011550957+$z);

    glNormal3f( -0.550610113495255,-0.0342950673255526,0.834057762552378 );
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);

    glNormal3f( -0.872063250156398,-0.172607443405581,0.457943619027112 );
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.9823111,0.97710933); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);

    glNormal3f( 0.523562863266593,0.0525390715097264,0.850365553261057 );
    glTexCoord2f(0.95348876,0.95678585); glVertex3f(0.14045706+$x,0.2261942+$y,0.015229082+$z);
    glTexCoord2f(0.93089635,0.95059634); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);

    glNormal3f( 0.568101488895293,0.252999852127198,0.783103935080502 );
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.83456368,0.9132052); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.85105641,0.90643102); glVertex3f(-0.12753602+$x,0.092016197+$y,0.026263457+$z);

    glNormal3f( 0.0632660737219474,-0.0512274249653987,0.996681069774692 );
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.85257842,0.92985558); glVertex3f(-0.1235121+$x,0.15363869+$y,0.017681165+$z);

    glNormal3f( 0.0558140251876119,0.135580097246001,0.989193020508698 );
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.86257442,0.92107568); glVertex3f(-0.098563797+$x,0.12779701+$y,0.011550957+$z);

    glNormal3f( 0.438453715141077,0.336499366821284,0.833382574696557 );
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.85105641,0.90643102); glVertex3f(-0.12753602+$x,0.092016197+$y,0.026263457+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);

    glNormal3f( 0.515215772450583,0.479754222303979,0.710203206131635 );
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.83456368,0.9132052); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( -0.488476069718461,0.411347095483664,0.769535376931794 );
    glTexCoord2f(0.94401516,0.91159902); glVertex3f(0.12597095+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.94188729,0.89623031); glVertex3f(0.11148483+$x,0.065180597+$y,0.029941581+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);

    glNormal3f( -0.483642791692568,-0.430773542434413,0.761921127927508 );
    glTexCoord2f(0.94401516,0.91159902); glVertex3f(0.12597095+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);

    glNormal3f( -0.0816198416002571,0.10464048585754,0.991155169575706 );
    glTexCoord2f(0.94401516,0.91159902); glVertex3f(0.12597095+$x,0.1099066+$y,0.015229082+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);

    glNormal3f( -0.110833318772305,0.696107168308791,0.709331224238038 );
    glTexCoord2f(0.94188729,0.89623031); glVertex3f(0.11148483+$x,0.065180597+$y,0.029941581+$z);
    glTexCoord2f(0.90622424,0.89801055); glVertex3f(0.017325104+$x,0.065180597+$y,0.015229082+$z);
    glTexCoord2f(0.94697969,0.88775212); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.827050101651838,0.128577554245395,0.547225677305037 );
    glTexCoord2f(0.85893905,0.84435205); glVertex3f(-0.17099436+$x,0.440879+$y,0.015229082+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.223278526941039,-0.265161066123076,0.937995900001441 );
    glTexCoord2f(0.85893905,0.84435205); glVertex3f(-0.17099436+$x,0.440879+$y,0.015229082+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( 0.503915423320276,-0.275418523290384,0.818665916701368 );
    glTexCoord2f(0.85761174,0.8559413); glVertex3f(-0.17099436+$x,0.47665981+$y,0.029941581+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( 0.347073650097494,-0.889476046149907,0.297274695750465 );
    glTexCoord2f(0.85761174,0.8559413); glVertex3f(-0.17099436+$x,0.47665981+$y,0.029941581+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.25936260067493,0.900041130699174,0.35022422020884 );
    glTexCoord2f(0.86101816,0.82676771); glVertex3f(-0.17099436+$x,0.3872078+$y,0.037297832+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.904508191790901,0.245127584844563,0.348966184796502 );
    glTexCoord2f(0.86101816,0.82676771); glVertex3f(-0.17099436+$x,0.3872078+$y,0.037297832+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.85593807,0.82279225); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);

    glNormal3f( -0.827050152628934,-0.128577497435323,0.547225613608981 );
    glTexCoord2f(0.8854105,0.83672086); glVertex3f(-0.084077684+$x,0.42298861+$y,0.015229082+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.223278496539024,0.265161131941065,0.937995888632251 );
    glTexCoord2f(0.8854105,0.83672086); glVertex3f(-0.084077684+$x,0.42298861+$y,0.015229082+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( -0.503915224365642,0.275418441836896,0.818666066567231 );
    glTexCoord2f(0.88848915,0.8241657); glVertex3f(-0.084077684+$x,0.3872078+$y,0.029941581+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( -0.346412972099786,0.830163968137777,0.436836169251966 );
    glTexCoord2f(0.88848915,0.8241657); glVertex3f(-0.084077684+$x,0.3872078+$y,0.029941581+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( -0.259362164740894,-0.90004115119281,0.350224490377869 );
    glTexCoord2f(0.88879824,0.85654593); glVertex3f(-0.084077684+$x,0.47665981+$y,0.037297832+$z);
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.62126444808052,-0.0946028504911465,0.777869388927317 );
    glTexCoord2f(0.88879824,0.85654593); glVertex3f(-0.084077684+$x,0.47665981+$y,0.037297832+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.89504843,0.86099529); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);

    glNormal3f( 0.827050145887601,0.128577470514242,0.547225630122947 );
    glTexCoord2f(0.72127817,0.84641038); glVertex3f(0.089755666+$x,0.440879+$y,0.015229082+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.223278529144642,-0.265161186609962,0.937995865416582 );
    glTexCoord2f(0.72127817,0.84641038); glVertex3f(0.089755666+$x,0.440879+$y,0.015229082+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( 0.503915099648369,-0.27541841328132,0.818666152941463 );
    glTexCoord2f(0.7183627,0.85879094); glVertex3f(0.089755666+$x,0.47665981+$y,0.029941581+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( 0.344292090123895,-0.912120084736034,0.222485747182264 );
    glTexCoord2f(0.7183627,0.85879094); glVertex3f(0.089755666+$x,0.47665981+$y,0.029941581+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.259362580188085,0.900041161086787,0.350224157287484 );
    glTexCoord2f(0.71924451,0.82840162); glVertex3f(0.089755666+$x,0.3872078+$y,0.037297832+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.807049334742973,0.184511854228992,0.560915989199723 );
    glTexCoord2f(0.71924451,0.82840162); glVertex3f(0.089755666+$x,0.3872078+$y,0.037297832+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.71528789,0.82398032); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);

    glNormal3f( -0.223278526941039,0.265161066123076,0.937995900001441 );
    glTexCoord2f(0.74919549,0.83968588); glVertex3f(0.17667234+$x,0.42298861+$y,0.015229082+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( -0.827050065030829,-0.12857740800177,0.547225767013989 );
    glTexCoord2f(0.74919549,0.83968588); glVertex3f(0.17667234+$x,0.42298861+$y,0.015229082+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.346707228197447,0.834748253377708,0.427772663220207 );
    glTexCoord2f(0.74920125,0.82705518); glVertex3f(0.17667234+$x,0.3872078+$y,0.029941581+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( -0.503915423320276,0.275418523290384,0.818665916701368 );
    glTexCoord2f(0.74920125,0.82705518); glVertex3f(0.17667234+$x,0.3872078+$y,0.029941581+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( -0.259362230757603,-0.900041150398776,0.350224443529128 );
    glTexCoord2f(0.74880613,0.85747601); glVertex3f(0.17667234+$x,0.47665981+$y,0.037297832+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.60577169098323,-0.0878158103935115,0.790777491996484 );
    glTexCoord2f(0.74880613,0.85747601); glVertex3f(0.17667234+$x,0.47665981+$y,0.037297832+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.75657711,0.86030351); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( -0.827050058289497,0.128577381080708,-0.547225783527938 );
    glTexCoord2f(0.94886767,0.85054407); glVertex3f(0.17667234+$x,0.440879+$y,-0.016347004+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.223278526941039,-0.265161066123076,-0.937995900001441 );
    glTexCoord2f(0.94886767,0.85054407); glVertex3f(0.17667234+$x,0.440879+$y,-0.016347004+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( -0.503915423320276,-0.275418523290384,-0.818665916701368 );
    glTexCoord2f(0.9612634,0.85311844); glVertex3f(0.17667234+$x,0.47665981+$y,-0.031059503+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( -0.347696374499204,-0.859042615785835,-0.375703360943097 );
    glTexCoord2f(0.9612634,0.85311844); glVertex3f(0.17667234+$x,0.47665981+$y,-0.031059503+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( -0.76583577742341,0.162778532338052,-0.622092204924761 );
    glTexCoord2f(0.9323289,0.84614889); glVertex3f(0.17667234+$x,0.3872078+$y,-0.038415754+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.92890193,0.85065139); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);

    glNormal3f( -0.259362628904158,0.900041166529049,-0.350224107224149 );
    glTexCoord2f(0.9323289,0.84614889); glVertex3f(0.17667234+$x,0.3872078+$y,-0.038415754+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.827050152628934,-0.128577497435323,-0.547225613608981 );
    glTexCoord2f(0.94900184,0.81921098); glVertex3f(0.089755666+$x,0.42298861+$y,-0.016347004+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( 0.223278529144642,0.265161186609962,-0.937995865416582 );
    glTexCoord2f(0.94900184,0.81921098); glVertex3f(0.089755666+$x,0.42298861+$y,-0.016347004+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( 0.503915099648369,0.27541841328132,-0.818666152941463 );
    glTexCoord2f(0.93667043,0.81658441); glVertex3f(0.089755666+$x,0.3872078+$y,-0.031059503+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( 0.345178546156684,0.814315478751495,-0.466628409271105 );
    glTexCoord2f(0.93667043,0.81658441); glVertex3f(0.089755666+$x,0.3872078+$y,-0.031059503+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( 0.951345183209679,-0.308127152947805,0 );
    glTexCoord2f(0.9671243,0.82549076); glVertex3f(0.089755666+$x,0.47665981+$y,-0.038415754+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);

    glNormal3f( -0.385311628700181,-0.544568888787195,-0.744969579347703 );
    glTexCoord2f(0.96375761,0.8411314); glVertex3f(0.14190567+$x,0.47665981+$y,-0.016347004+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.95823526,0.8486713); glVertex3f(0.1660492+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( 0.0671125635706548,-0.114118145994134,-0.991197736360327 );
    glTexCoord2f(0.96375761,0.8411314); glVertex3f(0.14190567+$x,0.47665981+$y,-0.016347004+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( 0,0.380290753993593,-0.924866986342893 );
    glTexCoord2f(0.78991523,0.90057574); glVertex3f(0.18391539+$x,0.26197501+$y,-0.016347004+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);

    glNormal3f( -0.447973520640942,-0.527608560197908,-0.721767921156413 );
    glTexCoord2f(0.78991523,0.90057574); glVertex3f(0.18391539+$x,0.26197501+$y,-0.016347004+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);

    glNormal3f( 0.571142564489523,-0.312161904485861,-0.759177921449308 );
    glTexCoord2f(0.77332092,0.89838758); glVertex3f(0.14045706+$x,0.26197501+$y,-0.034737629+$z);
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);
    glTexCoord2f(0.76505919,0.89358938); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);

    glNormal3f( 0.216834373011332,-0.877870794276534,-0.426996163023825 );
    glTexCoord2f(0.77332092,0.89838758); glVertex3f(0.14045706+$x,0.26197501+$y,-0.034737629+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);

    glNormal3f( -0.627843437478447,-0.349506648049592,-0.695455045983841 );
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.7991702,0.91098132); glVertex3f(0.22013067+$x,0.23513941+$y,-0.027381379+$z);

    glNormal3f( -0.903171574106045,0.117532012037699,-0.412876899175989 );
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.80063639,0.91746415); glVertex3f(0.22013067+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);

    glNormal3f( -0.125292806297348,0.101451301240837,-0.98691911835098 );
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.78930468,0.90998689); glVertex3f(0.19115845+$x,0.23513941+$y,-0.012668879+$z);

    glNormal3f( -0.39626183255359,-0.737976231816286,-0.546230392174864 );
    glTexCoord2f(0.80137388,0.90060064); glVertex3f(0.21288762+$x,0.26197501+$y,-0.031059503+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0.0654269399860978,0.170084404674334,-0.983255109730243 );
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.77797084,0.92052059); glVertex3f(0.16218623+$x,0.1993586+$y,-0.012668879+$z);

    glNormal3f( -0.0312605028903785,0.50624125696404,-0.861825139286682 );
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.76473749,0.93325026); glVertex3f(0.133214+$x,0.1635778+$y,-0.020025128+$z);

    glNormal3f( -0.100706494765027,0.081543494113381,-0.991568888418713 );
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);

    glNormal3f( -0.96100841688721,0.210098176397275,-0.179782031767575 );
    glTexCoord2f(0.79531499,0.9344735); glVertex3f(0.21288762+$x,0.172523+$y,-0.034737629+$z);
    glTexCoord2f(0.79962527,0.92466377); glVertex3f(0.22013067+$x,0.1993586+$y,-0.042093878+$z);
    glTexCoord2f(0.79528697,0.93804406); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( 0.100706509762183,-0.0815434784092993,-0.991568888187014 );
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.77797084,0.92052059); glVertex3f(0.16218623+$x,0.1993586+$y,-0.012668879+$z);

    glNormal3f( 0.491371093925755,0.0126594596012452,-0.870858304281937 );
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.74570522,0.90952043); glVertex3f(0.075269554+$x,0.217249+$y,-0.053128253+$z);

    glNormal3f( -0.45166479291968,0.393979499521355,-0.800486769905491 );
    glTexCoord2f(0.7531607,0.95217679); glVertex3f(0.11148483+$x,0.1099066+$y,-0.016347004+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);

    glNormal3f( -0.0674970881385308,-0.0409899995400461,-0.996877105279546 );
    glTexCoord2f(0.7531607,0.95217679); glVertex3f(0.11148483+$x,0.1099066+$y,-0.016347004+$z);
    glTexCoord2f(0.72922306,0.9434899); glVertex3f(0.046297329+$x,0.12779701+$y,-0.012668879+$z);
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);

    glNormal3f( -0.513242130784566,0.446719310911926,-0.73281946784054 );
    glTexCoord2f(0.75033958,0.9685948); glVertex3f(0.11148483+$x,0.065180597+$y,-0.034737629+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.75310762,0.97749093); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);

    glNormal3f( -0.642369445227996,-0.600403016074319,-0.476316821166686 );
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.67878658,0.9538229); glVertex3f(-0.079248979+$x,0.076113618+$y,-0.02084249+$z);

    glNormal3f( 0.484622169176548,-0.0573396479481124,-0.872842206768098 );
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);

    glNormal3f( 0.0420587375908793,-0.102166664229133,-0.993877776848116 );
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.69438485,0.95001154); glVertex3f(-0.040619346+$x,0.092016197+$y,-0.012668879+$z);

    glNormal3f( 0.114182278684254,0.721619284346836,-0.682808915944448 );
    glTexCoord2f(0.6680608,0.95646883); glVertex3f(-0.10580685+$x,0.065180597+$y,-0.031059503+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.65740249,0.96185794); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( 0,0.38029058373416,-0.924867056350867 );
    glTexCoord2f(0.65943939,0.87964403); glVertex3f(-0.1637513+$x,0.26197501+$y,-0.016347004+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);

    glNormal3f( -0.44797389586695,-0.527608512710307,-0.721767722981158 );
    glTexCoord2f(0.65943939,0.87964403); glVertex3f(-0.1637513+$x,0.26197501+$y,-0.016347004+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);

    glNormal3f( 0.872063088999194,-0.172607695852132,-0.45794383076727 );
    glTexCoord2f(0.63966878,0.8760239); glVertex3f(-0.20720963+$x,0.26197501+$y,-0.038415754+$z);
    glTexCoord2f(0.63927364,0.88259426); glVertex3f(-0.21445269+$x,0.23513941+$y,-0.042093878+$z);
    glTexCoord2f(0.64020173,0.86956116); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);

    glNormal3f( 0.306728582169166,-0.887009906854316,-0.345153591930883 );
    glTexCoord2f(0.63966878,0.8760239); glVertex3f(-0.20720963+$x,0.26197501+$y,-0.038415754+$z);
    glTexCoord2f(0.64683385,0.87426399); glVertex3f(-0.18548047+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);

    glNormal3f( -0.627842950077606,-0.349506793463513,-0.6954554129207 );
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.66943027,0.89034682); glVertex3f(-0.12753602+$x,0.23513941+$y,-0.027381379+$z);

    glNormal3f( -0.773866981929802,0.045522980799195,-0.631710022477099 );
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);

    glNormal3f( -0.125292806297348,0.101451301240837,-0.98691911835098 );
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.66007594,0.89005417); glVertex3f(-0.15650825+$x,0.23513941+$y,-0.012668879+$z);

    glNormal3f( -0.395225676642623,-0.731722042496613,-0.555319292882 );
    glTexCoord2f(0.66862391,0.88008768); glVertex3f(-0.13477908+$x,0.26197501+$y,-0.031059503+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( 0.410309348766964,0.42284291372432,-0.80799140380796 );
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);
    glTexCoord2f(0.64133243,0.90594988); glVertex3f(-0.19835702+$x,0.18345602+$y,-0.02084249+$z);

    glNormal3f( -0.0701036660328356,0.0930297762334115,-0.993192295954171 );
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);

    glNormal3f( 0.627843289651583,0.349506390288363,-0.695455308979 );
    glTexCoord2f(0.64083104,0.89692108); glVertex3f(-0.20720963+$x,0.20830381+$y,-0.016347004+$z);
    glTexCoord2f(0.64133243,0.90594988); glVertex3f(-0.19835702+$x,0.18345602+$y,-0.02084249+$z);
    glTexCoord2f(0.63470997,0.89914922); glVertex3f(-0.21445269+$x,0.1993586+$y,-0.027381379+$z);

    glNormal3f( 0.904604956638552,-0.11268769241645,-0.411085582820438 );
    glTexCoord2f(0.64083104,0.89692108); glVertex3f(-0.20720963+$x,0.20830381+$y,-0.016347004+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);

    glNormal3f( 0.392326778802354,0.499199698520783,-0.772579678500107 );
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);

    glNormal3f( 0.788876491246996,0.551689171469116,-0.270763623187365 );
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.63376607,0.91133515); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);

    glNormal3f( 0.882731457108134,0.178690173006085,0.4345745007508 );
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.63470997,0.89914922); glVertex3f(-0.21445269+$x,0.1993586+$y,-0.027381379+$z);

    glNormal3f( 0.57350797415899,0.261212333330962,-0.776438484679788 );
    glTexCoord2f(0.6358811,0.90977871); glVertex3f(-0.20720963+$x,0.172523+$y,-0.031059503+$z);
    glTexCoord2f(0.63470997,0.89914922); glVertex3f(-0.21445269+$x,0.1993586+$y,-0.027381379+$z);
    glTexCoord2f(0.64133243,0.90594988); glVertex3f(-0.19835702+$x,0.18345602+$y,-0.02084249+$z);

    glNormal3f( -0.827050145887602,0.128577470514243,-0.547225630122947 );
    glTexCoord2f(0.81698506,0.85268169); glVertex3f(-0.084077684+$x,0.440879+$y,-0.016347004+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.223278496539024,-0.265161131941065,-0.937995888632251 );
    glTexCoord2f(0.81698506,0.85268169); glVertex3f(-0.084077684+$x,0.440879+$y,-0.016347004+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( -0.503915224365642,-0.275418441836895,-0.818666066567231 );
    glTexCoord2f(0.82019781,0.83967519); glVertex3f(-0.084077684+$x,0.47665981+$y,-0.031059503+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( -0.345844942717365,-0.8223592803654,-0.451792529369095 );
    glTexCoord2f(0.82019781,0.83967519); glVertex3f(-0.084077684+$x,0.47665981+$y,-0.031059503+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.807049334742973,0.184511854228992,-0.560915989199723 );
    glTexCoord2f(0.82053058,0.8709384); glVertex3f(-0.084077684+$x,0.3872078+$y,-0.038415754+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.8245944,0.8753041); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);

    glNormal3f( -0.259362562887359,0.900041167323122,-0.350224154072977 );
    glTexCoord2f(0.82053058,0.8709384); glVertex3f(-0.084077684+$x,0.3872078+$y,-0.038415754+$z);
    glTexCoord2f(0.81160395,0.87523607); glVertex3f(-0.11015269+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.067112537211084,0.114118154639818,-0.991197737149704 );
    glTexCoord2f(0.8030736,0.87214476); glVertex3f(-0.13622769+$x,0.3872078+$y,-0.016347004+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.385311554388159,0.544568631564648,-0.744969805811476 );
    glTexCoord2f(0.8030736,0.87214476); glVertex3f(-0.13622769+$x,0.3872078+$y,-0.016347004+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( 0.223278526941039,0.265161066123076,-0.937995900001441 );
    glTexCoord2f(0.79034067,0.86188474); glVertex3f(-0.17099436+$x,0.42298861+$y,-0.016347004+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( 0.827050108393174,-0.128577581166494,-0.54722566079106 );
    glTexCoord2f(0.79034067,0.86188474); glVertex3f(-0.17099436+$x,0.42298861+$y,-0.016347004+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( 0.346707228197447,0.834748253377708,-0.427772663220207 );
    glTexCoord2f(0.78962744,0.87337046); glVertex3f(-0.17099436+$x,0.3872078+$y,-0.031059503+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( 0.503915423320276,0.275418523290384,-0.818665916701368 );
    glTexCoord2f(0.78962744,0.87337046); glVertex3f(-0.17099436+$x,0.3872078+$y,-0.031059503+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.79336483,0.86931133); glVertex3f(-0.16037122+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( 0.60577169098323,-0.0878158103935115,-0.790777491996484 );
    glTexCoord2f(0.78898544,0.84217603); glVertex3f(-0.17099436+$x,0.47665981+$y,-0.038415754+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.78088717,0.83943466); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);

    glNormal3f( 0.259362202528421,-0.900041114568912,-0.350224556513614 );
    glTexCoord2f(0.78898544,0.84217603); glVertex3f(-0.17099436+$x,0.47665981+$y,-0.038415754+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.38531183334041,-0.544568942077458,-0.744969434549157 );
    glTexCoord2f(0.80904131,0.84125231); glVertex3f(-0.11884435+$x,0.47665981+$y,-0.016347004+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.81597209,0.84367855); glVertex3f(-0.094700833+$x,0.46572679+$y,-0.02084249+$z);

    glNormal3f( 0.0671125650744141,-0.114118170121186,-0.991197733480724 );
    glTexCoord2f(0.80904131,0.84125231); glVertex3f(-0.11884435+$x,0.47665981+$y,-0.016347004+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.0241484237000886,0.125141131816343,-0.991845023559893 );
    glTexCoord2f(0.75694129,0.44659481); glVertex3f(0.23751401+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.73907641,0.43581228); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.77206831,0.43481649); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( -0.0216307415349257,-0.0700587915222788,-0.99730831579361 );
    glTexCoord2f(0.75694129,0.44659481); glVertex3f(0.23751401+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( 0.0443233142444854,0.163785402527261,-0.985499764451199 );
    glTexCoord2f(0.67885067,0.47202176); glVertex3f(0.14480289+$x,0.36931741+$y,-0.053128253+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.305132606069548,0.811802159390434,-0.497866796163626 );
    glTexCoord2f(0.9265368,0.83426583); glVertex3f(0.14480289+$x,0.36931741+$y,-0.053128253+$z);
    glTexCoord2f(0.92973331,0.8367981); glVertex3f(0.15059734+$x,0.3782626+$y,-0.042093878+$z);
    glTexCoord2f(0.92890193,0.85065139); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);

    glNormal3f( 0.385311671357706,0.544568532558109,-0.744969817685951 );
    glTexCoord2f(0.9341119,0.82862365); glVertex3f(0.12452234+$x,0.3872078+$y,-0.016347004+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.9396539,0.8210678); glVertex3f(0.10037882+$x,0.39814082+$y,-0.02084249+$z);

    glNormal3f( -0.0671125385981379,0.114118154184877,-0.991197737108167 );
    glTexCoord2f(0.9341119,0.82862365); glVertex3f(0.12452234+$x,0.3872078+$y,-0.016347004+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.0934866416317826,0.755494557186282,-0.648450631812719 );
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);
    glTexCoord2f(0.75310762,0.97749093); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);

    glNormal3f( 0.012778631123857,0.0318641613716817,-0.99941051715833 );
    glTexCoord2f(0.74341446,0.1391077); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.70730292,0.177309); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.69001794,0.13464797); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( -0.0199385888092016,-0.870824550265941,-0.491189429172105 );
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);
    glTexCoord2f(0.72908781,0.92392784); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);

    glNormal3f( 0.0205855675502351,-0.0885635512360104,-0.995857786936017 );
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);

    glNormal3f( -0.0487777888729877,0.433241841328765,0.899956795760065 );
    glTexCoord2f(0.13928973,0.59717598); glVertex3f(-0.13719343+$x,0.37528087+$y,0.052010331+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.197512679170702,0.972367112526634,0.124462605000171 );
    glTexCoord2f(0.86965967,0.8200345); glVertex3f(-0.13719343+$x,0.37528087+$y,0.052010331+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.85593807,0.82279225); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);

    glNormal3f( -0.385311759028365,0.544568684854909,0.744969661013026 );
    glTexCoord2f(0.87735348,0.82563841); glVertex3f(-0.11884435+$x,0.3872078+$y,0.015229082+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.88469707,0.82800087); glVertex3f(-0.094700833+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( 0.0671125414889456,0.114118177856983,0.991197734187027 );
    glTexCoord2f(0.87735348,0.82563841); glVertex3f(-0.11884435+$x,0.3872078+$y,0.015229082+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.151230498769862,0.841799450287175,0.518172772092502 );
    glTexCoord2f(0.88685843,0.88601197); glVertex3f(-0.03337629+$x,0.038345001+$y,0.052010331+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);
    glTexCoord2f(0.84954835,0.8928106); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);

    glNormal3f( -0.0141521194395403,0.0854618686444091,0.99624092795025 );
    glTexCoord2f(0.18519607,0.44819255); glVertex3f(-0.03337629+$x,0.038345001+$y,0.052010331+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.0111795476310405,0.135783370828398,0.990675473563994 );
    glTexCoord2f(0.90622424,0.89801055); glVertex3f(0.017325104+$x,0.065180597+$y,0.015229082+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);

    glNormal3f( 0.048688830840734,-0.56015013241772,0.826959023715065 );
    glTexCoord2f(0.93251357,0.92500023); glVertex3f(0.089755666+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.93089635,0.95059634); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);

    glNormal3f( -0.248378973708772,-0.736259251578936,0.629468188142818 );
    glTexCoord2f(0.74047198,0.8652332); glVertex3f(0.15204594+$x,0.4945502+$y,0.052010331+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.75657711,0.86030351); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( 0.0466231884714776,-0.202035441262237,0.978267835907287 );
    glTexCoord2f(0.74047198,0.8652332); glVertex3f(0.15204594+$x,0.4945502+$y,0.052010331+$z);
    glTexCoord2f(0.75435059,0.87476965); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.0671125621836003,-0.114118146449074,0.991197736401865 );
    glTexCoord2f(0.73069236,0.85872733); glVertex3f(0.12452234+$x,0.47665981+$y,0.015229082+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.385311745669745,-0.5445687897806,0.744969591222237 );
    glTexCoord2f(0.73069236,0.85872733); glVertex3f(0.12452234+$x,0.47665981+$y,0.015229082+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.72212792,0.85486801); glVertex3f(0.10037882+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( 0.0344266537758779,-0.0752645463531036,0.99656914139063 );
    glTexCoord2f(0.86948672,0.86240059); glVertex3f(-0.1376763+$x,0.4945502+$y,0.052010331+$z);
    glTexCoord2f(0.8664051,0.87830544); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.85251095,0.87195099); glVertex3f(-0.18548047+$x,0.5213858+$y,0.055688457+$z);

    glNormal3f( 0.0317575336504815,-0.0799810312385589,0.996290366157605 );
    glTexCoord2f(0.13907568,0.64991331); glVertex3f(-0.1376763+$x,0.4945502+$y,0.052010331+$z);
    glTexCoord2f(0.11793057,0.66177214); glVertex3f(-0.18548047+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.0587125231783167,-0.842059404557882,0.536179819480052 );
    glTexCoord2f(0.86948672,0.86240059); glVertex3f(-0.1376763+$x,0.4945502+$y,0.052010331+$z);
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.89504843,0.86099529); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);

    glNormal3f( 0.385311628700181,-0.544568888787195,0.744969579347703 );
    glTexCoord2f(0.8699361,0.85587103); glVertex3f(-0.13622769+$x,0.47665981+$y,0.015229082+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.86136746,0.85200911); glVertex3f(-0.16037122+$x,0.46572679+$y,0.019724568+$z);

    glNormal3f( -0.067112560796546,-0.114118146904015,0.991197736443402 );
    glTexCoord2f(0.8699361,0.85587103); glVertex3f(-0.13622769+$x,0.47665981+$y,0.015229082+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.0261236121654149,0.1315918367448,0.990959709266507 );
    glTexCoord2f(0.25693419,0.59453791); glVertex3f(0.12886817+$x,0.36931741+$y,0.052010331+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( 0.167254357426554,0.853198844342897,0.494042216752552 );
    glTexCoord2f(0.73224872,0.82080348); glVertex3f(0.12886817+$x,0.36931741+$y,0.052010331+$z);
    glTexCoord2f(0.72796507,0.82450416); glVertex3f(0.11583067+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.71528789,0.82398032); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);

    glNormal3f( 0.0671125399851918,0.114118153729937,0.991197737066629 );
    glTexCoord2f(0.73686024,0.82699173); glVertex3f(0.14190567+$x,0.3872078+$y,0.015229082+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( -0.385311554388159,0.544568631564648,0.744969805811476 );
    glTexCoord2f(0.73686024,0.82699173); glVertex3f(0.14190567+$x,0.3872078+$y,0.015229082+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.74542816,0.83088988); glVertex3f(0.1660492+$x,0.39814082+$y,0.019724568+$z);

    glNormal3f( -0.00938547615898887,-0.0486370921662629,-0.998772419574589 );
    glTexCoord2f(0.60286382,0.30769012); glVertex3f(-0.23183603+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.615434,0.32434555); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.60131129,0.33586984); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);

    glNormal3f( -0.0651577094101893,0.211036240818054,-0.975304146390141 );
    glTexCoord2f(0.60286382,0.30769012); glVertex3f(-0.23183603+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.59075291,0.30248891); glVertex3f(-0.26080825+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.61170523,0.28712711); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( -0.223241879994427,0.0482031957219106,0.973570498186315 );
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.069848647,0.64435978); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);

    glNormal3f( 0.0594411057566321,0.0433173104409711,0.997291514835351 );
    glTexCoord2f(0.10960405,0.62221923); glVertex3f(-0.20431242+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.11536892,0.61430857); glVertex3f(-0.19127491+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.988845575628656,-0.0377493108104597,-0.144081286407939 );
    glTexCoord2f(0.44367879,0.32057955); glVertex3f(0.30704735+$x,0.485605+$y,0.0088156086+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( 0.937026835792215,-0.0885177521580649,0.337853987038946 );
    glTexCoord2f(0.44367879,0.32057955); glVertex3f(0.30704735+$x,0.485605+$y,0.0088156086+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.44621872,0.31527785); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);

    glNormal3f( 0.756470250239897,-0.165760605389129,-0.632673835560644 );
    glTexCoord2f(0.19066252,0.22149452); glVertex3f(0.30704735+$x,-0.3731342+$y,0.0088156086+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( 0.472815464512674,-0.223326520226918,0.852391225835297 );
    glTexCoord2f(0.19066252,0.22149452); glVertex3f(0.30704735+$x,-0.3731342+$y,0.0088156086+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);

    glNormal3f( 0.472815458714852,0.223326581650604,-0.852391212958299 );
    glTexCoord2f(0.22208307,0.23144357); glVertex3f(0.30704735+$x,-0.2657918+$y,-0.0099335305+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.22600282,0.21349898); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);

    glNormal3f( 0.841439159786857,0.136949818492206,0.522709180703898 );
    glTexCoord2f(0.22208307,0.23144357); glVertex3f(0.30704735+$x,-0.2657918+$y,-0.0099335305+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.842667178641826,-0.13646394299279,0.52085469979898 );
    glTexCoord2f(0.25497601,0.2402819); glVertex3f(0.30704735+$x,-0.1584494+$y,0.0088156086+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.26457004,0.23577308); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);

    glNormal3f( 0.919248423955283,-0.0997759565654856,-0.380824229201834 );
    glTexCoord2f(0.25497601,0.2402819); glVertex3f(0.30704735+$x,-0.1584494+$y,0.0088156086+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.971104536900676,0.0604859439725213,-0.230862359410705 );
    glTexCoord2f(0.28639656,0.25023094); glVertex3f(0.30704735+$x,-0.051106998+$y,-0.0099335305+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.289123,0.24953847); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);

    glNormal3f( 0.987103656447624,0.0405721828500401,0.154855640538255 );
    glTexCoord2f(0.28639656,0.25023094); glVertex3f(0.30704735+$x,-0.051106998+$y,-0.0099335305+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( 0.996556881749195,-0.0210136557467598,-0.080204786082108 );
    glTexCoord2f(0.31928951,0.25906927); glVertex3f(0.30704735+$x,0.056235402+$y,0.0088156086+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( 0.901795924482504,-0.109529616968767,0.418051879069357 );
    glTexCoord2f(0.31928951,0.25906927); glVertex3f(0.30704735+$x,0.056235402+$y,0.0088156086+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.32443307,0.25332171); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);

    glNormal3f( 0.960316383378296,0.0706892909514181,-0.269806352705075 );
    glTexCoord2f(0.35071005,0.26901831); glVertex3f(0.30704735+$x,0.1635778+$y,-0.0099335305+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.34673717,0.26636883); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);

    glNormal3f( 0.996556881730799,0.021013656012557,0.0802047862410443 );
    glTexCoord2f(0.35071005,0.26901831); glVertex3f(0.30704735+$x,0.1635778+$y,-0.0099335305+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( 0.993003842545776,-0.0299273849054872,-0.114226618272813 );
    glTexCoord2f(0.37946482,0.30132894); glVertex3f(0.30704735+$x,0.2709202+$y,0.0088156086+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.971104536747958,-0.0604859435262496,0.230862360170023 );
    glTexCoord2f(0.37946482,0.30132894); glVertex3f(0.30704735+$x,0.2709202+$y,0.0088156086+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.3782527,0.29659687); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);

    glNormal3f( 0.988307559701686,0.0386437413726612,0.147495181918672 );
    glTexCoord2f(0.41088537,0.31127798); glVertex3f(0.30704735+$x,0.3782626+$y,-0.0099335305+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.960316383378296,0.0706892909514182,-0.269806352705075 );
    glTexCoord2f(0.41088537,0.31127798); glVertex3f(0.30704735+$x,0.3782626+$y,-0.0099335305+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);

    glNormal3f( 0.044935329504706,-0.0436617274501627,-0.998035304845661 );
    glTexCoord2f(0.56224368,0.62239427); glVertex3f(0.17667234+$x,-0.060052198+$y,-0.056806379+$z);
    glTexCoord2f(0.58974682,0.62057357); glVertex3f(0.22013067+$x,-0.015326199+$y,-0.056806379+$z);
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( -0.0109306818083995,0.0227590170544706,-0.999681222859526 );
    glTexCoord2f(0.56224368,0.62239427); glVertex3f(0.17667234+$x,-0.060052198+$y,-0.056806379+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.57526626,0.57146201); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);

    glNormal3f( 0.306798745763289,-0.0828064861620218,-0.948165394563402 );
    glTexCoord2f(0.60883207,0.63229895); glVertex3f(0.27083207+$x,-0.0063809978+$y,-0.056806379+$z);
    glTexCoord2f(0.61885893,0.62553008); glVertex3f(0.27807513+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.60801651,0.65172056); glVertex3f(0.29799353+$x,-0.039925498+$y,-0.045088166+$z);

    glNormal3f( -0.0187931642229793,-0.0266299224070321,-0.999468690960894 );
    glTexCoord2f(0.36330271,0.79536552); glVertex3f(0.053540384+$x,-0.2657918+$y,-0.056806379+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.43906305,0.67843164); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( 0.0612834539265191,-0.0868386583244701,-0.994335650419536 );
    glTexCoord2f(0.36330271,0.79536552); glVertex3f(0.053540384+$x,-0.2657918+$y,-0.056806379+$z);
    glTexCoord2f(0.36532592,0.82279137); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.31983728,0.8676351); glVertex3f(0.24367061+$x,-0.2657918+$y,-0.045088166+$z);

    glNormal3f( -0.00696425698241833,-0.0263156039639314,-0.999629425393579 );
    glTexCoord2f(0.47556667,0.56554515); glVertex3f(-0.055105459+$x,-0.095832998+$y,-0.056806379+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( 0.00957331625236177,0.00930198125197941,-0.999910908411705 );
    glTexCoord2f(0.72784301,0.19582481); glVertex3f(-0.055105459+$x,-0.095832998+$y,-0.056806379+$z);
    glTexCoord2f(0.70730292,0.177309); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.80182696,0.12820222); glVertex3f(0.12138861+$x,0.045282096+$y,-0.053803828+$z);

    glNormal3f( -0.0612834563559359,0.0868386843238388,-0.994335647999193 );
    glTexCoord2f(0.11818333,0.1078426); glVertex3f(-0.047862402+$x,-0.3731342+$y,-0.056806379+$z);
    glTexCoord2f(0.13035954,0.13229987); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.10563879,0.19102443); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);

    glNormal3f( 0.0285573329607611,0.040465741922765,-0.998772748158864 );
    glTexCoord2f(0.34980295,0.70887483); glVertex3f(-0.047862402+$x,-0.3731342+$y,-0.056806379+$z);
    glTexCoord2f(0.37496274,0.69778236); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.27960694,0.82566929); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( -0.306798936630686,0.08280653551808,-0.948165328493809 );
    glTexCoord2f(0.31988239,0.11295972); glVertex3f(-0.22893881+$x,-0.068997399+$y,-0.056806379+$z);
    glTexCoord2f(0.30501548,0.10392325); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);

    glNormal3f( 0.0141823816646967,0.0114836823769683,-0.999833478680016 );
    glTexCoord2f(0.42644296,0.50528962); glVertex3f(-0.22893881+$x,-0.068997399+$y,-0.056806379+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( 0.0609622914380447,-0.246810224107128,-0.967144411294824 );
    glTexCoord2f(0.44313583,0.47243081); glVertex3f(-0.25066798+$x,0.011509401+$y,-0.056806379+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.472815407379521,-0.22332653022594,-0.852391254906912 );
    glTexCoord2f(0.23666941,0.063257738); glVertex3f(-0.30136937+$x,-0.3731342+$y,-0.0099335305+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.2299889,0.083284912); glVertex3f(-0.23799262+$x,-0.3731342+$y,-0.045088166+$z);

    glNormal3f( -0.756470181372901,-0.165760627231658,0.632673912180215 );
    glTexCoord2f(0.23666941,0.063257738); glVertex3f(-0.30136937+$x,-0.3731342+$y,-0.0099335305+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( -0.991060597555516,0.0229551818456552,0.131422797106652 );
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.49436222,0.13860951); glVertex3f(-0.29427414+$x,0.48195391+$y,0.044209392+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.5073564,0.14503329); glVertex3f(-0.30136937+$x,0.5213858+$y,-0.019308101+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.44235201,0.12548043); glVertex3f(-0.30136937+$x,0.306701+$y,-0.019308101+$z);
    glTexCoord2f(0.41652725,0.1178907); glVertex3f(-0.30136937+$x,0.23513941+$y,-0.019308101+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);

    glNormal3f( -0.989426657677922,-0.0249548155561306,-0.142871082647451 );
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.45815758,0.13238131); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);

    glNormal3f( -1,0,0 );# left face
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.45215203,0.12504928); glVertex3f(-0.30136937+$x,0.34248181+$y,0.018190179+$z);
    glTexCoord2f(0.48056036,0.1371665); glVertex3f(-0.30136937+$x,0.44982421+$y,-0.019308101+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.47358985,0.13131174); glVertex3f(-0.30136937+$x,0.4140434+$y,0.018190179+$z);
    glTexCoord2f(0.47666231,0.13417441); glVertex3f(-0.30136937+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);

    glNormal3f( -0.992846927051093,0.0205431743303157,0.117613593745094 );
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.41251577,0.1151381); glVertex3f(-0.30136937+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.43211105,0.12021526); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);

    glNormal3f( -0.993461191602229,0.0289359668793307,-0.110442612251966 );
    glTexCoord2f(0.39818934,0.10967081); glVertex3f(-0.30136937+$x,0.1635778+$y,0.0088156086+$z);
    glTexCoord2f(0.40927636,0.11252436); glVertex3f(-0.30136937+$x,0.1993586+$y,0.018190179+$z);
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);

    glNormal3f( -0.957954179268435,0.0727189489106143,0.277553138860787 );
    glTexCoord2f(0.39818934,0.10967081); glVertex3f(-0.30136937+$x,0.1635778+$y,0.0088156086+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.3988158,0.11205304); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( -0.966338618106362,-0.0652048629012181,-0.24887346385326 );
    glTexCoord2f(0.36431503,0.10275598); glVertex3f(-0.30136937+$x,0.056235402+$y,-0.0099335305+$z);
    glTexCoord2f(0.37628549,0.10608244); glVertex3f(-0.30136937+$x,0.092016197+$y,-0.019308101+$z);
    glTexCoord2f(0.36315886,0.10458605); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);

    glNormal3f( -0.996556881730799,-0.021013656012557,0.0802047862410443 );
    glTexCoord2f(0.36431503,0.10275598); glVertex3f(-0.30136937+$x,0.056235402+$y,-0.0099335305+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( -0.971104536747958,0.06048594352625,0.230862360170024 );
    glTexCoord2f(0.33387585,0.09088344); glVertex3f(-0.30136937+$x,-0.051106998+$y,0.0088156086+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.33784873,0.093532925); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);

    glNormal3f( -0.986886966581637,0.0409093873799564,-0.156142682234842 );
    glTexCoord2f(0.33387585,0.09088344); glVertex3f(-0.30136937+$x,-0.051106998+$y,0.0088156086+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.842667043872075,-0.136463997811411,-0.520854903474303 );
    glTexCoord2f(0.3009829,0.082045111); glVertex3f(-0.30136937+$x,-0.1584494+$y,-0.0099335305+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.30478752,0.090467961); glVertex3f(-0.28326172+$x,-0.1360864+$y,-0.045088166+$z);

    glNormal3f( -0.941795300235839,-0.0852050928355615,0.325210246776709 );
    glTexCoord2f(0.3009829,0.082045111); glVertex3f(-0.30136937+$x,-0.1584494+$y,-0.0099335305+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.831701302165852,0.140718923820801,-0.537095083252809 );
    glTexCoord2f(0.27137747,0.072972422); glVertex3f(-0.30136937+$x,-0.2657918+$y,0.0088156086+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( -0.53061590564212,0.214823708341324,0.819937518969631 );
    glTexCoord2f(0.27137747,0.072972422); glVertex3f(-0.30136937+$x,-0.2657918+$y,0.0088156086+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.27172473,0.093638778); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);

    glNormal3f( -0.0241073828502012,0.0489086743008552,0.998512281181482 );
    glTexCoord2f(0.30048437,0.45609468); glVertex3f(0.22737373+$x,0.056235402+$y,0.055688457+$z);
    glTexCoord2f(0.28127559,0.47983397); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.111583246202311,0.0677629466561491,0.991442061961984 );
    glTexCoord2f(0.30048437,0.45609468); glVertex3f(0.22737373+$x,0.056235402+$y,0.055688457+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);

    glNormal3f( -0.032082828408596,-0.0519558430684578,0.998133900081723 );
    glTexCoord2f(0.11793308,0.41654356); glVertex3f(-0.18548047+$x,-0.033216598+$y,0.055688457+$z);
    glTexCoord2f(0.10512235,0.42445429); glVertex3f(-0.21445269+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.0107208374275516,0.052084893186377,0.998585112820442 );
    glTexCoord2f(0.11793308,0.41654356); glVertex3f(-0.18548047+$x,-0.033216598+$y,0.055688457+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);

    glNormal3f( -0.30679874576329,-0.0828064861620214,0.948165394563402 );
    glTexCoord2f(0.083007476,0.4285382); glVertex3f(-0.26515409+$x,-0.0063809978+$y,0.055688457+$z);
    glTexCoord2f(0.079500894,0.44027575); glVertex3f(-0.27239715+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.070717521,0.41360079); glVertex3f(-0.29231555+$x,-0.039925498+$y,0.043970244+$z);

    glNormal3f( 0,-0.0615302537631948,0.998105218838093 );
    glTexCoord2f(0.16917606,0.37699003); glVertex3f(-0.069591572+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.13074413,0.37699043); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);

    glNormal3f( 0.00249572020558646,0.00808328130810123,0.999964215331703 );
    glTexCoord2f(0.16917606,0.37699003); glVertex3f(-0.069591572+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.0612834537973617,0.0868386824110854,0.994335648323932 );
    glTexCoord2f(0.21370355,0.14416262); glVertex3f(0.053540384+$x,-0.3731342+$y,0.055688457+$z);
    glTexCoord2f(0.19874453,0.15622009); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.19734303,0.20146735); glVertex3f(0.24367061+$x,-0.3731342+$y,0.043970244+$z);

    glNormal3f( -0.0285573337012675,0.0404657437701814,0.998772748062842 );
    glTexCoord2f(0.22362244,0.26624108); glVertex3f(0.053540384+$x,-0.3731342+$y,0.055688457+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( -0.0336781609085161,0.021815752906732,0.999194602869197 );
    glTexCoord2f(0.19479792,0.32161558); glVertex3f(-0.011647121+$x,-0.24790139+$y,0.055688457+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.097452148,0.32321355); glVertex3f(-0.23183603+$x,-0.24432332+$y,0.048188801+$z);

    glNormal3f( 0.0290188922020919,-0.0469940238229842,0.998473567812533 );
    glTexCoord2f(0.19479792,0.32161558); glVertex3f(-0.011647121+$x,-0.24790139+$y,0.055688457+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.306798842882171,0.0828064530522404,0.948165366030139 );
    glTexCoord2f(0.30368761,0.40072045); glVertex3f(0.2346168+$x,-0.068997399+$y,0.055688457+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.32773154,0.37107868); glVertex3f(0.28893971+$x,-0.1360864+$y,0.043970244+$z);

    glNormal3f( -0.00909998697145155,0.00736838778890502,0.999931446199444 );
    glTexCoord2f(0.30368761,0.40072045); glVertex3f(0.2346168+$x,-0.068997399+$y,0.055688457+$z);
    glTexCoord2f(0.31009285,0.40863099); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( -0.0225053502384886,0.0273343417641999,0.999372974905246 );
    glTexCoord2f(0.31329478,0.47982635); glVertex3f(0.25634596+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.0583188539183032,-0.118054031936507,0.991293174001107 );
    glTexCoord2f(0.31329478,0.47982635); glVertex3f(0.25634596+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.29728155,0.47191591); glVertex3f(0.22013067+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.32804238,0.45927351); glVertex3f(0.28966401+$x,0.063391566+$y,0.048188801+$z);

    glNormal3f( 0.306798746703992,0.082806485798783,0.948165394290741 );
    glTexCoord2f(0.31913488,0.53125511); glVertex3f(0.27083207+$x,0.2261942+$y,0.055688457+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.33173307,0.54610065); glVertex3f(0.29799353+$x,0.2597387+$y,0.043970244+$z);

    glNormal3f( -0.0571546906318991,0.00925579871949838,0.998322428641587 );
    glTexCoord2f(0.31913488,0.53125511); glVertex3f(0.27083207+$x,0.2261942+$y,0.055688457+$z);
    glTexCoord2f(0.32230685,0.55101917); glVertex3f(0.27807513+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.014478916151435,0.0820664515220021,-0.996521679905493 );
    glTexCoord2f(0.47642103,0.25819076); glVertex3f(0.078166776+$x,0.5392762+$y,-0.056806379+$z);
    glTexCoord2f(0.4902607,0.22937897); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( -0.0118622025321933,-0.0172889917763577,-0.999780165293572 );
    glTexCoord2f(0.70727837,0.39649936); glVertex3f(0.078166776+$x,0.5392762+$y,-0.056806379+$z);
    glTexCoord2f(0.71054355,0.41008919); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.0260950900927875,0.00422591391128066,-0.999650532898704 );
    glTexCoord2f(0.67712789,0.40125651); glVertex3f(0.034708438+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( 0.0504715092921283,-0.0980820081402801,-0.993897653900513 );
    glTexCoord2f(0.67712789,0.40125651); glVertex3f(0.034708438+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.71054355,0.41008919); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.69614708,0.41841231); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);

    glNormal3f( 0.0378217437929018,-0.016843643756948,-0.999142536058521 );
    glTexCoord2f(0.60645845,0.46530051); glVertex3f(0.01297927+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.62227885,0.45827062); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);

    glNormal3f( -0.0168126196065403,-0.00204201343556611,-0.999856572715854 );
    glTexCoord2f(0.60645845,0.46530051); glVertex3f(0.01297927+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.00445972659593554,0.0339443425295368,-0.999413774394233 );
    glTexCoord2f(0.54950516,0.063792524); glVertex3f(0.096998722+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.51930797,0.06775834); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.54153824,0.036004087); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.0166904135382459,-0.0891953719109764,-0.995874297150793 );
    glTexCoord2f(0.64727694,0.47548392); glVertex3f(0.096998722+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.66032266,0.49256807); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);

    glNormal3f( 0.0290221854426181,0.0516992672529161,-0.998240902046017 );
    glTexCoord2f(0.77751574,0.19339672); glVertex3f(-0.19996658+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.78629144,0.20700189); glVertex3f(-0.23183603+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.75732704,0.20967564); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( -0.03672053159246,-0.0535196452440078,-0.997891401973443 );
    glTexCoord2f(0.55243699,0.38466024); glVertex3f(-0.19996658+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.53467349,0.39633561); glVertex3f(-0.21213491+$x,0.27807637+$y,-0.053863879+$z);

    glNormal3f( 0.0153590566904503,0.0596948802889058,-0.99809850247602 );
    glTexCoord2f(0.59027486,0.41344894); glVertex3f(-0.092769351+$x,0.3335366+$y,-0.056806379+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.60921543,0.40391838); glVertex3f(-0.075386016+$x,0.3782626+$y,-0.053863879+$z);

    glNormal3f( 0.00649453560562095,-0.0378627292490407,-0.99926184493409 );
    glTexCoord2f(0.59027486,0.41344894); glVertex3f(-0.092769351+$x,0.3335366+$y,-0.056806379+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.118413515022003,0.0268467359874592,-0.992601376297128 );
    glTexCoord2f(0.53409657,0.37344899); glVertex3f(-0.24777075+$x,0.31564621+$y,-0.056806379+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.53653702,0.3410386); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);

    glNormal3f( -0.060058801002731,0.00194521665850733,-0.998192945554248 );
    glTexCoord2f(0.72564872,0.48226092); glVertex3f(0.23896262+$x,0.42298861+$y,-0.056806379+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);

    glNormal3f( 0.101738763369746,0.0494275555622167,-0.993582478095874 );
    glTexCoord2f(0.72564872,0.48226092); glVertex3f(0.23896262+$x,0.42298861+$y,-0.056806379+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( -0.0326265346769061,-0.0088060616590243,-0.999428818132154 );
    glTexCoord2f(0.70963735,0.52105721); glVertex3f(0.27083207+$x,0.3335366+$y,-0.056806379+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0.473265475303869,-0.0766420031649254,-0.877579508213513 );
    glTexCoord2f(0.39867486,0.29790327); glVertex3f(0.27083207+$x,0.3335366+$y,-0.056806379+$z);
    glTexCoord2f(0.41146778,0.30398712); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.40691249,0.3086285); glVertex3f(0.29799353+$x,0.3670811+$y,-0.045088166+$z);

    glNormal3f( 0.0261354094489235,-0.0264527745504616,-0.999308356360298 );
    glTexCoord2f(0.6894584,0.49754228); glVertex3f(0.20129873+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0,0.0683703406308625,-0.997660010485546 );
    glTexCoord2f(0.6894584,0.49754228); glVertex3f(0.20129873+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.69807322,0.47976742); glVertex3f(0.18884067+$x,0.38541877+$y,-0.053863879+$z);

    glNormal3f( -0.0506930531156958,-0.0301010640445629,0.998260557324186 );
    glTexCoord2f(0.31201278,0.57079826); glVertex3f(0.25344874+$x,0.31564621+$y,0.055688457+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);

    glNormal3f( 0.17372096917882,-0.0168797037671456,0.984650242709717 );
    glTexCoord2f(0.31201278,0.57079826); glVertex3f(0.25344874+$x,0.31564621+$y,0.055688457+$z);
    glTexCoord2f(0.31009139,0.55102178); glVertex3f(0.24910291+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( -0.0290221854426181,0.0516992672529161,0.998240902046017 );
    glTexCoord2f(0.29087517,0.57475377); glVertex3f(0.20564456+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( 0.0367205389493191,-0.0535196354412483,0.997891402228473 );
    glTexCoord2f(0.29087517,0.57475377); glVertex3f(0.20564456+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.27934568,0.56684329); glVertex3f(0.17956957+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.2962618,0.55419199); glVertex3f(0.2178129+$x,0.27807637+$y,0.052745957+$z);

    glNormal3f( 0.0491352798678286,0.15914194726477,0.986032233191738 );
    glTexCoord2f(0.30496595,0.66572553); glVertex3f(0.23751401+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( 0.00938547615898887,-0.0486370921662629,0.998772419574589 );
    glTexCoord2f(0.30496595,0.66572553); glVertex3f(0.23751401+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.28446896,0.66177043); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( -0.0184993321432941,0.176754458494042,0.984081112567826 );
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.13522486,0.66968256); glVertex3f(-0.14636796+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.094886327,0.68393692); glVertex3f(-0.23763047+$x,0.57147892+$y,0.048188801+$z);

    glNormal3f( 0.0543228915437134,-0.0140755358640518,0.998424209814881 );
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.322741995070548,0.0540080448130093,0.944944832100456 );
    glTexCoord2f(0.11045874,0.55893442); glVertex3f(-0.20238094+$x,0.28881061+$y,0.055688457+$z);
    glTexCoord2f(0.11178243,0.56684501); glVertex3f(-0.19938714+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.19444932890961,0.15744846076641,0.968193906554307 );
    glTexCoord2f(0.086006451,0.54848263); glVertex3f(-0.25791104+$x,0.26495674+$y,0.055688457+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);

    glNormal3f( 0.0627640842714265,-0.0304925836352602,0.997562465246571 );
    glTexCoord2f(0.086006451,0.54848263); glVertex3f(-0.25791104+$x,0.26495674+$y,0.055688457+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.0693079112152919,-0.0561195649364632,0.996015566080327 );
    glTexCoord2f(0.085905325,0.52729228); glVertex3f(-0.25791104+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.079958926,0.53530961); glVertex3f(-0.27239715+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( 0.0328035323318604,0.0265614842456225,0.999108810801517 );
    glTexCoord2f(0.085905325,0.52729228); glVertex3f(-0.25791104+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.0153590574937749,0.059694879977097,0.998098502482306 );
    glTexCoord2f(0.24347574,0.57870956); glVertex3f(0.098447333+$x,0.3335366+$y,0.055688457+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);

    glNormal3f( -0.00649453570129151,-0.037862729080759,0.999261844939844 );
    glTexCoord2f(0.24347574,0.57870956); glVertex3f(0.098447333+$x,0.3335366+$y,0.055688457+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( -0.0198628275137164,-0.00884576868738331,0.999763582283076 );
    glTexCoord2f(0.19671717,0.55102294); glVertex3f(-0.0073012877+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.0168126199011013,-0.00204201314242779,0.9998565727115 );
    glTexCoord2f(0.19671717,0.55102294); glVertex3f(-0.0073012877+$x,0.2709202+$y,0.055688457+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( -0.101655179781683,0.0863597695257201,-0.991064182901904 );
    glTexCoord2f(0.62945695,0.57652684); glVertex3f(0.22013067+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.61253979,0.56661058); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.6407485,0.56010555); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( 0.473265475303869,-0.0766420031649254,-0.877579508213513 );
    glTexCoord2f(0.64575953,0.59134686); glVertex3f(0.27083207+$x,0.1188518+$y,-0.056806379+$z);
    glTexCoord2f(0.66131519,0.57876317); glVertex3f(0.27807513+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.66493437,0.58858691); glVertex3f(0.29799353+$x,0.1523963+$y,-0.045088166+$z);

    glNormal3f( 0.148328075689059,0.040034419525542,-0.988127535905985 );
    glTexCoord2f(0.77185255,0.23933411); glVertex3f(0.25634596+$x,0.20830381+$y,-0.056806379+$z);
    glTexCoord2f(0.77762232,0.25019736); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.75795317,0.26724718); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( -0.128015035906709,0.0207310982093883,-0.991555531550723 );
    glTexCoord2f(0.66781908,0.55788031); glVertex3f(0.25634596+$x,0.20830381+$y,-0.056806379+$z);
    glTexCoord2f(0.65220463,0.57041896); glVertex3f(0.24910291+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.6407485,0.56010555); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( 0.0835585078425417,0.135316989342601,-0.98727265137974 );
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.49840833,0.46371821); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.48836156,0.46529509); glVertex3f(-0.18548047+$x,0.092016197+$y,-0.056806379+$z);

    glNormal3f( 0.049084755848033,0.0397446395703536,-0.998003532242628 );
    glTexCoord2f(0.48414529,0.45084783); glVertex3f(-0.21445269+$x,0.1099066+$y,-0.056806379+$z);
    glTexCoord2f(0.48576291,0.42036759); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.50212587,0.43248751); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);

    glNormal3f( 0.0388678925507666,-0.00629437215802512,-0.999224533229543 );
    glTexCoord2f(0.50191657,0.39766886); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.51753102,0.3851302); glVertex3f(-0.25791104+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.50212587,0.43248751); glVertex3f(-0.21205829+$x,0.16801344+$y,-0.05437456+$z);

    glNormal3f( 0.0352258804482896,0.00665534385279594,-0.999357215286328 );
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.60131129,0.33586984); glVertex3f(-0.19175778+$x,0.48063544+$y,-0.054762976+$z);

    glNormal3f( -0.114772076016182,-0.0154887729901655,-0.993271095158917 );
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.55738344,0.35718103); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.53653702,0.3410386); glVertex3f(-0.292785+$x,0.37384522+$y,-0.049862253+$z);

    glNormal3f( 0.0585646132001076,-0.0663888211686404,0.996073647128846 );
    glTexCoord2f(0.30880959,0.62221719); glVertex3f(0.24620568+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( -0.0196435879851054,0.0222679507239537,0.999559036686492 );
    glTexCoord2f(0.30880959,0.62221719); glVertex3f(0.24620568+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( 0.0515675891715463,0.0835099990954735,0.995171776025681 );
    glTexCoord2f(0.10512178,0.47982848); glVertex3f(-0.21445269+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);

    glNormal3f( -0.0693079112152919,0.0561195649364632,0.996015566080328 );
    glTexCoord2f(0.085905811,0.47982868); glVertex3f(-0.25791104+$x,0.1099066+$y,0.055688457+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( -0.0779651147896919,-0.874424659243894,0.478855882476168 );
    glTexCoord2f(0.90337272,0.93699958); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);
    glTexCoord2f(0.92050282,0.93499005); glVertex3f(0.055166377+$x,0.1672289+$y,0.049683354+$z);

    glNormal3f( 0.18463444115484,-0.373752755664307,0.908965896374983 );
    glTexCoord2f(0.20441143,0.50752185); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);
    glTexCoord2f(0.23643789,0.52334273); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.22041719,0.5193803); glVertex3f(0.046297329+$x,0.1993586+$y,0.055688457+$z);

    glNormal3f( -0.0493600498698393,-0.0580174075055945,0.997094562167088 );
    glTexCoord2f(0.20441143,0.50752185); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.18199775,0.50796642); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);

    glNormal3f( 0,-0.899265790062245,0.437402604957623 );
    glTexCoord2f(0.90337272,0.93699958); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);
    glTexCoord2f(0.88389358,0.9323507); glVertex3f(-0.040619346+$x,0.1635778+$y,0.033619707+$z);
    glTexCoord2f(0.89742614,0.92536039); glVertex3f(-0.0044040652+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( -0.0149408100296075,0.150012198593435,0.988571248048831 );
    glTexCoord2f(0.12092043,0.59189514); glVertex3f(-0.17872028+$x,0.36335393+$y,0.055688457+$z);
    glTexCoord2f(0.13415809,0.59321345); glVertex3f(-0.14878232+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);

    glNormal3f( 0.0287334076794543,-0.10934925601805,0.993588008930978 );
    glTexCoord2f(0.10234533,0.55893451); glVertex3f(-0.22073002+$x,0.28881061+$y,0.055688457+$z);
    glTexCoord2f(0.092310351,0.55629774); glVertex3f(-0.24342493+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.10523202,0.5487505); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( -0.31919092035607,-0.262520077703076,0.910604395533547 );
    glTexCoord2f(0.87309682,0.95399536); glVertex3f(-0.069591572+$x,0.217249+$y,0.052010331+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);
    glTexCoord2f(0.88410417,0.93737952); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);

    glNormal3f( -0.491371082483172,0.0126594608045687,0.870858310720782 );
    glTexCoord2f(0.87309682,0.95399536); glVertex3f(-0.069591572+$x,0.217249+$y,0.052010331+$z);
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);

    glNormal3f( -0.0423505493680123,-0.0677672373727318,0.996801902339224 );
    glTexCoord2f(0.16918195,0.52729871); glVertex3f(-0.069591572+$x,0.217249+$y,0.052010331+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.136162968718222,0.0925338568611693,0.986355479167748 );
    glTexCoord2f(0.12434518,0.47983557); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.11793251,0.47191775); glVertex3f(-0.18548047+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.14178296,0.45610441); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);

    glNormal3f( 0.612401998466621,0.470166679295346,0.6355368486205 );
    glTexCoord2f(0.83456368,0.9132052); glVertex3f(-0.17099436+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.82029571,0.93221355); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);

    glNormal3f( 0.576079404147544,-0.397940287665866,0.713986027572962 );
    glTexCoord2f(0.93089635,0.95059634); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.95348876,0.95678585); glVertex3f(0.14045706+$x,0.2261942+$y,0.015229082+$z);
    glTexCoord2f(0.94664114,0.9743892); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( 0.0841382129106228,0.0681279155212483,0.994122401042717 );
    glTexCoord2f(0.23643789,0.52334273); glVertex3f(0.082512609+$x,0.20830381+$y,0.052010331+$z);
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.22041719,0.5193803); glVertex3f(0.046297329+$x,0.1993586+$y,0.055688457+$z);

    glNormal3f( -0.0860668817958079,0.0305092610296939,0.995822111046631 );
    glTexCoord2f(0.28127559,0.47983397); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.29728155,0.47191591); glVertex3f(0.22013067+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.0496796763761978,-0.201131575922817,0.978303643518698 );
    glTexCoord2f(0.89742614,0.92536039); glVertex3f(-0.0044040652+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.88390599,0.92763557); glVertex3f(-0.040619346+$x,0.15642164+$y,0.017435957+$z);
    glTexCoord2f(0.88419217,0.91943212); glVertex3f(-0.040619346+$x,0.12779701+$y,0.011550957+$z);

    glNormal3f( 0,-0.135791882047138,0.990737384360808 );
    glTexCoord2f(0.89742614,0.92536039); glVertex3f(-0.0044040652+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.88419217,0.91943212); glVertex3f(-0.040619346+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);

    glNormal3f( 0.0641950997808058,-0.0965336273539973,0.993257392599729 );
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.85105036,0.93363128); glVertex3f(-0.12753602+$x,0.1635778+$y,0.018907206+$z);
    glTexCoord2f(0.85257842,0.92985558); glVertex3f(-0.1235121+$x,0.15363869+$y,0.017681165+$z);

    glNormal3f( -0.0458291599339534,-0.111325488533019,0.99272671148843 );
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.88390599,0.92763557); glVertex3f(-0.040619346+$x,0.15642164+$y,0.017435957+$z);

    glNormal3f( -0.576234146092408,0.41394551869163,-0.704700870179873 );
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);
    glTexCoord2f(0.79528697,0.93804406); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( 0.497833941484662,0.329876286769317,-0.802086655002521 );
    glTexCoord2f(0.64593832,0.93579045); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);
    glTexCoord2f(0.65740249,0.96185794); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( 0.013586467938057,-0.893855806980863,-0.448148640760584 );
    glTexCoord2f(0.70734271,0.9209626); glVertex3f(-0.018890177+$x,0.172523+$y,-0.053128253+$z);
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);
    glTexCoord2f(0.69019548,0.9189916); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);

    glNormal3f( 0.0443993762516065,-0.100283839316586,-0.993967729335512 );
    glTexCoord2f(0.56687224,0.48817848); glVertex3f(-0.018890177+$x,0.172523+$y,-0.053128253+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.58592184,0.50476865); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);

    glNormal3f( 0.292544144706663,-0.298581250310333,-0.908442161263427 );
    glTexCoord2f(0.74570522,0.90952043); glVertex3f(0.075269554+$x,0.217249+$y,-0.053128253+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.72908781,0.92392784); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);

    glNormal3f( 0.0516908151164255,-0.0377513750165754,-0.997949344063594 );
    glTexCoord2f(0.61101956,0.50136292); glVertex3f(0.075269554+$x,0.217249+$y,-0.053128253+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.63969892,0.49823812); glVertex3f(0.11872789+$x,0.26595064+$y,-0.052719572+$z);

    glNormal3f( -0.423492225350766,-0.300286480741583,-0.854682610418213 );
    glTexCoord2f(0.68745319,0.90398115); glVertex3f(-0.076834627+$x,0.20830381+$y,-0.053128253+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.125292882354608,-0.101451407905786,-0.986919097730512 );
    glTexCoord2f(0.5584397,0.45928395); glVertex3f(-0.076834627+$x,0.20830381+$y,-0.053128253+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.55159876,0.4754808); glVertex3f(-0.063797126+$x,0.17073397+$y,-0.050921378+$z);

    glNormal3f( -0.232827528312203,-0.289863902581693,-0.928315819126304 );
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.6739314,0.92332949); glVertex3f(-0.10388523+$x,0.1526245+$y,-0.018673981+$z);
    glTexCoord2f(0.66231527,0.90898962); glVertex3f(-0.13558386+$x,0.17848647+$y,-0.018799087+$z);

    glNormal3f( 0.434947596753773,-0.0880458788057503,-0.896140899247122 );
    glTexCoord2f(0.62702331,0.61158867); glVertex3f(0.27083207+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.64004229,0.60203591); glVertex3f(0.27807513+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.63812304,0.62165172); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( 0.998194597593247,0.0434543220574181,-0.0414640474409458 );
    glTexCoord2f(0.30284303,0.25465011); glVertex3f(0.30704735+$x,0.0025642017+$y,-0.00055896092+$z);
    glTexCoord2f(0.29674737,0.25363985); glVertex3f(0.30704735+$x,-0.015326199+$y,-0.019308101+$z);
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( 0.992009311249537,-0.0912777386575771,0.0870970769875634 );
    glTexCoord2f(0.30284303,0.25465011); glVertex3f(0.30704735+$x,0.0025642017+$y,-0.00055896092+$z);
    glTexCoord2f(0.30893869,0.25566036); glVertex3f(0.30704735+$x,0.020454602+$y,0.018190179+$z);
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( 0.993541907498274,0.0820903071144408,0.0783304508001097 );
    glTexCoord2f(0.27068629,0.24525642); glVertex3f(0.30704735+$x,-0.1047782+$y,-0.00055896092+$z);
    glTexCoord2f(0.27530954,0.24737739); glVertex3f(0.30704735+$x,-0.086887798+$y,-0.019308101+$z);
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( 0.945197442235905,-0.236216018741674,-0.225396955792521 );
    glTexCoord2f(0.27068629,0.24525642); glVertex3f(0.30704735+$x,-0.1047782+$y,-0.00055896092+$z);
    glTexCoord2f(0.26606303,0.24313545); glVertex3f(0.30704735+$x,-0.1226686+$y,0.018190179+$z);
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.0364598829380816,-0.00369026140183915,-0.999328303865615 );
    glTexCoord2f(0.4773565,0.62571277); glVertex3f(0.039054272+$x,-0.1942302+$y,-0.056806379+$z);
    glTexCoord2f(0.50091298,0.60436477); glVertex3f(0.046297329+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( -0.0136905794909401,-0.0249422807788057,-0.999595143376934 );
    glTexCoord2f(0.26409238,0.15881127); glVertex3f(0.039054272+$x,-0.1942302+$y,-0.056806379+$z);
    glTexCoord2f(0.2479219,0.17520837); glVertex3f(0.10424178+$x,-0.230011+$y,-0.056806379+$z);
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( 0.0210313672572141,-0.0442764323939219,-0.998797917061183 );
    glTexCoord2f(0.43038963,0.52481692); glVertex3f(-0.19272352+$x,-0.095832998+$y,-0.056806379+$z);
    glTexCoord2f(0.47453695,0.53800136); glVertex3f(-0.098563797+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.360911,0.55694947); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( -0.0130306630095092,0.0246192721078871,-0.999611971348088 );
    glTexCoord2f(0.43038963,0.52481692); glVertex3f(-0.19272352+$x,-0.095832998+$y,-0.056806379+$z);
    glTexCoord2f(0.40580343,0.51862113); glVertex3f(-0.24342493+$x,-0.1226686+$y,-0.056806379+$z);
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( -0.192696719835058,0.468087779166082,-0.862416259795799 );
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.69438485,0.95001154); glVertex3f(-0.040619346+$x,0.092016197+$y,-0.012668879+$z);

    glNormal3f( -0.0337211843309528,0.0819135292619193,-0.996068800561073 );
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.72922306,0.9434899); glVertex3f(0.046297329+$x,0.12779701+$y,-0.012668879+$z);
    glTexCoord2f(0.73983221,0.96230098); glVertex3f(0.081063998+$x,0.070547717+$y,-0.018553879+$z);

    glNormal3f( -0.283666901870202,0.229689045709512,-0.931008072502282 );
    glTexCoord2f(0.76473749,0.93325026); glVertex3f(0.133214+$x,0.1635778+$y,-0.020025128+$z);
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);

    glNormal3f( -0.328800078065245,0.288420360998866,-0.89927982520769 );
    glTexCoord2f(0.76473749,0.93325026); glVertex3f(0.133214+$x,0.1635778+$y,-0.020025128+$z);
    glTexCoord2f(0.77788491,0.95621056); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.75939342,0.93616224); glVertex3f(0.12114224+$x,0.15363869+$y,-0.018799087+$z);

    glNormal3f( 0.0357712681451908,-0.0868934731927517,-0.995575180833565 );
    glTexCoord2f(0.57773461,0.47134381); glVertex3f(-0.026133234+$x,0.217249+$y,-0.056806379+$z);
    glTexCoord2f(0.59729573,0.47833246); glVertex3f(0.017325104+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.58592184,0.50476865); glVertex3f(0.038249488+$x,0.17351692+$y,-0.05067617+$z);

    glNormal3f( -0.0162725200970153,0.013176091571324,-0.999780773820239 );
    glTexCoord2f(0.57773461,0.47134381); glVertex3f(-0.026133234+$x,0.217249+$y,-0.056806379+$z);
    glTexCoord2f(0.56768444,0.47292953); glVertex3f(-0.040619346+$x,0.1993586+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.0094243496021225,-0.0228930918503335,-0.999693497018016 );
    glTexCoord2f(0.6133071,0.43953617); glVertex3f(-0.014544344+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.62227885,0.45827062); glVertex3f(0.028913994+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( 0.0128419032902212,0.0187168798242368,-0.999742348772687 );
    glTexCoord2f(0.6133071,0.43953617); glVertex3f(-0.014544344+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.61004193,0.42594634); glVertex3f(-0.040619346+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( 0.023465133220033,-0.0133000448698363,-0.999636181982938 );
    glTexCoord2f(0.66799509,0.48883876); glVertex3f(0.15204594+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.67661861,0.48596689); glVertex3f(0.16218623+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( -0.0232868725471233,0.0094278485781448,-0.999684368807556 );
    glTexCoord2f(0.5739199,0.059826715); glVertex3f(0.15204594+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.57070743,0.06775834); glVertex3f(0.14480289+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.54153824,0.036004087); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.999370953076064,-0.0134866434332312,0.0327995212883467 );
    glTexCoord2f(0.80063639,0.91746415); glVertex3f(0.22013067+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.79962527,0.92466377); glVertex3f(0.22013067+$x,0.1993586+$y,-0.042093878+$z);

    glNormal3f( -0.920052714491889,0.148995826039851,-0.362357898187425 );
    glTexCoord2f(0.80063639,0.91746415); glVertex3f(0.22013067+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.79962527,0.92466377); glVertex3f(0.22013067+$x,0.1993586+$y,-0.042093878+$z);
    glTexCoord2f(0.79210619,0.9276676); glVertex3f(0.20854179+$x,0.18504628+$y,-0.018553879+$z);

    glNormal3f( 0.100706533348782,-0.0815434593063617,-0.991568887362458 );
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.78930468,0.90998689); glVertex3f(0.19115845+$x,0.23513941+$y,-0.012668879+$z);

    glNormal3f( -0.0468153070476458,0.0189535135355025,-0.998723731244379 );
    glTexCoord2f(0.68872821,0.53946876); glVertex3f(0.26358902+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.67338337,0.54692737); glVertex3f(0.24910291+$x,0.23513941+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0.213473159465677,-0.0864261187583099,-0.973118562244147 );
    glTexCoord2f(0.68872821,0.53946876); glVertex3f(0.26358902+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.70387897,0.53165462); glVertex3f(0.27807513+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.69827552,0.55309472); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.994673395813412,0.074574130565914,-0.0711585181925009 );
    glTexCoord2f(0.36301835,0.29690978); glVertex3f(0.30704735+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.35692269,0.29589952); glVertex3f(0.30704735+$x,0.1993586+$y,-0.019308101+$z);
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0.998194597466741,-0.0434543126364303,0.0414640603596242 );
    glTexCoord2f(0.36301835,0.29690978); glVertex3f(0.30704735+$x,0.217249+$y,-0.00055896092+$z);
    glTexCoord2f(0.36911401,0.29792003); glVertex3f(0.30704735+$x,0.23513941+$y,0.018190179+$z);
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( 0.434947596282606,0.0880458910138849,0.896140898276356 );
    glTexCoord2f(0.31893596,0.50361277); glVertex3f(0.27083207+$x,0.1635778+$y,0.055688457+$z);
    glTexCoord2f(0.32231864,0.48776537); glVertex3f(0.27807513+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.33396547,0.5035889); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( -0.0460094429776428,0.00931363066375392,0.998897586062128 );
    glTexCoord2f(0.31893596,0.50361277); glVertex3f(0.27083207+$x,0.1635778+$y,0.055688457+$z);
    glTexCoord2f(0.32220818,0.51946861); glVertex3f(0.27807513+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.29675675,0.50552445); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( -0.999473686202258,0.0123366129590495,-0.0300026427164084 );
    glTexCoord2f(0.98317589,0.95401288); glVertex3f(0.22013067+$x,0.217249+$y,0.033619707+$z);
    glTexCoord2f(0.98316976,0.94722143); glVertex3f(0.22013067+$x,0.1993586+$y,0.026263457+$z);
    glTexCoord2f(0.98273724,0.935285); glVertex3f(0.21893348+$x,0.16801344+$y,0.053256639+$z);

    glNormal3f( 0.00942434968259026,-0.0228930920458011,0.999693497012781 );
    glTexCoord2f(0.20888704,0.57475461); glVertex3f(0.020222326+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( -0.0127416831645495,0.0185708112190093,0.999746355072526 );
    glTexCoord2f(0.20888704,0.57475461); glVertex3f(0.020222326+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.0482768671387951,0.0351814327038247,0.998214210924774 );
    glTexCoord2f(0.2088868,0.59848641); glVertex3f(0.020222326+$x,0.3782626+$y,0.055688457+$z);
    glTexCoord2f(0.22041654,0.5826651); glVertex3f(0.046297329+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.2357951,0.59849197); glVertex3f(0.081063998+$x,0.3782626+$y,0.052745957+$z);

    glNormal3f( -0.0236000906455546,0.00573279950870484,0.999705041865507 );
    glTexCoord2f(0.2088868,0.59848641); glVertex3f(0.020222326+$x,0.3782626+$y,0.055688457+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.0318342492550141,-0.0360872691681509,0.998841473697581 );
    glTexCoord2f(0.12412342,0.56025272); glVertex3f(-0.17147723+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.11955442,0.55651536); glVertex3f(-0.18161751+$x,0.28284713+$y,0.055688457+$z);
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.00807561125804391,0.0358333712014123,0.999325149293837 );
    glTexCoord2f(0.16042011,0.57343668); glVertex3f(-0.089389259+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.18967115,0.56684421); glVertex3f(-0.023236012+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( -0.00845470990184178,-0.0397062116120725,0.999175627524958 );
    glTexCoord2f(0.16042011,0.57343668); glVertex3f(-0.089389259+$x,0.32160967+$y,0.055688457+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.0318209385884218,0.00708562308102295,0.999468469644193 );
    glTexCoord2f(0.13949591,0.58793966); glVertex3f(-0.13671056+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.14184463,0.57739217); glVertex3f(-0.13139898+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.0145268965280826,-0.0435217388565705,0.998946859209319 );
    glTexCoord2f(0.13095567,0.56948168); glVertex3f(-0.15602537+$x,0.31266447+$y,0.055688457+$z);
    glTexCoord2f(0.12305579,0.56684489); glVertex3f(-0.17389158+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.1455593,0.55102802); glVertex3f(-0.12300911+$x,0.2709202+$y,0.053389629+$z);

    glNormal3f( 0.0227467090424297,0.0331530040830172,0.999191405861765 );
    glTexCoord2f(0.20120017,0.62221829); glVertex3f(0.0028389911+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.21272983,0.61430757); glVertex3f(0.028913994+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.0144858219960057,-0.0211128673659182,0.999672150153584 );
    glTexCoord2f(0.20120017,0.62221829); glVertex3f(0.0028389911+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.16768367,0.59901858); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( 0.0446235473941515,0.101170356437072,0.993867847350118 );
    glTexCoord2f(0.27550147,0.66572583); glVertex3f(0.1708779+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.28446896,0.66177043); glVertex3f(0.19115845+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( 0.0119173740038097,-0.0887768497556504,0.995980244354433 );
    glTexCoord2f(0.27550147,0.66572583); glVertex3f(0.1708779+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.0371544751462071,0.0541521200227637,0.997841216263214 );
    glTexCoord2f(0.23450736,0.66968155); glVertex3f(0.078166776+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.31331041,0.6872498); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( -0.00486407803581213,-0.0275695791142245,0.999608052714826 );
    glTexCoord2f(0.23450736,0.66968155); glVertex3f(0.078166776+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.18967002,0.67759261); glVertex3f(-0.023236012+$x,0.55716661+$y,0.055688457+$z);
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);

    glNormal3f( 0.0494029593538679,-0.0620035548726906,0.996852500017043 );
    glTexCoord2f(0.20952684,0.64595); glVertex3f(0.021670937+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.18967051,0.63012901); glVertex3f(-0.023236012+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.23719682,0.64348449); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.020640182310597,0.0476310550088227,0.998651723812127 );
    glTexCoord2f(0.20952684,0.64595); glVertex3f(0.021670937+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.24603702,0.66177083); glVertex3f(0.10424178+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.1708855,0.64815184); glVertex3f(-0.065728608+$x,0.49057456+$y,0.053645054+$z);

    glNormal3f( -0.0341732384346831,-0.0830116309394704,0.995962478662553 );
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.19479574,0.53520176); glVertex3f(-0.011647121+$x,0.23513941+$y,0.055688457+$z);
    glTexCoord2f(0.18199775,0.50796642); glVertex3f(-0.040619346+$x,0.17351692+$y,0.049558248+$z);

    glNormal3f( 0.117473562717189,0.168289166642409,0.978712786497313 );
    glTexCoord2f(0.85105036,0.93363128); glVertex3f(-0.12753602+$x,0.1635778+$y,0.018907206+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);

    glNormal3f( 0.125622978331807,-0.07120303107936,0.989519578219733 );
    glTexCoord2f(0.85105036,0.93363128); glVertex3f(-0.12753602+$x,0.1635778+$y,0.018907206+$z);
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.85257842,0.92985558); glVertex3f(-0.1235121+$x,0.15363869+$y,0.017681165+$z);

    glNormal3f( -0.0204639553807189,-0.028168921270543,0.999393685393614 );
    glTexCoord2f(0.26973761,0.57475399); glVertex3f(0.1578404+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.25884848,0.5826647); glVertex3f(0.133214+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.25475385,0.55102672); glVertex3f(0.12394289+$x,0.2709202+$y,0.053481582+$z);

    glNormal3f( 0.0382465134870789,0.0464531253335885,0.998188014029834 );
    glTexCoord2f(0.26973761,0.57475399); glVertex3f(0.1578404+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.27934568,0.56684329); glVertex3f(0.17956957+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( 0.176465293435874,0.891611466145418,0.416999992386822 );
    glTexCoord2f(0.73378352,0.82389761); glVertex3f(0.133214+$x,0.3782626+$y,0.033619707+$z);
    glTexCoord2f(0.73994835,0.82386581); glVertex3f(0.15059734+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( -0.0808615204589846,-0.0785696967678468,0.993623780542148 );
    glTexCoord2f(0.73377488,0.84284365); glVertex3f(0.133214+$x,0.4319338+$y,0.011550957+$z);
    glTexCoord2f(0.73994259,0.8364965); glVertex3f(0.15059734+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.0808615779576982,0.0785696635213722,0.993623778491804 );
    glTexCoord2f(0.73377488,0.84284365); glVertex3f(0.133214+$x,0.4319338+$y,0.011550957+$z);
    glTexCoord2f(0.72760717,0.8491908); glVertex3f(0.11583067+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.059423567269127,-0.988306869396271,-0.14042211918766 );
    glTexCoord2f(0.73378327,0.86198027); glVertex3f(0.133214+$x,0.485605+$y,0.033619707+$z);
    glTexCoord2f(0.73990136,0.86185599); glVertex3f(0.15059734+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( -0.176465330952847,-0.891611529449111,0.416999841157187 );
    glTexCoord2f(0.73378327,0.86198027); glVertex3f(0.133214+$x,0.485605+$y,0.033619707+$z);
    glTexCoord2f(0.72761276,0.86194855); glVertex3f(0.11583067+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.99604104678612,-0.0338057383964159,-0.0822156017352081 );
    glTexCoord2f(0.71581229,0.84263114); glVertex3f(0.081063998+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.71821417,0.84876545); glVertex3f(0.081063998+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.71641177,0.86007732); glVertex3f(0.084232835+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.89750977778528,0.16770611310625,0.407861322518588 );
    glTexCoord2f(0.71581229,0.84263114); glVertex3f(0.081063998+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.71547965,0.8368966); glVertex3f(0.081063998+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.72372078,0.83259238); glVertex3f(0.095550111+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( -0.997405422702671,0.0273767654086621,-0.0665802934738662 );
    glTexCoord2f(0.7522864,0.84293882); glVertex3f(0.18536401+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.7522836,0.83655994); glVertex3f(0.18536401+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.75133001,0.8239779); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( -0.897509779260652,-0.16770603178045,0.407861352711863 );
    glTexCoord2f(0.7522864,0.84293882); glVertex3f(0.18536401+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.75207067,0.84876505); glVertex3f(0.18536401+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.74398582,0.85327158); glVertex3f(0.1708779+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.115576513831807,-0.00467919500105762,0.99328755885928 );
    glTexCoord2f(0.30560717,0.59848542); glVertex3f(0.23896262+$x,0.3782626+$y,0.055688457+$z);
    glTexCoord2f(0.3049668,0.58266423); glVertex3f(0.23751401+$x,0.34248181+$y,0.055688457+$z);
    glTexCoord2f(0.33193049,0.59654568); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( -0.0611019694931734,-0.0222637927672817,0.997883195998244 );
    glTexCoord2f(0.30560717,0.59848542); glVertex3f(0.23896262+$x,0.3782626+$y,0.055688457+$z);
    glTexCoord2f(0.29984222,0.61430668); glVertex3f(0.22592513+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.28071345,0.59849251); glVertex3f(0.18264786+$x,0.3782626+$y,0.052240215+$z);

    glNormal3f( -0.0355120982799072,0.01006411999801,0.999318570008795 );
    glTexCoord2f(0.31329308,0.64594894); glVertex3f(0.25634596+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.31777664,0.66177009); glVertex3f(0.26648623+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.28724891,0.64375587); glVertex3f(0.19743576+$x,0.48063544+$y,0.053645054+$z);

    glNormal3f( 0.293476190703211,0.0831711041679642,0.952341479156408 );
    glTexCoord2f(0.31329308,0.64594894); glVertex3f(0.25634596+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.31777696,0.6301277); glVertex3f(0.26648623+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.33013072,0.64597199); glVertex3f(0.29437201+$x,0.485605+$y,0.043970244+$z);

    glNormal3f( 0.991494726222404,0.094158778811403,-0.0898461587710065 );
    glTexCoord2f(0.42672623,0.31588077); glVertex3f(0.30704735+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.42123618,0.31468689); glVertex3f(0.30704735+$x,0.4140434+$y,-0.019308101+$z);
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( 0.993691530915859,-0.0811368124904061,0.0774206629072128 );
    glTexCoord2f(0.42672623,0.31588077); glVertex3f(0.30704735+$x,0.4319338+$y,-0.00055896092+$z);
    glTexCoord2f(0.43228065,0.31716033); glVertex3f(0.30704735+$x,0.44982421+$y,0.018190179+$z);
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.771499038375922,0.460300502407318,0.439218261538154 );
    glTexCoord2f(0.45948859,0.32509084); glVertex3f(0.30704735+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.46411184,0.32721181); glVertex3f(0.30704735+$x,0.55716661+$y,-0.019308101+$z);
    glTexCoord2f(0.4774835,0.31197009); glVertex3f(0.25634596+$x,0.57897053+$y,0.046899798+$z);

    glNormal3f( 0.993922692716724,-0.0796410252633889,-0.0759933417986958 );
    glTexCoord2f(0.45948859,0.32509084); glVertex3f(0.30704735+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.45497382,0.32367547); glVertex3f(0.30704735+$x,0.5213858+$y,0.018190179+$z);
    glTexCoord2f(0.43975376,0.3184892); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( -0.0292311270685041,0.986991375767958,-0.158093533612161 );
    glTexCoord2f(0.50039007,0.23875933); glVertex3f(0.0028389911+$x,0.5929474+$y,-0.00055896092+$z);
    glTexCoord2f(0.49167862,0.26846668); glVertex3f(0.10424178+$x,0.5929474+$y,-0.019308101+$z);
    glTexCoord2f(0.51586504,0.16351274); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( -0.0606654066748786,0.132628466955756,-0.98930753468572 );
    glTexCoord2f(0.63356847,0.33004804); glVertex3f(-0.14636796+$x,0.5392762+$y,-0.056806379+$z);
    glTexCoord2f(0.615434,0.32434555); glVertex3f(-0.18548047+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.61170523,0.28712711); glVertex3f(-0.24815508+$x,0.57834299+$y,-0.045327314+$z);

    glNormal3f( 0.00590578430394571,-0.0406469569905138,-0.999156117230519 );
    glTexCoord2f(0.63356847,0.33004804); glVertex3f(-0.14636796+$x,0.5392762+$y,-0.056806379+$z);
    glTexCoord2f(0.67928472,0.36061619); glVertex3f(-0.023236012+$x,0.55716661+$y,-0.056806379+$z);
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.0163676278280963,-0.0371086307139907,-0.999177186631988 );
    glTexCoord2f(0.98028608,0.85497128); glVertex3f(0.1708779+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.97572147,0.86132883); glVertex3f(0.19115845+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.97050954,0.82469634); glVertex3f(0.092652888+$x,0.485605+$y,-0.053863879+$z);

    glNormal3f( -0.0210607531542815,0.156889203772642,-0.987391625656285 );
    glTexCoord2f(0.46598797,0.28518158); glVertex3f(0.1708779+$x,0.53033101+$y,-0.056806379+$z);
    glTexCoord2f(0.46888095,0.26443648); glVertex3f(0.10424178+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.47279026,0.31099594); glVertex3f(0.24507898+$x,0.57306919+$y,-0.051598285+$z);

    glNormal3f( -0.989899195762067,0.0539149271941258,-0.131121176227434 );
    glTexCoord2f(0.82291874,0.85587554); glVertex3f(-0.075386016+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.82033478,0.84996657); glVertex3f(-0.075386016+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.89750977778528,0.16770611310625,-0.407861322518588 );
    glTexCoord2f(0.82291874,0.85587554); glVertex3f(-0.075386016+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.8238219,0.8619538); glVertex3f(-0.075386016+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.176465289711225,0.891611470999036,-0.416999983585213 );
    glTexCoord2f(0.80558317,0.87606678); glVertex3f(-0.12753602+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.79924619,0.87632669); glVertex3f(-0.14491936+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.0611019694931734,-0.0222637927672817,-0.997883195998244 );
    glTexCoord2f(0.77946334,0.22133826); glVertex3f(-0.23328464+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.76696559,0.23268068); glVertex3f(-0.22024715+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.75732704,0.20967564); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( 0.0572545211877262,0.018543942729952,0.998187378196896 );
    glTexCoord2f(0.092309433,0.6459512); glVertex3f(-0.24342493+$x,0.485605+$y,0.055688457+$z);
    glTexCoord2f(0.097433856,0.63012995); glVertex3f(-0.23183603+$x,0.44982421+$y,0.055688457+$z);
    glTexCoord2f(0.11969918,0.6434857); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.0564680388099033,-0.989447152154535,-0.133437976926524 );
    glTexCoord2f(0.87305635,0.8591357); glVertex3f(-0.12753602+$x,0.485605+$y,0.033619707+$z);
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);

    glNormal3f( -0.176465289711225,-0.891611470999036,0.416999983585213 );
    glTexCoord2f(0.87305635,0.8591357); glVertex3f(-0.12753602+$x,0.485605+$y,0.033619707+$z);
    glTexCoord2f(0.86686799,0.85910098); glVertex3f(-0.14491936+$x,0.485605+$y,0.026263457+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( -0.080861553247184,-0.0785696834284518,0.993623778928627 );
    glTexCoord2f(0.87301772,0.83996618); glVertex3f(-0.12753602+$x,0.4319338+$y,0.011550957+$z);
    glTexCoord2f(0.87853675,0.83396426); glVertex3f(-0.11015269+$x,0.4140434+$y,0.011550957+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.0808615536480278,0.0785696850989947,0.99362377876391 );
    glTexCoord2f(0.87301772,0.83996618); glVertex3f(-0.12753602+$x,0.4319338+$y,0.011550957+$z);
    glTexCoord2f(0.86684224,0.8463213); glVertex3f(-0.14491936+$x,0.44982421+$y,0.011550957+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( 0.176465349576103,0.891611505181021,0.416999885165234 );
    glTexCoord2f(0.8710173,0.8217408); glVertex3f(-0.12753602+$x,0.3782626+$y,0.033619707+$z);
    glTexCoord2f(0.87921981,0.82097109); glVertex3f(-0.11015269+$x,0.3782626+$y,0.026263457+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( -0.0117453743149851,0.999545745588196,-0.0277551555343834 );
    glTexCoord2f(0.8710173,0.8217408); glVertex3f(-0.12753602+$x,0.3782626+$y,0.033619707+$z);
    glTexCoord2f(0.86792441,0.82224209); glVertex3f(-0.14491936+$x,0.3782626+$y,0.040975956+$z);
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( -0.998021762072579,-0.0239086516560395,0.058145840827488 );
    glTexCoord2f(0.89088534,0.84038283); glVertex3f(-0.075386016+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.88853046,0.8342691); glVertex3f(-0.075386016+$x,0.4140434+$y,0.026263457+$z);
    glTexCoord2f(0.89247644,0.82152353); glVertex3f(-0.072971664+$x,0.37945529+$y,0.053481582+$z);

    glNormal3f( -0.897509743113412,-0.167706059757152,0.407861420751249 );
    glTexCoord2f(0.89088534,0.84038283); glVertex3f(-0.075386016+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.89173591,0.84688353); glVertex3f(-0.075386016+$x,0.44982421+$y,0.040975956+$z);
    glTexCoord2f(0.88424384,0.85069159); glVertex3f(-0.089872129+$x,0.47069633+$y,0.017681165+$z);

    glNormal3f( 0.1506065655566,0,0.988593780281489 );
    glTexCoord2f(0.11366097,0.60112425); glVertex3f(-0.19513788+$x,0.38422607+$y,0.055688457+$z);
    glTexCoord2f(0.11366105,0.59321366); glVertex3f(-0.19513788+$x,0.36633567+$y,0.055688457+$z);
    glTexCoord2f(0.12220735,0.60060263); glVertex3f(-0.17582307+$x,0.38303338+$y,0.052745957+$z);

    glNormal3f( 0.998702100077327,0.0193691313997456,0.0471057538943515 );
    glTexCoord2f(0.85453118,0.84007158); glVertex3f(-0.17968603+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.85451788,0.84639157); glVertex3f(-0.17968603+$x,0.44982421+$y,0.026263457+$z);
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);

    glNormal3f( 0.897509693441733,0.167706178385233,0.407861481277097 );
    glTexCoord2f(0.85453118,0.84007158); glVertex3f(-0.17968603+$x,0.4319338+$y,0.033619707+$z);
    glTexCoord2f(0.85624735,0.83481165); glVertex3f(-0.17968603+$x,0.4140434+$y,0.040975956+$z);
    glTexCoord2f(0.86445842,0.83076216); glVertex3f(-0.16519991+$x,0.39317127+$y,0.017681165+$z);

    glNormal3f( -0.241033590970786,0.117100956831865,0.963426268031337 );
    glTexCoord2f(0.089107649,0.56025308); glVertex3f(-0.25066798+$x,0.29179234+$y,0.055688457+$z);
    glTexCoord2f(0.092310243,0.56684521); glVertex3f(-0.24342493+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.069709352,0.55227769); glVertex3f(-0.294579+$x,0.27371558+$y,0.046899798+$z);

    glNormal3f( -0.280375770380136,-0.113512145792795,-0.953154982225483 );
    glTexCoord2f(0.39197826,0.12463345); glVertex3f(-0.25791104+$x,0.1635778+$y,-0.056806379+$z);
    glTexCoord2f(0.38004789,0.12584185); glVertex3f(-0.24342493+$x,0.12779701+$y,-0.056806379+$z);
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);

    glNormal3f( 0.92542690192968,-0.144102019716956,-0.35045635548286 );
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.63927364,0.88259426); glVertex3f(-0.21445269+$x,0.23513941+$y,-0.042093878+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);

    glNormal3f( 0.096894597222378,-0.0784568824173993,-0.992197538109451 );
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.66007594,0.89005417); glVertex3f(-0.15650825+$x,0.23513941+$y,-0.012668879+$z);

    glNormal3f( -0.998194597471206,-0.0434543208624079,0.0414640516313101 );
    glTexCoord2f(0.38250839,0.10636173); glVertex3f(-0.30136937+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.37628549,0.10608244); glVertex3f(-0.30136937+$x,0.092016197+$y,-0.019308101+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( -0.996139429948224,0.0635108793691042,-0.0606020156776245 );
    glTexCoord2f(0.38250839,0.10636173); glVertex3f(-0.30136937+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.38783853,0.10626191); glVertex3f(-0.30136937+$x,0.12779701+$y,0.018190179+$z);
    glTexCoord2f(0.39447514,0.11272631); glVertex3f(-0.29545667+$x,0.15992671+$y,-0.045327314+$z);

    glNormal3f( -0.434947596753773,-0.0880458788057497,0.896140899247122 );
    glTexCoord2f(0.36484446,0.10973781); glVertex3f(-0.26515409+$x,0.056235402+$y,0.055688457+$z);
    glTexCoord2f(0.3761691,0.11069922); glVertex3f(-0.27239715+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( 0.108152776380419,0.021893199310641,0.993893185802756 );
    glTexCoord2f(0.089108229,0.50356044); glVertex3f(-0.25066798+$x,0.1635778+$y,0.055688457+$z);
    glTexCoord2f(0.092311052,0.48773921); glVertex3f(-0.24342493+$x,0.12779701+$y,0.055688457+$z);
    glTexCoord2f(0.10774507,0.50195477); glVertex3f(-0.20854+$x,0.15992671+$y,0.051184629+$z);

    glNormal3f( -0.133563494032037,0.0270370440417415,0.990671384118588 );
    glTexCoord2f(0.089108229,0.50356044); glVertex3f(-0.25066798+$x,0.1635778+$y,0.055688457+$z);
    glTexCoord2f(0.092310729,0.51938161); glVertex3f(-0.24342493+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.072037888,0.50357094); glVertex3f(-0.28929762+$x,0.1635778+$y,0.050480363+$z);

    glNormal3f( 0.0417684667694831,-0.101461590186361,0.993962243196683 );
    glTexCoord2f(0.089109161,0.41258855); glVertex3f(-0.25066798+$x,-0.042161799+$y,0.055688457+$z);
    glTexCoord2f(0.079911836,0.40871049); glVertex3f(-0.27239715+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.956622048274927,-0.210773050067584,0.20111931314394 );
    glTexCoord2f(0.31742938,0.086464276); glVertex3f(-0.30136937+$x,-0.1047782+$y,-0.00055896092+$z);
    glTexCoord2f(0.31133372,0.085454018); glVertex3f(-0.30136937+$x,-0.1226686+$y,-0.019308101+$z);
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.993083892892255,0.0849416529674299,-0.0810512015279586 );
    glTexCoord2f(0.31742938,0.086464276); glVertex3f(-0.30136937+$x,-0.1047782+$y,-0.00055896092+$z);
    glTexCoord2f(0.32352504,0.087474533); glVertex3f(-0.30136937+$x,-0.086887798+$y,0.018190179+$z);
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.0534338271458181,0.00865322297239239,0.99853389919859 );
    glTexCoord2f(0.15316247,0.4046773); glVertex3f(-0.10580685+$x,-0.060052198+$y,0.055688457+$z);
    glTexCoord2f(0.15636493,0.42445376); glVertex3f(-0.098563797+$x,-0.015326199+$y,0.055688457+$z);
    glTexCoord2f(0.074715392,0.3686034); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( 0.012384136591735,-0.0100276132600559,0.999873032006156 );
    glTexCoord2f(0.15316247,0.4046773); glVertex3f(-0.10580685+$x,-0.060052198+$y,0.055688457+$z);
    glTexCoord2f(0.13074413,0.37699043); glVertex3f(-0.15650825+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0,0.0110131969464249,0.999939352907475 );
    glTexCoord2f(0.28126921,0.37698888); glVertex3f(0.18391539+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.31009317,0.37698859); glVertex3f(0.24910291+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.0142470518435161,-0.0547961937595349,0.998395912783719 );
    glTexCoord2f(0.28126921,0.37698888); glVertex3f(0.18391539+$x,-0.1226686+$y,0.055688457+$z);
    glTexCoord2f(0.22041881,0.36116831); glVertex3f(0.046297329+$x,-0.1584494+$y,0.055688457+$z);
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.029823242112967,-0.0482965851844423,0.998387707300823 );
    glTexCoord2f(0.92811025,0.91324335); glVertex3f(0.075269554+$x,0.1099066+$y,0.011550957+$z);
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);

    glNormal3f( -0.0370437147419031,0.119979280325685,0.992085044484923 );
    glTexCoord2f(0.92811025,0.91324335); glVertex3f(0.075269554+$x,0.1099066+$y,0.011550957+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.93637112,0.90134197); glVertex3f(0.096998722+$x,0.078598397+$y,0.016148612+$z);

    glNormal3f( 0.0142963865216522,0.0810319178457932,0.996608971273416 );
    glTexCoord2f(0.89100473,0.91314308); glVertex3f(-0.026133234+$x,0.1099066+$y,0.011550957+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);

    glNormal3f( -0.0181156574947527,-0.0440055132631275,0.998867027064154 );
    glTexCoord2f(0.89100473,0.91314308); glVertex3f(-0.026133234+$x,0.1099066+$y,0.011550957+$z);
    glTexCoord2f(0.90609136,0.90644495); glVertex3f(0.017325104+$x,0.092016197+$y,0.011550957+$z);
    glTexCoord2f(0.91449282,0.92396578); glVertex3f(0.040502883+$x,0.14926549+$y,0.014493456+$z);

    glNormal3f( 0.0496796968777775,-0.201131575717455,0.978303642519819 );
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.88419217,0.91943212); glVertex3f(-0.040619346+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.88390599,0.92763557); glVertex3f(-0.040619346+$x,0.15642164+$y,0.017435957+$z);

    glNormal3f( -0.990664711929862,-0.0986256788649138,-0.0941084693604016 );
    glTexCoord2f(0.34826304,0.096311053); glVertex3f(-0.30136937+$x,0.0025642017+$y,-0.00055896092+$z);
    glTexCoord2f(0.35236943,0.098985939); glVertex3f(-0.30136937+$x,0.020454602+$y,-0.019308101+$z);
    glTexCoord2f(0.33319571,0.095783118); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.998194597585541,0.0434543219733474,0.0414640477145685 );
    glTexCoord2f(0.34826304,0.096311053); glVertex3f(-0.30136937+$x,0.0025642017+$y,-0.00055896092+$z);
    glTexCoord2f(0.34496287,0.093736991); glVertex3f(-0.30136937+$x,-0.015326199+$y,0.018190179+$z);
    glTexCoord2f(0.36692309,0.10055698); glVertex3f(-0.29734546+$x,0.056235402+$y,0.040064174+$z);

    glNormal3f( -0.394866486786601,0.0799323004456174,-0.915254765056309 );
    glTexCoord2f(0.45195696,0.45368385); glVertex3f(-0.26515409+$x,0.056235402+$y,-0.056806379+$z);
    glTexCoord2f(0.43919184,0.46321564); glVertex3f(-0.27239715+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.44268973,0.44545107); glVertex3f(-0.29231555+$x,0.056235402+$y,-0.045088166+$z);

    glNormal3f( 0.997405422702671,0.0273767654086621,0.0665802934738662 );
    glTexCoord2f(0.78589913,0.85715341); glVertex3f(-0.17968603+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.7861235,0.86371778); glVertex3f(-0.17968603+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.78755846,0.87657687); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( 0.897509658769842,-0.167706125036109,-0.407861579509784 );
    glTexCoord2f(0.78589913,0.85715341); glVertex3f(-0.17968603+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.78592683,0.85118536); glVertex3f(-0.17968603+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( 0.0808615310571484,-0.0785697070656314,-0.993623778865379 );
    glTexCoord2f(0.80491445,0.85662935); glVertex3f(-0.12753602+$x,0.4319338+$y,-0.012668879+$z);
    glTexCoord2f(0.79880038,0.86336841); glVertex3f(-0.14491936+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.0808615758380627,0.078569661461815,-0.993623778827158 );
    glTexCoord2f(0.80491445,0.85662935); glVertex3f(-0.12753602+$x,0.4319338+$y,-0.012668879+$z);
    glTexCoord2f(0.81026474,0.85025901); glVertex3f(-0.11015269+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.81583107,0.86696703); glVertex3f(-0.089872129+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.176465349576103,-0.891611505181021,-0.416999885165234 );
    glTexCoord2f(0.80424135,0.83693626); glVertex3f(-0.12753602+$x,0.485605+$y,-0.034737629+$z);
    glTexCoord2f(0.81057979,0.83676157); glVertex3f(-0.11015269+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.79403604,0.84652767); glVertex3f(-0.16519991+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.0213643626651235,-0.998496258040238,0.0504855096790699 );
    glTexCoord2f(0.80424135,0.83693626); glVertex3f(-0.12753602+$x,0.485605+$y,-0.034737629+$z);
    glTexCoord2f(0.79796572,0.83729276); glVertex3f(-0.14491936+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.82523625,0.8369104); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( -0.0778913679970141,0.0441488235232326,-0.995983843329332 );
    glTexCoord2f(0.74655786,0.46384937); glVertex3f(0.24620568+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.72931082,0.46959311); glVertex3f(0.22592513+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.72588836,0.44740255); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( 0.151837032267443,-0.0860611983172957,-0.984651707852277 );
    glTexCoord2f(0.74655786,0.46384937); glVertex3f(0.24620568+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.7634426,0.45785463); glVertex3f(0.26648623+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( -0.999438319988136,0.0127442416565299,-0.0309940130330536 );
    glTexCoord2f(0.94518539,0.85286461); glVertex3f(0.18536401+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.95135109,0.8541779); glVertex3f(0.18536401+$x,0.44982421+$y,-0.027381379+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);

    glNormal3f( -0.897509813932509,0.167706085129537,-0.407861254479214 );
    glTexCoord2f(0.94518539,0.85286461); glVertex3f(0.18536401+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.93982772,0.85131413); glVertex3f(0.18536401+$x,0.4140434+$y,-0.042093878+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.0808615553668183,-0.078569685488009,-0.993623778593273 );
    glTexCoord2f(0.94892671,0.83488405); glVertex3f(0.133214+$x,0.4319338+$y,-0.012668879+$z);
    glTexCoord2f(0.94400812,0.82757724); glVertex3f(0.11583067+$x,0.4140434+$y,-0.012668879+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.0808615430498581,0.0785696748012101,-0.99362378044068 );
    glTexCoord2f(0.94892671,0.83488405); glVertex3f(0.133214+$x,0.4319338+$y,-0.012668879+$z);
    glTexCoord2f(0.95384531,0.84219086); glVertex3f(0.15059734+$x,0.44982421+$y,-0.012668879+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( -0.0383110176943932,-0.99515641301736,0.0905316494583047 );
    glTexCoord2f(0.9675203,0.83874561); glVertex3f(0.133214+$x,0.485605+$y,-0.034737629+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);

    glNormal3f( 0.176465293435874,-0.891611466145418,-0.416999992386822 );
    glTexCoord2f(0.9675203,0.83874561); glVertex3f(0.133214+$x,0.485605+$y,-0.034737629+$z);
    glTexCoord2f(0.96624103,0.84476523); glVertex3f(0.15059734+$x,0.485605+$y,-0.027381379+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( -0.447987036217772,-0.145096610938577,0.882187388753068 );
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);
    glTexCoord2f(0.95781131,0.97015177); glVertex3f(0.16942928+$x,0.26197501+$y,0.015229082+$z);

    glNormal3f( 0.0911403813590876,0.073797615024457,0.993099865523313 );
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.95953679,0.95952183); glVertex3f(0.16218623+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);

    glNormal3f( 0.992494515639802,0.0884738450289199,0.0844216510778686 );
    glTexCoord2f(0.39517509,0.30630346); glVertex3f(0.30704735+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.39979835,0.30842443); glVertex3f(0.30704735+$x,0.34248181+$y,-0.019308101+$z);
    glTexCoord2f(0.41258399,0.30658172); glVertex3f(0.29846298+$x,0.37384522+$y,0.048744331+$z);

    glNormal3f( 0.996199179484002,-0.0630184480337739,-0.0601321045932771 );
    glTexCoord2f(0.39517509,0.30630346); glVertex3f(0.30704735+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.39084335,0.30268613); glVertex3f(0.30704735+$x,0.306701+$y,0.018190179+$z);
    glTexCoord2f(0.37528884,0.30024428); glVertex3f(0.30025699+$x,0.26253408+$y,-0.04801772+$z);

    glNormal3f( 0,0.0884653395980433,-0.996079255727075 );
    glTexCoord2f(0.71954523,0.50337394); glVertex3f(0.26069179+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.71193646,0.49651444); glVertex3f(0.23751401+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.7612173,0.48208405); glVertex3f(0.29844622+$x,0.47721888+$y,-0.04801772+$z);

    glNormal3f( 0,-0.0216362082290434,-0.999765909847635 );
    glTexCoord2f(0.71954523,0.50337394); glVertex3f(0.26069179+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.7252518,0.50851856); glVertex3f(0.27807513+$x,0.3782626+$y,-0.056806379+$z);
    glTexCoord2f(0.6755726,0.52442193); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( 0.216834584884516,-0.877870799852361,-0.42699604396825 );
    glTexCoord2f(0.78734989,0.89500667); glVertex3f(0.17667234+$x,0.2709202+$y,-0.034737629+$z);
    glTexCoord2f(0.79285081,0.89581651); glVertex3f(0.19115845+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);

    glNormal3f( 0.0654656929624751,-0.989492158418156,-0.128916684234131 );
    glTexCoord2f(0.78734989,0.89500667); glVertex3f(0.17667234+$x,0.2709202+$y,-0.034737629+$z);
    glTexCoord2f(0.78189831,0.89448839); glVertex3f(0.16218623+$x,0.2709202+$y,-0.042093878+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);

    glNormal3f( -0.176465330952847,0.891611529449111,-0.416999841157187 );
    glTexCoord2f(0.93042961,0.83094419); glVertex3f(0.133214+$x,0.3782626+$y,-0.034737629+$z);
    glTexCoord2f(0.93167672,0.82495067); glVertex3f(0.11583067+$x,0.3782626+$y,-0.027381379+$z);
    glTexCoord2f(0.93711101,0.84249237); glVertex3f(0.1708779+$x,0.39317127+$y,-0.018799087+$z);

    glNormal3f( 0.998635358654107,-0.0198605724082861,-0.0483009120969516 );
    glTexCoord2f(0.95276452,0.81682519); glVertex3f(0.081063998+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.94656666,0.815538); glVertex3f(0.081063998+$x,0.4140434+$y,-0.027381379+$z);
    glTexCoord2f(0.93440996,0.81218848); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( 0.897509743113412,-0.167706059757152,-0.407861420751249 );
    glTexCoord2f(0.95276452,0.81682519); glVertex3f(0.081063998+$x,0.4319338+$y,-0.034737629+$z);
    glTexCoord2f(0.95892499,0.81867182); glVertex3f(0.081063998+$x,0.44982421+$y,-0.042093878+$z);
    glTexCoord2f(0.96134916,0.82788621); glVertex3f(0.095550111+$x,0.47069633+$y,-0.018799087+$z);

    glNormal3f( 0.0142866458589,-0.0208225709864721,-0.999681105296892 );
    glTexCoord2f(0.65078178,0.4094434); glVertex3f(0.0028389911+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.66463633,0.41128743); glVertex3f(0.028913994+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.6599095,0.44961797); glVertex3f(0.079035943+$x,0.3782626+$y,-0.054599504+$z);

    glNormal3f( -0.0184159967122777,0.026841052819514,-0.999470064058266 );
    glTexCoord2f(0.65078178,0.4094434); glVertex3f(0.0028389911+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.63692724,0.40759937); glVertex3f(-0.023236012+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.64209136,0.37099337); glVertex3f(-0.07002079+$x,0.4833963+$y,-0.054081842+$z);

    glNormal3f( 0.0204639553807189,-0.028168921270543,-0.999393685393614 );
    glTexCoord2f(0.56813006,0.39880794); glVertex3f(-0.15216242+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.58150906,0.40022325); glVertex3f(-0.12753602+$x,0.34248181+$y,-0.056806379+$z);
    glTexCoord2f(0.56337179,0.42646394); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.0382465262284535,0.0464531194306591,-0.998188013816344 );
    glTexCoord2f(0.56813006,0.39880794); glVertex3f(-0.15216242+$x,0.3245914+$y,-0.056806379+$z);
    glTexCoord2f(0.55570216,0.39825007); glVertex3f(-0.17389158+$x,0.306701+$y,-0.056806379+$z);
    glTexCoord2f(0.57586718,0.37385573); glVertex3f(-0.17696988+$x,0.3782626+$y,-0.053358137+$z);

    glNormal3f( 0.21032241687063,-0.885565319453533,-0.414172121155997 );
    glTexCoord2f(0.64480637,0.87667896); glVertex3f(-0.17099436+$x,0.2709202+$y,-0.034737629+$z);
    glTexCoord2f(0.66090422,0.8753964); glVertex3f(-0.15650825+$x,0.2709202+$y,-0.027381379+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);

    glNormal3f( 0.0357929793818053,-0.00966070068019046,-0.999312530437471 );
    glTexCoord2f(0.4473521,0.48687807); glVertex3f(-0.22169575+$x,-0.0063809978+$y,-0.056806379+$z);
    glTexCoord2f(0.45767187,0.48021232); glVertex3f(-0.21445269+$x,0.020454602+$y,-0.056806379+$z);
    glTexCoord2f(0.49300273,0.49603779); glVertex3f(-0.13111284+$x,0.047400636+$y,-0.054081842+$z);

    glNormal3f( -0.21199260406891,0.102992117155204,-0.971829079429079 );
    glTexCoord2f(0.4473521,0.48687807); glVertex3f(-0.22169575+$x,-0.0063809978+$y,-0.056806379+$z);
    glTexCoord2f(0.42711859,0.49538512); glVertex3f(-0.24342493+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.41302228,0.47823609); glVertex3f(-0.29250032+$x,-0.043804794+$y,-0.045327314+$z);

    glNormal3f( -0.852010281452463,-0.378760391586992,-0.361412570429092 );
    glTexCoord2f(0.28502938,0.077267731); glVertex3f(-0.30136937+$x,-0.2121206+$y,-0.00055896092+$z);
    glTexCoord2f(0.29028422,0.077470638); glVertex3f(-0.30136937+$x,-0.1942302+$y,-0.019308101+$z);
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( -0.977403475337579,0.152931010392219,0.145926531029961 );
    glTexCoord2f(0.28502938,0.077267731); glVertex3f(-0.30136937+$x,-0.2121206+$y,-0.00055896092+$z);
    glTexCoord2f(0.28064937,0.074949618); glVertex3f(-0.30136937+$x,-0.230011+$y,0.018190179+$z);
    glTexCoord2f(0.30672468,0.087253988); glVertex3f(-0.28326172+$x,-0.14167715+$y,0.046899798+$z);

    glNormal3f( -0.833101952239236,-0.40017138134286,0.381842903206701 );
    glTexCoord2f(0.25394641,0.065711693); glVertex3f(-0.30136937+$x,-0.319463+$y,-0.00055896092+$z);
    glTexCoord2f(0.24702022,0.066666644); glVertex3f(-0.30136937+$x,-0.3373534+$y,-0.019308101+$z);
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( -0.895349680361011,0.322212157866157,-0.307454509156508 );
    glTexCoord2f(0.25394641,0.065711693); glVertex3f(-0.30136937+$x,-0.319463+$y,-0.00055896092+$z);
    glTexCoord2f(0.25921154,0.068687161); glVertex3f(-0.30136937+$x,-0.30157259+$y,0.018190179+$z);
    glTexCoord2f(0.2670301,0.086963542); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( 0.0145026270817575,0.0822008916774851,0.99651025444556 );
    glTexCoord2f(0.20120357,0.28997311); glVertex3f(0.0028389911+$x,-0.319463+$y,0.055688457+$z);
    glTexCoord2f(0.24604091,0.28206205); glVertex3f(0.10424178+$x,-0.3373534+$y,0.055688457+$z);
    glTexCoord2f(0.31971953,0.31619317); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( -0.0156059629276214,-0.0884545492163705,0.995957954255113 );
    glTexCoord2f(0.20120357,0.28997311); glVertex3f(0.0028389911+$x,-0.319463+$y,0.055688457+$z);
    glTexCoord2f(0.15636623,0.29788417); glVertex3f(-0.098563797+$x,-0.30157259+$y,0.055688457+$z);
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( 0.901945269303522,0.312435414902103,0.298125548546157 );
    glTexCoord2f(0.20637279,0.22646905); glVertex3f(0.30704735+$x,-0.319463+$y,-0.00055896092+$z);
    glTexCoord2f(0.21099605,0.22859002); glVertex3f(0.30704735+$x,-0.30157259+$y,-0.019308101+$z);
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.83310200621348,-0.400171320899726,-0.381842848790499 );
    glTexCoord2f(0.20637279,0.22646905); glVertex3f(0.30704735+$x,-0.319463+$y,-0.00055896092+$z);
    glTexCoord2f(0.20174954,0.22434807); glVertex3f(0.30704735+$x,-0.3373534+$y,0.018190179+$z);
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( -0.0348352423671433,-0.197446157047119,-0.979694605964811 );
    glTexCoord2f(0.1933099,0.15108151); glVertex3f(0.0028389911+$x,-0.4268054+$y,-0.056806379+$z);
    glTexCoord2f(0.1836084,0.156421); glVertex3f(0.10424178+$x,-0.4446958+$y,-0.056806379+$z);
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( 0.0156059627123462,0.088454547996191,-0.995957954366855 );
    glTexCoord2f(0.7587128,0.1297176); glVertex3f(0.0028389911+$x,-0.4268054+$y,-0.056806379+$z);
    glTexCoord2f(0.75333872,0.17506179); glVertex3f(-0.098563797+$x,-0.40891499+$y,-0.056806379+$z);
    glTexCoord2f(0.72842043,0.017363077); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( 0.0333529165468761,-0.983030286281324,0.180385806568799 );
    glTexCoord2f(0.18357831,0.1212463); glVertex3f(0.0028389911+$x,-0.4804766+$y,-0.00055896092+$z);
    glTexCoord2f(0.17436189,0.15217906); glVertex3f(0.10424178+$x,-0.4804766+$y,-0.019308101+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( -0.0333529163109515,-0.983030286502139,-0.180385805409065 );
    glTexCoord2f(0.18357831,0.1212463); glVertex3f(0.0028389911+$x,-0.4804766+$y,-0.00055896092+$z);
    glTexCoord2f(0.19279472,0.090313533); glVertex3f(-0.098563797+$x,-0.4804766+$y,0.018190179+$z);
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( 0.553013204952917,-0.602784243501322,0.575176104279587 );
    glTexCoord2f(0.17421605,0.21707536); glVertex3f(0.30704735+$x,-0.4268054+$y,-0.00055896092+$z);
    glTexCoord2f(0.18031171,0.21808562); glVertex3f(0.30704735+$x,-0.40891499+$y,0.018190179+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( 0.833102006254693,0.400171322482298,-0.381842847042044 );
    glTexCoord2f(0.17421605,0.21707536); glVertex3f(0.30704735+$x,-0.4268054+$y,-0.00055896092+$z);
    glTexCoord2f(0.16812038,0.2160651); glVertex3f(0.30704735+$x,-0.4446958+$y,-0.019308101+$z);
    glTexCoord2f(0.19240601,0.20893854); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( -0.0156059628604196,0.0884545495333179,0.995957954228017 );
    glTexCoord2f(0.20120405,0.24250951); glVertex3f(0.0028389911+$x,-0.4268054+$y,0.055688457+$z);
    glTexCoord2f(0.24604123,0.25041966); glVertex3f(0.10424178+$x,-0.40891499+$y,0.055688457+$z);
    glTexCoord2f(0.08772725,0.26625989); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( 0.0348352426771452,-0.197446157246492,0.979694605913607 );
    glTexCoord2f(0.20186529,0.12427707); glVertex3f(0.0028389911+$x,-0.4268054+$y,0.055688457+$z);
    glTexCoord2f(0.20498604,0.092334048); glVertex3f(-0.098563797+$x,-0.4446958+$y,0.055688457+$z);
    glTexCoord2f(0.17126584,0.18716542); glVertex3f(0.22254503+$x,-0.46556793+$y,0.040064174+$z);

    glNormal3f( -0.553013205632178,-0.602784245626639,-0.575176101399168 );
    glTexCoord2f(0.22095914,0.058283216); glVertex3f(-0.30136937+$x,-0.4268054+$y,-0.00055896092+$z);
    glTexCoord2f(0.22558239,0.060404188); glVertex3f(-0.30136937+$x,-0.40891499+$y,-0.019308101+$z);
    glTexCoord2f(0.20068503,0.081408831); glVertex3f(-0.21686705+$x,-0.46556793+$y,-0.041182096+$z);

    glNormal3f( -0.833101952198022,0.400171379760289,0.381842904955155 );
    glTexCoord2f(0.22095914,0.058283216); glVertex3f(-0.30136937+$x,-0.4268054+$y,-0.00055896092+$z);
    glTexCoord2f(0.21633588,0.056162245); glVertex3f(-0.30136937+$x,-0.4446958+$y,0.018190179+$z);
    glTexCoord2f(0.23492592,0.075813722); glVertex3f(-0.25383681+$x,-0.3731342+$y,0.046899798+$z);

    glNormal3f( 0.0156059626451443,-0.0884545483131383,-0.995957954339759 );
    glTexCoord2f(0.35862192,0.74038403); glVertex3f(0.0028389911+$x,-0.319463+$y,-0.056806379+$z);
    glTexCoord2f(0.33814292,0.80645799); glVertex3f(0.10424178+$x,-0.30157259+$y,-0.056806379+$z);
    glTexCoord2f(0.27960694,0.82566929); glVertex3f(0.2595148+$x,-0.3731342+$y,-0.04801772+$z);

    glNormal3f( -0.00893482435602931,0.0506425848994521,-0.998676873422244 );
    glTexCoord2f(0.35862192,0.74038403); glVertex3f(0.0028389911+$x,-0.319463+$y,-0.056806379+$z);
    glTexCoord2f(0.37496274,0.69778236); glVertex3f(-0.098563797+$x,-0.3373534+$y,-0.056806379+$z);
    glTexCoord2f(0.43906305,0.67843164); glVertex3f(-0.26080825+$x,-0.25505756+$y,-0.051181637+$z);

    glNormal3f( 0.960054267192312,0.202440001703322,-0.193167931490174 );
    glTexCoord2f(0.23852954,0.23586273); glVertex3f(0.30704735+$x,-0.2121206+$y,-0.00055896092+$z);
    glTexCoord2f(0.23243388,0.23485247); glVertex3f(0.30704735+$x,-0.230011+$y,-0.019308101+$z);
    glTexCoord2f(0.25714955,0.23591853); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.881323740354445,-0.341854089265754,0.326196637536216 );
    glTexCoord2f(0.23852954,0.23586273); glVertex3f(0.30704735+$x,-0.2121206+$y,-0.00055896092+$z);
    glTexCoord2f(0.24371689,0.23632233); glVertex3f(0.30704735+$x,-0.1942302+$y,0.018190179+$z);
    glTexCoord2f(0.22901815,0.21940032); glVertex3f(0.27083207+$x,-0.26020105+$y,0.046899798+$z);

    glNormal3f( 0.289011093665149,0.0936065482120545,0.952738370104983 );
    glTexCoord2f(0.3084292,0.23050308); glVertex3f(0.2346168+$x,-0.0063809978+$y,0.055688457+$z);
    glTexCoord2f(0.2938191,0.23092868); glVertex3f(0.24910291+$x,-0.051106998+$y,0.055688457+$z);
    glTexCoord2f(0.29052153,0.24677398); glVertex3f(0.29899951+$x,-0.046137442+$y,0.040064174+$z);

    glNormal3f( -0.0133698035666306,0.00721714612634088,0.9998845739156 );
    glTexCoord2f(0.30368732,0.42840755); glVertex3f(0.2346168+$x,-0.0063809978+$y,0.055688457+$z);
    glTexCoord2f(0.31009252,0.44027339); glVertex3f(0.24910291+$x,0.020454602+$y,0.055688457+$z);
    glTexCoord2f(0.25514796,0.45021484); glVertex3f(0.12483361+$x,0.042928492+$y,0.053864593+$z);

    glNormal3f( 0.998194597468499,0.043454312792015,0.0414640601542401 );
    glTexCoord2f(0.33499978,0.26404379); glVertex3f(0.30704735+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.33962304,0.26616476); glVertex3f(0.30704735+$x,0.12779701+$y,-0.019308101+$z);
    glTexCoord2f(0.35300977,0.26633191); glVertex3f(0.30302344+$x,0.1635778+$y,0.040064174+$z);

    glNormal3f( 0.998194597475395,-0.0434543206353091,-0.0414640517684555 );
    glTexCoord2f(0.33499978,0.26404379); glVertex3f(0.30704735+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.33037652,0.26192282); glVertex3f(0.30704735+$x,0.092016197+$y,0.018190179+$z);
    glTexCoord2f(0.31766282,0.25934477); glVertex3f(0.30302344+$x,0.056235402+$y,-0.041182096+$z);

    glNormal3f( -0.0373703606746507,-0.0907779603406028,-0.995169743340023 );
    glTexCoord2f(0.59369349,0.64010088); glVertex3f(0.25634596+$x,-0.042161799+$y,-0.056806379+$z);
    glTexCoord2f(0.59798792,0.64900362); glVertex3f(0.27807513+$x,-0.051106998+$y,-0.056806379+$z);
    glTexCoord2f(0.57096554,0.68384931); glVertex3f(0.2844128+$x,-0.15006327+$y,-0.04801772+$z);

    glNormal3f( 0.100706531397813,0.081543457726635,0.991568887690515 );
    glTexCoord2f(0.83453014,0.95403316); glVertex3f(-0.17099436+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.82961974,0.9600302); glVertex3f(-0.18548047+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);

    glNormal3f( -0.216834584884516,-0.877870799852361,0.42699604396825 );
    glTexCoord2f(0.83454855,0.97440751); glVertex3f(-0.17099436+$x,0.2709202+$y,0.033619707+$z);
    glTexCoord2f(0.82903772,0.97441439); glVertex3f(-0.18548047+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.84252214,0.96853187); glVertex3f(-0.14491936+$x,0.25660789+$y,0.017435957+$z);

    glNormal3f( 0.0627679520970505,-0.99034447526326,-0.123604225271957 );
    glTexCoord2f(0.83454855,0.97440751); glVertex3f(-0.17099436+$x,0.2709202+$y,0.033619707+$z);
    glTexCoord2f(0.84005939,0.97440063); glVertex3f(-0.15650825+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( 0.999978473231692,-0.00249527023772048,-0.00606850061017732 );
    glTexCoord2f(0.81735589,0.95234657); glVertex3f(-0.21445269+$x,0.217249+$y,0.033619707+$z);
    glTexCoord2f(0.81802824,0.96081767); glVertex3f(-0.21445269+$x,0.23513941+$y,0.026263457+$z);
    glTexCoord2f(0.81814109,0.97243098); glVertex3f(-0.21421423+$x,0.26576659+$y,0.05296392+$z);

    glNormal3f( 0.920052714491889,0.148995826039851,0.362357898187425 );
    glTexCoord2f(0.81735589,0.95234657); glVertex3f(-0.21445269+$x,0.217249+$y,0.033619707+$z);
    glTexCoord2f(0.81793454,0.94614652); glVertex3f(-0.21445269+$x,0.1993586+$y,0.040975956+$z);
    glTexCoord2f(0.82514433,0.94280512); glVertex3f(-0.20286381+$x,0.18504628+$y,0.017435957+$z);

    glNormal3f( -0.283132849493722,0.275108135531805,0.91877706942532 );
    glTexCoord2f(0.079919605,0.61422046); glVertex3f(-0.27239715+$x,0.4140434+$y,0.055688457+$z);
    glTexCoord2f(0.08718542,0.62221946); glVertex3f(-0.25501381+$x,0.4319338+$y,0.055688457+$z);
    glTexCoord2f(0.069910025,0.61828291); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);

    glNormal3f( -0.931112250929159,0.26387718639263,-0.251791196571971 );
    glTexCoord2f(0.5073564,0.14503329); glVertex3f(-0.30136937+$x,0.5213858+$y,-0.019308101+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.5050016,0.14646972); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);

    glNormal3f( -0.926348893615149,0.0954645279826861,-0.364368290600366 );
    glTexCoord2f(0.48056036,0.1371665); glVertex3f(-0.30136937+$x,0.44982421+$y,-0.019308101+$z);
    glTexCoord2f(0.49270126,0.14136756); glVertex3f(-0.30136937+$x,0.485605+$y,-0.0099335305+$z);
    glTexCoord2f(0.47820431,0.13864165); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);

    glNormal3f( -0.936924074059696,0.252880419868042,-0.241298099235664 );
    glTexCoord2f(0.44235201,0.12548043); glVertex3f(-0.30136937+$x,0.306701+$y,-0.019308101+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);

    glNormal3f( -0.952567074852482,0.0771308030316382,-0.294392267443763 );
    glTexCoord2f(0.41652725,0.1178907); glVertex3f(-0.30136937+$x,0.23513941+$y,-0.019308101+$z);
    glTexCoord2f(0.42719615,0.12150592); glVertex3f(-0.30136937+$x,0.2709202+$y,-0.0099335305+$z);
    glTexCoord2f(0.41145338,0.11820354); glVertex3f(-0.29412631+$x,0.217249+$y,-0.047431809+$z);

    glNormal3f( -0.963014480597045,0.194941662754937,-0.186013059441386 );
    glTexCoord2f(0.37628549,0.10608244); glVertex3f(-0.30136937+$x,0.092016197+$y,-0.019308101+$z);
    glTexCoord2f(0.38250839,0.10636173); glVertex3f(-0.30136937+$x,0.1099066+$y,-0.00055896092+$z);
    glTexCoord2f(0.37661691,0.10802705); glVertex3f(-0.29412631+$x,0.10096141+$y,-0.047431809+$z);

    glNormal3f( -0.0632660842166381,-0.0512274541111287,0.99668106761049 );
    glTexCoord2f(0.22041719,0.5193803); glVertex3f(0.046297329+$x,0.1993586+$y,0.055688457+$z);
    glTexCoord2f(0.21401179,0.52729096); glVertex3f(0.031811216+$x,0.217249+$y,0.055688457+$z);
    glTexCoord2f(0.20441143,0.50752185); glVertex3f(0.010082047+$x,0.172523+$y,0.052010331+$z);

    glNormal3f( -0.12529291663255,-0.101451390580761,0.98691909515975 );
    glTexCoord2f(0.95953679,0.95952183); glVertex3f(0.16218623+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.96585017,0.95308037); glVertex3f(0.17667234+$x,0.217249+$y,0.011550957+$z);
    glTexCoord2f(0.95781131,0.97015177); glVertex3f(0.16942928+$x,0.26197501+$y,0.015229082+$z);

    glNormal3f( 0.298802766341147,-0.362917172585201,0.882614317054534 );
    glTexCoord2f(0.95953679,0.95952183); glVertex3f(0.16218623+$x,0.23513941+$y,0.011550957+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.95348876,0.95678585); glVertex3f(0.14045706+$x,0.2261942+$y,0.015229082+$z);

    glNormal3f( -0.882731793900545,-0.178689932391451,0.434573915576008 );
    glTexCoord2f(0.98316976,0.94722143); glVertex3f(0.22013067+$x,0.1993586+$y,0.026263457+$z);
    glTexCoord2f(0.98317589,0.95401288); glVertex3f(0.22013067+$x,0.217249+$y,0.033619707+$z);
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);

    glNormal3f( -0.107448388140505,0.116003293827685,-0.987419910528006 );
    glTexCoord2f(0.61200397,0.57676182); glVertex3f(0.19115845+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.61253979,0.56661058); glVertex3f(0.17667234+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.62945695,0.57652684); glVertex3f(0.22013067+$x,0.1188518+$y,-0.056806379+$z);

    glNormal3f( -0.999370952860525,-0.0134866408630182,0.0327995289124418 );
    glTexCoord2f(0.7991702,0.91098132); glVertex3f(0.22013067+$x,0.23513941+$y,-0.027381379+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.80063639,0.91746415); glVertex3f(0.22013067+$x,0.217249+$y,-0.034737629+$z);

    glNormal3f( -0.8827317824208,0.17868985515742,-0.434573970651738 );
    glTexCoord2f(0.7991702,0.91098132); glVertex3f(0.22013067+$x,0.23513941+$y,-0.027381379+$z);
    glTexCoord2f(0.80063639,0.91746415); glVertex3f(0.22013067+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( 0.100706502534401,-0.0815434799349712,-0.991568888795622 );
    glTexCoord2f(0.77797084,0.92052059); glVertex3f(0.16218623+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);

    glNormal3f( 0.198899033409311,0.0402628369574219,-0.979192564549477 );
    glTexCoord2f(0.77797084,0.92052059); glVertex3f(0.16218623+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.7666696,0.92956423); glVertex3f(0.13723792+$x,0.17351692+$y,-0.018799087+$z);
    glTexCoord2f(0.77113112,0.91294062); glVertex3f(0.14045706+$x,0.217249+$y,-0.016347004+$z);

    glNormal3f( -0.100706519788407,0.0815434939057846,-0.991568885894341 );
    glTexCoord2f(0.77797084,0.92052059); glVertex3f(0.16218623+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.78325273,0.91553897); glVertex3f(0.17667234+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.78154991,0.93077836); glVertex3f(0.17667234+$x,0.172523+$y,-0.016347004+$z);

    glNormal3f( 0.0968945702298964,-0.078456904415385,-0.992197539005978 );
    glTexCoord2f(0.6484148,0.90079628); glVertex3f(-0.18548047+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);

    glNormal3f( 0.265043141213342,0.262299788566936,-0.927874428041589 );
    glTexCoord2f(0.6484148,0.90079628); glVertex3f(-0.18548047+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.64133243,0.90594988); glVertex3f(-0.19835702+$x,0.18345602+$y,-0.02084249+$z);
    glTexCoord2f(0.64083104,0.89692108); glVertex3f(-0.20720963+$x,0.20830381+$y,-0.016347004+$z);

    glNormal3f( -0.125292822629855,0.101451371172616,-0.986919109088804 );
    glTexCoord2f(0.6484148,0.90079628); glVertex3f(-0.18548047+$x,0.1993586+$y,-0.012668879+$z);
    glTexCoord2f(0.65504569,0.89662343); glVertex3f(-0.17099436+$x,0.217249+$y,-0.012668879+$z);
    glTexCoord2f(0.64906249,0.90939439); glVertex3f(-0.17823741+$x,0.172523+$y,-0.016347004+$z);

    glNormal3f( 0.882731524823825,-0.178690124627991,-0.434574383095273 );
    glTexCoord2f(0.63470997,0.89914922); glVertex3f(-0.21445269+$x,0.1993586+$y,-0.027381379+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.64083104,0.89692108); glVertex3f(-0.20720963+$x,0.20830381+$y,-0.016347004+$z);

    glNormal3f( -0.317361648566766,-0.089940213860845,-0.944029841662672 );
    glTexCoord2f(0.59075291,0.30248891); glVertex3f(-0.26080825+$x,0.5213858+$y,-0.056806379+$z);
    glTexCoord2f(0.58344498,0.31679902); glVertex3f(-0.25066798+$x,0.485605+$y,-0.056806379+$z);
    glTexCoord2f(0.58335771,0.29013519); glVertex3f(-0.29122909+$x,0.53033101+$y,-0.047431809+$z);

    glNormal3f( 0.48621508373095,0.467931120414549,0.737994145573046 );
    glTexCoord2f(0.85105641,0.90643102); glVertex3f(-0.12753602+$x,0.092016197+$y,0.026263457+$z);
    glTexCoord2f(0.84954835,0.8928106); glVertex3f(-0.13155994+$x,0.056235402+$y,0.05160165+$z);
    glTexCoord2f(0.86775452,0.90720817); glVertex3f(-0.09132074+$x,0.071144075+$y,0.015637763+$z);

    glNormal3f( 0.0125880731025357,-0.129108156623195,0.991550616110406 );
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.95524194,0.94236099); glVertex3f(0.14126184+$x,0.17848647+$y,0.017681165+$z);
    glTexCoord2f(0.93251357,0.92500023); glVertex3f(0.089755666+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( -0.432826168172668,0.0988492691570923,0.896041477908291 );
    glTexCoord2f(0.93696209,0.91718245); glVertex3f(0.10424178+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.96942928,0.91320556); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.94465098,0.92476412); glVertex3f(0.12741956+$x,0.14926549+$y,0.020378457+$z);

    glNormal3f( 0.0564680501605664,-0.989447155795358,-0.133437945126338 );
    glTexCoord2f(0.87924594,0.85898325); glVertex3f(-0.11015269+$x,0.485605+$y,0.040975956+$z);
    glTexCoord2f(0.85392047,0.85723884); glVertex3f(-0.18149679+$x,0.48001426+$y,0.052240215+$z);
    glTexCoord2f(0.87305635,0.8591357); glVertex3f(-0.12753602+$x,0.485605+$y,0.033619707+$z);

    glNormal3f( 0.124872392698439,0.578578865334129,-0.806010782887201 );
    glTexCoord2f(0.69438485,0.95001154); glVertex3f(-0.040619346+$x,0.092016197+$y,-0.012668879+$z);
    glTexCoord2f(0.7016853,0.97570036); glVertex3f(-0.011647121+$x,0.029399802+$y,-0.053128253+$z);
    glTexCoord2f(0.67016868,0.94280874); glVertex3f(-0.10580685+$x,0.10096141+$y,-0.016347004+$z);

    glNormal3f( -0.112106968214651,-0.0226936684105765,0.993436975903248 );
    glTexCoord2f(0.29728155,0.47191591); glVertex3f(0.22013067+$x,0.092016197+$y,0.055688457+$z);
    glTexCoord2f(0.28127559,0.47983397); glVertex3f(0.18391539+$x,0.1099066+$y,0.052010331+$z);
    glTexCoord2f(0.30048437,0.45609468); glVertex3f(0.22737373+$x,0.056235402+$y,0.055688457+$z);

    glNormal3f( 0.0881787409851361,0.713995773004453,0.694575082888848 );
    glTexCoord2f(0.82903761,0.93362433); glVertex3f(-0.18548047+$x,0.1635778+$y,0.026263457+$z);
    glTexCoord2f(0.85105036,0.93363128); glVertex3f(-0.12753602+$x,0.1635778+$y,0.018907206+$z);
    glTexCoord2f(0.83547337,0.9384581); glVertex3f(-0.17099436+$x,0.172523+$y,0.015229082+$z);

    glNormal3f( 0.246098152700388,0,-0.969244911896604 );
    glTexCoord2f(0.48836156,0.46529509); glVertex3f(-0.18548047+$x,0.092016197+$y,-0.056806379+$z);
    glTexCoord2f(0.49840833,0.46371821); glVertex3f(-0.17099436+$x,0.1099066+$y,-0.053128253+$z);
    glTexCoord2f(0.47777219,0.47704089); glVertex3f(-0.18548047+$x,0.056235402+$y,-0.056806379+$z);

    glNormal3f( -0.860483682638607,-0.147905810294155,-0.48753636089417 );
    glTexCoord2f(0.66943027,0.89034682); glVertex3f(-0.12753602+$x,0.23513941+$y,-0.027381379+$z);
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);

    glNormal3f( -0.632803382189474,-0.35822374911061,-0.686466040720662 );
    glTexCoord2f(0.66943027,0.89034682); glVertex3f(-0.12753602+$x,0.23513941+$y,-0.027381379+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.67540668,0.87779431); glVertex3f(-0.11826491+$x,0.2709202+$y,-0.054599504+$z);

    glNormal3f( -0.801780705636866,-0.0811516469753025,-0.592082857598196 );
    glTexCoord2f(0.66943027,0.89034682); glVertex3f(-0.12753602+$x,0.23513941+$y,-0.027381379+$z);
    glTexCoord2f(0.67271006,0.8966607); glVertex3f(-0.12029296+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( 0.0388585766625708,-0.0943929823248911,-0.994776344666263 );
    glTexCoord2f(0.72922306,0.9434899); glVertex3f(0.046297329+$x,0.12779701+$y,-0.012668879+$z);
    glTexCoord2f(0.71192896,0.94577501); glVertex3f(0.0028389911+$x,0.1099066+$y,-0.012668879+$z);
    glTexCoord2f(0.71966385,0.93437203); glVertex3f(0.017325104+$x,0.15463261+$y,-0.016347004+$z);

    glNormal3f( -0.924015698897284,0.0443371158340807,0.379775207656951 );
    glTexCoord2f(0.79962527,0.92466377); glVertex3f(0.22013067+$x,0.1993586+$y,-0.042093878+$z);
    glTexCoord2f(0.80360016,0.89554808); glVertex3f(0.21868207+$x,0.27628732+$y,-0.054599504+$z);
    glTexCoord2f(0.79528697,0.93804406); glVertex3f(0.21421798+$x,0.1635778+$y,-0.052302551+$z);

    glNormal3f( -0.0810137760539974,-0.40295928014676,-0.911625244622525 );
    glTexCoord2f(0.78930468,0.90998689); glVertex3f(0.19115845+$x,0.23513941+$y,-0.012668879+$z);
    glTexCoord2f(0.77824332,0.90228691); glVertex3f(0.15059734+$x,0.25660789+$y,-0.018553879+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);

    glNormal3f( -0.265043051008282,-0.262299863904546,-0.927874432511144 );
    glTexCoord2f(0.78930468,0.90998689); glVertex3f(0.19115845+$x,0.23513941+$y,-0.012668879+$z);
    glTexCoord2f(0.79590941,0.90436423); glVertex3f(0.204035+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.79495841,0.91365196); glVertex3f(0.21288762+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( -0.882731847344416,-0.178689787996097,0.434573866390771 );
    glTexCoord2f(0.98264503,0.96054775); glVertex3f(0.22013067+$x,0.23513941+$y,0.040975956+$z);
    glTexCoord2f(0.9785028,0.94974193); glVertex3f(0.21288762+$x,0.20830381+$y,0.015229082+$z);
    glTexCoord2f(0.98317589,0.95401288); glVertex3f(0.22013067+$x,0.217249+$y,0.033619707+$z);

    glNormal3f( -0.255088222083109,-0.82619519409842,0.502326089510742 );
    glTexCoord2f(0.96950287,0.97345078); glVertex3f(0.19115845+$x,0.2709202+$y,0.040975956+$z);
    glTexCoord2f(0.96115096,0.97441474); glVertex3f(0.16218623+$x,0.2709202+$y,0.026263457+$z);
    glTexCoord2f(0.97779225,0.9699247); glVertex3f(0.21288762+$x,0.26197501+$y,0.037297832+$z);

    glNormal3f( 0.0601159631066533,0.340737091118637,0.93823467518301 );
    glTexCoord2f(0.18967002,0.67759261); glVertex3f(-0.023236012+$x,0.55716661+$y,0.055688457+$z);
    glTexCoord2f(0.23450736,0.66968155); glVertex3f(0.078166776+$x,0.5392762+$y,0.055688457+$z);
    glTexCoord2f(0.18712671,0.68947711); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);

    glNormal3f( -0.116109203734291,-0.141022929979601,0.98317403649006 );
    glTexCoord2f(0.27934568,0.56684329); glVertex3f(0.17956957+$x,0.306701+$y,0.055688457+$z);
    glTexCoord2f(0.26973761,0.57475399); glVertex3f(0.1578404+$x,0.3245914+$y,0.055688457+$z);
    glTexCoord2f(0.27999376,0.55498467); glVertex3f(0.18101818+$x,0.2798654+$y,0.052010331+$z);

    glNormal3f( -0.0809021201754273,0.87452745316129,0.478180489583534 );
    glTexCoord2f(0.51022401,0.20772269); glVertex3f(-0.098563797+$x,0.5929474+$y,0.018190179+$z);
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);
    glTexCoord2f(0.50283358,0.22693707); glVertex3f(-0.029030456+$x,0.58400221+$y,0.046313888+$z);

    glNormal3f( -0.218189137160752,-0.247338976895749,-0.944042864987184 );
    glTexCoord2f(0.56976358,0.32567514); glVertex3f(-0.26080825+$x,0.44982421+$y,-0.056806379+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.55688428,0.31949968); glVertex3f(-0.29122909+$x,0.440879+$y,-0.047431809+$z);

    glNormal3f( 0.0721125702959809,0.0817467796983946,-0.994040864961924 );
    glTexCoord2f(0.57225274,0.3492937); glVertex3f(-0.22024715+$x,0.4140434+$y,-0.056806379+$z);
    glTexCoord2f(0.57088976,0.33741874); glVertex3f(-0.2405277+$x,0.4319338+$y,-0.056806379+$z);
    glTexCoord2f(0.58753053,0.35243272); glVertex3f(-0.18982631+$x,0.4319338+$y,-0.053128253+$z);

    glNormal3f( -0.960316339631294,-0.0706893099335882,0.269806503439532 );
    glTexCoord2f(0.47358985,0.13131174); glVertex3f(-0.30136937+$x,0.4140434+$y,0.018190179+$z);
    glTexCoord2f(0.46250284,0.12845819); glVertex3f(-0.30136937+$x,0.3782626+$y,0.0088156086+$z);
    glTexCoord2f(0.47676816,0.13343132); glVertex3f(-0.29412631+$x,0.42298861+$y,0.046313888+$z);

    glNormal3f( -0.0998300810542806,0.323334954788366,0.941003964884687 );
    glTexCoord2f(0.084622888,0.66177248); glVertex3f(-0.26080825+$x,0.5213858+$y,0.055688457+$z);
    glTexCoord2f(0.097433492,0.66572765); glVertex3f(-0.23183603+$x,0.53033101+$y,0.055688457+$z);
    glTexCoord2f(0.071190565,0.6697018); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);

    glNormal3f( -0.968227946456278,-0.180920304705856,0.172633968401933 );
    glTexCoord2f(0.45215203,0.12504928); glVertex3f(-0.30136937+$x,0.34248181+$y,0.018190179+$z);
    glTexCoord2f(0.44785402,0.12551973); glVertex3f(-0.30136937+$x,0.3245914+$y,-0.00055896092+$z);
    glTexCoord2f(0.44907762,0.12534232); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);

    glNormal3f( -0.385146165839139,0.233893790121347,0.892723991994212 );
    glTexCoord2f(0.079918539,0.57743986); glVertex3f(-0.27239715+$x,0.33055487+$y,0.055688457+$z);
    glTexCoord2f(0.085904704,0.5879402); glVertex3f(-0.25791104+$x,0.35440873+$y,0.055688457+$z);
    glTexCoord2f(0.069910443,0.57741148); glVertex3f(-0.29412631+$x,0.33055487+$y,0.046313888+$z);

    glNormal3f( 0.815485742403926,-0.220103446797781,-0.53529195458521 );
    glTexCoord2f(0.63927364,0.88259426); glVertex3f(-0.21445269+$x,0.23513941+$y,-0.042093878+$z);
    glTexCoord2f(0.64305779,0.88479688); glVertex3f(-0.21445269+$x,0.217249+$y,-0.034737629+$z);
    glTexCoord2f(0.63405162,0.88528921); glVertex3f(-0.22169575+$x,0.23513941+$y,-0.053128253+$z);

    glNormal3f( -0.0665263673156413,-0.412983663274276,-0.908305420175584 );
    glTexCoord2f(0.66007594,0.89005417); glVertex3f(-0.15650825+$x,0.23513941+$y,-0.012668879+$z);
    glTexCoord2f(0.65003663,0.88522273); glVertex3f(-0.20238094+$x,0.25601153+$y,-0.018799087+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);

    glNormal3f( -0.26504309016187,-0.262299976726956,-0.927874389433443 );
    glTexCoord2f(0.66007594,0.89005417); glVertex3f(-0.15650825+$x,0.23513941+$y,-0.012668879+$z);
    glTexCoord2f(0.66481965,0.88418136); glVertex3f(-0.14363171+$x,0.25104199+$y,-0.02084249+$z);
    glTexCoord2f(0.66592337,0.89365069); glVertex3f(-0.13477908+$x,0.2261942+$y,-0.016347004+$z);

    glNormal3f( 0.42510969674299,-0.344217268605531,0.837135722406367 );
    glTexCoord2f(0.86257442,0.92107568); glVertex3f(-0.098563797+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);
    glTexCoord2f(0.85501753,0.9155232); glVertex3f(-0.12029296+$x,0.1099066+$y,0.015229082+$z);

    glNormal3f( -0.0458291732525207,-0.111325491135868,0.992726710581693 );
    glTexCoord2f(0.86257442,0.92107568); glVertex3f(-0.098563797+$x,0.12779701+$y,0.011550957+$z);
    glTexCoord2f(0.87100782,0.91904348); glVertex3f(-0.076834627+$x,0.1188518+$y,0.011550957+$z);
    glTexCoord2f(0.86674221,0.92907263); glVertex3f(-0.084077684+$x,0.15463261+$y,0.015229082+$z);

    glNormal3f( -0.505367746933715,-0.0818407394603967,-0.859014280279272 );
    glTexCoord2f(0.42534647,0.12968751); glVertex3f(-0.27239715+$x,0.2709202+$y,-0.056806379+$z);
    glTexCoord2f(0.41134209,0.12794328); glVertex3f(-0.26515409+$x,0.2261942+$y,-0.056806379+$z);
    glTexCoord2f(0.43825067,0.12603161); glVertex3f(-0.29412631+$x,0.306701+$y,-0.047431809+$z);

    glNormal3f( -0.291740632240323,0.755925081433352,0.586058593282272 );
    glTexCoord2f(0.51309213,0.14349976); glVertex3f(-0.30136937+$x,0.55716661+$y,0.018190179+$z);
    glTexCoord2f(0.51136234,0.14447574); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);
    glTexCoord2f(0.5198965,0.16165145); glVertex3f(-0.25066798+$x,0.58400221+$y,0.0088156086+$z);

    glNormal3f( -0.954242290439314,-0.216345722530907,0.206436865602322 );
    glTexCoord2f(0.51309213,0.14349976); glVertex3f(-0.30136937+$x,0.55716661+$y,0.018190179+$z);
    glTexCoord2f(0.51044443,0.14442655); glVertex3f(-0.30136937+$x,0.5392762+$y,-0.00055896092+$z);
    glTexCoord2f(0.51136234,0.14447574); glVertex3f(-0.29122909+$x,0.5392762+$y,0.046313888+$z);

    glNormal3f( -0.0383110251273318,-0.995156414751544,0.0905316272500702 );
    glTexCoord2f(0.96810846,0.83389045); glVertex3f(0.11583067+$x,0.485605+$y,-0.042093878+$z);
    glTexCoord2f(0.96242161,0.85687742); glVertex3f(0.18654655+$x,0.48195391+$y,-0.052302551+$z);
    glTexCoord2f(0.9675203,0.83874561); glVertex3f(0.133214+$x,0.485605+$y,-0.034737629+$z);

    glNormal3f( -0.198899033409311,0.0402628369574216,0.979192564549477 );
    glTexCoord2f(0.84003484,0.94723483); glVertex3f(-0.15650825+$x,0.1993586+$y,0.011550957+$z);
    glTexCoord2f(0.84952026,0.93740928); glVertex3f(-0.13155994+$x,0.17351692+$y,0.017681165+$z);
    glTexCoord2f(0.848295,0.95402975); glVertex3f(-0.13477908+$x,0.217249+$y,0.015229082+$z);
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

