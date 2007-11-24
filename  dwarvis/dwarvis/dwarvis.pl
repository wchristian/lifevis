#!/usr/bin/perl -w
use strict;
use warnings;

use OpenGL qw/ :all /;
use Image::BMP;
use Math::Trig;
$|++;

# Dwarf Fortress 3D Map Viewer
#
# The base intention of this program is to provide an OpenGL engine capable of
# rendering ascii-based map files in such a way as to semi-accurately display
# the interior layout of a dwarven fortress and surroundings.
#
# It is Public Domain software.
#
# This program based on this:
#
### ----------------------
### OpenGL cube demo.
###
### Written by Chris Halsall (chalsall@chalsall.com) for the
### O'Reilly Network on Linux.com (oreilly.linux.com).
### May 2000.
###
### Released into the Public Domain; do with it as you wish.
### We would like to hear about interesting uses.
###
### Coded to the groovy tunes of Yello: Pocket Universe.
###
### Translated from C to Perl by J-L Morel <jl_morel@bribes.org>
### ( http://www.bribes.org/perl/wopengl.html )


use constant PROGRAM_TITLE => "O'Reilly Net: OpenGL Demo -- C.Halsall";
use constant PI    => 4 * atan2(1, 1);

# Some global variables.

# Window and texture IDs, window width and height.
my $Window_ID;
my $Window_Width = 300;
my $Window_Height = 300;

# Our display mode settings.
my $Light_On = 1;
my $Texture_On = 1;

my $Curr_TexMode = 0;
my @TexModesStr = qw/ GL_DECAL GL_MODULATE GL_BLEND GL_REPLACE /;
my @TexModes = ( GL_DECAL, GL_MODULATE, GL_BLEND, GL_REPLACE );

my $cam_mode = 0; # 0 = fps ; 1 = rts

# Object and scene global variables.

# Camera position and rotation variables.
my ($X_Pos,$Y_Pos,$Z_Pos,$X_Off,$Y_Off,$Z_Off,$X_Rot,$Y_Rot);
if ($cam_mode == 0) {
    $X_Pos   = 4.5;
    $Y_Pos   = 5.5;
    $Z_Pos   = 11.5;
    $X_Off   =  0.0;
    $Y_Off   =  0.0;
    $Z_Off   = -20.0;
    $X_Rot   = 0.0;
    $Y_Rot   = 0.0;
}
if ($cam_mode == 1) {
    $X_Pos   = 0.5;
    $Y_Pos   = -5.0;
    $Z_Pos   = 0.5;
    $X_Off   =  0.0;
    $Y_Off   =  0.0;
    $Z_Off   = 20.0;
    $X_Rot   = 0.0;
    $Y_Rot   = 180.0;
}

my ( $Map_W, $Map_H, $Map_D );


# Settings for our light.  Try playing with these (or add more lights).
my @Light_Ambient  = ( 0.1, 0.1, 0.1, 1.0 );
my @Light_Diffuse  = ( 1.2, 1.2, 1.2, 1.0 );
my @Light_Position = ( 2.0, 2.0, 40.0, 1.0 );

my $piover180 = 0.0174532925; # pre-calced value for trig stuff further down
my $tex_const = 0.046875; # width or height of one texture field

my $range = 15; # view range


# ------
# Frames per second (FPS) statistic variables.

use constant CLOCKS_PER_SEC => 1000;
use constant FRAME_RATE_SAMPLES => 50;

my $FrameCount = 0;
my $FrameRate = 0;
my $last=0;

my (%special_inputs, %normal_inputs);   # hashes containing the functions called on certain key presses

my $last_mouse_x;
my $last_mouse_y;
my @map_data;
my @pre_compiled_map_data;
my @compiled_map_data;
my @sliced_map_data;
my %slice_cache;

my %displaylist;

my (%sin_cache, %cos_cache);

# ------
# The main() function.  Inits OpenGL.  Calls our own init function,
# then passes control onto OpenGL.

glutInit();

ourLoadMapData();

print "setting up OpenGL environment...   ";
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
glutInitWindowSize($Window_Width, $Window_Height);
glutInitWindowPosition(390,250);

$Window_ID = glutCreateWindow( PROGRAM_TITLE ); # Open a window

# Set up Callback functions ####################################################

glutDisplayFunc(\&cbRenderScene);               # Register the callback function to do the drawing.

glutIdleFunc(\&cbRenderScene);                  # If there's nothing to do, draw.

glutReshapeFunc(\&cbResizeScene);               # It's a good idea to know when our window's resized.

glutKeyboardFunc(\&cbKeyPressed);               # And let's get some keyboard input.
glutSpecialFunc(\&cbSpecialKeyPressed);

glutMotionFunc(\&cbMouseActiveMotion);

print "OpenGL environment ready.\n";

