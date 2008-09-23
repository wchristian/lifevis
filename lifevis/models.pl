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

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 0,1,0 ); # top face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,0+$z);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
}

sub drawSingleEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);

    glNormal3f( -0.707106781186547,0.707106781186547,0 ); #  face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,0+$z);

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1.1); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(1,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
}

sub drawSingleNorthRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 0,0.707106781186547,0.707106781186547 ); # top south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0.1+$y,1+$z);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
}

sub drawSingleSouthRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0.1); glVertex3f(0+$x,0.1+$y,0+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(0,1.1); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0.707106781186547,-0.707106781186547 ); #  face
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,0+$z);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(0+$x,0.1+$y,0+$z);

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(1,1.1); glVertex3f(1+$x,1.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
}

sub drawSingleWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,0+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,0.1); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);

    glNormal3f( 0.707106781186547,0.707106781186547,0 ); # top right face
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,1+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,1.41421356); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1,1.41421356); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0.1+$y,1+$z);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0.1); glVertex3f(1+$x,0.1+$y,0+$z);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(1,1.1); glVertex3f(0+$x,1.1+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,1.1); glVertex3f(0+$x,1.1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
}

sub drawWall {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness);

    glNormal3f( 0,0,1 ); # south face
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,1+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,1+$y,1+$z);

    glNormal3f( 0,-1,0 ); # bottom face
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,0+$y,0+$z);

    glNormal3f( -1,0,0 ); # left face
    glTexCoord2f(1,1); glVertex3f(0+$x,1+$y,1+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,1+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,1+$y,1+$z);

    glNormal3f( 0,1,0 ); # top face
    glTexCoord2f(0,0); glVertex3f(0+$x,1+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(0+$x,1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,1+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(0+$x,1+$y,1+$z);

    glNormal3f( 1,0,0 ); # right face
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,1+$y,1+$z);
    glTexCoord2f(1,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,1+$z);

    glNormal3f( 0,0,-1 ); # north face
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(0,0); glVertex3f(1+$x,0+$y,0+$z);
    glTexCoord2f(1,1); glVertex3f(0+$x,1+$y,0+$z);
    glTexCoord2f(0,1); glVertex3f(1+$x,1+$y,0+$z);
    glTexCoord2f(1,0); glVertex3f(0+$x,0+$y,0+$z);
}