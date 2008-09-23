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

our $zcount;



sub drawFloor {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,0.1);
    glTexCoord2f(3.3306691e-016,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1.5,8.3266727e-016); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0.15); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(1.5,1.6653345e-016); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1.5,1.5); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0,0.1);
    glTexCoord2f(0,0.15); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1.5,8.3266727e-016); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1.5,0.15); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( -0.1,0,0);
    glTexCoord2f(1.5,0.15); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,1.9984014e-015); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1.5,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( 0,1,0);
    glTexCoord2f(1.6653345e-016,0); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1.5,1.5); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.5); glVertex3f(0+$x,0.1+$y,0+$z);

    glNormal3f( 0,1,0);
    glTexCoord2f(1.5,3.3306691e-016); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1.5,1.5); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1.6653345e-016,0); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1.5,1.5); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1.5); glVertex3f(1+$x,0+$y,0+$z);

    glNormal3f( 0.1,0,0);
    glTexCoord2f(0,2.220446e-015); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1.5,0.15); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.15); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,0,-0.1);
    glTexCoord2f(1.5,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1.110223e-016,0.15); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,8.8817842e-016); glVertex3f(1+$x,0+$y,0+$z);

    glNormal3f( -0.1,0,0);
    glTexCoord2f(0,0.15); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.9984014e-015); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1.5,0.15); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 0,0,-0.1);
    glTexCoord2f(1.5,0.15); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1.110223e-016,0.15); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1.5,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 0.1,0,0);
    glTexCoord2f(1.5,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1.5,0.15); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,2.220446e-015); glVertex3f(1+$x,0+$y,1+$z);
}

sub drawSingleNorthRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,0.1);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0,0.1);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( -0.1,0,0);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( -1.1,0,0);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 0,1,1);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0+$x,1.1+$y,0+$z);

    glNormal3f( 0,1,1);
    glTexCoord2f(1,0); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 1.1,0,0);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1.1); glVertex3f(1+$x,1.1+$y,0+$z);

    glNormal3f( 0.1,0,0);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0,-1.1);
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 0,0,-1.1);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
}

sub drawSingleWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0.1,0,0);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1.110223e-016+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1.110223e-016+$z);

    glNormal3f( 0.1,0,0);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1.110223e-016+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1.110223e-016+$z);

    glNormal3f( 0,0,0.1);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0,1.1);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( 1,1,6.123234e-017);
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(6.123234e-017+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0+$x,1.1+$y,1+$z);

    glNormal3f( 1,1,0);
    glTexCoord2f(1,0); glVertex3f(1+$x,0.1+$y,1.110223e-016+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(6.123234e-017+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 1.2212453e-016,0,-1.1);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1.110223e-016+$z);
    glTexCoord2f(1,0); glVertex3f(6.123234e-017+$x,0+$y,0+$z);
    glTexCoord2f(1,1.1); glVertex3f(6.123234e-017+$x,1.1+$y,0+$z);

    glNormal3f( 1.110223e-017,0,-0.1);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1.110223e-016+$z);
    glTexCoord2f(1,0); glVertex3f(6.123234e-017+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1.110223e-016+$z);

    glNormal3f( 0,-1,0);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(6.123234e-017+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1.110223e-016+$z);

    glNormal3f( -1.1,0,-6.7355574e-017);
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(6.123234e-017+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( -1.1,0,-6.7355574e-017);
    glTexCoord2f(0,1.1); glVertex3f(6.123234e-017+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(6.123234e-017+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
}