print "initializing OpenGL...\n";

ourInit($Window_Width, $Window_Height);         # OK, OpenGL's ready to go.  Let's call our own init function.

print "OpenGL initialized.\n";

# Print out a bit of help dialog.
print PROGRAM_TITLE, "\n";
print << 'TXT';
Use arrow keys to rotate, 'R' to reverse, 'X' to stop.
Page up/down will move cube away from/towards camera.
Use first letter of shown display mode settings to alter.
Q or [Esc] to quit; OpenGL window must have focus for input.
TXT
;

# Pass off control to OpenGL.
# Above functions are called as appropriate.
print "switching to main loop...\n";
glutMainLoop();


################################################################################
## Rendering Functions #########################################################
################################################################################

# ------
# Routine which actually does the drawing

sub cbRenderScene {
    my $buf; # For our strings.

    # Enables, disables or otherwise adjusts as appropriate for our current settings.

    if ($Texture_On) { glEnable(GL_TEXTURE_2D); }
    else { glDisable(GL_TEXTURE_2D); }

    if ($Light_On) { glEnable(GL_LIGHTING); }
    else { glDisable(GL_LIGHTING); }

    glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

    glEnable(GL_DEPTH_TEST);

    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);

    glMatrixMode(GL_MODELVIEW);    # Need to manipulate the ModelView matrix to move our model around.

    glLoadIdentity();    # Reset to 0,0,0; no rotation, no scaling.

    if ($cam_mode == 0) {
        gluLookAt($X_Pos,$Y_Pos,$Z_Pos,
        $X_Pos + $X_Off, $Y_Pos + $Y_Off, $Z_Pos + $Z_Off,
        0,1,0);
    }
    else {
        gluLookAt($X_Pos + $X_Off, $Y_Pos + $Y_Off, $Z_Pos + $Z_Off,
        $X_Pos,$Y_Pos,$Z_Pos,
        0,1,0);
    }

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);    # Clear the color and depth buffers.


    glBegin(GL_QUADS);    # OK, let's start drawing our planer quads.

    ourDrawMapCubes();
    ourDrawMapGround();

    glEnd();    # All polygons have been drawn.
    
    glCallList($displaylist{MY_CIRCLE_LIST});

    glLoadIdentity();    # Move back to the origin (for the text, below).

    glMatrixMode(GL_PROJECTION);    # We need to change the projection matrix for the text rendering.

    glPushMatrix();    # But we like our current view too; so we save it here.

    glLoadIdentity();    # Now we set up a new projection for the text.
    glOrtho(0,$Window_Width,0,$Window_Height,-1.0,1.0);

    glDisable(GL_TEXTURE_2D);    # Lit or textured text looks awful.
    glDisable(GL_LIGHTING);

    glDisable(GL_DEPTH_TEST);    # We don'$t want depth-testing either.

    glColor4f(0.6,1.0,0.6,.75);    # But, for fun, let's make the text partially transparent too.

    $buf = sprintf "Mode: %s", $TexModesStr[$Curr_TexMode];    # Render our various display mode settings.
    glRasterPos2i(2,2); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Light: %d", $Light_On;
    glRasterPos2i(2,38); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Tex: %d", $Texture_On;
    glRasterPos2i(2,50); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "X_Rot: %d", $X_Rot;
    glRasterPos2i(2,74); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Rot: %d", $Y_Rot;
    glRasterPos2i(2,86); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Z_Pos: %f", $Z_Pos;
    glRasterPos2i(2,98); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Pos: %f", $Y_Pos;
    glRasterPos2i(2,110); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "X_Pos: %f", $X_Pos;
    glRasterPos2i(2,122); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Z_Off: %f", $Z_Off;
    glRasterPos2i(2,134); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "Y_Off: %f", $Y_Off;
    glRasterPos2i(2,146); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    $buf = sprintf "X_Off: %f", $X_Off;
    glRasterPos2i(2,158); ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    # Now we want to render the calulated FPS at the top. To ease, simply translate up.  Note we're working in screen pixels in this projection.

    #    glTranslatef(6.0,$Window_Height - 14,0.0);
    #
    #    glColor4f(0.2,0.2,0.2,0.75);    # Make sure we can read the FPS section by first placing a dark, mostly opaque backdrop rectangle.
    #
    #    glBegin(GL_QUADS);
    #    glVertex3f(  0.0, -2.0, 0.0);
    #    glVertex3f(  0.0, 12.0, 0.0);
    #    glVertex3f(140.0, 12.0, 0.0);
    #    glVertex3f(140.0, -2.0, 0.0);
    #    glEnd();
    #
    #    glColor4f(0.9,0.2,0.2,.75);
    #    $buf = sprintf "FPS: %f F: %2d", $FrameRate, $FrameCount;
    #    glRasterPos2i(6,0);
    #    ourPrintString(GLUT_BITMAP_HELVETICA_12,$buf);

    glPopMatrix();    # Done with this special projection matrix.  Throw it away.

    glutSwapBuffers();    # All done drawing.  Let's show it.

    #ourDoFPS();    # And collect our statistics.
}

