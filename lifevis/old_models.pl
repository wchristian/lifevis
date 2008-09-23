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

sub drawWall {
    my ($x, $y, $z, $s, $below, $north, $south, $west, $east) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + $s;
    my $zs = $z + $s;

    if ($below != WALL) {
        glNormal3f( 0,-1, 0); # Bottom Face.
        glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
        glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
        glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
        glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);
    }

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);

    if ($north != WALL) {    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    }

    if ($east != WALL) {    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    }

    if ($south != WALL) {    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    }

    if ($west != WALL) {    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
    }
}

sub drawFloor {
    my ($x, $y, $z, $s, $below, $north, $south, $west, $east) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;
    my $tex_y3 =0.1;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $zs = $z + $s;

    if ($below != WALL) {
        glNormal3f( 0,-1, 0); # Bottom Face.
        glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
        glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
        glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
        glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);
    }

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);

    if ($north == EMPTY) {    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y3); glVertex3f(  $x, $ys, $z);
    }

    if ($east == EMPTY) {    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $xs, $ys,  $z);
    }

    if ($south == EMPTY) {    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y3); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $xs, $ys, $zs);
    }

    if ($west == EMPTY) {    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $x, $ys,  $z);
    }
}

sub ourDrawCube {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + $s;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub ourDrawFloor {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;# $tex_num_x*$tex_const;
    my $tex_x2 =1;# $tex_num_x*$tex_const + $tex_const;
    my $tex_y1 =1;# $tex_num_y*$tex_const;
    my $tex_y2 =0;# $tex_num_y*$tex_const + $tex_const;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

#sub drawSingleNorthRamp {
#    my ($x, $y, $z, $s) = @_;
#    my $brightness = $y/($zcount-15);
#    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
#    my $tex_x1 =0;
#    my $tex_x2 =1;
#    my $tex_y1 =1;
#    my $tex_y2 =0;
#
#    my $xs = $x + $s;
#    my $ys = $y + 0.1*$s;
#    my $ys2 = $y + $s+0.1;
#    my $zs = $z + $s;
#
#    glNormal3f( 0,-1, 0); # Bottom Face.
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);
#
#    glNormal3f( 0, 1, 1); # Top face.
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
#    
#    glNormal3f( 0, 0,-1); # Far face.
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
#    
#    glNormal3f( 1, 0, 0); # Right face.
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
#    
#    glNormal3f( 0, 0, 1); # Front face.
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
#    
#    glNormal3f(-1, 0, 0); # Left Face.
#    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
#    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
#    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
#    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
#}

sub drawSingleNorthRamp {
    glEnd();
    glBegin(GL_TRIANGLES);
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





    glEnd();
    glBegin(GL_QUADS);
}

sub drawSingleNorthEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( -1, 1, 1); # Top face.
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawSingleSouthEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( -1, 1, -1); # Top face.
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawSingleSouthWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 1, 1, -1); # Top face.
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawSingleNorthWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 1, 1, 1); # Top face.
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
}

sub drawDoubleNorthEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( -1, 1, 1); # Top face.
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
}

sub drawDoubleNorthWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
}

sub drawDoubleSouthWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
}

sub drawDoubleSouthEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( -1, 1, -1); # Top face.
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawTripleNorthSouthEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $xs2 = $x + 0.5*$s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $ys3 = $y + ($s+0.1)*0.5;
    my $zs = $z + $s;
    my $zs2 = $z + 0.5*$s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top-North face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys3, $zs2);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs2, $ys3, $zs2);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);

    glNormal3f( 0, 1, 0); # Top-South face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys3,  $zs2);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs2, $ys3, $zs2);

    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);

    glNormal3f(-1, 0, 0); # North-Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs2);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys3, $zs2);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);

    glNormal3f(-1, 0, 0); # North-Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $zs2);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys3,  $zs2);
}

sub drawSingleSouthRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, -1); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawSingleEastRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( -1, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}

sub drawSingleWestRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 1, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys2, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys2,  $z);
}

sub ourDrawRamp {
    my ($x, $y, $z, $s) = @_;
    my $brightness = $y/($zcount-15);
    glColor3f($brightness, $brightness, $brightness); # Basic polygon color
    my $tex_x1 =0;
    my $tex_x2 =1;
    my $tex_y1 =1;
    my $tex_y2 =0;

    my $xs = $x + $s;
    my $ys = $y + 0.1*$s;
    my $ys2 = $y + $s+0.1;
    my $zs = $z + $s;

    glNormal3f( 0,-1, 0); # Bottom Face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);

    glNormal3f( 0, 1, 0); # Top face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0,-1); # Far face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $z);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
    
    glNormal3f( 1, 0, 0); # Right face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2,  $z);
    
    glNormal3f( 0, 0, 1); # Front face.
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys2, $zs);
    
    glNormal3f(-1, 0, 0); # Left Face.
    glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
    glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
    glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
    glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
}