# ------
# Routine which draws all cubes in the map

sub ourDrawMapCubes {
    glColor3f(0.75, 0.75, 0.75); # Basic polygon color
    my $tex_num_x = 2;
    my $tex_num_y = 11;
    my $tex_x1 = $tex_num_x*$tex_const;
    my $tex_x2 = $tex_num_x*$tex_const + $tex_const;
    my $tex_y1 = $tex_num_y*$tex_const;
    my $tex_y2 = $tex_num_y*$tex_const + $tex_const;
    my $tex_y3 = $tex_num_y*$tex_const + ($tex_const/4)*3;

    for my $num ( 0..$#{ $sliced_map_data[1] } ) {
        my $x = $sliced_map_data[1][$num][0];
        my $y = $sliced_map_data[1][$num][1];
        my $z = $sliced_map_data[1][$num][2];
        my $s = $sliced_map_data[1][$num][3];
        my $top = $sliced_map_data[1][$num][4];
        my $bottom = $sliced_map_data[1][$num][5];
        my $front = $sliced_map_data[1][$num][6];
        my $back = $sliced_map_data[1][$num][7];
        my $right = $sliced_map_data[1][$num][8];
        my $left = $sliced_map_data[1][$num][9];
        my $xs = $x + $s;
        my $ys = $y + $s;
        my $zs = $z + $s;
        my $yh = $y + 0.25;

        if ( $X_Rot > -30  and $bottom == 2 ) {
            glNormal3f( 0,-1, 0); # Bottom Face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $y,  $z);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs, $y,  $z);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $y, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $y, $zs);
        }

        if ( $X_Rot < 30 and ( $top==-1 or $top==0 or $top==3 ) ) {
            glNormal3f( 0, 1, 0); # Top face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
        }

        if ( $back == 0 or $back == 3 ) {
            glNormal3f( 0, 0,-1); # Far face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
        }
        if ( $back == 2 ) {
            glNormal3f( 0, 0,-1); # Far face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
            glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $xs,  $yh, $z);
            glTexCoord2f($tex_x2,$tex_y3); glVertex3f(  $x,  $yh, $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
        }

        if ( $right == 0 or $right == 3 ) {
            glNormal3f( 1, 0, 0); # Right face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
        }
        if ( $right == 2 ) {
            glNormal3f( 1, 0, 0); # Right face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $xs,  $yh, $zs);
            glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $xs,  $yh,  $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
        }

        if ( $front == 0 or $front == 3 ) {
            glNormal3f( 0, 0, 1); # Front face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
        }
        if ( $front == 2 ) {
            glNormal3f( 0, 0, 1); # Front face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y3); glVertex3f(  $x,  $yh, $zs);
            glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $xs,  $yh, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
        }

        if ( $left == 0 or $left == 3 ) {
            glNormal3f(-1, 0, 0); # Left Face.
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
        }
        if ( $left == 2 ) {
            glNormal3f(-1, 0, 0); # Left Face.
            glTexCoord2f($tex_x1,$tex_y3); glVertex3f( $x,  $yh,  $z);
            glTexCoord2f($tex_x2,$tex_y3); glVertex3f( $x,  $yh, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
        }
    }
}

sub ourDrawMapGround {
    glColor3f(0.1, 0.1, 0.1); # Basic polygon color
    my $tex_num_x = 14;
    my $tex_num_y = 2;
    my $tex_x1 = $tex_num_x*$tex_const;
    my $tex_x2 = $tex_num_x*$tex_const + $tex_const;
    my $tex_y1 = $tex_num_y*$tex_const;
    my $tex_y2 = $tex_num_y*$tex_const + $tex_const;
    my $tex_y3 = $tex_num_y*$tex_const + $tex_const/2;

    for my $num ( 0..$#{ $sliced_map_data[2] } ) {
        my $x = $sliced_map_data[2][$num][0];
        my $y = $sliced_map_data[2][$num][1];
        my $z = $sliced_map_data[2][$num][2];
        my $s = $sliced_map_data[2][$num][3];
        my $top = $sliced_map_data[2][$num][4];
        my $bottom = $sliced_map_data[2][$num][5];
        my $front = $sliced_map_data[2][$num][6];
        my $back = $sliced_map_data[2][$num][7];
        my $right = $sliced_map_data[2][$num][8];
        my $left = $sliced_map_data[2][$num][9];
        my $xs = $x + $s;
        my $ys = $y + $s/4;
        my $zs = $z + $s;

        if ( $X_Rot > -30 and ( $bottom == 2 or $bottom == 3 ) ) {
            glNormal3f( 0,-1, 0); # Bottom Face.
            glTexCoord2f(0,    0); glVertex3f(  $x, $y,  $z);
            glTexCoord2f(0,    0); glVertex3f( $xs, $y,  $z);
            glTexCoord2f(0,    0); glVertex3f( $xs, $y, $zs);
            glTexCoord2f(0,    0); glVertex3f(  $x, $y, $zs);
        }

        if ( $X_Rot > -30 and ( $bottom == 2 or $bottom == 3 ) ) {
            glNormal3f( 0,-1, 0); # Bottom Face.
            glTexCoord2f(0,    0); glVertex3f(  $x, $y,  $z);
            glTexCoord2f(0,    0); glVertex3f( $xs, $y,  $z);
            glTexCoord2f(0,    0); glVertex3f( $xs, $y, $zs);
            glTexCoord2f(0,    0); glVertex3f(  $x, $y, $zs);
        }

        if ( $X_Rot < 30 and $top ) {
            glNormal3f( 0, 1, 0); # Top face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys,  $z);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x, $ys, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs, $ys, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
        }

        if ( $back == 0 or $back == 3 ) {
            glNormal3f( 0, 0,-1); # Far face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $z);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $z);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f(  $x,  $y, $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f(  $x, $ys, $z);
        }

        if ( $right == 0 or $right == 3) {
            glNormal3f( 1, 0, 0); # Right face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $xs, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $xs,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y,  $z);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys,  $z);
        }

        if ( $front == 0 or $front == 3 ) {
            glNormal3f( 0, 0, 1); # Front face.
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f(  $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f(  $x,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $xs,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $xs, $ys, $zs);
        }

        if ( $left == 0 or $left == 3) {
            glNormal3f(-1, 0, 0); # Left Face.
            glTexCoord2f($tex_x1,$tex_y2); glVertex3f( $x,  $y,  $z);
            glTexCoord2f($tex_x2,$tex_y2); glVertex3f( $x,  $y, $zs);
            glTexCoord2f($tex_x2,$tex_y1); glVertex3f( $x, $ys, $zs);
            glTexCoord2f($tex_x1,$tex_y1); glVertex3f( $x, $ys,  $z);
        }
    }
}


################################################################################
## 3D Maintenance ##############################################################
################################################################################

# ------
# Callback routine executed whenever our window is resized.  Lets us
# request the newly appropriate perspective projection matrix for
# our needs.  Try removing the gluPerspective() call to see what happens.

sub cbResizeScene {
    my ($Width, $Height) = @_;

    $Height = 1 if ($Height == 0);    # Let's not core dump, no matter what.

    glViewport(0, 0, $Width, $Height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,$Width/$Height,0.0001,100.0);

    glMatrixMode(GL_MODELVIEW);

    $Window_Width  = $Width;
    $Window_Height = $Height;
}

# ------
# Does everything needed before losing control to the main
# OpenGL event loop.

sub ourInit {
    my ($Width, $Height) = @_;

    ourBuildTextures();

    glClearColor(0.7, 0.7, 0.7, 0.0);    # Color to clear color buffer to.

    glClearDepth(1.0);    # Depth to clear depth buffer to; type of test.
    glDepthFunc(GL_LESS);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    glEnable(GL_CULL_FACE);

    glShadeModel(GL_SMOOTH);    # Enables Smooth Color Shading; try GL_FLAT for (lack of) fun.

    cbResizeScene($Width, $Height);    # Load up the correct perspective matrix; using a callback directly.

    glLightfv_p(GL_LIGHT1, GL_POSITION, @Light_Position);    # Set up a light, turn it on.
    glLightfv_p(GL_LIGHT1, GL_AMBIENT,  @Light_Ambient);
    glLightfv_p(GL_LIGHT1, GL_DIFFUSE,  @Light_Diffuse);
    glEnable (GL_LIGHT1);
    
    glColorMaterial(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE);    # A handy trick -- have surface material mirror the color.
    glEnable(GL_COLOR_MATERIAL);
    
    $displaylist{MY_CIRCLE_LIST} = 1;
    glNewList($displaylist{MY_CIRCLE_LIST}, GL_COMPILE);
    glBegin(GL_POLYGON);
    for my $j (0..99){
    for my $i (0..99){
        my $cos=cos($i*2*PI/100.0);
        my $sin=sin($i*2*PI/100.0);
        glVertex2f($cos+$j,$sin+$j);
    }
    }
    glEnd();
    glEndList();
}


################################################################################
## Texture Stuff ###############################################################
################################################################################

# ------
# Function to build a simple full-color texture with alpha channel,
# and then create mipmaps.  This could instead load textures from
# graphics files from disk, or render textures based on external
# input.

sub ourBuildTextures {
    my $gluerr;
    my $hole_size = 3300; # ~ == 57.45 ^ 2.

    my @Texture_ID = glGenTextures_p(1);    # Generate a texture index, then bind it for future operations.
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[0]);

    print "loading texture...   ";
    my $img = new Image::BMP(
    file            => 'curses3_960x300.bmp',
    debug           => 0,
    );
    my $w = $img->{Width};
    my $h = $img->{Height};

    my $tw = 256 if ( $w > 128 and $w < 256);
    my $th = 256 if ( $h > 128 and $h < 256);

    # Iterate across the texture array.
    my $fulltex;
    for my $y (0..$th-1) {
        for my $x (0..$tw-1) {
            my ($r,$g,$b) = (0,0,0);
            my $a = 255;
            if ($x < $w and $y < $h) {
                ($r,$g,$b) = $img->xy_rgb($x,$y);
                $a = 0 if ( $r == 255 and $g == 0 and $b == 255 );
            }
            else { $a = 0; }
            $fulltex .= pack "C4", $r, $g, $b, $a;
        }
    }

    # The GLU library helps us build MipMaps for our texture.
    if ( ( $gluerr = gluBuild2DMipmaps_s(GL_TEXTURE_2D, 4, $tw, $th, GL_RGBA, GL_UNSIGNED_BYTE, $fulltex) ) ) {
        printf STDERR "GLULib%s\n", gluErrorString($gluerr);
        exit(-1);
    }

    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);    # Some pretty standard settings for wrapping and filtering.
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_REPEAT);

    glTexEnvf(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_DECAL);    # We start with GL_DECAL mode.
    print "texture loaded.\n";
}


################################################################################
## Input Stuff #################################################################
################################################################################

# Callback function called when a normal $key is pressed. ######################

sub cbKeyPressed {
    my $key = shift;
    my $c = uc chr $key;

    unless ( $normal_inputs{exist_check} ) {
        $normal_inputs{exist_check} = 1;
        $normal_inputs{108} = sub { $Light_On       = $Light_On     ? 0 : 1;        }; # L
        $normal_inputs{116} = sub { $Texture_On     = $Texture_On   ? 0 : 1;        }; # T

        #        $normal_inputs{97} = sub { $Y_Rot += 2.5; }; # Q
        #        $normal_inputs{100} = sub { $Y_Rot -= 2.5; }; # E
        $normal_inputs{97} = sub {
            if ($cam_mode == 0) {
                my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * $piover180);
                my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * $piover180);
                $X_Pos -= $cos_y * 0.25;
                $Z_Pos -= $sin_y * 0.25;
            }
            else {
                $X_Pos -= 1;
            }
            ourResliceMapData();
        }; # A
        $normal_inputs{100} = sub {
            if ($cam_mode == 0) {
                my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * $piover180);
                my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * $piover180);
                $X_Pos += $cos_y * 0.25;
                $Z_Pos += $sin_y * 0.25;
            }
            else {
                $X_Pos += 1;
            }
            ourResliceMapData();
        }; # D
        $normal_inputs{119} = sub {
            if ($cam_mode == 0) {
                my $cos_x = $cos_cache{$X_Rot} ||= cos($X_Rot * $piover180);
                my $sin_x = $sin_cache{$X_Rot} ||= sin($X_Rot * $piover180);
                my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * $piover180);
                my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * $piover180);
                $X_Pos += $sin_y * $cos_x * 0.25;
                $Y_Pos += $sin_x * 0.25;
                $Z_Pos -= $cos_y * $cos_x * 0.25;
            }
            else {
                $Z_Pos -= 1;
            }
            ourResliceMapData();
        }; # W
        $normal_inputs{115} = sub {
            if ($cam_mode == 0) {
                my $cos_x = $cos_cache{$X_Rot} ||= cos($X_Rot * $piover180);
                my $sin_x = $sin_cache{$X_Rot} ||= sin($X_Rot * $piover180);
                my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * $piover180);
                my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * $piover180);
                $X_Pos -= $sin_y * $cos_x * 0.25;
                $Y_Pos -= $sin_x * 0.25;
                $Z_Pos += $cos_y * $cos_x * 0.25;
            }
            else {
                $Z_Pos += 1;
            }
            ourResliceMapData();
        }; # S

        $normal_inputs{113} = sub {
            $Y_Rot -= 2;
            $Y_Rot -= 360 if ($Y_Rot > 360);
            $Y_Rot += 360 if ($Y_Rot < 0);
            ourOrientMe();
        }; # Q

        $normal_inputs{101} = sub {
            $Y_Rot += 2;
            $Y_Rot -= 360 if ($Y_Rot > 360);
            $Y_Rot += 360 if ($Y_Rot < 0);
            ourOrientMe();
        }; # E

        $normal_inputs{114} = sub { $Y_Pos += 1; ourResliceMapData();               }; # R
        $normal_inputs{102} = sub { $Y_Pos -= 1; ourResliceMapData();                }; # F

        $normal_inputs{27} = sub { glutDestroyWindow($Window_ID); exit(1);           }; # ESC

        #$normal_inputs{102} = sub { $Filtering_On   = $Filtering_On ? 0 : 1;        }; # F
        #$normal_inputs{120} = sub { $X_Speed = $Y_Speed = 0;                        }; # X
        #$normal_inputs{32} = $normal_inputs{120};

        $normal_inputs{109} = sub {                                                    # M
            $Curr_TexMode=0 if ( ++ $Curr_TexMode > 3 );
            glTexEnvi(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,$TexModes[$Curr_TexMode]);
        };
    }

    if ( $normal_inputs{$key} ) {
        $normal_inputs{$key}->();
        return;
    }

    printf "KP: No action for %d.\n", $key;
}

# Callback Function called when a special $key is pressed. #####################

sub cbSpecialKeyPressed {
    my $key = shift;

    unless ( $special_inputs{exist_check} ) {
        $special_inputs{exist_check} = 1;
        $special_inputs{104} = sub { $Z_Off -= 0.05;     }; # GLUT_KEY_PAGE_UP
        $special_inputs{105} = sub { $Z_Off += 0.05;     }; # GLUT_KEY_PAGE_DOWN
        #$special_inputs{101} = sub { $X_Speed -= 0.01;   }; # GLUT_KEY_UP
        #$special_inputs{103} = sub { $X_Speed += 0.01;   }; # GLUT_KEY_DOWN
        #$special_inputs{100} = sub { $Y_Speed -= 0.01;   }; # GLUT_KEY_LEFT
        #$special_inputs{102} = sub { $Y_Speed += 0.01;   }; # GLUT_KEY_RIGHT
    }

    if ( $special_inputs{$key} ) {
        $special_inputs{$key}->();
        return;
    }

    printf "SKP: No action for %d.\n", $key;
}

sub cbMouseActiveMotion {
    my ($x, $y) = @_;
    my ($new_x, $new_y) = (0, 0);
    $new_x = $x - $last_mouse_x if ($last_mouse_x);
    $new_y = $y - $last_mouse_y if ($last_mouse_y);

    if ( $new_x < 30  and $new_x > -30 ) { # $x > 0 and $x < 300 and
        $Y_Rot -= (180 * $new_x / 300) * -1;
        $Y_Rot -= 360 if ($Y_Rot > 360);
        $Y_Rot += 360 if ($Y_Rot < 0);
    }

    if ( $new_y < 30  and $new_y > -30 ) { # $x > 0 and $x < 300 and
        my $diff = (180 * $new_y / 300) * -1;
        $X_Rot += $diff if( ($X_Rot + $diff) > -90 and ($X_Rot + $diff) < 90 );
    }
    $last_mouse_x = $x;
    $last_mouse_y = $y;
    ourOrientMe();
}

sub ourOrientMe {
    my $cos_y = $cos_cache{$Y_Rot} ||= cos($Y_Rot * $piover180);
    my $sin_y = $sin_cache{$Y_Rot} ||= sin($Y_Rot * $piover180);
    my $sin_x = $sin_cache{$X_Rot} ||= sin($X_Rot * $piover180);
    my $cos_x = $cos_cache{$X_Rot} ||= cos($X_Rot * $piover180);

    if ($cam_mode == 0) {
        $X_Off = $sin_y * $cos_x;
        $Y_Off = $sin_x;
        $Z_Off = -$cos_y * $cos_x;
    }
    else {
        $X_Off = ($sin_y * $cos_x) * 20;
        $Y_Off = (-$sin_x) * 20;
        $Z_Off = (-$cos_y * $cos_x) * 20;
    }
}

################################################################################
## Map Stuff ###################################################################
################################################################################


sub ourLoadMapData {
    my $map_directory = '.';

    print "reading map files...   ";

    opendir my $DIR, $map_directory or die "can't opendir $map_directory: $!";
    my @map_files = grep { /map.*txt/ && -f "$map_directory/$_" } readdir $DIR;
    closedir $DIR;

    for my $map_file (@map_files) {
        open my $DAT, '<', $map_file or die "horribly: $!";
        push @map_data, [ <$DAT> ];
        close $DAT;
    }

    print "map files read.\n";

    print "inserting map data into internal 3d grid...   ";

    $Map_H = $#map_data;
    for my $y ( 0..$Map_H ) {

        $Map_D = $#{ $map_data[0] } unless ( $Map_D );
        for my $z ( 0..$Map_D ) {
            chomp($map_data[$y][$z]);
            my @line_data = split //, $map_data[$y][$z];

            $Map_W = $#line_data unless ( $Map_W );
            for my $x (0..$Map_W) {
                $pre_compiled_map_data[$x][$y][$z] = 0 if ( $line_data[$x] eq ' ' );
                $pre_compiled_map_data[$x][$y][$z] = 1 if ( $line_data[$x] eq '#' );
                $pre_compiled_map_data[$x][$y][$z] = 2 if ( $line_data[$x] eq '.' );
                $pre_compiled_map_data[$x][$y][$z] = 3 if ( $line_data[$x] eq '_' );
            }
        }
    }

    print "3d grid created.\n";

    print "parsing 3d grid into map component list...   ";

    for my $y ( 0..$Map_H ) {
        for my $z ( 0..$Map_D ) {
            for my $x (0..$Map_W) {
                if ( $pre_compiled_map_data[$x][$y][$z] > 0 ) {
                    my @cube;
                    my $type = $pre_compiled_map_data[$x][$y][$z];
                    $cube[0] = $x;
                    $cube[1] = $y;
                    $cube[2] = $z;
                    $cube[3] = 1;
                    for my $i (4..9) { $cube[$i] = -1; }
                    $cube[4] = $pre_compiled_map_data[$x][$y+1][$z] if ($pre_compiled_map_data[$x][$y+1][$z] and $y < $Map_H ); # top
                    $cube[5] = $pre_compiled_map_data[$x][$y-1][$z] if ($pre_compiled_map_data[$x][$y-1][$z] and $y > 0 ); # bottom
                    $cube[6] = $pre_compiled_map_data[$x][$y][$z+1] if ($pre_compiled_map_data[$x][$y][$z+1] and $z < $Map_D ); # front
                    $cube[7] = $pre_compiled_map_data[$x][$y][$z-1] if ($pre_compiled_map_data[$x][$y][$z-1] and $z > 0 ); # back
                    $cube[8] = $pre_compiled_map_data[$x+1][$y][$z] if ($pre_compiled_map_data[$x+1][$y][$z] and $x < $Map_W ); # right
                    $cube[9] = $pre_compiled_map_data[$x-1][$y][$z] if ($pre_compiled_map_data[$x-1][$y][$z] and $x > 0 ); # left
                    #                    if ( $type == 1 ) {
                    #                        $cube[4] = 1 unless ( $y < $Map_H and $pre_compiled_map_data[$x][$y+1][$z] > 0 ); # top
                    #                        $cube[5] = 1 unless ( $pre_compiled_map_data[$x][$y-1][$z] == 1 ); # bottom
                    #                        $cube[6] = 1 unless ( $z < $Map_D and $pre_compiled_map_data[$x][$y][$z+1] == 1 ); # front
                    #                        $cube[7] = 1 unless ( $pre_compiled_map_data[$x][$y][$z-1] == 1 ); # back
                    #                        $cube[8] = 1 unless ( $x < $Map_W and $pre_compiled_map_data[$x+1][$y][$z] == 1 ); # right
                    #                        $cube[9] = 1 unless ( $pre_compiled_map_data[$x-1][$y][$z] == 1 ); # left
                    #                    }
                    #                    if ( $type == 2 ) {
                    #                        $cube[4] = 1; # unless ( $y < $Map_H and $pre_compiled_map_data[$x][$y+1][$z] > 0 ); # top
                    #                        $cube[5] = 1 unless ( $pre_compiled_map_data[$x][$y-1][$z] < 2 ); # bottom
                    #                        $cube[6] = 1 unless ( $z < $Map_D and $pre_compiled_map_data[$x][$y][$z+1] > 0 ); # front
                    #                        $cube[7] = 1 unless ( $pre_compiled_map_data[$x][$y][$z-1] > 0 ); # back
                    #                        $cube[8] = 1 unless ( $x < $Map_W and $pre_compiled_map_data[$x+1][$y][$z] > 0 ); # right
                    #                        $cube[9] = 1 unless ( $pre_compiled_map_data[$x-1][$y][$z] > 0 ); # left
                    #                    }
                    next unless ( $cube[4] or $cube[5] or $cube[6] or $cube[7] or $cube[8] or $cube[9] );
                    push @{ $compiled_map_data[$type] }, [ @cube ];
                }
            }
        }
    }
    #    print "$#compiled_map_data\n";
    #    print "$#{ $compiled_map_data[1] }\n";
    #    print "$#{ $compiled_map_data[2] }\n";

    print "component list created.\n";

    print "creating initial view slice...   ";

    ourResliceMapData();

    print "intial view slice created.\n";
}

sub ourResliceMapData {
    my $slice_id = int($X_Pos) . ':' . int($Y_Pos) .  ':' . int($Z_Pos);
    #    print "$slice_id\n";

    if ( $slice_cache{$slice_id} ) {
        @sliced_map_data = @{ $slice_cache{$slice_id} };
    }
    else {
        @sliced_map_data = ();
        for my $type ( 0..$#compiled_map_data ) {
            my $counter = 0;
            for my $num ( 0..$#{ $compiled_map_data[$type] } ) {
                my $x = $compiled_map_data[$type][$num][0];
                next if ( $x > $X_Pos+$range or $X_Pos-$range > $x );
                my $y = $compiled_map_data[$type][$num][1];
                next if ( $y-$range > $Y_Pos or $y+$range < $Y_Pos );
                my $z = $compiled_map_data[$type][$num][2];
                next if ( $z > $Z_Pos+$range or $Z_Pos-$range > $z );
                my $s = $compiled_map_data[$type][$num][3];
                my $top = $compiled_map_data[$type][$num][4];
                my $bottom = $compiled_map_data[$type][$num][5];
                my $front = $compiled_map_data[$type][$num][6];
                my $back = $compiled_map_data[$type][$num][7];
                my $right = $compiled_map_data[$type][$num][8];
                my $left = $compiled_map_data[$type][$num][9];

                $sliced_map_data[$type][$counter][0] = $x;
                $sliced_map_data[$type][$counter][1] = $y;
                $sliced_map_data[$type][$counter][2] = $z;
                $sliced_map_data[$type][$counter][3] = $s;
                $sliced_map_data[$type][$counter][4] = $top;
                $sliced_map_data[$type][$counter][5] = $bottom;
                $sliced_map_data[$type][$counter][6] = $front;
                $sliced_map_data[$type][$counter][7] = $back;
                $sliced_map_data[$type][$counter][8] = $right;
                $sliced_map_data[$type][$counter][9] = $left;

                $counter++;
            }
        }

        $slice_cache{$slice_id} = [ @sliced_map_data ];
    }
    #    print "$#sliced_map_data\n";
    #    print "$#{ $sliced_map_data[1] }\n";
    #    print "$#{ $sliced_map_data[2] }\n";
}

################################################################################
## Helper Stuff ################################################################
################################################################################

# ------
# Frames per second (FPS) statistic routine.

sub ourDoFPS {
    my ($now, $delta);

    if (++$FrameCount >= FRAME_RATE_SAMPLES) {
        $now   = Win32::GetTickCount(); # clock();
        $delta = ($now - $last) / CLOCKS_PER_SEC;
        $last  = $now;

        $FrameRate = FRAME_RATE_SAMPLES / $delta;
        $FrameCount = 0;
    }
}

# ------
# String rendering routine; leverages on GLUT routine.

sub ourPrintString {
    my ($font, $str) = @_;
    my @c = split '', $str;

    for(@c) {
        glutBitmapCharacter($font, ord $_);
    }
}

__END__


backup stuff:

sub ourBuildTextures {
    my $gluerr;
    my $hole_size = 3300; # ~ == 57.45 ^ 2.

    my @Texture_ID = glGenTextures_p(1);    # Generate a texture index, then bind it for future operations.
    glBindTexture(GL_TEXTURE_2D, $Texture_ID[0]);

    # Iterate across the texture array.

    $color_transparent =

    my ($tex,$alpha,$fulltex);
    for my $y (0..100) {
        for my $x (0..100) {

            # A simple repeating squares pattern. Dark blue on white.
            $tex = pack "C3", 240, 240, 240; # White
            $tex = pack ("C3", 0,0,120) if ( $y < 30 and $y > 10 ); # White
            $tex = pack ("C3", 0,0,120) if ( ( ($x+4)%32 < 8 ) && ( ($y+4)%32 < 8)); # Dark blue
            $tex = pack ("C3", 120,0,120) if ( ($x == 0) or ($x == 127) or ($y == 0) or ($y == 127) ); # purple

            # Make a round dot in the texture's alpha-channel.
            my $t = ($x-64)*($x-64) + ($y-64)*($y-64);            # Calculate distance to center (squared).
            $alpha = pack "C", 0;    # Outside of the dot, it's transparent.
            $alpha = pack ("C", 128) if ( $t < $hole_size + 100 ); # Give our dot an anti-aliased edge.
            $alpha = pack ("C", 255) if ( $t < $hole_size ); # The dot itself is opaque. Don't take square root; compare squared.

            $fulltex .= $tex.$alpha;
        }
    }

    # The GLU library helps us build MipMaps for our texture.
    if ( ( $gluerr = gluBuild2DMipmaps_s(GL_TEXTURE_2D, 4, 101, 101, GL_RGBA, GL_UNSIGNED_BYTE, $fulltex) ) ) {
        printf STDERR "GLULib%s\n", gluErrorString($gluerr);
        exit(-1);
    }

    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);    # Some pretty standard settings for wrapping and filtering.
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_REPEAT);

    glTexEnvf(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_DECAL);    # We start with GL_DECAL mode.
}