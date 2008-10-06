package Lifevis::models;
    use strict;
    
    use base 'Exporter';
    
    use lib '.';
    use lib '..';
    use Lifevis::constants;
    
    our @EXPORT = ( qw( get_model_subs set_zcount_for_models ) );
    
    my $ZCOUNT;
    
    my %DRAW_MODEL;
    
    



$DRAW_MODEL{'1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,1.22474487); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,1.22474487); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,1.22474487); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,1.22474487); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1D_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.6); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,0.6); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,-0.5); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,0.6); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,5.5511151e-017); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,5.5511151e-017); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,5.5511151e-017); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(2.220446e-016,1.110223e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(2.220446e-016,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.110223e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(2.220446e-016,1.110223e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.66804649,0.60101099); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(-0.20036884,0.83370217); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.032322347,-0.034713159); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(-0.20036884,0.09963116); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.66804649,0.33232235); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.032322347,0.96804649); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1D_1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.6); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,0.6); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,-0.5); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-1.110223e-016,0.6); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,5.5511151e-017); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,5.5511151e-017); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,5.5511151e-017); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(5.5511151e-017,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(2.220446e-016,1.110223e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(2.220446e-016,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.110223e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(2.220446e-016,1.110223e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.66804649,0.60101099); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(-0.20036884,0.83370217); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.032322347,-0.034713159); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(-0.20036884,0.09963116); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.66804649,0.33232235); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.032322347,0.96804649); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'1S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'1S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'1S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_1DL1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.38890873,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DL2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.38890873,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DL3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.38890873,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DL4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.38890873,0); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.38890873,0.55); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.41421356); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_1DR1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1.00237868,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.55002111); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.95806318,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.31755483,1.10315914); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'1S_1DR2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.55002111); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.95806318,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.31755483,1.10315914); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DR3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1.00237868,1.41757752); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.55002111); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.95806318,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.31755483,1.10315914); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_1DR4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.59787551); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,0.70878876); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.00237868,1.41757752); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.55002111); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.95806318,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.31755483,1.10315914); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'1S_1S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
};

$DRAW_MODEL{'1S_1S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
};



$DRAW_MODEL{'1S_2D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
};

$DRAW_MODEL{'1S_2D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
};

$DRAW_MODEL{'1S_2D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
};

$DRAW_MODEL{'1S_2D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
};



$DRAW_MODEL{'2D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,1.06897265); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.28643036,0); OpenGL::glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.451801,0.61717165); OpenGL::glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    OpenGL::glTexCoord2f(0,1.3519151); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.97487984,1.3519151); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61717165); OpenGL::glVertex3f(-5.5511151e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.16537064,0); OpenGL::glVertex3f(0+$x,-0.4+$y,1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.451801,1.06897265); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,1.06897265); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.28643036,0); OpenGL::glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    OpenGL::glTexCoord2f(0.451801,0.61717165); OpenGL::glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    OpenGL::glTexCoord2f(0,1.3519151); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.97487984,1.3519151); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61717165); OpenGL::glVertex3f(-0.5+$x,0.1+$y,2.48959921544406e-017+$z);
    OpenGL::glTexCoord2f(0.16537064,0); OpenGL::glVertex3f(1.110223e-016+$x,-0.4+$y,6.79793069979871e-033+$z);
    OpenGL::glTexCoord2f(0.451801,1.06897265); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,1.06897265); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.28643036,0); OpenGL::glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.451801,0.61717165); OpenGL::glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    OpenGL::glTexCoord2f(0,1.3519151); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.97487984,1.3519151); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61717165); OpenGL::glVertex3f(-5.71916669111886e-018+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.16537064,0); OpenGL::glVertex3f(1.35958613995974e-032+$x,-0.4+$y,-1.110223e-016+$z);
    OpenGL::glTexCoord2f(0.451801,1.06897265); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'2D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.8857806e-016,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,1.06897265); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.28643036,0); OpenGL::glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    OpenGL::glTexCoord2f(0.451801,0.61717165); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    OpenGL::glTexCoord2f(0,1.3519151); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,2.220446e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.97487984,1.3519151); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.97487984,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.48743992,0.40557453); OpenGL::glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61717165); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.63343255366783e-017+$z);
    OpenGL::glTexCoord2f(0.16537064,0); OpenGL::glVertex3f(-1.110223e-016+$x,-0.4+$y,-2.03937920993961e-032+$z);
    OpenGL::glTexCoord2f(0.451801,1.06897265); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'2S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.70710678,-0.22474487); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};

$DRAW_MODEL{'2S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.70710678,-0.22474487); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'2S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.70710678,-0.22474487); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
};

$DRAW_MODEL{'2S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.70710678,-0.22474487); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.41421356,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'2S_1D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.06,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.35,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.70479502,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'2S_1D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.35,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70479502,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1.06,0); OpenGL::glVertex3f(3.06151588455594e-017+$x,0.1+$y,-0.5+$z);
};

$DRAW_MODEL{'2S_1D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.35,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.70479502,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.06,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-6.12303176911189e-017+$z);
};

$DRAW_MODEL{'2S_1D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.35,0.61); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70479502,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(1.41,0.61); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.35,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1.06,0); OpenGL::glVertex3f(-9.18454765366783e-017+$x,0.1+$y,0.5+$z);
};



$DRAW_MODEL{'3D1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.4); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1.4); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.4); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1.4); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-3.06151588455594e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3D3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.4); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1.4); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-6.12303176911189e-017+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,6.12303176911189e-017+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3D4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.4); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1.4); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.7); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(9.18454765366783e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.7); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'3S1'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3S2'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,3.06151588455594e-017+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};

$DRAW_MODEL{'3S3'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(6.12303176911189e-017+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
};

$DRAW_MODEL{'3S4'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,-9.18454765366783e-017+$z);
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'4D'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.6); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,-0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.5); OpenGL::glVertex3f(0.5+$x,0.1+$y,0+$z);

    OpenGL::glNormal3f( 0.577350269189626,0.577350269189626,0.577350269189626 );
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0.70710678,0); OpenGL::glVertex3f(0+$x,0.1+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.35355339,0.61237244); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
};



$DRAW_MODEL{'4S'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1.1); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.1); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(0,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(1,0.70710678); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.5+$z);
};



$DRAW_MODEL{'Boulder'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.24070736,0.00987696); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.24295376); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.00987696); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.24295376); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.24295376); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.00987696); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.00763056,0.00987696); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.24295376); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.24295376); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.00987696); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.24295376); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.00987696); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.24070736,0.1380692); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.1380692); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.00763056,0.11476152); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.24070736,0.11476152); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    OpenGL::glNormal3f( 0.640600035459061,-0.384897891818282,0.664443532170863 );
    OpenGL::glTexCoord2f(0.69841053,0.93715116); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    OpenGL::glTexCoord2f(0.55264044,0.91484076); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    OpenGL::glNormal3f( 0.189307227252031,-0.941771290374991,0.27790215964539 );
    OpenGL::glTexCoord2f(0.35767,0.97606286); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    OpenGL::glTexCoord2f(0.5364198,0.87602364); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    OpenGL::glNormal3f( 0.615059664847828,0.101316783568941,0.78194406324527 );
    OpenGL::glTexCoord2f(0.69841053,0.93715116); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);

    OpenGL::glNormal3f( 0.0490170456103017,-0.640267974828601,0.766586100610049 );
    OpenGL::glTexCoord2f(0.69841053,0.93715116); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    OpenGL::glTexCoord2f(0.80128246,0.92678874); OpenGL::glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);

    OpenGL::glNormal3f( 0.615059691468161,0.101316773707155,0.781944043584107 );
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    OpenGL::glTexCoord2f(0.69841053,0.93715116); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);

    OpenGL::glNormal3f( 0.693641118531241,0.34293237933716,0.633450378391932 );
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    OpenGL::glTexCoord2f(0.66238385,0.83151975); OpenGL::glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);

    OpenGL::glNormal3f( 0.898647060527821,0.0388082265848983,0.436952379732669 );
    OpenGL::glTexCoord2f(0.5364198,0.87602364); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    OpenGL::glNormal3f( 0.288786196930425,-0.953738721796946,-0.0835762107754924 );
    OpenGL::glTexCoord2f(0.5364198,0.87602364); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    OpenGL::glTexCoord2f(0.54566383,0.80355101); OpenGL::glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);

    OpenGL::glNormal3f( 0.189307032246148,-0.941771339766842,0.277902125101488 );
    OpenGL::glTexCoord2f(0.29157227,0.88896406); OpenGL::glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    OpenGL::glTexCoord2f(0.35767,0.97606286); OpenGL::glVertex3f(0.14413525+$x,-0.40909909+$y,0.12458331+$z);

    OpenGL::glNormal3f( 0.0228360890143053,-0.992501303158065,0.120081956463381 );
    OpenGL::glTexCoord2f(0.29157227,0.88896406); OpenGL::glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    OpenGL::glTexCoord2f(0.32416229,0.780776); OpenGL::glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);

    OpenGL::glNormal3f( -0.0352185914172215,-0.987482099701116,0.153748995406349 );
    OpenGL::glTexCoord2f(0.29157227,0.88896406); OpenGL::glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    OpenGL::glTexCoord2f(0.13384169,0.77153642); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    OpenGL::glTexCoord2f(0.32416229,0.780776); OpenGL::glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);

    OpenGL::glNormal3f( 0.193935618421172,-0.634080468484848,0.748552560207787 );
    OpenGL::glTexCoord2f(0.80128246,0.92678874); OpenGL::glVertex3f(0.092973454+$x,-0.42146577+$y,0.1175258+$z);
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    OpenGL::glTexCoord2f(0.87798301,0.812148); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);

    OpenGL::glNormal3f( 0.00729031537051618,-0.999871512328208,-0.0142762087509399 );
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    OpenGL::glNormal3f( 0.240392168351923,-0.96970131024586,-0.0434853343384185 );
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    OpenGL::glTexCoord2f(0.5364198,0.87602364); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    OpenGL::glNormal3f( -0.0352185895764157,-0.987482099536529,0.153748996885105 );
    OpenGL::glTexCoord2f(0.32416229,0.780776); OpenGL::glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    OpenGL::glTexCoord2f(0.13384169,0.77153642); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    OpenGL::glNormal3f( 0.00729023791120114,-0.999871515075846,-0.0142760558674439 );
    OpenGL::glTexCoord2f(0.32416229,0.780776); OpenGL::glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.45545208,0.85227352); OpenGL::glVertex3f(0.16298345+$x,-0.42851552+$y,0.04594435+$z);

    OpenGL::glNormal3f( -0.0824364696990246,-0.980080226307662,0.180684748842516 );
    OpenGL::glTexCoord2f(0.13384169,0.77153642); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    OpenGL::glTexCoord2f(0.028893233,0.58833944); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    OpenGL::glNormal3f( -0.0607774783613331,-0.573245715411729,0.817126335327734 );
    OpenGL::glTexCoord2f(0.87798301,0.812148); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    OpenGL::glTexCoord2f(0.94726943,0.67736193); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    OpenGL::glNormal3f( 0.185329320452526,-0.608697980735779,0.771453051863035 );
    OpenGL::glTexCoord2f(0.87798301,0.812148); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    OpenGL::glTexCoord2f(0.85332201,0.79292146); OpenGL::glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);

    OpenGL::glNormal3f( -0.0879211042577068,-0.99612516211107,-0.00213092357885107 );
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.32416229,0.780776); OpenGL::glVertex3f(0.057855113+$x,-0.42945644+$y,0.058159805+$z);

    OpenGL::glNormal3f( -0.0694857948494604,-0.976740781601924,0.202852581619759 );
    OpenGL::glTexCoord2f(0.028893233,0.58833944); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    OpenGL::glNormal3f( -0.549406984468949,-0.151753922529128,0.821658513260685 );
    OpenGL::glTexCoord2f(0.94726943,0.67736193); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    OpenGL::glTexCoord2f(0.97792379,0.55280394); OpenGL::glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);

    OpenGL::glNormal3f( -0.0607774109414158,-0.573245584431174,0.817126432230301 );
    OpenGL::glTexCoord2f(0.85332201,0.79292146); OpenGL::glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    OpenGL::glTexCoord2f(0.87798301,0.812148); OpenGL::glVertex3f(-0.022314189+$x,-0.41137231+$y,0.15594454+$z);

    OpenGL::glNormal3f( -0.00128409682494458,0.198138847416126,0.980173121565754 );
    OpenGL::glTexCoord2f(0.85332201,0.79292146); OpenGL::glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    OpenGL::glTexCoord2f(0.83671485,0.74812927); OpenGL::glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);

    OpenGL::glNormal3f( 0.210724201257019,0.252280638364147,0.944430934749159 );
    OpenGL::glTexCoord2f(0.85332201,0.79292146); OpenGL::glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    OpenGL::glTexCoord2f(0.83671485,0.74812927); OpenGL::glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);

    OpenGL::glNormal3f( -0.112340074154598,0.464200953842534,0.878576793564809 );
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);

    OpenGL::glNormal3f( -0.734243285382096,-0.251296994909264,0.630663633184029 );
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    OpenGL::glTexCoord2f(0.94726943,0.67736193); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    OpenGL::glNormal3f( 0.106146278642061,0.603053167220682,0.790607263459896 );
    OpenGL::glTexCoord2f(0.83671485,0.74812927); OpenGL::glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);

    OpenGL::glNormal3f( -0.112340172082223,0.464201003754359,0.878576754671999 );
    OpenGL::glTexCoord2f(0.83671485,0.74812927); OpenGL::glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    OpenGL::glTexCoord2f(0.91696932,0.67438362); OpenGL::glVertex3f(-0.14963368+$x,-0.36361666+$y,0.17997701+$z);

    OpenGL::glNormal3f( 0.552484560292371,0.316151162372175,0.771238778310108 );
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);

    OpenGL::glNormal3f( 0.582841465317735,0.435539845607859,0.686003548966154 );
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);

    OpenGL::glNormal3f( 0.210724081424252,0.252280809925178,0.94443091565842 );
    OpenGL::glTexCoord2f(0.76710515,0.86339989); OpenGL::glVertex3f(0.095918885+$x,-0.37298465+$y,0.15782986+$z);
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    OpenGL::glTexCoord2f(0.85332201,0.79292146); OpenGL::glVertex3f(-0.012125921+$x,-0.37473514+$y,0.18240472+$z);

    OpenGL::glNormal3f( 0.171961411793547,0.578631883240407,0.797254298546976 );
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    OpenGL::glTexCoord2f(0.83671485,0.74812927); OpenGL::glVertex3f(-0.028905377+$x,-0.3167789+$y,0.17066707+$z);

    OpenGL::glNormal3f( -0.848979985210112,0.517877258780956,0.105052984489542 );
    OpenGL::glTexCoord2f(0.90889348,0.51153926); OpenGL::glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    OpenGL::glTexCoord2f(0.8492942,0.39574297); OpenGL::glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);

    OpenGL::glNormal3f( -0.856882775641672,-0.41881131002961,0.300581096211829 );
    OpenGL::glTexCoord2f(0.90889348,0.51153926); OpenGL::glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    OpenGL::glTexCoord2f(0.86630911,0.34672392); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    OpenGL::glTexCoord2f(0.9682447,0.45018084); OpenGL::glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    OpenGL::glTexCoord2f(0.8492942,0.39574297); OpenGL::glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);
    OpenGL::glTexCoord2f(0.86630911,0.34672392); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    OpenGL::glTexCoord2f(0.90889348,0.51153926); OpenGL::glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);

    OpenGL::glNormal3f( -0.613838857551129,0.641486778264234,0.460104955713909 );
    OpenGL::glTexCoord2f(0.90889348,0.51153926); OpenGL::glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    OpenGL::glNormal3f( -0.699167273588937,-0.385152081496047,-0.602347904172892 );
    OpenGL::glTexCoord2f(0.8492942,0.39574297); OpenGL::glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.86630911,0.34672392); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);

    OpenGL::glNormal3f( -0.6138388462233,0.641486788378303,0.46010495672546 );
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);

    OpenGL::glNormal3f( -0.761608092361733,0.603684273816562,-0.235623452134315 );
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.8492942,0.39574297); OpenGL::glVertex3f(-0.30967411+$x,-0.36886383+$y,-0.022114995+$z);

    OpenGL::glNormal3f( 0.898647061612937,0.0388082233750073,0.436952377786081 );
    OpenGL::glTexCoord2f(0.54566383,0.80355101); OpenGL::glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    OpenGL::glTexCoord2f(0.5364198,0.87602364); OpenGL::glVertex3f(0.21414524+$x,-0.41614883+$y,0.053001859+$z);

    OpenGL::glNormal3f( 0.913623240265063,0.37493205138581,0.157221282564402 );
    OpenGL::glTexCoord2f(0.54566383,0.80355101); OpenGL::glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    OpenGL::glTexCoord2f(0.53098023,0.75929649); OpenGL::glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);

    OpenGL::glNormal3f( 0.288136321982837,-0.95075182517882,-0.114229710992128 );
    OpenGL::glTexCoord2f(0.54566383,0.80355101); OpenGL::glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);

    OpenGL::glNormal3f( 0.594570414812596,-0.672761318553261,-0.440316057040912 );
    OpenGL::glTexCoord2f(0.54566383,0.80355101); OpenGL::glVertex3f(0.25045618+$x,-0.39847249+$y,-0.023246054+$z);
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    OpenGL::glTexCoord2f(0.5791821,0.76818365); OpenGL::glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);

    OpenGL::glNormal3f( 0.799992982063558,0.375461947632196,0.468016617791819 );
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);

    OpenGL::glNormal3f( 0.909524712805247,0.384187175032699,0.158634836454442 );
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    OpenGL::glNormal3f( 0.909524799517788,0.384187020138775,0.158634714419686 );
    OpenGL::glTexCoord2f(0.53098023,0.75929649); OpenGL::glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    OpenGL::glTexCoord2f(0.57382836,0.82064545); OpenGL::glVertex3f(0.23741907+$x,-0.37715339+$y,0.0016729183+$z);

    OpenGL::glNormal3f( 0.594570415751239,-0.672761318633218,-0.440316055651271 );
    OpenGL::glTexCoord2f(0.5791821,0.76818365); OpenGL::glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    OpenGL::glTexCoord2f(0.57326236,0.72481515); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    OpenGL::glNormal3f( 0.703704517436082,0.205491262288307,-0.680127409580888 );
    OpenGL::glTexCoord2f(0.53098023,0.75929649); OpenGL::glVertex3f(0.24580586+$x,-0.35960533+$y,-0.088910851+$z);
    OpenGL::glTexCoord2f(0.51515366,0.71826295); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);

    OpenGL::glNormal3f( 0.173251325294788,0.86869906863809,0.464053775365436 );
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    OpenGL::glTexCoord2f(0.75842861,0.62245326); OpenGL::glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    OpenGL::glNormal3f( 0.370420735150451,0.745615865908208,0.553936331609106 );
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    OpenGL::glNormal3f( -0.0270376580357788,0.758152032781383,0.651517045239337 );
    OpenGL::glTexCoord2f(0.75842861,0.62245326); OpenGL::glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);

    OpenGL::glNormal3f( -0.333544267175588,0.929442071105603,0.157751888398293 );
    OpenGL::glTexCoord2f(0.75842861,0.62245326); OpenGL::glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);

    OpenGL::glNormal3f( 0.370420766623972,0.745615862241916,0.553936315497506 );
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);

    OpenGL::glNormal3f( 0.132417179099996,0.989037103091195,0.0653551787403069 );
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    OpenGL::glTexCoord2f(0.75842861,0.62245326); OpenGL::glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    OpenGL::glNormal3f( 0.406504815914597,0.913648443307297,0.000597227254095913 );
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.67600523,0.64725215); OpenGL::glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);

    OpenGL::glNormal3f( 0.00404020848206433,-0.996101032756082,0.0881272333486508 );
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);
    OpenGL::glTexCoord2f(0.32596171,0.55231497); OpenGL::glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    OpenGL::glNormal3f( -0.00810932840244064,-0.989252785718005,-0.145990289889525 );
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    OpenGL::glNormal3f( 0.0421819674438488,-0.990388866097031,-0.131721583400762 );
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    OpenGL::glNormal3f( 0.114354268931712,-0.936603728640859,-0.331204705089064 );
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    OpenGL::glTexCoord2f(0.46659919,0.77674709); OpenGL::glVertex3f(0.1540931+$x,-0.42758111+$y,-0.024039454+$z);

    OpenGL::glNormal3f( -0.144838782480458,-0.792757328705007,-0.592079002223589 );
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    OpenGL::glTexCoord2f(0.51468777,0.69099188); OpenGL::glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);

    OpenGL::glNormal3f( 0.907848882999639,0.387899636107212,0.159198862886015 );
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    OpenGL::glTexCoord2f(0.62125557,0.74598318); OpenGL::glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);

    OpenGL::glNormal3f( 0.780080584476411,0.470393186073905,0.412558519749842 );
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    OpenGL::glTexCoord2f(0.66238385,0.83151975); OpenGL::glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);

    OpenGL::glNormal3f( 0.780080596843879,0.470393221511411,0.412558455959656 );
    OpenGL::glTexCoord2f(0.62125557,0.74598318); OpenGL::glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    OpenGL::glNormal3f( 0.416685386805528,0.90514365390732,0.0841917704650132 );
    OpenGL::glTexCoord2f(0.62125557,0.74598318); OpenGL::glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);

    OpenGL::glNormal3f( 0.73851474986134,0.174837955917979,-0.651174057689391 );
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    OpenGL::glTexCoord2f(0.51515366,0.71826295); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
    OpenGL::glTexCoord2f(0.5764281,0.69145457); OpenGL::glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);

    OpenGL::glNormal3f( 0.662862717561145,0.692569064293617,-0.284536656427458 );
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.62125557,0.74598318); OpenGL::glVertex3f(0.1923722+$x,-0.2541541+$y,-0.039739683+$z);

    OpenGL::glNormal3f( -0.0694857865378374,-0.976740782019618,0.202852582455641 );
    OpenGL::glTexCoord2f(0.04722199,0.42217066); OpenGL::glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    OpenGL::glTexCoord2f(0.028893233,0.58833944); OpenGL::glVertex3f(-0.15982195+$x,-0.40025383+$y,0.15351682+$z);

    OpenGL::glNormal3f( -0.0613575381018331,-0.974317911892198,0.216656084807486 );
    OpenGL::glTexCoord2f(0.04722199,0.42217066); OpenGL::glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    OpenGL::glTexCoord2f(0.17805773,0.31008355); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);

    OpenGL::glNormal3f( -0.484044854843421,-0.201656669596427,0.851489968294923 );
    OpenGL::glTexCoord2f(0.97792379,0.55280394); OpenGL::glVertex3f(-0.25148606+$x,-0.4067097+$y,0.091032704+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);
    OpenGL::glTexCoord2f(0.90889348,0.51153926); OpenGL::glVertex3f(-0.28218647+$x,-0.34612478+$y,0.087928707+$z);

    OpenGL::glNormal3f( -0.00233526856119081,-0.997264627559658,0.0738769865319693 );
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    OpenGL::glTexCoord2f(0.31416075,0.35401659); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    OpenGL::glTexCoord2f(0.32596171,0.55231497); OpenGL::glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    OpenGL::glNormal3f( 0.0109504391350984,-0.996160413535144,0.0868591871262842 );
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);
    OpenGL::glTexCoord2f(0.32596171,0.55231497); OpenGL::glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);
    OpenGL::glTexCoord2f(0.18304305,0.67711051); OpenGL::glVertex3f(-0.05743253+$x,-0.41936298+$y,0.096578546+$z);

    OpenGL::glNormal3f( -0.00233526862942223,-0.997264627556923,0.0738769865667286 );
    OpenGL::glTexCoord2f(0.17805773,0.31008355); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    OpenGL::glTexCoord2f(0.31416075,0.35401659); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    OpenGL::glTexCoord2f(0.19552426,0.5150661); OpenGL::glVertex3f(-0.14909664+$x,-0.42581885+$y,0.034094426+$z);

    OpenGL::glNormal3f( -0.665448207257968,-0.411044170536024,-0.623074131484776 );
    OpenGL::glTexCoord2f(0.86630911,0.34672392); OpenGL::glVertex3f(-0.2789737+$x,-0.42944875+$y,-0.019010998+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.7495913,0.26653774); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);

    OpenGL::glNormal3f( 0.236633171274748,-0.828673595050312,-0.507252220417857 );
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    OpenGL::glTexCoord2f(0.51468777,0.69099188); OpenGL::glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    OpenGL::glTexCoord2f(0.57326236,0.72481515); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    OpenGL::glNormal3f( 0.11435426901673,-0.936603727955447,-0.331204706997966 );
    OpenGL::glTexCoord2f(0.51468777,0.69099188); OpenGL::glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    OpenGL::glTexCoord2f(0.52601197,0.76397055); OpenGL::glVertex3f(0.20991422+$x,-0.40546551+$y,-0.067306261+$z);
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    OpenGL::glNormal3f( 0.113713079926886,-0.602567706672945,-0.789924992849606 );
    OpenGL::glTexCoord2f(0.48949462,0.66813361); OpenGL::glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    OpenGL::glTexCoord2f(0.51515366,0.71826295); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);

    OpenGL::glNormal3f( -0.183572255288068,0.624129075442902,0.759449882661944 );
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    OpenGL::glTexCoord2f(0.90236927,0.59669461); OpenGL::glVertex3f(-0.19984428+$x,-0.307471+$y,0.14389191+$z);

    OpenGL::glNormal3f( -0.0270376196068548,0.758152029502705,0.651517050649424 );
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    OpenGL::glTexCoord2f(0.83309659,0.67159504); OpenGL::glVertex3f(-0.079115974+$x,-0.26063324+$y,0.13458196+$z);
    OpenGL::glTexCoord2f(0.75842861,0.62245326); OpenGL::glVertex3f(-0.058172224+$x,-0.17607847+$y,0.037057112+$z);

    OpenGL::glNormal3f( -0.462309768181665,0.883977869308234,0.0696620758884657 );
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    OpenGL::glTexCoord2f(0.74417336,0.4877339); OpenGL::glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    OpenGL::glNormal3f( 0.077342234909126,-0.98957216376503,-0.1215117747408 );
    OpenGL::glTexCoord2f(0.31416075,0.35401659); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    OpenGL::glTexCoord2f(0.32596171,0.55231497); OpenGL::glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);

    OpenGL::glNormal3f( 0.00617095515875168,-0.745481709584991,-0.666497516864593 );
    OpenGL::glTexCoord2f(0.31416075,0.35401659); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    OpenGL::glTexCoord2f(0.39982566,0.31162603); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);

    OpenGL::glNormal3f( -0.842899812266919,-0.446187531505355,-0.30072677501272 );
    OpenGL::glTexCoord2f(0.7495913,0.26653774); OpenGL::glVertex3f(-0.21147085+$x,-0.43469128+$y,-0.087646072+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.66061458,0.35567921); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);

    OpenGL::glNormal3f( 0.0421818748193015,-0.99038888520901,-0.131721469363136 );
    OpenGL::glTexCoord2f(0.32596171,0.55231497); OpenGL::glVertex3f(-0.081593787+$x,-0.43106138+$y,-0.034540648+$z);
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    OpenGL::glTexCoord2f(0.38418993,0.70926066); OpenGL::glVertex3f(0.048964765+$x,-0.42852204+$y,-0.011823999+$z);

    OpenGL::glNormal3f( 0.00617098411386942,-0.745481645592029,-0.666497588173031 );
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    OpenGL::glTexCoord2f(0.39982566,0.31162603); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    OpenGL::glTexCoord2f(0.50356634,0.50299107); OpenGL::glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    OpenGL::glNormal3f( 0.121407501971246,-0.782849814547526,-0.610251084659426 );
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    OpenGL::glTexCoord2f(0.44278899,0.67882182); OpenGL::glVertex3f(0.068080478+$x,-0.41884944+$y,-0.078428854+$z);

    OpenGL::glNormal3f( 0.813275340817297,0.35978086610687,0.457319306832656 );
    OpenGL::glTexCoord2f(0.66238385,0.83151975); OpenGL::glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    OpenGL::glTexCoord2f(0.59300218,0.882207); OpenGL::glVertex3f(0.20110813+$x,-0.39482973+$y,0.077920831+$z);
    OpenGL::glTexCoord2f(0.60476826,0.79888797); OpenGL::glVertex3f(0.21667479+$x,-0.3256111+$y,-0.0042176635+$z);

    OpenGL::glNormal3f( 0.582841537037797,0.43553987958181,0.686003466461563 );
    OpenGL::glTexCoord2f(0.66238385,0.83151975); OpenGL::glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    OpenGL::glTexCoord2f(0.69787908,0.84845996); OpenGL::glVertex3f(0.15289177+$x,-0.35871529+$y,0.11116738+$z);

    OpenGL::glNormal3f( 0.595964484627425,0.510728944418158,0.619663036170694 );
    OpenGL::glTexCoord2f(0.66238385,0.83151975); OpenGL::glVertex3f(0.17104193+$x,-0.31108954+$y,0.06550933+$z);
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);

    OpenGL::glNormal3f( 0.267841709541709,0.611610143007963,0.744441973292448 );
    OpenGL::glTexCoord2f(0.73083118,0.78457699); OpenGL::glVertex3f(0.097289592+$x,-0.26740266+$y,0.10043415+$z);
    OpenGL::glTexCoord2f(0.76459167,0.70591054); OpenGL::glVertex3f(0.015427392+$x,-0.21918442+$y,0.090272642+$z);
    OpenGL::glTexCoord2f(0.76410559,0.81592025); OpenGL::glVertex3f(0.079139428+$x,-0.31502842+$y,0.1460922+$z);

    OpenGL::glNormal3f( 0.499657975672013,0.863292781576393,0.0711862390173839 );
    OpenGL::glTexCoord2f(0.67643986,0.76323644); OpenGL::glVertex3f(0.14673934+$x,-0.23963253+$y,0.02998731+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    OpenGL::glNormal3f( -0.0571616222112343,-0.319598616521682,-0.945827295685426 );
    OpenGL::glTexCoord2f(0.66061458,0.35567921); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    OpenGL::glTexCoord2f(0.59174039,0.48726069); OpenGL::glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    OpenGL::glTexCoord2f(0.50356634,0.50299107); OpenGL::glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    OpenGL::glNormal3f( -0.415749011338237,0.229228468678528,-0.8801176448172 );
    OpenGL::glTexCoord2f(0.66061458,0.35567921); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    OpenGL::glTexCoord2f(0.59174039,0.48726069); OpenGL::glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);

    OpenGL::glNormal3f( 0.0676406285450162,-0.740233044211907,-0.668939298910453 );
    OpenGL::glTexCoord2f(0.50356634,0.50299107); OpenGL::glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    OpenGL::glTexCoord2f(0.41971963,0.53633461); OpenGL::glVertex3f(-0.062478073+$x,-0.42138879+$y,-0.1011455+$z);

    OpenGL::glNormal3f( -0.042737126778154,-0.314265675564981,-0.948372618308033 );
    OpenGL::glTexCoord2f(0.50356634,0.50299107); OpenGL::glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);

    OpenGL::glNormal3f( -0.186145414636915,0.50720471632389,-0.841482774837639 );
    OpenGL::glTexCoord2f(0.59174039,0.48726069); OpenGL::glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);

    OpenGL::glNormal3f( -0.0427370019916678,-0.314265794777,-0.948372584427631 );
    OpenGL::glTexCoord2f(0.59174039,0.48726069); OpenGL::glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    OpenGL::glTexCoord2f(0.50356634,0.50299107); OpenGL::glVertex3f(-0.068159194+$x,-0.37764161+$y,-0.15012959+$z);

    OpenGL::glNormal3f( -0.448999438129508,0.891065888190152,0.0663406923635973 );
    OpenGL::glTexCoord2f(0.74417336,0.4877339); OpenGL::glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    OpenGL::glTexCoord2f(0.82137073,0.58500138); OpenGL::glVertex3f(-0.15271559+$x,-0.21752729+$y,0.081366435+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);

    OpenGL::glNormal3f( -0.761608104823891,0.603684261876473,-0.235623442444125 );
    OpenGL::glTexCoord2f(0.74417336,0.4877339); OpenGL::glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.82106216,0.49696398); OpenGL::glVertex3f(-0.23505778+$x,-0.25618107+$y,0.025403235+$z);

    OpenGL::glNormal3f( -0.578901089230433,0.611024412497528,-0.539928417681334 );
    OpenGL::glTexCoord2f(0.74417336,0.4877339); OpenGL::glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);

    OpenGL::glNormal3f( -0.328060272695367,0.814833035058542,-0.477936797554162 );
    OpenGL::glTexCoord2f(0.74417336,0.4877339); OpenGL::glVertex3f(-0.18385589+$x,-0.2230501+$y,-0.055213231+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);

    OpenGL::glNormal3f( -0.415749037838546,0.229228483905588,-0.880117628333093 );
    OpenGL::glTexCoord2f(0.74317253,0.36396387); OpenGL::glVertex3f(-0.25847221+$x,-0.33573285+$y,-0.10273146+$z);
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    OpenGL::glTexCoord2f(0.66061458,0.35567921); OpenGL::glVertex3f(-0.21715197+$x,-0.39094411+$y,-0.13663016+$z);

    OpenGL::glNormal3f( -0.328060276280855,0.814833035009724,-0.477936795176277 );
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    OpenGL::glNormal3f( -0.0957565473338303,0.467799513367747,-0.878632061181245 );
    OpenGL::glTexCoord2f(0.66487866,0.47554972); OpenGL::glVertex3f(-0.13882117+$x,-0.25335804+$y,-0.1377974+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    OpenGL::glTexCoord2f(0.59174039,0.48726069); OpenGL::glVertex3f(-0.097500924+$x,-0.3085693+$y,-0.1716961+$z);

    OpenGL::glNormal3f( 0.132417179499332,0.989037103100465,0.0653551777909111 );
    OpenGL::glTexCoord2f(0.67600523,0.64725215); OpenGL::glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);
    OpenGL::glTexCoord2f(0.71013011,0.69570605); OpenGL::glVertex3f(0.064877144+$x,-0.19141429+$y,0.019825804+$z);

    OpenGL::glNormal3f( 0.075225443060936,0.948686270349978,-0.307140836043881 );
    OpenGL::glTexCoord2f(0.67600523,0.64725215); OpenGL::glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    OpenGL::glTexCoord2f(0.7219674,0.57531659); OpenGL::glVertex3f(-0.074041613+$x,-0.16896847+$y,-0.038387163+$z);

    OpenGL::glNormal3f( 0.191906993763866,0.881671781089691,-0.431076067735902 );
    OpenGL::glTexCoord2f(0.67600523,0.64725215); OpenGL::glVertex3f(0.049007755+$x,-0.18430429+$y,-0.055618472+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    OpenGL::glNormal3f( 0.191906994694242,0.881671775254814,-0.43107607925568 );
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.60482777,0.61451489); OpenGL::glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);

    OpenGL::glNormal3f( 0.662862693862111,0.692569038047424,-0.284536775521077 );
    OpenGL::glTexCoord2f(0.5764281,0.69145457); OpenGL::glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);
    OpenGL::glTexCoord2f(0.5648889,0.74500636); OpenGL::glVertex3f(0.22506159+$x,-0.30806304+$y,-0.094801433+$z);

    OpenGL::glNormal3f( 0.320962962762576,0.764966127142711,-0.558399141169603 );
    OpenGL::glTexCoord2f(0.5764281,0.69145457); OpenGL::glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    OpenGL::glTexCoord2f(0.60482777,0.61451489); OpenGL::glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    OpenGL::glTexCoord2f(0.62739604,0.68866485); OpenGL::glVertex3f(0.13552929+$x,-0.22277361+$y,-0.095781282+$z);

    OpenGL::glNormal3f( 0.209185078644524,0.353803227299244,-0.911627598981691 );
    OpenGL::glTexCoord2f(0.5764281,0.69145457); OpenGL::glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    OpenGL::glTexCoord2f(0.60482777,0.61451489); OpenGL::glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);

    OpenGL::glNormal3f( 0.20918511659579,0.353803260820144,-0.911627577263785 );
    OpenGL::glTexCoord2f(0.60482777,0.61451489); OpenGL::glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);

    OpenGL::glNormal3f( -0.154718261570701,0.52547515000122,-0.836623049089455 );
    OpenGL::glTexCoord2f(0.60482777,0.61451489); OpenGL::glVertex3f(0.057514634+$x,-0.23774573+$y,-0.16113414+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    OpenGL::glTexCoord2f(0.6551742,0.56770715); OpenGL::glVertex3f(-0.029006897+$x,-0.19927641+$y,-0.12097133+$z);

    OpenGL::glNormal3f( 0.113713107395018,-0.602567708977925,-0.789924987137173 );
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    OpenGL::glTexCoord2f(0.48949462,0.66813361); OpenGL::glVertex3f(0.1239016+$x,-0.39673384+$y,-0.12169566+$z);

    OpenGL::glNormal3f( -0.0188684894844931,-0.305282321975843,-0.952074936122998 );
    OpenGL::glTexCoord2f(0.52763241,0.62813803); OpenGL::glVertex3f(0.059815852+$x,-0.3535094+$y,-0.16389339+$z);
    OpenGL::glTexCoord2f(0.57261656,0.58672797); OpenGL::glVertex3f(0.030474122+$x,-0.28443708+$y,-0.18545989+$z);
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);

    OpenGL::glNormal3f( 0.585669849954908,0.0809942693030834,-0.806492873616287 );
    OpenGL::glTexCoord2f(0.54878368,0.67141075); OpenGL::glVertex3f(0.14117816+$x,-0.32337391+$y,-0.17516878+$z);
    OpenGL::glTexCoord2f(0.5764281,0.69145457); OpenGL::glVertex3f(0.16821867+$x,-0.27668255+$y,-0.15084303+$z);
    OpenGL::glTexCoord2f(0.51515366,0.71826295); OpenGL::glVertex3f(0.20526391+$x,-0.36659834+$y,-0.13297106+$z);
};



$DRAW_MODEL{'Creature'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( -0.00539890949409186,-0.999983546661686,0.00193860315454319 );
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(-0.11855785+$x,-0.39531013+$y,0.032581697+$z);
    OpenGL::glTexCoord2f(0.800276,0.441019); OpenGL::glVertex3f(0.03616019+$x,-0.39614575+$y,0.032428207+$z);

    OpenGL::glNormal3f( -0.000565865056345979,-0.999982999902154,-0.00580342169989267 );
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);
    OpenGL::glTexCoord2f(0.623546,0.549776); OpenGL::glVertex3f(-0.1138134+$x,-0.39586533+$y,0.12778516+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(-0.11855785+$x,-0.39531013+$y,0.032581697+$z);

    OpenGL::glNormal3f( -0.00930914698520681,0.0757500992715555,0.997083377778788 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1138134+$x,-0.39586533+$y,0.12778516+$z);

    OpenGL::glNormal3f( 0.0264607687703039,0.126691633537858,0.991589157719866 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.030682563+$x,-0.36390787+$y,0.12524518+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);

    OpenGL::glNormal3f( 0.985386048318906,0.170277093626215,0.00447740601921108 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031040055+$x,-0.36361949+$y,0.03560128+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.030682563+$x,-0.36390787+$y,0.12524518+$z);

    OpenGL::glNormal3f( 0.987824459402393,0.155570858117192,-0.000738587199426589 );
    OpenGL::glTexCoord2f(0.646629,0.978498); OpenGL::glVertex3f(0.03616019+$x,-0.39614575+$y,0.032428207+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031040055+$x,-0.36361949+$y,0.03560128+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036203033+$x,-0.39595839+$y,0.12919284+$z);

    OpenGL::glNormal3f( -0.0158029187193918,0.0946166818775918,-0.995388341940181 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.03616019+$x,-0.39614575+$y,0.032428207+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031040055+$x,-0.36361949+$y,0.03560128+$z);

    OpenGL::glNormal3f( -0.000358937605332219,0.115985670390077,-0.993250822012224 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.11855785+$x,-0.39531013+$y,0.032581697+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.03616019+$x,-0.39614575+$y,0.032428207+$z);

    OpenGL::glNormal3f( -0.0104463982109046,0.132512830789533,-0.991126239406749 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.11855785+$x,-0.39531013+$y,0.032581697+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.11303341+$x,-0.35232483+$y,0.038270572+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);

    OpenGL::glNormal3f( -0.0326503770809912,0.112487726438516,0.993116541135613 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1138134+$x,-0.39586533+$y,0.12778516+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.10755827+$x,-0.3523357+$y,0.12306032+$z);

    OpenGL::glNormal3f( -0.991413204746978,0.12078375234584,0.0501113023437417 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1138134+$x,-0.39586533+$y,0.12778516+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(-0.11303341+$x,-0.35232483+$y,0.038270572+$z);
    OpenGL::glTexCoord2f(0.823359,0.97848); OpenGL::glVertex3f(-0.11855785+$x,-0.39531013+$y,0.032581697+$z);

    OpenGL::glNormal3f( -0.968683045109099,0.176339029736517,0.174807622001296 );
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.10755827+$x,-0.3523357+$y,0.12306032+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);

    OpenGL::glNormal3f( -0.986822391461264,0.148723288291959,0.0637412835633025 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.10755827+$x,-0.3523357+$y,0.12306032+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(-0.11303341+$x,-0.35232483+$y,0.038270572+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1138134+$x,-0.39586533+$y,0.12778516+$z);

    OpenGL::glNormal3f( -0.0244554846202959,0.0129461736520977,0.999617089619699 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.10755827+$x,-0.3523357+$y,0.12306032+$z);

    OpenGL::glNormal3f( 0.998680184153984,-0.0513603160637581,0 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.028847849+$x,-0.22182398+$y,0.038389694+$z);

    OpenGL::glNormal3f( -0.00196841198007984,-0.179299098829022,0.983792639997564 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);

    OpenGL::glNormal3f( 0.971478020268955,-0.0631649712507649,0.228562119655031 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036089269+$x,-0.22061172+$y,0.11803959+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);

    OpenGL::glNormal3f( 0.0803146453898956,-0.170979707037219,0.981995670824145 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036089269+$x,-0.22061172+$y,0.11803959+$z);

    OpenGL::glNormal3f( 0.916485223822774,-0.094312342870733,0.388793025267627 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);

    OpenGL::glNormal3f( -0.0438184191812077,-0.998860491422272,-0.018912028344892 );
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);

    OpenGL::glNormal3f( 0.981778758958022,-0.166387509142983,0.0917914225842488 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036089269+$x,-0.22061172+$y,0.11803959+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.028847849+$x,-0.22182398+$y,0.038389694+$z);

    OpenGL::glNormal3f( 0.00398044272797684,-0.157203913121439,-0.987558142984501 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);
    OpenGL::glTexCoord2f(0.964423,0.497747); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);

    OpenGL::glNormal3f( -0.148701567399888,-0.988615125935223,0.0229777419451731 );
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);
    OpenGL::glTexCoord2f(0.632024,0.752693); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);

    OpenGL::glNormal3f( -0.0066669311162428,-0.999754352337581,0.0211373369078374 );
    OpenGL::glTexCoord2f(0.556016,0.376286); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.546823,0.335187); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);

    OpenGL::glNormal3f( -0.981719252855843,-0.164880637830821,0.0950877691433955 );
    OpenGL::glTexCoord2f(0.96259,0.987723); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);

    OpenGL::glNormal3f( 0.0026401248797071,-0.999969687855447,-0.00732482838694054 );
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.556016,0.376286); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);

    OpenGL::glNormal3f( -0.0385714708627631,-0.99925466333954,0.00153604351052458 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13870206+$x,-0.084781864+$y,0.056779397+$z);
    OpenGL::glTexCoord2f(0.469506,0.401201); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);

    OpenGL::glNormal3f( -0.949816815672843,-0.0794746670291617,0.3025422184848 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13870206+$x,-0.084781864+$y,0.056779397+$z);

    OpenGL::glNormal3f( -0.900355325283934,-0.0655105771060026,0.430196062883076 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);

    OpenGL::glNormal3f( -0.00174658816312721,-0.141007339056813,0.990007009955942 );
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);

    OpenGL::glNormal3f( 0.882095021356527,-0.0551102522088065,0.467836759350428 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032791597+$x,-0.086161262+$y,0.14117966+$z);

    OpenGL::glNormal3f( 0.998053538029428,-0.0615725032301421,0.0098975791442126 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);
    OpenGL::glTexCoord2f(0.449811,0.966089); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);

    OpenGL::glNormal3f( 0.997392156898056,-0.0715713142485368,-0.00929689921320547 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);
    OpenGL::glTexCoord2f(0.652416,0.797749); OpenGL::glVertex3f(0.010673052+$x,-0.08557626+$y,-0.058095615+$z);
    OpenGL::glTexCoord2f(0.449811,0.966089); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);

    OpenGL::glNormal3f( -0.0064397386734632,-0.999883261819297,0.013856135804055 );
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13870206+$x,-0.084781864+$y,0.056779397+$z);
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(-0.13885533+$x,-0.086362264+$y,-0.057336295+$z);
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);

    OpenGL::glNormal3f( 0.907629779567634,-0.0914460454098851,0.409689887623434 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036084225+$x,0.21516227+$y,0.21919281+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);

    OpenGL::glNormal3f( -0.0235374529501553,0.891969088791214,0.451483258770014 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036084225+$x,0.21516227+$y,0.21919281+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);

    OpenGL::glNormal3f( -0.0223540559708926,0.540032602233075,0.841347184405477 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.027751467+$x,0.132838+$y,0.2722554+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036084225+$x,0.21516227+$y,0.21919281+$z);

    OpenGL::glNormal3f( 0.0167920050057603,0.564761373254533,0.825083401752538 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10965691+$x,0.1333196+$y,0.27359268+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.027751467+$x,0.132838+$y,0.2722554+$z);

    OpenGL::glNormal3f( -0.99518268580979,0.0978529577146812,-0.00601834951636954 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10965691+$x,0.1333196+$y,0.27359268+$z);

    OpenGL::glNormal3f( -0.434768901964333,0.879491358067728,0.193574153669624 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);

    OpenGL::glNormal3f( 0.581893408570704,0.813256003149108,0.0038385418984519 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);

    OpenGL::glNormal3f( 0.418641342222791,0.8876382777077,0.191931536048686 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036084225+$x,0.21516227+$y,0.21919281+$z);

    OpenGL::glNormal3f( 0.979765687441656,0.200115812293424,-0.00358599806493252 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);

    OpenGL::glNormal3f( -0.914348844805137,-0.098802985758162,0.392688375189263 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);
    OpenGL::glTexCoord2f(0.001952,0.833096); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10139807+$x,0.21391041+$y,0.21826099+$z);

    OpenGL::glNormal3f( -0.418576748089051,0.894704333359845,0.155877072805176 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(-0.092775003+$x,0.2553573+$y,0.022856718+$z);

    OpenGL::glNormal3f( -0.999874735394364,-0.0145000073920011,-0.0063453373182844 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13870206+$x,-0.084781864+$y,0.056779397+$z);

    OpenGL::glNormal3f( -0.623713252635646,0.781652996239186,-0.00060988274701147 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);
    OpenGL::glTexCoord2f(0.023627,0.446331); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);

    OpenGL::glNormal3f( 0.994405576740482,0.105374898666337,0.00732664169241131 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.027751467+$x,0.132838+$y,0.2722554+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036084225+$x,0.21516227+$y,0.21919281+$z);

    OpenGL::glNormal3f( -0.153644645655046,-0.98807413582789,-0.0101402647649546 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.027751467+$x,0.132838+$y,0.2722554+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);

    OpenGL::glNormal3f( -0.00826065459765283,-0.988667559804941,-0.149894021811949 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10965691+$x,0.1333196+$y,0.27359268+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.027751467+$x,0.132838+$y,0.2722554+$z);

    OpenGL::glNormal3f( -0.0139605547308281,-0.174804904313738,0.984504112911405 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);

    OpenGL::glNormal3f( 0.0157114894839654,-0.0870102360180769,-0.996083514533934 );
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);

    OpenGL::glNormal3f( 0.914908140832282,-0.110707123625046,0.388184268894923 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);

    OpenGL::glNormal3f( 0.0019060845168497,-0.999997191320329,0.00140861395252384 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10965691+$x,0.1333196+$y,0.27359268+$z);

    OpenGL::glNormal3f( -0.996253610397731,0.0575149464034641,0.0645815353618385 );
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11543845+$x,0.00063803198+$y,0.20033566+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);

    OpenGL::glNormal3f( 0.0100092193769082,-0.999918536640954,0.00792058137253459 );
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10965691+$x,0.1333196+$y,0.27359268+$z);

    OpenGL::glNormal3f( 0.0150415070891504,-0.06544936115573,0.997742518984129 );
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);

    OpenGL::glNormal3f( -0.99668456740289,0.0779291159999681,0.0233864486482769 );
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11543845+$x,0.00063803198+$y,0.20033566+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11429499+$x,0.00073465552+$y,0.24874571+$z);

    OpenGL::glNormal3f( 0.981221392195083,-0.170862607812187,0.0895016689808809 );
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(-0.027170396+$x,0.13368152+$y,0.1812579+$z);

    OpenGL::glNormal3f( -0.0759570851683881,-0.122324058113509,0.989579378331706 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(-0.11429499+$x,0.00073465552+$y,0.24874571+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(-0.10352436+$x,0.13332054+$y,0.26596166+$z);

    OpenGL::glNormal3f( -0.191183405154472,0.0976931521423057,0.976680579113787 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(-0.11429499+$x,0.00073465552+$y,0.24874571+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);

    OpenGL::glNormal3f( 0.995780487793326,-0.0906820539398346,-0.0140707222039188 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.034750461+$x,0.13400111+$y,0.2649695+$z);

    OpenGL::glNormal3f( 0.77038735543248,0.637424203073283,-0.0139178994873504 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);

    OpenGL::glNormal3f( -0.0750623063641677,-0.147647700239477,-0.986187510961929 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11543845+$x,0.00063803198+$y,0.20033566+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10910382+$x,0.13318883+$y,0.18000858+$z);

    OpenGL::glNormal3f( -0.208713981032226,0.109595270787418,-0.97181652113077 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11543845+$x,0.00063803198+$y,0.20033566+$z);

    OpenGL::glNormal3f( 0.750532580209974,0.66083286911438,0.000874723622551134 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.019431777+$x,0.0095575104+$y,0.18226102+$z);

    OpenGL::glNormal3f( -0.646068996979944,-0.763094468227488,0.0167834353437198 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11543845+$x,0.00063803198+$y,0.20033566+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11429499+$x,0.00073465552+$y,0.24874571+$z);

    OpenGL::glNormal3f( 0.995841989501487,0.0115536042314652,0.090361751725956 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.028847849+$x,-0.22182398+$y,0.038389694+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036089269+$x,-0.22061172+$y,0.11803959+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);

    OpenGL::glNormal3f( -0.0168177767705269,-0.143024823090102,-0.989576203414644 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.028847849+$x,-0.22182398+$y,0.038389694+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0037900533+$x,-0.085105135+$y,0.018203674+$z);

    OpenGL::glNormal3f( -0.0161983907290594,0.000701228591810312,-0.99986855156878 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.028847849+$x,-0.22182398+$y,0.038389694+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);

    OpenGL::glNormal3f( 0.0812782705903426,0.0537045949697563,0.995243517541801 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036089269+$x,-0.22061172+$y,0.11803959+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);

    OpenGL::glNormal3f( -0.95844645184038,-0.223841713077828,0.176848201689953 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.083786677+$x,-0.22063691+$y,0.12193624+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11176524+$x,-0.085692004+$y,0.14110717+$z);

    OpenGL::glNormal3f( -0.992165550515119,0.107243400914782,0.0640809904048222 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);
    OpenGL::glTexCoord2f(0.639452,0.910131); OpenGL::glVertex3f(-0.11303341+$x,-0.35232483+$y,0.038270572+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.10755827+$x,-0.3523357+$y,0.12306032+$z);

    OpenGL::glNormal3f( -0.446437407860659,-0.0394969847923247,0.89394274372298 );
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(-0.092775003+$x,0.2553573+$y,0.022856718+$z);

    OpenGL::glNormal3f( 0.41125133122166,0.894621100260834,0.174715281347991 );
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0086645686+$x,0.215478+$y,0.1201265+$z);

    OpenGL::glNormal3f( -0.456717058451187,-0.478215420972189,0.750146345498055 );
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);

    OpenGL::glNormal3f( -0.0512512644563593,0.99355031387941,0.101148809591363 );
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(-0.092775003+$x,0.2553573+$y,0.022856718+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.068221707+$x,0.24225567+$y,0.16399052+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);

    OpenGL::glNormal3f( -0.633862922133658,0.773419069136949,-0.00638274545287777 );
    OpenGL::glTexCoord2f(0.035327,0.498638); OpenGL::glVertex3f(-0.092775003+$x,0.2553573+$y,0.022856718+$z);
    OpenGL::glTexCoord2f(0.023627,0.446331); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.1434487+$x,0.21463326+$y,0.12053076+$z);

    OpenGL::glNormal3f( -0.993995710741617,-0.107530397692312,0.0202420502766348 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);
    OpenGL::glTexCoord2f(0.534654,0.2158); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(-0.092775003+$x,0.2553573+$y,0.022856718+$z);

    OpenGL::glNormal3f( 0.730730543449437,0.12060074116144,0.671928816245741 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);

    OpenGL::glNormal3f( 0.690737136141491,0.0832443280256011,0.718298399418109 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);
    OpenGL::glTexCoord2f(0.229164,0.01486); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);

    OpenGL::glNormal3f( -0.548536437307063,-0.431728886026706,0.716043257014976 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.070532,0.006139); OpenGL::glVertex3f(-0.046628886+$x,0.25539139+$y,0.045903719+$z);

    OpenGL::glNormal3f( 0.258446253643327,-0.964059690670096,-0.0615990811847727 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);

    OpenGL::glNormal3f( 0.584197780210195,-0.439825856300175,-0.682104222041837 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0039378525+$x,0.34243849+$y,0.029633283+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);

    OpenGL::glNormal3f( 0.597117134977463,0.142730595444427,0.789353598991216 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);

    OpenGL::glNormal3f( 0.601983093134524,0.0121726945285422,0.798416045109381 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);

    OpenGL::glNormal3f( 0.63330233979731,-0.00963178479501171,0.773844541964932 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);

    OpenGL::glNormal3f( 0.576765792589491,-0.0740046139863954,0.813550574707769 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);

    OpenGL::glNormal3f( 0.224232769204443,-0.131875100760933,0.96557165607437 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(-0.04551186+$x,0.31702849+$y,0.061090972+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);

    OpenGL::glNormal3f( 0.386912438161095,-0.0459149602088805,-0.920972628054305 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0039378525+$x,0.34243849+$y,0.029633283+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);

    OpenGL::glNormal3f( 0.525941409407804,0.0645730570741107,0.848066008144552 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);

    OpenGL::glNormal3f( 0.988501888173703,-0.0727058347646564,-0.132581592493824 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);

    OpenGL::glNormal3f( 0.992268552411851,0.124098779522101,0.00161642061799374 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);

    OpenGL::glNormal3f( 0.912352567236169,-0.316362324268613,0.259860872085301 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.007350152+$x,0.30185503+$y,0.036062224+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);

    OpenGL::glNormal3f( 0.461470807404962,0.340226577113005,0.819323239105898 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.0083619922+$x,0.21595821+$y,0.064254646+$z);

    OpenGL::glNormal3f( 0.382924522431853,0.00885348677109435,0.923737206077752 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);
    OpenGL::glTexCoord2f(0.020867,0.090074); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);

    OpenGL::glNormal3f( 0.720071929234105,0.316975753815832,0.617270433620435 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);
    OpenGL::glTexCoord2f(0.056483,0.113005); OpenGL::glVertex3f(0.007350152+$x,0.30185503+$y,0.036062224+$z);
    OpenGL::glTexCoord2f(0.020867,0.090074); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);

    OpenGL::glNormal3f( 0.86035476250168,0.509212558007194,0.0221867845450613 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.083833,0.121737); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);

    OpenGL::glNormal3f( 0.711954466789837,-0.0743882282817355,0.6982744651719 );
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);

    OpenGL::glNormal3f( 0.965870877350485,0.190657696033731,-0.175337078877552 );
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);

    OpenGL::glNormal3f( 0.694680412892518,-0.0705927530674372,0.715846203564593 );
    OpenGL::glTexCoord2f(0.229164,0.01486); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);

    OpenGL::glNormal3f( -0.990997886689023,-0.133850140326237,0.00270712255667398 );
    OpenGL::glTexCoord2f(0.39126,0.246155); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);

    OpenGL::glNormal3f( -0.992817741171722,-0.119205558518246,-0.0101472968337993 );
    OpenGL::glTexCoord2f(0.39126,0.246155); OpenGL::glVertex3f(0.025234536+$x,0.1332314+$y,0.057616799+$z);
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);

    OpenGL::glNormal3f( 0.999680542740053,-0.0249018791362282,0.00432537656603135 );
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);

    OpenGL::glNormal3f( 0.702350218863379,-0.185717563974135,0.687177674618491 );
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.03783605+$x,-0.0044807081+$y,0.022176352+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);

    OpenGL::glNormal3f( -0.999465298711822,-0.0311399889833734,0.00997084535054452 );
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);
    OpenGL::glTexCoord2f(0.455921,0.089119); OpenGL::glVertex3f(0.03783605+$x,-0.0044807081+$y,0.022176352+$z);

    OpenGL::glNormal3f( -0.999733833713368,-0.0229103260357284,0.00271637436812914 );
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.036268536+$x,0.051157759+$y,0.038815403+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);

    OpenGL::glNormal3f( -0.160687139536011,0.101934669562767,-0.981727541800098 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.019431777+$x,0.0095575104+$y,0.18226102+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.04455432+$x,0.038080758+$y,0.18933465+$z);

    OpenGL::glNormal3f( -0.144322528017446,0.0903339888977025,-0.985398791533907 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.019431777+$x,0.0095575104+$y,0.18226102+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);

    OpenGL::glNormal3f( -0.650943071046534,-0.759063397340953,0.00979168390615419 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11429499+$x,0.00073465552+$y,0.24874571+$z);

    OpenGL::glNormal3f( -0.753850904571209,-0.656943710794153,0.0115660937735364 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);

    OpenGL::glNormal3f( -0.743666806273037,-0.66854785184638,-0.00185769729815595 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);

    OpenGL::glNormal3f( -0.205989464883343,-0.38606794808405,-0.899177335023101 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.059468356+$x,-0.047131549+$y,0.18292799+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);

    OpenGL::glNormal3f( -0.189098208206248,0.0973667234096101,0.977119024902117 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043545215+$x,0.038378551+$y,0.25882949+$z);

    OpenGL::glNormal3f( -0.155412466833725,0.0748586743946567,0.985009210119647 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0064002983+$x,-0.057357383+$y,0.27548781+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);

    OpenGL::glNormal3f( 0.54354765579551,0.839375114205031,-0.00231593015792603 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.019431777+$x,0.0095575104+$y,0.18226102+$z);

    OpenGL::glNormal3f( 0.350547508136982,0.261624439948151,0.899260305451524 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0064002983+$x,-0.057357383+$y,0.27548781+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.032428772+$x,-0.022219689+$y,0.25511874+$z);

    OpenGL::glNormal3f( -0.212114997523122,-0.37529594269535,0.902308252883777 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0064002983+$x,-0.057357383+$y,0.27548781+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.058143813+$x,-0.047214741+$y,0.26453337+$z);

    OpenGL::glNormal3f( -0.263990329908303,-0.340653712649965,0.902365864698295 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0064002983+$x,-0.057357383+$y,0.27548781+$z);

    OpenGL::glNormal3f( -0.242301945040641,-0.374538054395973,0.894992186132818 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);

    OpenGL::glNormal3f( 0.521625124573258,0.852830406836094,-0.0242389477848427 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.032428772+$x,-0.022219689+$y,0.25511874+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.020133486+$x,0.010243408+$y,0.26616385+$z);

    OpenGL::glNormal3f( 0.582020487044475,0.812838719595348,-0.023353127994056 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.032428772+$x,-0.022219689+$y,0.25511874+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);

    OpenGL::glNormal3f( 0.357553717378569,0.269579934721052,-0.894137572180344 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.019431777+$x,0.0095575104+$y,0.18226102+$z);

    OpenGL::glNormal3f( 0.200518832500113,0.39242691082587,-0.897659911922359 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);

    OpenGL::glNormal3f( 0.508940693089862,0.860777795192387,0.00639986100977117 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.032244706+$x,-0.023877027+$y,0.19284534+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);

    OpenGL::glNormal3f( -0.568141576870448,-0.822914474516391,-0.00518808852772567 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.01784578+$x,-0.093630331+$y,0.25470107+$z);

    OpenGL::glNormal3f( 0.2317288721722,0.353669724770105,0.906211595369888 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0064002983+$x,-0.057357383+$y,0.27548781+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.032428772+$x,-0.022219689+$y,0.25511874+$z);

    OpenGL::glNormal3f( -0.219193966625262,-0.377206942316677,-0.899816052125759 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024127985+$x,-0.070008166+$y,0.17321511+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);

    OpenGL::glNormal3f( 0.257140934030912,0.302350523842663,-0.917857669128377 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0063480592+$x,-0.057568806+$y,0.17233164+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024127985+$x,-0.070008166+$y,0.17321511+$z);

    OpenGL::glNormal3f( 0.258332982697653,0.965976269990773,0.0124062832970882 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.030682563+$x,-0.36390787+$y,0.12524518+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.705683,0.93425); OpenGL::glVertex3f(-0.035240372+$x,-0.34627162+$y,0.12475103+$z);

    OpenGL::glNormal3f( -0.239582194333211,-0.345789196161419,-0.907210121182807 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024127985+$x,-0.070008166+$y,0.17321511+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(-0.00057956475+$x,-0.10645337+$y,0.19363138+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);

    OpenGL::glNormal3f( 0.837979116044546,-0.544004978786853,0.0430067916533779 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024127985+$x,-0.070008166+$y,0.17321511+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(-0.00057956475+$x,-0.10645337+$y,0.19363138+$z);

    OpenGL::glNormal3f( 0.282214455778265,0.341862928989917,0.896373102414509 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.032428772+$x,-0.022219689+$y,0.25511874+$z);

    OpenGL::glNormal3f( 0.782528143507769,-0.612283217177917,-0.112955595614142 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);

    OpenGL::glNormal3f( 0.794658914966156,-0.605540056696219,0.0428771337795839 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024127985+$x,-0.070008166+$y,0.17321511+$z);

    OpenGL::glNormal3f( -0.606740020729171,-0.794812115978228,0.0118426154111786 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(-0.00057956475+$x,-0.10645337+$y,0.19363138+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018360039+$x,-0.092887274+$y,0.19315616+$z);

    OpenGL::glNormal3f( 0.911461160575167,-0.411343994027054,0.0058882374986569 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(-0.00057956475+$x,-0.10645337+$y,0.19363138+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);

    OpenGL::glNormal3f( 0.608403510456485,-0.79361655346442,-0.00423491811982193 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);

    OpenGL::glNormal3f( 0.745552321201427,-0.660477947275407,-0.0889978511764732 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.040819616+$x,-0.043577119+$y,0.24132565+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);

    OpenGL::glNormal3f( 0.782709087468078,-0.60316335487363,-0.153494142339292 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.050082569+$x,-0.034881364+$y,0.25438958+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.040819616+$x,-0.043577119+$y,0.24132565+$z);

    OpenGL::glNormal3f( 0.831379785907342,-0.544232412713206,-0.112333131964815 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.025135836+$x,-0.070736193+$y,0.2759183+$z);

    OpenGL::glNormal3f( 0.838724774494047,-0.540020835500087,-0.0701302351036818 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.906343,0.303733); OpenGL::glVertex3f(0.0061149086+$x,-0.093225491+$y,0.23935015+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);

    OpenGL::glNormal3f( 0.850017297886847,-0.524170548668082,-0.0521136182023912 );
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(-0.00056762918+$x,-0.10555722+$y,0.25438761+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.786136,0.312218); OpenGL::glVertex3f(0.0061149086+$x,-0.093225491+$y,0.23935015+$z);

    OpenGL::glNormal3f( 0.878981460864259,-0.476490046820142,-0.0186769038727441 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);

    OpenGL::glNormal3f( 0.95778735333351,0.285905889593414,-0.030020128084136 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.011197288+$x,0.38131963+$y,0.026087841+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);

    OpenGL::glNormal3f( 0.96651313534992,0.256449034076283,0.00928720180722156 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);
    OpenGL::glTexCoord2f(0.443463,0.169879); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.011197288+$x,0.38131963+$y,0.026087841+$z);

    OpenGL::glNormal3f( 0.956628273773811,0.289994795999693,0.027665214794656 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);
    OpenGL::glTexCoord2f(0.443463,0.169879); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);

    OpenGL::glNormal3f( 0.409457846615698,-0.24625352278382,0.878466547092941 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);

    OpenGL::glNormal3f( 0.55841254850794,0.092755121329751,0.824361518471096 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.0039231061+$x,0.34262624+$y,0.015409614+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);

    OpenGL::glNormal3f( 0.953105958091005,-0.229958024981935,-0.19674435035811 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.01474871+$x,0.35036741+$y,0.033779768+$z);

    OpenGL::glNormal3f( 0.61378576552155,0.0954946363516151,0.783675831240953 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);

    OpenGL::glNormal3f( 0.0878048932677705,0.996015107233706,-0.0156271200310458 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);

    OpenGL::glNormal3f( 0.579894177429224,0.131797302758652,0.803960331091795 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);
    OpenGL::glTexCoord2f(0.474002,0.23214); OpenGL::glVertex3f(0.0039231061+$x,0.34262624+$y,0.015409614+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);

    OpenGL::glNormal3f( 0.292883589784045,0.0618275019410626,0.954147034182331 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);

    OpenGL::glNormal3f( 0.956692795598894,0.0213581661147962,0.290314869735232 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.013471325+$x,0.29035974+$y,0.011868267+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);

    OpenGL::glNormal3f( 0.880382825494492,0.351768333615799,-0.318096086174441 );
    OpenGL::glTexCoord2f(0.083833,0.121737); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);
    OpenGL::glTexCoord2f(0.056483,0.113005); OpenGL::glVertex3f(0.007350152+$x,0.30185503+$y,0.036062224+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);

    OpenGL::glNormal3f( 0.844128409483624,-0.534093432135859,-0.0468127552274496 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.012493127+$x,0.29089388+$y,-0.011864696+$z);
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.013471325+$x,0.29035974+$y,0.011868267+$z);

    OpenGL::glNormal3f( 0.979068191825386,-0.201603476020145,0.0279555756936714 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);
    OpenGL::glTexCoord2f(0.556157,0.237438); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.012493127+$x,0.29089388+$y,-0.011864696+$z);

    OpenGL::glNormal3f( 0.387940883852808,0.37234317145371,0.84312658201915 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);

    OpenGL::glNormal3f( 0.261661620770215,0.0699564718909325,0.962621051222379 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.029762198+$x,0.31786774+$y,0.0068243363+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.033199391+$x,0.3184578+$y,0.0058471501+$z);

    OpenGL::glNormal3f( 0.818758137966286,0.561941212169785,0.117716547601149 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);

    OpenGL::glNormal3f( 0.873465603184515,0.484199279751321,-0.0510773681958403 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);

    OpenGL::glNormal3f( 0.993687654510432,0.109572458306191,0.024056634309378 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016373337+$x,0.36236792+$y,0.010736433+$z);

    OpenGL::glNormal3f( 0.986865743587938,0.145039885269515,0.0711297111875981 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.018571026+$x,0.34380493+$y,0.0045084637+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);

    OpenGL::glNormal3f( 0.894243894372445,0.181126077478214,0.40929353944933 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013905992+$x,0.29822127+$y,0.014127455+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.013347216+$x,0.30558393+$y,0.012090072+$z);

    OpenGL::glNormal3f( 0.981963650425806,-0.182812020086001,0.048240590320819 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);

    OpenGL::glNormal3f( 0.980535759851603,0.0113931732860749,0.196009742754571 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.007350152+$x,0.30185503+$y,0.036062224+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.010039429+$x,0.28390278+$y,0.023652641+$z);

    OpenGL::glNormal3f( 0.890343941494428,-0.170539509152152,0.422142087054004 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.013471325+$x,0.29035974+$y,0.011868267+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013905992+$x,0.29822127+$y,0.014127455+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);

    OpenGL::glNormal3f( 0.998590638222039,-0.0512575259723972,-0.0137623866567457 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.013471325+$x,0.29035974+$y,0.011868267+$z);
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.013528188+$x,0.29860362+$y,-0.014709829+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013905992+$x,0.29822127+$y,0.014127455+$z);

    OpenGL::glNormal3f( 0.987871671965529,-0.148887819891095,-0.0440678660262508 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.013471325+$x,0.29035974+$y,0.011868267+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.012493127+$x,0.29089388+$y,-0.011864696+$z);
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.013528188+$x,0.29860362+$y,-0.014709829+$z);

    OpenGL::glNormal3f( 0.96003782139184,-0.0371572114922993,0.277392723645244 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.013347216+$x,0.30558393+$y,0.012090072+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.010171983+$x,0.29855535+$y,0.022137853+$z);

    OpenGL::glNormal3f( 0.997098456678183,-0.0516246975942748,-0.0559424551506663 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.013347216+$x,0.30558393+$y,0.012090072+$z);
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);

    OpenGL::glNormal3f( 0.99952234722837,0.0118467732039663,-0.028543499360512 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.013347216+$x,0.30558393+$y,0.012090072+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.012626277+$x,0.30576006+$y,-0.013082317+$z);
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);

    OpenGL::glNormal3f( 0.997295622159857,0.0679156769468817,-0.0280874143635573 );
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013905992+$x,0.29822127+$y,0.014127455+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.012626277+$x,0.30576006+$y,-0.013082317+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.013347216+$x,0.30558393+$y,0.012090072+$z);

    OpenGL::glNormal3f( 0.407415423458208,-0.913213340699344,-0.00735303319128851 );
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.0040779992+$x,0.34790127+$y,0.016397579+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);

    OpenGL::glNormal3f( 0.391840481361806,0.918489921394038,-0.0532663257952106 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0096479429+$x,0.34569149+$y,0.019267474+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0040779992+$x,0.34790127+$y,0.016397579+$z);

    OpenGL::glNormal3f( 0.4820068674087,0.370965018166367,0.793759620456772 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.010042402+$x,0.34565572+$y,0.02475574+$z);

    OpenGL::glNormal3f( 0.452386022401014,0.344261161574594,0.822697477428672 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.0039378525+$x,0.34243849+$y,0.029633283+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);

    OpenGL::glNormal3f( 0.736351263825631,-0.145382781498382,0.660795477516447 );
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.0040779992+$x,0.34790127+$y,0.016397579+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.0039231061+$x,0.34262624+$y,0.015409614+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.0099769662+$x,0.35058118+$y,0.010413732+$z);

    OpenGL::glNormal3f( 0.0996779568639788,0.994949599399689,-0.0118152261857558 );
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011229355+$x,0.33638692+$y,0.011162482+$z);

    OpenGL::glNormal3f( 0.333678005685846,-0.938280388580384,-0.0910434013367241 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093916528+$x,0.3387039+$y,0.025629486+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);

    OpenGL::glNormal3f( 0.42985700300757,-0.159410890864261,-0.888713184801043 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.0092505065+$x,0.33976283+$y,0.019513364+$z);

    OpenGL::glNormal3f( 0.5423475323055,-0.315418926244252,-0.778697666086818 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.0039231061+$x,0.34262624+$y,0.015409614+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);

    OpenGL::glNormal3f( 0.545982299397279,0.360470087010327,-0.756283442312224 );
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0039378525+$x,0.34243849+$y,0.029633283+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.014339223+$x,0.33647579+$y,0.034300302+$z);

    OpenGL::glNormal3f( 0.428223898254485,0.903329820638009,-0.0248903216097294 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.010042402+$x,0.34565572+$y,0.02475574+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0096479429+$x,0.34569149+$y,0.019267474+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0048598465+$x,0.34816689+$y,0.026729223+$z);

    OpenGL::glNormal3f( 0.995928591851534,-0.0543290649485912,-0.0719346414075475 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.010042402+$x,0.34565572+$y,0.02475574+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0096479429+$x,0.34569149+$y,0.019267474+$z);

    OpenGL::glNormal3f( 0.989472071059359,-0.00427501873013138,-0.144660792229131 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.010042402+$x,0.34565572+$y,0.02475574+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.0092505065+$x,0.33976283+$y,0.019513364+$z);

    OpenGL::glNormal3f( 0.480802495903709,0.077615890747072,-0.873386932256433 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0096479429+$x,0.34569149+$y,0.019267474+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0040779992+$x,0.34790127+$y,0.016397579+$z);

    OpenGL::glNormal3f( 0.42265453493924,-0.891315246078283,-0.164073996122802 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.0092505065+$x,0.33976283+$y,0.019513364+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093916528+$x,0.3387039+$y,0.025629486+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0030136281+$x,0.33727864+$y,0.016942277+$z);

    OpenGL::glNormal3f( 0.994984386674697,-0.0780515314496205,-0.0625621987461029 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.0092505065+$x,0.33976283+$y,0.019513364+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.010042402+$x,0.34565572+$y,0.02475574+$z);

    OpenGL::glNormal3f( 0.964816922388053,-0.254421941602703,-0.066315774177463 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.0092505065+$x,0.33976283+$y,0.019513364+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093916528+$x,0.3387039+$y,0.025629486+$z);

    OpenGL::glNormal3f( 0.660537028840824,-0.351628209527357,0.663361466920352 );
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093916528+$x,0.3387039+$y,0.025629486+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);

    OpenGL::glNormal3f( 0.519852565758905,0.14248833767845,-0.842288776785917 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0095022303+$x,0.34339661+$y,0.018983318+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.0039231061+$x,0.34262624+$y,0.015409614+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0040779992+$x,0.34790127+$y,0.016397579+$z);

    OpenGL::glNormal3f( 0.449308779595915,-0.0499566110361784,0.891978675525267 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.010267737+$x,0.34182266+$y,0.026410294+$z);
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.0039378525+$x,0.34243849+$y,0.029633283+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.0057561605+$x,0.33714019+$y,0.028420623+$z);

    OpenGL::glNormal3f( 0.905452740035677,0.420711865010005,-0.0561859608949342 );
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.033199391+$x,0.3184578+$y,0.0058471501+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);

    OpenGL::glNormal3f( 0.282914961698558,0.0727941280881619,0.956378658985544 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.029762198+$x,0.31786774+$y,0.0068243363+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.028089109+$x,0.32953412+$y,0.006431289+$z);

    OpenGL::glNormal3f( 0.160786823824382,-0.985844552162253,0.0475196407443653 );
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.028988584+$x,0.31705986+$y,-0.0073183876+$z);
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.029762198+$x,0.31786774+$y,0.0068243363+$z);

    OpenGL::glNormal3f( 0.157336038178832,-0.986636778043636,-0.0423466563244708 );
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.029762198+$x,0.31786774+$y,0.0068243363+$z);
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.032418946+$x,0.3187978+$y,-0.004974215+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.033199391+$x,0.3184578+$y,0.0058471501+$z);

    OpenGL::glNormal3f( -0.784770974606956,0.368300883498115,0.498486686511241 );
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10235363+$x,0.39057159+$y,0.027071667+$z);
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13184931+$x,0.33391623+$y,0.022495548+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);

    OpenGL::glNormal3f( -0.886770874511754,0.462167704902223,-0.0061990856641549 );
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10235363+$x,0.39057159+$y,0.027071667+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13184931+$x,0.33391623+$y,0.022495548+$z);

    OpenGL::glNormal3f( 0.668163024678647,0.0405127728017571,0.742911090031772 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);
    OpenGL::glTexCoord2f(0.503631,0.08026); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);

    OpenGL::glNormal3f( 0.606460927278429,0.0380998342698778,0.794199941018127 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.03534414+$x,0.33513421+$y,0.073114463+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);

    OpenGL::glNormal3f( -0.0494735376797001,0.399259661758776,0.915502098065167 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.03534414+$x,0.33513421+$y,0.073114463+$z);

    OpenGL::glNormal3f( 0.239044787543495,0.650938991465236,0.720510942969297 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);

    OpenGL::glNormal3f( 0.571536879906219,0.328826396858534,0.751810345523456 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016906287+$x,0.36259849+$y,0.029936021+$z);
    OpenGL::glTexCoord2f(0.432926,0.238482); OpenGL::glVertex3f(0.011197288+$x,0.38131963+$y,0.026087841+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);

    OpenGL::glNormal3f( 0.320599569570792,0.631664966938957,0.705843669329852 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.011197288+$x,0.38131963+$y,0.026087841+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024871511+$x,0.3571959+$y,0.064059077+$z);

    OpenGL::glNormal3f( 0.537879130818819,0.84300790647448,0.00486931731408517 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.011197288+$x,0.38131963+$y,0.026087841+$z);
    OpenGL::glTexCoord2f(0.569474,0.007328); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);

    OpenGL::glNormal3f( -0.454027729117639,-0.103286391492265,0.884980645282588 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.05093225+$x,0.29687272+$y,0.078603004+$z);

    OpenGL::glNormal3f( -0.385065121255296,0.430187732906201,0.816494560208252 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10235363+$x,0.39057159+$y,0.027071667+$z);

    OpenGL::glNormal3f( -0.83289560700571,-0.0673782549143261,0.549313279099723 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13184931+$x,0.33391623+$y,0.022495548+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);

    OpenGL::glNormal3f( -0.96293232217033,-0.269368294878696,-0.0142149440308133 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13184931+$x,0.33391623+$y,0.022495548+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(-0.13158283+$x,0.33533761+$y,-0.022490694+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);

    OpenGL::glNormal3f( -0.880816194836335,0.473358205833318,0.00973857711892008 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13184931+$x,0.33391623+$y,0.022495548+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(-0.13158283+$x,0.33533761+$y,-0.022490694+$z);

    OpenGL::glNormal3f( 0.17695515609588,-0.971602833540331,0.15708216508402 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);

    OpenGL::glNormal3f( 0.657962438462769,-0.196195329544206,0.727043892923369 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.05093225+$x,0.29687272+$y,0.078603004+$z);

    OpenGL::glNormal3f( 0.214947453026007,-0.0861844506868362,-0.972815415635176 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(-0.04551186+$x,0.31702849+$y,0.061090972+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);

    OpenGL::glNormal3f( -0.0794872024952537,-0.65780570901863,0.748981597785938 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.05093225+$x,0.29687272+$y,0.078603004+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);

    OpenGL::glNormal3f( -0.263072978382058,0.241179784058316,0.93414395025969 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.05093225+$x,0.29687272+$y,0.078603004+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.03534414+$x,0.33513421+$y,0.073114463+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);

    OpenGL::glNormal3f( 0.0100661021138651,-0.999946620469563,0.00233019306778195 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);

    OpenGL::glNormal3f( 0.0303011832472622,-0.999507762526464,0.00812840348150375 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.563769,0.218347); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);

    OpenGL::glNormal3f( -0.965691456586698,-0.259676283692623,-0.00287025487552245 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11257753+$x,0.26393482+$y,0.043132507+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(-0.13158283+$x,0.33533761+$y,-0.022490694+$z);
    OpenGL::glTexCoord2f(0.563769,0.218347); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);

    OpenGL::glNormal3f( 0.599526457186226,-0.130991691566658,0.789562666211009 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.03534414+$x,0.33513421+$y,0.073114463+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.05093225+$x,0.29687272+$y,0.078603004+$z);

    OpenGL::glNormal3f( 0.41169235506316,-0.348782719049654,-0.841938251699541 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.023794384+$x,0.33490212+$y,0.06430606+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(-0.04551186+$x,0.31702849+$y,0.061090972+$z);
    OpenGL::glTexCoord2f(0.498678,0.081409); OpenGL::glVertex3f(-0.019653147+$x,0.35088513+$y,0.059709901+$z);

    OpenGL::glNormal3f( -0.258519818952544,0.300348525001987,0.91812758739615 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.03534414+$x,0.33513421+$y,0.073114463+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.11300003+$x,0.33518652+$y,0.051231559+$z);

    OpenGL::glNormal3f( -0.236551664129281,0.761183306284908,0.603857006609051 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.075080876+$x,0.40313366+$y,0.02192041+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10235363+$x,0.39057159+$y,0.027071667+$z);

    OpenGL::glNormal3f( 0.00958086885942274,0.852009714930106,0.523438298767503 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.059670599+$x,0.38592474+$y,0.049649606+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.075080876+$x,0.40313366+$y,0.02192041+$z);

    OpenGL::glNormal3f( -0.418998554666775,0.907977603055016,-0.00410895821606144 );
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.075080876+$x,0.40313366+$y,0.02192041+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10235363+$x,0.39057159+$y,0.027071667+$z);

    OpenGL::glNormal3f( 0.564591153565413,0.824782082194025,0.0311664275682161 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);
    OpenGL::glTexCoord2f(0.569474,0.007328); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);
    OpenGL::glTexCoord2f(0.582086,0.037976); OpenGL::glVertex3f(-0.02078313+$x,0.40339908+$y,-0.022656108+$z);

    OpenGL::glNormal3f( 0.0147254295242009,0.999891479611054,0.000436722502856022 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(-0.074606455+$x,0.40314652+$y,-0.02351956+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.075080876+$x,0.40313366+$y,0.02192041+$z);

    OpenGL::glNormal3f( 0.197885267774146,0.135836109193341,0.970767723112573 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(-0.04551186+$x,0.31702849+$y,0.061090972+$z);
    OpenGL::glTexCoord2f(0.504443,0.329853); OpenGL::glVertex3f(-0.041102023+$x,0.28053606+$y,0.06529831+$z);

    OpenGL::glNormal3f( 0.513523115546008,-0.185004037351428,0.837894692645557 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.016696787+$x,0.31998644+$y,0.054803294+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.007350152+$x,0.30185503+$y,0.036062224+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01333188+$x,0.31924896+$y,0.036236699+$z);

    OpenGL::glNormal3f( 0.616897282920993,-0.177999578466602,0.766651089081865 );
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.03783605+$x,-0.0044807081+$y,0.022176352+$z);
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.044721177+$x,-0.0030068111+$y,0.016978338+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);

    OpenGL::glNormal3f( 0.61633498587964,-0.269148273126664,0.740061073326843 );
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.03783605+$x,-0.0044807081+$y,0.022176352+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.039935209+$x,-0.058682111+$y,0.00071596218+$z);
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.044721177+$x,-0.0030068111+$y,0.016978338+$z);

    OpenGL::glNormal3f( 0.998629611550819,-0.0519806973193178,-0.00607503416101525 );
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.044721177+$x,-0.0030068111+$y,0.016978338+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.044477929+$x,-0.0036513667+$y,-0.017492284+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);

    OpenGL::glNormal3f( 0.99644558206972,-0.0840618411634144,-0.00545974669325976 );
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.044721177+$x,-0.0030068111+$y,0.016978338+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.039935209+$x,-0.058682111+$y,0.00071596218+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.044477929+$x,-0.0036513667+$y,-0.017492284+$z);

    OpenGL::glNormal3f( -0.119910746638837,-0.148973903274802,-0.981543778434557 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.017698209+$x,-0.093826943+$y,0.22719286+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.068567724+$x,-0.1354833+$y,0.22730076+$z);

    OpenGL::glNormal3f( 0.14411721152912,-0.449370861042999,-0.881643952276964 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.017698209+$x,-0.093826943+$y,0.22719286+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);

    OpenGL::glNormal3f( -0.784869489925515,-0.614841651859228,0.0771338247662934 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.017698209+$x,-0.093826943+$y,0.22719286+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.028240335+$x,-0.10712923+$y,0.22842958+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030022734+$x,-0.10821521+$y,0.23790979+$z);

    OpenGL::glNormal3f( -0.0235041623173015,-0.999612077709895,-0.0149415009376233 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.018329344+$x,-0.093994234+$y,0.23739209+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.017698209+$x,-0.093826943+$y,0.22719286+$z);

    OpenGL::glNormal3f( 0.19010661489673,0.158567945140519,0.968873408524777 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);

    OpenGL::glNormal3f( 0.559597777325701,0.827944512334044,-0.0368539293437799 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.096139464+$x,-0.092757543+$y,0.22850156+$z);

    OpenGL::glNormal3f( 0.577946028665283,0.815602485553144,-0.0277664097348267 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11353389+$x,-0.10548621+$y,0.21044741+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);

    OpenGL::glNormal3f( -0.0426198354536383,-0.170427323243507,0.984448107884798 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.085836867+$x,-0.12351132+$y,0.23727278+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);

    OpenGL::glNormal3f( 0.724663290509061,-0.553804801996466,0.410077256958045 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.085836867+$x,-0.12351132+$y,0.23727278+$z);

    OpenGL::glNormal3f( -0.579455209278264,-0.814854746045433,0.0156013873587134 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030022734+$x,-0.10821521+$y,0.23790979+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.028240335+$x,-0.10712923+$y,0.22842958+$z);

    OpenGL::glNormal3f( -0.476459237508989,-0.864125237728754,-0.162093085949333 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.068567724+$x,-0.1354833+$y,0.22730076+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);

    OpenGL::glNormal3f( 0.599417936745173,0.794542866309857,-0.0969524146387148 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.096139464+$x,-0.092757543+$y,0.22850156+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);

    OpenGL::glNormal3f( -0.411613300199093,0.618591472053665,-0.669267571156478 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.096139464+$x,-0.092757543+$y,0.22850156+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);

    OpenGL::glNormal3f( 0.627665906915803,0.777088382703472,0.0465741855845633 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.096139464+$x,-0.092757543+$y,0.22850156+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);

    OpenGL::glNormal3f( 0.275063415850792,-0.249047608668384,0.928609393597251 );
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);

    OpenGL::glNormal3f( -0.000525845154006458,-0.0566712054512852,-0.998392757365343 );
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);

    OpenGL::glNormal3f( -0.196473327973752,-0.321338629211598,-0.926358309063685 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);

    OpenGL::glNormal3f( -0.297740520071544,0.502092649407487,-0.811944304813142 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.044960097+$x,-0.055789841+$y,0.22588626+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);

    OpenGL::glNormal3f( 0.427681062768735,0.0349860688128438,-0.903252391935958 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.044960097+$x,-0.055789841+$y,0.22588626+$z);

    OpenGL::glNormal3f( 0.204999864239826,0.067184056281018,-0.976453459332949 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);
    OpenGL::glTexCoord2f(0.783541,0.359685); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);

    OpenGL::glNormal3f( -0.168942116864158,-0.274784634768053,-0.946547392181102 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.017698209+$x,-0.093826943+$y,0.22719286+$z);

    OpenGL::glNormal3f( 0.0108875629191022,-0.0282638392545933,-0.999541202934763 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);

    OpenGL::glNormal3f( 0.209204052427412,-0.226612891876053,-0.951251944378313 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.036184726+$x,-0.068509568+$y,0.22123853+$z);

    OpenGL::glNormal3f( 0.0317098062355066,-0.281428295222181,-0.959058185323937 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.026015446+$x,-0.080863758+$y,0.22194514+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);

    OpenGL::glNormal3f( 0.04185330321992,-0.0628253377204958,0.997146567937676 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);

    OpenGL::glNormal3f( 0.0517285220928896,-0.0410267811583181,0.997818101273911 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.085836867+$x,-0.12351132+$y,0.23727278+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);

    OpenGL::glNormal3f( 0.119704108336538,-0.405862360866531,0.906061074364858 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0061149086+$x,-0.093225491+$y,0.23935015+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.018329344+$x,-0.093994234+$y,0.23739209+$z);

    OpenGL::glNormal3f( 0.211839364027956,0.170970913169234,0.962233355635892 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);

    OpenGL::glNormal3f( 0.846375090373314,-0.257096646996051,0.46642311316974 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);

    OpenGL::glNormal3f( 0.71898469858364,-0.496027881827188,0.486844270432164 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.085836867+$x,-0.12351132+$y,0.23727278+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);

    OpenGL::glNormal3f( -0.670958192761894,0.200751835294031,-0.713802356532796 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.068567724+$x,-0.1354833+$y,0.22730076+$z);

    OpenGL::glNormal3f( -0.539335582513902,0.3309787162194,-0.774319197000919 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);

    OpenGL::glNormal3f( 0.374823610187028,0.0897422194455596,-0.922742431719354 );
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.096139464+$x,-0.092757543+$y,0.22850156+$z);

    OpenGL::glNormal3f( -0.294647849790559,0.506493796845474,-0.810337385519671 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.044960097+$x,-0.055789841+$y,0.22588626+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);

    OpenGL::glNormal3f( 0.581252012883674,0.148355270273907,-0.800085502493723 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);

    OpenGL::glNormal3f( 0.203968094200502,0.0992851101782945,0.973929917111647 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);

    OpenGL::glNormal3f( 0.832136464374809,-0.198851848795396,0.517693777139 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);

    OpenGL::glNormal3f( 0.192385186234912,0.923973995124956,0.330544999130506 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);

    OpenGL::glNormal3f( -0.131410136397092,0.989632446797921,-0.0579568485759731 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.044960097+$x,-0.055789841+$y,0.22588626+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);

    OpenGL::glNormal3f( -0.689565738356824,0.60980788739069,-0.390683289840392 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.075424418+$x,-0.05766208+$y,0.20246632+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);

    OpenGL::glNormal3f( 0.286020365967416,0.224845050595177,0.931470371764297 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072208237+$x,-0.073848048+$y,0.23551116+$z);

    OpenGL::glNormal3f( 0.392150300585236,0.905247950974711,0.163536812390958 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);

    OpenGL::glNormal3f( 0.840661419707849,-0.194908113069835,0.505271417036765 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);

    OpenGL::glNormal3f( 0.381430026047876,-0.0215173700649389,0.92414724909757 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040819616+$x,-0.043577119+$y,0.24132565+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);

    OpenGL::glNormal3f( 0.908772068780124,0.414861516480957,-0.0449805418843949 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.044960097+$x,-0.055789841+$y,0.22588626+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);

    OpenGL::glNormal3f( 0.871884204255261,-0.144664068613128,0.467857073925859 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.096637799+$x,-0.070004793+$y,0.19499087+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.093506603+$x,-0.077123975+$y,0.19862478+$z);

    OpenGL::glNormal3f( 0.866192333158473,0.12920085966762,0.48271935929547 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.096637799+$x,-0.070004793+$y,0.19499087+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);

    OpenGL::glNormal3f( 0.62893353302534,0.0953418282316052,-0.771590919351517 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.096637799+$x,-0.070004793+$y,0.19499087+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.092308029+$x,-0.074887716+$y,0.19085826+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);

    OpenGL::glNormal3f( -0.302522262878676,-0.921011012395634,0.245395589831468 );
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093506603+$x,-0.077123975+$y,0.19862478+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.085112683+$x,-0.076353595+$y,0.19116817+$z);

    OpenGL::glNormal3f( 0.82252446913081,-0.500055532219829,-0.270920583155696 );
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.093506603+$x,-0.077123975+$y,0.19862478+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.092308029+$x,-0.074887716+$y,0.19085826+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.096637799+$x,-0.070004793+$y,0.19499087+$z);

    OpenGL::glNormal3f( 0.340870552997577,0.84021802785968,-0.421711906114489 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.096637799+$x,-0.070004793+$y,0.19499087+$z);

    OpenGL::glNormal3f( 0.339881393872089,0.840489104724839,-0.42197002611371 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.075424418+$x,-0.05766208+$y,0.20246632+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);

    OpenGL::glNormal3f( -0.70570400728664,0.0363438643895825,-0.707574008582006 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.075424418+$x,-0.05766208+$y,0.20246632+$z);

    OpenGL::glNormal3f( 0.0427764970168109,-0.40322595519362,-0.914100104124906 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.092308029+$x,-0.074887716+$y,0.19085826+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.085112683+$x,-0.076353595+$y,0.19116817+$z);

    OpenGL::glNormal3f( -0.704116890460497,0.113814245672071,-0.700903504093351 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.085112683+$x,-0.076353595+$y,0.19116817+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.08874042+$x,-0.070033574+$y,0.18855006+$z);

    OpenGL::glNormal3f( 0.178260255702841,-0.937910684523645,-0.297568192341092 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.085112683+$x,-0.076353595+$y,0.19116817+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.092308029+$x,-0.074887716+$y,0.19085826+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093506603+$x,-0.077123975+$y,0.19862478+$z);

    OpenGL::glNormal3f( 0.932390709462164,0.140265553164095,0.333126311636011 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079514393+$x,-0.058659516+$y,0.22960139+$z);

    OpenGL::glNormal3f( -0.279685606095494,-0.895528133148546,0.346129057552924 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093506603+$x,-0.077123975+$y,0.19862478+$z);

    OpenGL::glNormal3f( 0.25619456700035,-0.90227060455315,-0.346802681648796 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.088289659+$x,-0.071005776+$y,0.2102387+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);

    OpenGL::glNormal3f( 0.205357867952727,0.951575614888723,-0.228761874487555 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086322652+$x,-0.058125735+$y,0.21032093+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.075424418+$x,-0.05766208+$y,0.20246632+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.07069082+$x,-0.052812063+$y,0.21839151+$z);

    OpenGL::glNormal3f( -0.694318137185701,0.0383550479703325,-0.718645402594472 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.075424418+$x,-0.05766208+$y,0.20246632+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);

    OpenGL::glNormal3f( -0.592619392467006,-0.780002938072818,-0.200991721893737 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.076272327+$x,-0.070845268+$y,0.20094351+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.078937155+$x,-0.078527128+$y,0.22289787+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063085662+$x,-0.064200797+$y,0.21403841+$z);

    OpenGL::glNormal3f( -0.426716390358781,0.472997224902453,-0.770835097432487 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.096320175+$x,-0.11165439+$y,0.21361189+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);

    OpenGL::glNormal3f( -0.702505088398259,0.698888229196323,0.134319931005723 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.096320175+$x,-0.11165439+$y,0.21361189+$z);

    OpenGL::glNormal3f( -0.52711703518581,0.33525275440512,-0.780866968107054 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.096320175+$x,-0.11165439+$y,0.21361189+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.086224808+$x,-0.10500035+$y,0.22328348+$z);

    OpenGL::glNormal3f( -0.865816279865684,0.491440613229657,0.0940653665703042 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.096320175+$x,-0.11165439+$y,0.21361189+$z);
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);

    OpenGL::glNormal3f( -0.600345753664877,0.236352248025443,-0.764017402229733 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.077706794+$x,-0.11822295+$y,0.22356459+$z);

    OpenGL::glNormal3f( -0.882175101435074,0.409008104264047,0.233408356864846 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);

    OpenGL::glNormal3f( -0.868481446715588,0.46375345200362,0.175136268275664 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);

    OpenGL::glNormal3f( -0.814592775690432,0.549607668978885,0.185391531609602 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.088076339+$x,-0.12605969+$y,0.21299213+$z);
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);

    OpenGL::glNormal3f( -0.583723789995154,-0.787561566157984,-0.197517889074576 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);

    OpenGL::glNormal3f( -0.545456077832651,-0.838137702748267,0.00169067657435347 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.081706763+$x,-0.14016423+$y,0.21363388+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);

    OpenGL::glNormal3f( 0.599879310684195,-0.640979970798371,0.478841821114629 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.085836867+$x,-0.12351132+$y,0.23727278+$z);

    OpenGL::glNormal3f( 0.63839346341001,-0.724807458824619,-0.259051989970298 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);

    OpenGL::glNormal3f( 0.717057412748218,-0.497732404598855,0.487945816904985 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.094174899+$x,-0.11135933+$y,0.23734017+$z);

    OpenGL::glNormal3f( 0.789522234938865,-0.525337341033993,-0.317293741905625 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);

    OpenGL::glNormal3f( 0.749934552168388,-0.356705284000306,0.557099190297617 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11353389+$x,-0.10548621+$y,0.21044741+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10102919+$x,-0.095841931+$y,0.23345565+$z);

    OpenGL::glNormal3f( 0.793671572922256,-0.483704126011388,-0.368938684356455 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11353389+$x,-0.10548621+$y,0.21044741+$z);

    OpenGL::glNormal3f( 0.863893607619213,-0.41084452852896,-0.291366793050406 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);

    OpenGL::glNormal3f( 0.783032393829824,-0.541749695833763,-0.305561020546079 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.10557543+$x,-0.11974995+$y,0.21202769+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);

    OpenGL::glNormal3f( 0.580027931497302,0.814281703277265,-0.0226474367387693 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11353389+$x,-0.10548621+$y,0.21044741+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10718074+$x,-0.10085565+$y,0.21422602+$z);

    OpenGL::glNormal3f( 0.541220218877333,0.840530976669684,0.0242559670406927 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11353389+$x,-0.10548621+$y,0.21044741+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);

    OpenGL::glNormal3f( -0.41276826918937,-0.90654692588898,-0.0882894507381927 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.08539657+$x,-0.1425682+$y,0.21231474+$z);

    OpenGL::glNormal3f( -0.67083783872295,-0.685005277674783,-0.284155527300128 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.073089721+$x,-0.12800324+$y,0.18796119+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);

    OpenGL::glNormal3f( 0.668452816814909,-0.677852522997687,-0.306082976916203 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.097504888+$x,-0.13168757+$y,0.21171065+$z);

    OpenGL::glNormal3f( 0.359396070416148,-0.490901707669166,-0.7936308827011 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.073734086+$x,-0.12816312+$y,0.18370351+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);

    OpenGL::glNormal3f( -0.735821053739839,0.671660570264288,0.0862522766391997 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.096320175+$x,-0.11165439+$y,0.21361189+$z);

    OpenGL::glNormal3f( -0.583765163286234,0.482603812444336,0.652925565702239 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.091136453+$x,-0.099666189+$y,0.18764524+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);

    OpenGL::glNormal3f( 0.132088228070961,0.983943320398068,-0.120034337791728 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.091136453+$x,-0.099666189+$y,0.18764524+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.10544597+$x,-0.099996603+$y,0.20068326+$z);

    OpenGL::glNormal3f( 0.169483486108402,0.95202703827385,-0.254793772161063 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.092354353+$x,-0.10074122+$y,0.18443855+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.091136453+$x,-0.099666189+$y,0.18764524+$z);

    OpenGL::glNormal3f( 0.46343059178664,-0.110708482304632,-0.879190376734237 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.092354353+$x,-0.10074122+$y,0.18443855+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10782056+$x,-0.10129409+$y,0.19266057+$z);

    OpenGL::glNormal3f( 0.493184444972721,-0.399958174508537,-0.7725299747458 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.082031918+$x,-0.1213549+$y,0.18217746+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);

    OpenGL::glNormal3f( -0.702035919666422,0.315760209337623,0.638311097895988 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.073089721+$x,-0.12800324+$y,0.18796119+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.078786412+$x,-0.13829256+$y,0.19931653+$z);

    OpenGL::glNormal3f( -0.503538244767703,0.408005858353619,0.761564478954597 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);

    OpenGL::glNormal3f( -0.377708885289427,0.602799614163195,0.702829014155023 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.091136453+$x,-0.099666189+$y,0.18764524+$z);
    OpenGL::glTexCoord2f(0.901713,0.490842); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.095005898+$x,-0.11130905+$y,0.19971053+$z);

    OpenGL::glNormal3f( -0.636481005041258,0.62540405018862,-0.451399716691693 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.091136453+$x,-0.099666189+$y,0.18764524+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.092354353+$x,-0.10074122+$y,0.18443855+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);

    OpenGL::glNormal3f( -0.458376274536691,0.429371843128227,0.778158731410587 );
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);

    OpenGL::glNormal3f( -0.605870913562341,0.470890808096683,-0.641234967035631 );
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.088551639+$x,-0.10987346+$y,0.18178013+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);

    OpenGL::glNormal3f( -0.622368295674701,0.44633513452811,-0.642995063919422 );
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.083029554+$x,-0.10670432+$y,0.18932493+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.092354353+$x,-0.10074122+$y,0.18443855+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.088551639+$x,-0.10987346+$y,0.18178013+$z);

    OpenGL::glNormal3f( -0.68200122849474,-0.0404583050481205,0.730231093479522 );
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.073089721+$x,-0.12800324+$y,0.18796119+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.086841554+$x,-0.12385631+$y,0.20103451+$z);

    OpenGL::glNormal3f( -0.976400504922244,0.151944741617432,-0.153475892186357 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.073734086+$x,-0.12816312+$y,0.18370351+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.073089721+$x,-0.12800324+$y,0.18796119+$z);

    OpenGL::glNormal3f( -0.500370909126183,0.443123935792465,-0.743821303021117 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.082031918+$x,-0.1213549+$y,0.18217746+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.073734086+$x,-0.12816312+$y,0.18370351+$z);

    OpenGL::glNormal3f( -0.58696264814747,0.30738616617721,-0.748991718594128 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.074517714+$x,-0.11685597+$y,0.18991248+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.088551639+$x,-0.10987346+$y,0.18178013+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.082031918+$x,-0.1213549+$y,0.18217746+$z);

    OpenGL::glNormal3f( -0.75837812836866,-0.645496688516434,-0.090535294368355 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.073089721+$x,-0.12800324+$y,0.18796119+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.073734086+$x,-0.12816312+$y,0.18370351+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.081874835+$x,-0.13920226+$y,0.19421833+$z);

    OpenGL::glNormal3f( 0.335313862074422,-0.57581625663434,-0.745654244604261 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.073734086+$x,-0.12816312+$y,0.18370351+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.082031918+$x,-0.1213549+$y,0.18217746+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.091712307+$x,-0.12853275+$y,0.19207359+$z);

    OpenGL::glNormal3f( 0.480378230352746,-0.301286966632083,-0.82368860593115 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.082031918+$x,-0.1213549+$y,0.18217746+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.088551639+$x,-0.10987346+$y,0.18178013+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);

    OpenGL::glNormal3f( 0.583348582638732,-0.00647699876666509,-0.81219608446505 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.088551639+$x,-0.10987346+$y,0.18178013+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.092354353+$x,-0.10074122+$y,0.18443855+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10085549+$x,-0.11451685+$y,0.19065423+$z);

    OpenGL::glNormal3f( 0.923821034036395,0.373984528333254,-0.0817940684847015 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040819616+$x,-0.043577119+$y,0.24132565+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.045246525+$x,-0.054970155+$y,0.23923323+$z);

    OpenGL::glNormal3f( 0.820442843086675,-0.555131721047672,0.136756402096955 );
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039077861+$x,-0.043153459+$y,0.22359053+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.050178662+$x,-0.034475935+$y,0.19221793+$z);

    OpenGL::glNormal3f( 0.287235011275113,-0.0047243510240234,0.957848489483168 );
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040819616+$x,-0.043577119+$y,0.24132565+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036714902+$x,-0.068821556+$y,0.24243204+$z);

    OpenGL::glNormal3f( 0.822975625481896,-0.561821749408536,0.0840680780927897 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.022496358+$x,-0.068954582+$y,0.21833413+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(-0.00057956475+$x,-0.10645337+$y,0.19363138+$z);

    OpenGL::glNormal3f( 0.0680544991835259,-0.326260213707021,0.942827056300745 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.022566955+$x,-0.068624586+$y,0.24667563+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0061149086+$x,-0.093225491+$y,0.23935015+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);

    OpenGL::glNormal3f( -0.059106319920033,-0.997984244551692,0.0231060721910603 );
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0061149086+$x,-0.093225491+$y,0.23935015+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.0050654965+$x,-0.093496523+$y,0.22495945+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.018329344+$x,-0.093994234+$y,0.23739209+$z);

    OpenGL::glNormal3f( 0.99815557444546,-0.0605427145068861,0.00447536854259601 );
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.044477929+$x,-0.0036513667+$y,-0.017492284+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.047612122+$x,0.051330158+$y,0.027267949+$z);

    OpenGL::glNormal3f( 0.578858875482532,-0.298819083522434,-0.758702548827873 );
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.044477929+$x,-0.0036513667+$y,-0.017492284+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.039935209+$x,-0.058682111+$y,0.00071596218+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);

    OpenGL::glNormal3f( 0.599029753257063,-0.187716975244333,-0.778412289161664 );
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.044477929+$x,-0.0036513667+$y,-0.017492284+$z);

    OpenGL::glNormal3f( -0.999048518173959,-0.0425247425660385,0.00968011384795534 );
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.039935209+$x,-0.058682111+$y,0.00071596218+$z);
    OpenGL::glTexCoord2f(0.455921,0.089119); OpenGL::glVertex3f(0.03783605+$x,-0.0044807081+$y,0.022176352+$z);

    OpenGL::glNormal3f( 0.732874944666251,0.336498732306046,-0.591323023936042 );
    OpenGL::glTexCoord2f(0.075002,0.239425); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);
    OpenGL::glTexCoord2f(0.087071,0.19858); OpenGL::glVertex3f(0.0065153108+$x,0.30272908+$y,-0.037073956+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);

    OpenGL::glNormal3f( 0.122875287140711,0.136070871737665,-0.983049531648655 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);
    OpenGL::glTexCoord2f(0.504443,0.329853); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(-0.046492623+$x,0.31664642+$y,-0.060802042+$z);

    OpenGL::glNormal3f( 0.541523855368069,-0.181832934206236,-0.820785415382884 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.0065153108+$x,0.30272908+$y,-0.037073956+$z);

    OpenGL::glNormal3f( 0.557520265385356,0.0745799093633229,-0.826806501428237 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);

    OpenGL::glNormal3f( 0.597356971099845,-0.0455763655742005,-0.80067936402749 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);

    OpenGL::glNormal3f( -0.00506504687285378,0.999715387151601,0.0233128718201146 );
    OpenGL::glTexCoord2f(0.582086,0.037976); OpenGL::glVertex3f(-0.02078313+$x,0.40339908+$y,-0.022656108+$z);
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(-0.074606455+$x,0.40314652+$y,-0.02351956+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.021724704+$x,0.40234775+$y,0.022223033+$z);

    OpenGL::glNormal3f( 0.00509804457181333,0.828411082708816,-0.560097391519324 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.02078313+$x,0.40339908+$y,-0.022656108+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.074606455+$x,0.40314652+$y,-0.02351956+$z);

    OpenGL::glNormal3f( 0.214420192550318,0.646735487851961,-0.73195436318091 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.02078313+$x,0.40339908+$y,-0.022656108+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);

    OpenGL::glNormal3f( 0.339504651711276,0.616954469320491,-0.710002657918881 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(-0.02078313+$x,0.40339908+$y,-0.022656108+$z);

    OpenGL::glNormal3f( 0.608965547811492,-0.188887742127001,-0.770378077603986 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.03734941+$x,-0.0033435231+$y,-0.023052297+$z);

    OpenGL::glNormal3f( 0.620584782910157,0.0278636710132429,-0.783644143127491 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);

    OpenGL::glNormal3f( 0.910559974631087,0.00470937338328778,-0.413350159552614 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.036061595+$x,0.051147822+$y,-0.037430928+$z);
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);

    OpenGL::glNormal3f( 0.977892705809319,0.11114501845512,-0.177123236187518 );
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.047845637+$x,0.05108715+$y,-0.028101047+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.049647993+$x,0.13423326+$y,0.034023985+$z);

    OpenGL::glNormal3f( 0.995498207432677,0.0946120705487499,-0.00564580417706653 );
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);

    OpenGL::glNormal3f( 0.787802293071405,0.0453182336904417,-0.614258744118971 );
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);

    OpenGL::glNormal3f( 0.356785177833036,-0.0130820832767534,-0.9340948538429 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);
    OpenGL::glTexCoord2f(0.075002,0.239425); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);

    OpenGL::glNormal3f( 0.881256337491923,0.472638581248828,0.000197852007454796 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.02629357+$x,0.25583256+$y,0.037597019+$z);

    OpenGL::glNormal3f( 0.440140696856488,0.322206841268337,-0.838128223132097 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);

    OpenGL::glNormal3f( -0.999849060948483,0.0163490860567315,-0.00587900548961429 );
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);
    OpenGL::glTexCoord2f(0.534654,0.2158); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093720087+$x,0.2640772+$y,0.022770011+$z);

    OpenGL::glNormal3f( 0.190563174372649,-0.970105664695518,-0.15026867903421 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);

    OpenGL::glNormal3f( -0.435930561558785,0.010626952347734,-0.899917559214643 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);

    OpenGL::glNormal3f( -0.999950142601799,-0.00987534697194567,0.00147980837474176 );
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(-0.13885533+$x,-0.086362264+$y,-0.057336295+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13870206+$x,-0.084781864+$y,0.056779397+$z);

    OpenGL::glNormal3f( -0.949238715877766,-0.0739271080567897,-0.305746043266451 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13885533+$x,-0.086362264+$y,-0.057336295+$z);

    OpenGL::glNormal3f( -0.91160957497026,-0.0634266861952839,-0.406134261422041 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);

    OpenGL::glNormal3f( -0.424993574802425,0.893667146639227,-0.144012125858758 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);

    OpenGL::glNormal3f( -0.922322699560996,-0.0894580626914612,-0.375922987982922 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);
    OpenGL::glTexCoord2f(0.001952,0.833096); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);

    OpenGL::glNormal3f( 0.0386599194064297,-0.999240983070654,0.00478208986541441 );
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(-0.13885533+$x,-0.086362264+$y,-0.057336295+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(-0.12375738+$x,-0.085418697+$y,0.017770049+$z);

    OpenGL::glNormal3f( 0.962912815909795,0.269798883106116,0.00273342849942599 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);

    OpenGL::glNormal3f( 0.902915722809009,-0.429659342241287,0.0116639242568813 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);

    OpenGL::glNormal3f( 0.633383467953723,-0.195226162960557,-0.74880713659701 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.016821991+$x,0.36287712+$y,-0.010115039+$z);

    OpenGL::glNormal3f( 0.991766391807142,0.127560525460097,-0.0113020540693303 );
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.013528188+$x,0.29860362+$y,-0.014709829+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.012626277+$x,0.30576006+$y,-0.013082317+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013905992+$x,0.29822127+$y,0.014127455+$z);

    OpenGL::glNormal3f( 0.917083901238784,0.194701835413478,-0.347919981282013 );
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013528188+$x,0.29860362+$y,-0.014709829+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.012626277+$x,0.30576006+$y,-0.013082317+$z);

    OpenGL::glNormal3f( 0.871920520476783,-0.268229559786322,-0.409643148640779 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.012493127+$x,0.29089388+$y,-0.011864696+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.013528188+$x,0.29860362+$y,-0.014709829+$z);

    OpenGL::glNormal3f( 0.984577261542157,0.0823111151443334,-0.154377771644245 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.012493127+$x,0.29089388+$y,-0.011864696+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);

    OpenGL::glNormal3f( 0.0637235816853875,-0.997495658832207,-0.0306873874431717 );
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.028988584+$x,0.31705986+$y,-0.0073183876+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.013839871+$x,0.31550658+$y,0.011714181+$z);

    OpenGL::glNormal3f( 0.288806113994347,0.053753772318452,-0.955877377324634 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.028988584+$x,0.31705986+$y,-0.0073183876+$z);

    OpenGL::glNormal3f( 0.298334863159452,0.0429635380381001,-0.953493809011301 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);

    OpenGL::glNormal3f( 0.997412772552688,0.0705632400121023,0.0137328186383704 );
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);

    OpenGL::glNormal3f( 0.089149272428747,-0.174451176580469,-0.980621840576231 );
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036630229+$x,-0.22059999+$y,-0.11784096+$z);

    OpenGL::glNormal3f( -0.969413196316661,0.18239358520521,-0.164227387737567 );
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.1079657+$x,-0.35330599+$y,-0.12774938+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);

    OpenGL::glNormal3f( -0.960562497707601,-0.220880492243519,-0.168912687930762 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);

    OpenGL::glNormal3f( -0.0167776516124375,-0.00169140144749871,0.999857814675424 );
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.029796217+$x,-0.22238489+$y,-0.038946718+$z);

    OpenGL::glNormal3f( 0.00346500495124786,0.00863206107904986,0.999956739695381 );
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);
    OpenGL::glTexCoord2f(0.639912,0.566668); OpenGL::glVertex3f(-0.1133722+$x,-0.35253738+$y,-0.038918314+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);

    OpenGL::glNormal3f( -0.991453080934046,0.115144855470492,-0.061338817767121 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.1079657+$x,-0.35330599+$y,-0.12774938+$z);
    OpenGL::glTexCoord2f(0.639452,0.910131); OpenGL::glVertex3f(-0.1133722+$x,-0.35253738+$y,-0.038918314+$z);

    OpenGL::glNormal3f( -0.994967665633119,-0.100196311351926,-0.00020865294147799 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);
    OpenGL::glTexCoord2f(0.96259,0.987723); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);

    OpenGL::glNormal3f( 0.981511464838741,-0.169528165580797,-0.0888563192177029 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036630229+$x,-0.22059999+$y,-0.11784096+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.029796217+$x,-0.22238489+$y,-0.038946718+$z);

    OpenGL::glNormal3f( 0.0874046792348116,0.0771430742053419,-0.993181437678941 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036630229+$x,-0.22059999+$y,-0.11784096+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);

    OpenGL::glNormal3f( -0.0165551459984057,-0.148747133443079,0.988736677499848 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.029796217+$x,-0.22238489+$y,-0.038946718+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);

    OpenGL::glNormal3f( 0.99595726246355,0.027044950314465,-0.0856603876281207 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.029796217+$x,-0.22238489+$y,-0.038946718+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036630229+$x,-0.22059999+$y,-0.11784096+$z);

    OpenGL::glNormal3f( -0.00604792509288045,-0.139611084391143,-0.990187945653349 );
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);

    OpenGL::glNormal3f( -0.00615699364410974,-0.175071865866645,-0.98453640522392 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);

    OpenGL::glNormal3f( 0.044899206948076,-0.99899133983405,0.000603450083362267 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);
    OpenGL::glTexCoord2f(0.469506,0.401201); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(-0.13885533+$x,-0.086362264+$y,-0.057336295+$z);

    OpenGL::glNormal3f( -0.00254213281676708,-0.999963234218533,-0.00818949155642013 );
    OpenGL::glTexCoord2f(0.632024,0.752693); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.652416,0.797749); OpenGL::glVertex3f(0.010673052+$x,-0.08557626+$y,-0.058095615+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.011680554+$x,-0.086523771+$y,0.05728578+$z);

    OpenGL::glNormal3f( 0.00618070922916513,-0.164005977003191,0.986439982127982 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.964423,0.497747); OpenGL::glVertex3f(-0.11201411+$x,-0.085131644+$y,-0.017185118+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.0981858+$x,-0.22240158+$y,-0.040094326+$z);

    OpenGL::glNormal3f( 0.972634641237977,-0.0687715348868458,-0.221928661180071 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(-0.036630229+$x,-0.22059999+$y,-0.11784096+$z);

    OpenGL::glNormal3f( 0.00736456758502775,-0.999962814131372,-0.00448703674510604 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.010673052+$x,-0.08557626+$y,-0.058095615+$z);
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(-0.0043186525+$x,-0.085866669+$y,-0.017982108+$z);

    OpenGL::glNormal3f( 0.998959959804765,-0.0436749085391112,0.0130958417431627 );
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(-0.029796217+$x,-0.22238489+$y,-0.038946718+$z);

    OpenGL::glNormal3f( -0.0471729976519993,0.0617248543496608,0.996977808503297 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036983993+$x,-0.39592395+$y,-0.03273573+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031499939+$x,-0.36312986+$y,-0.03502556+$z);

    OpenGL::glNormal3f( -0.00703303467143425,0.132358624908165,0.99117694224378 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.1133722+$x,-0.35253738+$y,-0.038918314+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.11718932+$x,-0.39615641+$y,-0.033120652+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);

    OpenGL::glNormal3f( 0.26842777724055,0.963290789498264,0.00416932530620399 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031040055+$x,-0.36361949+$y,0.03560128+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.030682563+$x,-0.36390787+$y,0.12524518+$z);

    OpenGL::glNormal3f( 0.000868815606800871,0.00947650812667293,-0.999954719451419 );
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(-0.035191604+$x,-0.34517571+$y,0.038405957+$z);
    OpenGL::glTexCoord2f(0.639912,0.566668); OpenGL::glVertex3f(-0.11303341+$x,-0.35232483+$y,0.038270572+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(-0.098805271+$x,-0.22144132+$y,0.039523309+$z);

    OpenGL::glNormal3f( 0.249921248306628,0.968262303204091,-0.00273529500537545 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031499939+$x,-0.36312986+$y,-0.03502556+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031301974+$x,-0.36334779+$y,-0.13025809+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);

    OpenGL::glNormal3f( 0.986603890330146,0.163116176171977,-0.0024241816049869 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031499939+$x,-0.36312986+$y,-0.03502556+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031301974+$x,-0.36334779+$y,-0.13025809+$z);

    OpenGL::glNormal3f( 0.256376887243801,0.966574146670442,0.00230449028765206 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031301974+$x,-0.36334779+$y,-0.13025809+$z);
    OpenGL::glTexCoord2f(0.705683,0.93425); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);

    OpenGL::glNormal3f( -0.0194750481994383,0.0933388724710116,-0.99544390971238 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.031301974+$x,-0.36334779+$y,-0.13025809+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);

    OpenGL::glNormal3f( 0.00110828002112473,0.0428284596403435,-0.999081825858238 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(-0.1079657+$x,-0.35330599+$y,-0.12774938+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(-0.084063068+$x,-0.22113937+$y,-0.12205717+$z);

    OpenGL::glNormal3f( -0.00768166389860145,0.131618249190103,-0.991270714043283 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1134954+$x,-0.39607438+$y,-0.1333852+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.1079657+$x,-0.35330599+$y,-0.12774938+$z);

    OpenGL::glNormal3f( -0.000229102636292599,0.119969540891539,-0.992777546467614 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.034042712+$x,-0.3460225+$y,-0.12735515+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1134954+$x,-0.39607438+$y,-0.1333852+$z);

    OpenGL::glNormal3f( -0.988816077798966,0.135933571919627,-0.0613581967746876 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(-0.1079657+$x,-0.35330599+$y,-0.12774938+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1134954+$x,-0.39607438+$y,-0.1333852+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(-0.1133722+$x,-0.35253738+$y,-0.038918314+$z);

    OpenGL::glNormal3f( -0.995935502721214,0.0822867418740208,-0.0366246710729302 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.1134954+$x,-0.39607438+$y,-0.1333852+$z);
    OpenGL::glTexCoord2f(0.823359,0.97848); OpenGL::glVertex3f(-0.11718932+$x,-0.39615641+$y,-0.033120652+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(-0.1133722+$x,-0.35253738+$y,-0.038918314+$z);

    OpenGL::glNormal3f( -0.0035041545759487,-0.999993411806897,-0.000947229386021058 );
    OpenGL::glTexCoord2f(0.623546,0.549776); OpenGL::glVertex3f(-0.1134954+$x,-0.39607438+$y,-0.1333852+$z);
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(-0.11718932+$x,-0.39615641+$y,-0.033120652+$z);

    OpenGL::glNormal3f( -0.0284665684843043,-0.217421164382897,0.97566269363808 );
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);

    OpenGL::glNormal3f( 0.0785736693816059,-0.37949736927477,0.921850272654642 );
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.018352549+$x,-0.093307038+$y,-0.22618682+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);

    OpenGL::glNormal3f( 0.917290817835921,-0.398207033262456,-0.00295197801843418 );
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);
    OpenGL::glTexCoord2f(0.786136,0.312218); OpenGL::glVertex3f(0.0053416119+$x,-0.094274483+$y,-0.24009422+$z);

    OpenGL::glNormal3f( 0.916908943635853,-0.399088359991765,-0.00254361940311501 );
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.00061204121+$x,-0.10545038+$y,-0.19365014+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);

    OpenGL::glNormal3f( 0.0353475218757927,-0.99868817042503,0.0370471449688885 );
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0053416119+$x,-0.094274483+$y,-0.24009422+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.019028194+$x,-0.093702804+$y,-0.23774202+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);

    OpenGL::glNormal3f( 0.825551823796128,-0.548640984770678,0.132125909861567 );
    OpenGL::glTexCoord2f(0.906343,0.303733); OpenGL::glVertex3f(0.0053416119+$x,-0.094274483+$y,-0.24009422+$z);
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);

    OpenGL::glNormal3f( -0.0664741278015155,-0.191890481429008,-0.979162516373033 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0053416119+$x,-0.094274483+$y,-0.24009422+$z);

    OpenGL::glNormal3f( 0.156413994943365,-0.135387985623852,-0.978368415033198 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);

    OpenGL::glNormal3f( 0.798934007911309,-0.57398429403013,0.179573052570547 );
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.040381694+$x,-0.043494292+$y,-0.24150545+$z);

    OpenGL::glNormal3f( 0.790829831303267,-0.610869435026751,0.0377718317128495 );
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);

    OpenGL::glNormal3f( 0.219120015607195,0.0481257663072873,0.974510302345562 );
    OpenGL::glTexCoord2f(0.783541,0.359685); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);

    OpenGL::glNormal3f( 0.853740820789218,-0.517616565954061,-0.0565659046429674 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.00061204121+$x,-0.10545038+$y,-0.19365014+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);

    OpenGL::glNormal3f( 0.846339776985745,-0.527148270163064,-0.0763130601916108 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024456171+$x,-0.070171577+$y,-0.17290565+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.00061204121+$x,-0.10545038+$y,-0.19365014+$z);

    OpenGL::glNormal3f( 0.151441888848086,0.0808390327963423,-0.985155015760807 );
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040381694+$x,-0.043494292+$y,-0.24150545+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);

    OpenGL::glNormal3f( 0.702900616150083,-0.709716882163717,0.0472511480034796 );
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.040381694+$x,-0.043494292+$y,-0.24150545+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);

    OpenGL::glNormal3f( 0.932626901868673,0.360744348502479,0.00840100793731987 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040381694+$x,-0.043494292+$y,-0.24150545+$z);

    OpenGL::glNormal3f( 0.336746552095505,0.0239860541282905,0.941289768806155 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.04582212+$x,-0.056073177+$y,-0.22643709+$z);

    OpenGL::glNormal3f( 0.796945137749247,-0.597045210044036,-0.091735841312471 );
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);

    OpenGL::glNormal3f( 0.238600108375367,-0.88126501482319,0.407972991669726 );
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);

    OpenGL::glNormal3f( 0.871387598122723,-0.152027113282914,-0.466445506640139 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);

    OpenGL::glNormal3f( 0.863136425235102,-0.15673179906536,-0.4800319308068 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);

    OpenGL::glNormal3f( 0.609538421760832,0.792370366256855,-0.0247409594658548 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.097019949+$x,-0.0928252+$y,-0.23375685+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);

    OpenGL::glNormal3f( -0.603930378312486,0.544182130601003,0.582352047206749 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.097234596+$x,-0.10131209+$y,-0.18651363+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.09258681+$x,-0.1095733+$y,-0.1836139+$z);

    OpenGL::glNormal3f( -0.545851365690703,0.818428194550974,0.179503696167038 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.097234596+$x,-0.10131209+$y,-0.18651363+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.096769815+$x,-0.10090429+$y,-0.1897863+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);

    OpenGL::glNormal3f( 0.0839032346102941,0.990219162652622,0.111473122937643 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.097234596+$x,-0.10131209+$y,-0.18651363+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.096769815+$x,-0.10090429+$y,-0.1897863+$z);

    OpenGL::glNormal3f( -0.697798918194986,0.452557717096297,0.555219040075623 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.09258681+$x,-0.1095733+$y,-0.1836139+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.085620679+$x,-0.12116061+$y,-0.18292414+$z);

    OpenGL::glNormal3f( -0.696151818682857,0.429266353661763,0.575415539378704 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.09258681+$x,-0.1095733+$y,-0.1836139+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);

    OpenGL::glNormal3f( 0.506473183862279,0.0176494657095239,0.862075060762446 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.09258681+$x,-0.1095733+$y,-0.1836139+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.097234596+$x,-0.10131209+$y,-0.18651363+$z);

    OpenGL::glNormal3f( -0.726521398065817,0.404212116811443,0.555679064546527 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.085620679+$x,-0.12116061+$y,-0.18292414+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.079044133+$x,-0.12873002+$y,-0.18601649+$z);

    OpenGL::glNormal3f( 0.413345875221175,-0.195558721797114,0.889326696870571 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.085620679+$x,-0.12116061+$y,-0.18292414+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.09258681+$x,-0.1095733+$y,-0.1836139+$z);

    OpenGL::glNormal3f( -0.830473286021131,0.345273236877698,0.437150446758621 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.079044133+$x,-0.12873002+$y,-0.18601649+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.077153587+$x,-0.12741943+$y,-0.19064318+$z);

    OpenGL::glNormal3f( 0.209813422802754,-0.520442531214716,0.82771849037859 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.079044133+$x,-0.12873002+$y,-0.18601649+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.085620679+$x,-0.12116061+$y,-0.18292414+$z);

    OpenGL::glNormal3f( 0.216774176885474,-0.466105072537448,0.85776163215108 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.079044133+$x,-0.12873002+$y,-0.18601649+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);

    OpenGL::glNormal3f( -0.852196561673095,-0.477981359196829,0.212825845547259 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.077153587+$x,-0.12741943+$y,-0.19064318+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.079044133+$x,-0.12873002+$y,-0.18601649+$z);

    OpenGL::glNormal3f( -0.831001420251652,-0.479262349124901,0.282390226904225 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.077153587+$x,-0.12741943+$y,-0.19064318+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);

    OpenGL::glNormal3f( -0.586926654685146,0.0429672924289238,-0.808499173655379 );
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.077153587+$x,-0.12741943+$y,-0.19064318+$z);

    OpenGL::glNormal3f( -0.392966058323371,0.376875692856614,-0.83877433743507 );
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.080173244+$x,-0.1180138+$y,-0.19233543+$z);

    OpenGL::glNormal3f( -0.272178790638422,0.599386497663306,-0.752764592914359 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.096769815+$x,-0.10090429+$y,-0.1897863+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);
    OpenGL::glTexCoord2f(0.901713,0.490842); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);

    OpenGL::glNormal3f( -0.56913221654328,0.516750144606575,-0.639576272341006 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.096769815+$x,-0.10090429+$y,-0.1897863+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);

    OpenGL::glNormal3f( -0.496673161007775,0.35389970980965,-0.792509158641836 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.088713728+$x,-0.10602236+$y,-0.19094869+$z);

    OpenGL::glNormal3f( -0.822409896694119,0.531815198876509,-0.202026127180393 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);

    OpenGL::glNormal3f( -0.851270503706613,0.501671552214417,-0.153831671699517 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.098325816+$x,-0.11258628+$y,-0.21054519+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);

    OpenGL::glNormal3f( -0.609285219240707,0.229954216007004,-0.758875866104205 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.077153587+$x,-0.12741943+$y,-0.19064318+$z);

    OpenGL::glNormal3f( -0.880564711102408,0.43082902783241,-0.197464271041911 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.089023381+$x,-0.1237649+$y,-0.19906579+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);

    OpenGL::glNormal3f( 0.433893471095782,-0.300619782942565,0.849331620654747 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.085620679+$x,-0.12116061+$y,-0.18292414+$z);

    OpenGL::glNormal3f( 0.776128116083109,-0.556520630180396,0.29649609712254 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);

    OpenGL::glNormal3f( 0.792640451432183,-0.512035022699452,0.330970165245383 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);

    OpenGL::glNormal3f( 0.364839353864296,-0.0614088520107672,0.929043163026672 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.097234596+$x,-0.10131209+$y,-0.18651363+$z);

    OpenGL::glNormal3f( 0.883563115148246,-0.372650087266044,0.283633802657824 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.10334757+$x,-0.11506718+$y,-0.18982342+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);

    OpenGL::glNormal3f( 0.106060581998532,0.941051727492775,0.321205228987631 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.096769815+$x,-0.10090429+$y,-0.1897863+$z);

    OpenGL::glNormal3f( 0.732044401485208,0.67327734515194,0.103964468734847 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11515362+$x,-0.10509346+$y,-0.21034477+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);

    OpenGL::glNormal3f( 0.849299120163089,-0.414038652331602,0.327510303449576 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.10942698+$x,-0.10180252+$y,-0.19133405+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11515362+$x,-0.10509346+$y,-0.21034477+$z);

    OpenGL::glNormal3f( -0.733145750088469,0.664466960989766,-0.144848082073054 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.098325816+$x,-0.11258628+$y,-0.21054519+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.096525085+$x,-0.11194497+$y,-0.19848892+$z);

    OpenGL::glNormal3f( -0.733542949071238,0.664169714580772,-0.144198932387056 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.098325816+$x,-0.11258628+$y,-0.21054519+$z);

    OpenGL::glNormal3f( 0.62539049901969,-0.711915013854955,0.319474156675938 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.093564324+$x,-0.1286002+$y,-0.1896155+$z);

    OpenGL::glNormal3f( 0.635482917283265,-0.694792118436427,0.336786837628452 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);

    OpenGL::glNormal3f( -0.486855982694091,-0.865742911039648,0.116019240212846 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.083190078+$x,-0.13909661+$y,-0.19269743+$z);

    OpenGL::glNormal3f( -0.787880187435967,-0.603168153555773,-0.124229580945866 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);

    OpenGL::glNormal3f( -0.875832922090526,0.450285486157661,-0.173665406855047 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.081351063+$x,-0.13869671+$y,-0.19743048+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);

    OpenGL::glNormal3f( 0.44535369118501,0.879221347077298,-0.169203760571296 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11515362+$x,-0.10509346+$y,-0.21034477+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.1080591+$x,-0.099213899+$y,-0.1984664+$z);

    OpenGL::glNormal3f( 0.390458805948518,0.91320021487719,0.116650282492205 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11515362+$x,-0.10509346+$y,-0.21034477+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);

    OpenGL::glNormal3f( 0.775093175284324,-0.458028796773539,-0.435247275642075 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.11515362+$x,-0.10509346+$y,-0.21034477+$z);

    OpenGL::glNormal3f( 0.775913057181043,-0.500958626592068,-0.383404984499362 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);

    OpenGL::glNormal3f( 0.684287246735718,-0.613043899719321,-0.394877374601 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.087086171+$x,-0.12349664+$y,-0.24346274+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);

    OpenGL::glNormal3f( 0.664583783049398,-0.628399972559326,-0.404279445180174 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.076260777+$x,-0.13712283+$y,-0.24007816+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.087086171+$x,-0.12349664+$y,-0.24346274+$z);

    OpenGL::glNormal3f( -0.827531996509127,-0.526124542361918,0.19591773956965 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.076260777+$x,-0.13712283+$y,-0.24007816+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.087518175+$x,-0.14397317+$y,-0.21092447+$z);

    OpenGL::glNormal3f( -0.773086443949922,0.281327476531575,0.5684999570178 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);

    OpenGL::glNormal3f( -0.744670464130336,0.452446773472293,0.490670782731579 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.098325816+$x,-0.11258628+$y,-0.21054519+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);

    OpenGL::glNormal3f( -0.6024215865349,0.630846109223414,0.489000427969603 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.098325816+$x,-0.11258628+$y,-0.21054519+$z);

    OpenGL::glNormal3f( -0.648209105258936,0.521783548605283,0.554587129551605 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.097019949+$x,-0.0928252+$y,-0.23375685+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);

    OpenGL::glNormal3f( 0.532724612392709,0.842731773980491,0.0775089960890521 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.10826696+$x,-0.10193198+$y,-0.21204307+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.097019949+$x,-0.0928252+$y,-0.23375685+$z);

    OpenGL::glNormal3f( -0.1629955535755,-0.526233225776368,0.834572370500974 );
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.091102091+$x,-0.075362839+$y,-0.19106857+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.08523056+$x,-0.076070888+$y,-0.19266176+$z);

    OpenGL::glNormal3f( 0.526919342934714,-0.129415156137572,0.840004597251192 );
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.091102091+$x,-0.075362839+$y,-0.19106857+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.097510918+$x,-0.0704013+$y,-0.19432431+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);

    OpenGL::glNormal3f( -0.737889766334233,0.0192792450867013,0.67464583556715 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.074961299+$x,-0.058409349+$y,-0.20315869+$z);

    OpenGL::glNormal3f( -0.305921403437667,-0.924291911993398,-0.228246700616498 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093764026+$x,-0.077260997+$y,-0.19927987+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.08523056+$x,-0.076070888+$y,-0.19266176+$z);

    OpenGL::glNormal3f( -0.598739580809453,-0.774133299042371,0.205495862941074 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);

    OpenGL::glNormal3f( 0.320468824918577,0.857824600382392,0.401791845654061 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.074961299+$x,-0.058409349+$y,-0.20315869+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);

    OpenGL::glNormal3f( -0.723954609970856,0.0214116669995854,0.689515237843403 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.074961299+$x,-0.058409349+$y,-0.20315869+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);

    OpenGL::glNormal3f( 0.846414949455109,-0.0226195536960533,-0.532043315087688 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.097510918+$x,-0.0704013+$y,-0.19432431+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);

    OpenGL::glNormal3f( 0.245312370048449,0.920310649906079,0.304713223819812 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.074961299+$x,-0.058409349+$y,-0.20315869+$z);

    OpenGL::glNormal3f( -0.302498516797793,-0.921456908892419,-0.243745384345146 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093764026+$x,-0.077260997+$y,-0.19927987+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);

    OpenGL::glNormal3f( 0.846021386441479,-0.0814812514489403,-0.526885774476738 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.097510918+$x,-0.0704013+$y,-0.19432431+$z);
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.093764026+$x,-0.077260997+$y,-0.19927987+$z);

    OpenGL::glNormal3f( 0.921652598301563,-0.0108784119220889,-0.387863569052355 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.086826403+$x,-0.071813963+$y,-0.21126199+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);

    OpenGL::glNormal3f( -0.730380112088837,-0.125430998101633,0.671425317202387 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.08523056+$x,-0.076070888+$y,-0.19266176+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.075649422+$x,-0.070579333+$y,-0.20205828+$z);

    OpenGL::glNormal3f( 0.051549865215821,-0.969214964660857,0.24075914037412 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.08523056+$x,-0.076070888+$y,-0.19266176+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.093764026+$x,-0.077260997+$y,-0.19927987+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.091102091+$x,-0.075362839+$y,-0.19106857+$z);

    OpenGL::glNormal3f( 0.274102627098908,0.8696276734922,0.410628127767717 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.088131928+$x,-0.070235181+$y,-0.18841545+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.097510918+$x,-0.0704013+$y,-0.19432431+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);

    OpenGL::glNormal3f( 0.678824800574022,-0.63596676971132,0.367073777255455 );
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.093764026+$x,-0.077260997+$y,-0.19927987+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.097510918+$x,-0.0704013+$y,-0.19432431+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.091102091+$x,-0.075362839+$y,-0.19106857+$z);

    OpenGL::glNormal3f( 0.912361701958309,0.407711052492876,-0.0369840840753002 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.04582212+$x,-0.056073177+$y,-0.22643709+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);

    OpenGL::glNormal3f( -0.138282960995494,0.988389485653402,0.0629606809693364 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.04582212+$x,-0.056073177+$y,-0.22643709+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);

    OpenGL::glNormal3f( -0.291977194024772,0.482940810604795,0.825540726809891 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.04582212+$x,-0.056073177+$y,-0.22643709+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);

    OpenGL::glNormal3f( -0.274031926278072,0.508171559853865,0.816497500998025 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.04582212+$x,-0.056073177+$y,-0.22643709+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);

    OpenGL::glNormal3f( 0.219405169845536,0.88952312921972,-0.400761742221246 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);

    OpenGL::glNormal3f( 0.416951203465804,0.0368064089543796,-0.908183341725833 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.040381694+$x,-0.043494292+$y,-0.24150545+$z);

    OpenGL::glNormal3f( 0.47307085191745,0.851066057672612,-0.22779493967974 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.086581272+$x,-0.058507279+$y,-0.21221769+$z);

    OpenGL::glNormal3f( 0.308911644670121,0.316478730030821,-0.896891748889062 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.079361723+$x,-0.059081691+$y,-0.22935688+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);

    OpenGL::glNormal3f( -0.670647165736471,0.667582804582137,0.323366012617107 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.073082376+$x,-0.052749574+$y,-0.21873999+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.074961299+$x,-0.058409349+$y,-0.20315869+$z);

    OpenGL::glNormal3f( 0.218044989597181,0.172918226057286,-0.96049761561847 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.044948533+$x,-0.05533852+$y,-0.23988881+$z);

    OpenGL::glNormal3f( 0.0448533995808704,0.248842916931925,-0.967504715874217 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);

    OpenGL::glNormal3f( 0.194648241838946,-0.241590292418002,0.950655664559146 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);

    OpenGL::glNormal3f( -0.16072871872152,-0.441064190917118,0.882965830861402 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.063060699+$x,-0.064402349+$y,-0.21546759+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);

    OpenGL::glNormal3f( -0.599536451412747,0.555266042258595,0.576398877290619 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.090790238+$x,-0.12528846+$y,-0.21026896+$z);

    OpenGL::glNormal3f( 0.141641125930843,-0.0332847444600224,0.989358336110468 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);

    OpenGL::glNormal3f( 0.144873565010491,-0.0253495565621217,0.989125396571767 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);

    OpenGL::glNormal3f( 0.467628961602898,-0.118298551869703,0.875972948723719 );
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.089072842+$x,-0.10540182+$y,-0.23121282+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.097019949+$x,-0.0928252+$y,-0.23375685+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.079525624+$x,-0.079017696+$y,-0.22255301+$z);

    OpenGL::glNormal3f( -0.756673100395823,0.29654418559293,0.582672605438422 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.07001298+$x,-0.13313284+$y,-0.23386415+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);

    OpenGL::glNormal3f( 0.0325850366073456,-0.0833420080688186,0.995988114929267 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.018352549+$x,-0.093307038+$y,-0.22618682+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.028684635+$x,-0.10761721+$y,-0.22772229+$z);

    OpenGL::glNormal3f( 0.752242491401285,-0.526041694612938,-0.396751017212478 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.087086171+$x,-0.12349664+$y,-0.24346274+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.099236327+$x,-0.13224103+$y,-0.20883201+$z);

    OpenGL::glNormal3f( -0.0518705329481946,-0.0868315373979783,-0.994871716315613 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.087086171+$x,-0.12349664+$y,-0.24346274+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);

    OpenGL::glNormal3f( -0.103160308685192,-0.161815140564278,-0.981414189318729 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.087086171+$x,-0.12349664+$y,-0.24346274+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.076260777+$x,-0.13712283+$y,-0.24007816+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);

    OpenGL::glNormal3f( 0.234783553158208,0.358873899529356,-0.903374898590281 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);

    OpenGL::glNormal3f( 0.858157555485517,-0.353044219564026,-0.372726963064855 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.107792+$x,-0.1189934+$y,-0.20882694+$z);

    OpenGL::glNormal3f( -0.017266969096063,0.000280087725047149,-0.999850875545499 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.036964557+$x,-0.068621582+$y,-0.24409262+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.095840166+$x,-0.10972777+$y,-0.24512089+$z);

    OpenGL::glNormal3f( 0.164257665506762,-0.542343854343967,-0.823943300826943 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026425684+$x,-0.082085124+$y,-0.24391439+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.019028194+$x,-0.093702804+$y,-0.23774202+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.0053416119+$x,-0.094274483+$y,-0.24009422+$z);

    OpenGL::glNormal3f( 0.221789255376787,-0.0742559806035317,0.972263120530661 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.035390927+$x,-0.068190271+$y,-0.22239656+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);

    OpenGL::glNormal3f( -0.053489596586442,-0.294324856692613,0.95420738929747 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.027920954+$x,-0.080209409+$y,-0.22161049+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.018352549+$x,-0.093307038+$y,-0.22618682+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.079061734+$x,-0.11728392+$y,-0.23017933+$z);

    OpenGL::glNormal3f( 0.58922631445533,0.795016855012926,0.144085219917743 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.097019949+$x,-0.0928252+$y,-0.23375685+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.10315986+$x,-0.096016845+$y,-0.24125509+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.072396598+$x,-0.073985177+$y,-0.23701471+$z);

    OpenGL::glNormal3f( -0.484423260272263,-0.871805649997581,0.0727256044284745 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.07001298+$x,-0.13313284+$y,-0.23386415+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.076260777+$x,-0.13712283+$y,-0.24007816+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.084093864+$x,-0.13917504+$y,-0.21250326+$z);

    OpenGL::glNormal3f( -0.525248681008788,-0.850948415376365,0.00078579067309925 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.07001298+$x,-0.13313284+$y,-0.23386415+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.028684635+$x,-0.10761721+$y,-0.22772229+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030474711+$x,-0.10873182+$y,-0.23820925+$z);

    OpenGL::glNormal3f( -0.0407841582421501,0,-0.999167980089625 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.076260777+$x,-0.13712283+$y,-0.24007816+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030474711+$x,-0.10873182+$y,-0.23820925+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.019028194+$x,-0.093702804+$y,-0.23774202+$z);

    OpenGL::glNormal3f( 0.034586168022642,-0.998744828388498,0.0362293354719664 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.019028194+$x,-0.093702804+$y,-0.23774202+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.018352549+$x,-0.093307038+$y,-0.22618682+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.005632508+$x,-0.093714281+$y,-0.22527028+$z);

    OpenGL::glNormal3f( -0.794570091182255,-0.602942457199577,-0.0715455344851075 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.019028194+$x,-0.093702804+$y,-0.23774202+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030474711+$x,-0.10873182+$y,-0.23820925+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.028684635+$x,-0.10761721+$y,-0.22772229+$z);

    OpenGL::glNormal3f( 0.844720806728351,-0.534014606962115,0.0357093577553851 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.023118882+$x,-0.069007759+$y,-0.24625272+$z);

    OpenGL::glNormal3f( -0.270680474317623,-0.327677873785332,-0.905184672790426 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);

    OpenGL::glNormal3f( 0.625094217423677,-0.780515858612534,0.00722591155630281 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.039958777+$x,-0.042792811+$y,-0.22467789+$z);

    OpenGL::glNormal3f( 0.542867106219537,0.839804687388751,-0.00483653023432864 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);

    OpenGL::glNormal3f( 0.605375408742626,0.795622837126741,0.0224703255894193 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.031695395+$x,-0.021794431+$y,-0.25539345+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);

    OpenGL::glNormal3f( -0.539513008195293,-0.841942558011779,0.00764480193652956 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.00061204121+$x,-0.10545038+$y,-0.19365014+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);

    OpenGL::glNormal3f( 0.792223107524103,-0.60556233945526,-0.0753445481659156 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024456171+$x,-0.070171577+$y,-0.17290565+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.021287228+$x,-0.068556446+$y,-0.21920724+$z);

    OpenGL::glNormal3f( 0.238135264379162,0.360995350067232,0.901650682409159 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024456171+$x,-0.070171577+$y,-0.17290565+$z);

    OpenGL::glNormal3f( 0.245911938450832,0.349157708081335,0.904221329882648 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.04943518+$x,-0.034915868+$y,-0.19361825+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);

    OpenGL::glNormal3f( 0.213769636234027,0.356609673841898,-0.909468022058361 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.031695395+$x,-0.021794431+$y,-0.25539345+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.049587226+$x,-0.035376375+$y,-0.25651358+$z);

    OpenGL::glNormal3f( -0.234411289725284,-0.382174436729601,-0.893864669376602 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0065455596+$x,-0.058617019+$y,-0.27671918+$z);

    OpenGL::glNormal3f( -0.243572710176267,-0.363994237995033,0.898988614813226 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024456171+$x,-0.070171577+$y,-0.17290565+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.00061204121+$x,-0.10545038+$y,-0.19365014+$z);

    OpenGL::glNormal3f( -0.25805280681894,-0.341757563477976,0.903665046739368 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.024456171+$x,-0.070171577+$y,-0.17290565+$z);

    OpenGL::glNormal3f( -0.203222330793649,-0.3804100532705,0.902213320472233 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);

    OpenGL::glNormal3f( -0.127452566028735,0.0967889100026459,0.987110809541254 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.020115744+$x,0.0090505402+$y,-0.18335838+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);

    OpenGL::glNormal3f( 0.258281738898797,0.345980036176149,-0.901991329181697 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0065455596+$x,-0.058617019+$y,-0.27671918+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.031695395+$x,-0.021794431+$y,-0.25539345+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.023645047+$x,-0.070181951+$y,-0.27625881+$z);

    OpenGL::glNormal3f( 0.361696676849535,0.269795460943469,-0.892404573727804 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0065455596+$x,-0.058617019+$y,-0.27671918+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.031695395+$x,-0.021794431+$y,-0.25539345+$z);

    OpenGL::glNormal3f( -0.13852108775938,0.0998236008294398,-0.985315765104468 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0065455596+$x,-0.058617019+$y,-0.27671918+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);

    OpenGL::glNormal3f( -0.588742542117366,-0.808208155560099,-0.0134831890635892 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.00028214657+$x,-0.10580853+$y,-0.25637566+$z);

    OpenGL::glNormal3f( -0.769437615647374,-0.638543325771649,-0.0151055201620358 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(-0.018089452+$x,-0.093468505+$y,-0.19386576+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);

    OpenGL::glNormal3f( 0.347099744070003,0.277287652335046,0.895898055321618 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.020115744+$x,0.0090505402+$y,-0.18335838+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.0073793047+$x,-0.058115136+$y,-0.17322253+$z);

    OpenGL::glNormal3f( 0.529684475753711,0.847902942135583,0.0222476260158079 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.031695395+$x,-0.021794431+$y,-0.25539345+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);

    OpenGL::glNormal3f( -0.212736867067938,-0.396573660384808,-0.893013077888064 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.0065455596+$x,-0.058617019+$y,-0.27671918+$z);

    OpenGL::glNormal3f( -0.749505044800236,-0.661907314236299,0.0109952343988589 );
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(-0.017183795+$x,-0.093095751+$y,-0.2557548+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);

    OpenGL::glNormal3f( 0.533613994569715,0.845525460789066,0.0185148577307426 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.020115744+$x,0.0090505402+$y,-0.18335838+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.03078021+$x,-0.022854514+$y,-0.19320224+$z);

    OpenGL::glNormal3f( 0.772895388825014,0.634212114596886,0.0201918704328215 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.020115744+$x,0.0090505402+$y,-0.18335838+$z);

    OpenGL::glNormal3f( 0.741261147908277,0.671206832296553,-0.00364676296595589 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);

    OpenGL::glNormal3f( -0.157651407742007,0.11297727492713,-0.981010789434552 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(-0.018713945+$x,0.0099802834+$y,-0.26621838+$z);

    OpenGL::glNormal3f( -0.192706210673811,0.118355804767553,-0.974092510927769 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(-0.11481881+$x,0.0016979107+$y,-0.24930892+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);

    OpenGL::glNormal3f( -0.203122228065938,0.106596197259604,0.973333761458689 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11539061+$x,0.0009118006+$y,-0.19999722+$z);

    OpenGL::glNormal3f( -0.649122700914736,-0.76059374821601,0.0116991167136576 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11481881+$x,0.0016979107+$y,-0.24930892+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(-0.057993755+$x,-0.047063028+$y,-0.26647534+$z);

    OpenGL::glNormal3f( -0.124561121294241,0.0948277702576319,0.987670097274331 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(-0.020115744+$x,0.0090505402+$y,-0.18335838+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);

    OpenGL::glNormal3f( -0.62748548042272,-0.778379395143046,-0.0196847421982929 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11539061+$x,0.0009118006+$y,-0.19999722+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11481881+$x,0.0016979107+$y,-0.24930892+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(-0.057624742+$x,-0.04609082+$y,-0.18279466+$z);

    OpenGL::glNormal3f( -0.995770644727485,0.0913181166097595,-0.0100908214658038 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11539061+$x,0.0009118006+$y,-0.19999722+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(-0.11481881+$x,0.0016979107+$y,-0.24930892+$z);

    OpenGL::glNormal3f( -0.0769127734664828,-0.139892793732289,0.987174975138384 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11539061+$x,0.0009118006+$y,-0.19999722+$z);

    OpenGL::glNormal3f( -0.00730479625970246,-0.0923090406539483,0.995703611003371 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);

    OpenGL::glNormal3f( 0.984994113732939,-0.15538356004113,-0.075116876801463 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);

    OpenGL::glNormal3f( 0.995836473885117,-0.0910231241341668,0.00495057096839875 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(-0.043845956+$x,0.038154088+$y,-0.18914542+$z);

    OpenGL::glNormal3f( -0.0183919461179523,-0.0789989889342619,-0.996705019584711 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);

    OpenGL::glNormal3f( -0.0778752943230449,-0.114871293757753,-0.990323191894706 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(-0.11481881+$x,0.0016979107+$y,-0.24930892+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(-0.043561794+$x,0.037460409+$y,-0.25906053+$z);

    OpenGL::glNormal3f( 0.00698873058701715,-0.179965650195832,-0.983648068363057 );
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(-0.11198075+$x,-0.085204968+$y,-0.14105266+$z);

    OpenGL::glNormal3f( -0.995190104841179,0.0569404270877409,-0.079714760171932 );
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(-0.11539061+$x,0.0009118006+$y,-0.19999722+$z);

    OpenGL::glNormal3f( 0.167219535640528,-0.985912201762352,-0.00384152525396152 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10968661+$x,0.13286439+$y,-0.27357188+$z);
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);

    OpenGL::glNormal3f( -0.995513985339327,0.094549796524441,0.00349870990477465 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(-0.10939036+$x,0.13255345+$y,-0.18087476+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10968661+$x,0.13286439+$y,-0.27357188+$z);

    OpenGL::glNormal3f( 0.909725858437397,-0.0896124608954417,-0.405423814473946 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);

    OpenGL::glNormal3f( 0.907154571134506,-0.117491602972826,-0.404062256713797 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);

    OpenGL::glNormal3f( 0.886383581918768,-0.0629908249273131,-0.458646161741086 );
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.010673052+$x,-0.08557626+$y,-0.058095615+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(-0.032476139+$x,-0.085519822+$y,-0.14149387+$z);

    OpenGL::glNormal3f( 0.89742213358637,0.161653371009676,-0.410489587919712 );
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.037478892+$x,0.1339072+$y,-0.033365903+$z);

    OpenGL::glNormal3f( 0.977269574665147,0.211947895761501,0.00471888928392129 );
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.02639098+$x,0.13342432+$y,-0.057796722+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);

    OpenGL::glNormal3f( -0.438900025130989,0.881406255135756,-0.174613233598086 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(-0.14193194+$x,0.21565524+$y,-0.12081003+$z);

    OpenGL::glNormal3f( 0.0305484101515414,0.886546329149519,-0.461630155978491 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036458132+$x,0.21433137+$y,-0.2190071+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);

    OpenGL::glNormal3f( 0.435944139483088,0.874370888054894,-0.213139056421965 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036458132+$x,0.21433137+$y,-0.2190071+$z);

    OpenGL::glNormal3f( -0.0301451354099881,0.996182853259255,-0.081920654803064 );
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(-0.09360707+$x,0.25429145+$y,-0.023664375+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);

    OpenGL::glNormal3f( 0.0876777011971934,-0.996030468473544,-0.0153599018599744 );
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.028499119+$x,0.13391681+$y,-0.274306+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);

    OpenGL::glNormal3f( -0.00894353679718477,-0.987801315493887,0.155462452888481 );
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(-0.10251599+$x,0.13404964+$y,-0.26562834+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10968661+$x,0.13286439+$y,-0.27357188+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);

    OpenGL::glNormal3f( 0.0122111979547283,-0.996832698626694,-0.0785840797689529 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10968661+$x,0.13286439+$y,-0.27357188+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.028499119+$x,0.13391681+$y,-0.274306+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(-0.03476777+$x,0.13324948+$y,-0.26681506+$z);

    OpenGL::glNormal3f( -0.0146296746181265,0.542846835955023,-0.839704284444344 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(-0.10968661+$x,0.13286439+$y,-0.27357188+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.028499119+$x,0.13391681+$y,-0.274306+$z);

    OpenGL::glNormal3f( 0.995089356767703,0.0989781068973279,-0.000711619744801535 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.028499119+$x,0.13391681+$y,-0.274306+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036458132+$x,0.21433137+$y,-0.2190071+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);

    OpenGL::glNormal3f( 0.026753236606187,0.568219052307553,-0.822442321944706 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(-0.10159129+$x,0.21611367+$y,-0.21989444+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036458132+$x,0.21433137+$y,-0.2190071+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(-0.028499119+$x,0.13391681+$y,-0.274306+$z);

    OpenGL::glNormal3f( 0.902912698441104,-0.106849595607941,-0.416331385932197 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(-0.036458132+$x,0.21433137+$y,-0.2190071+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(-0.028289502+$x,0.13248537+$y,-0.18028609+$z);

    OpenGL::glNormal3f( 0.908504565066681,0.371804046216133,0.19073858149392 );
    OpenGL::glTexCoord2f(0.087071,0.19858); OpenGL::glVertex3f(0.0065153108+$x,0.30272908+$y,-0.037073956+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.025759644+$x,0.25686029+$y,-0.03932501+$z);

    OpenGL::glNormal3f( 0.897498419027802,-0.334866747060151,-0.286985800268844 );
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.0065153108+$x,0.30272908+$y,-0.037073956+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);

    OpenGL::glNormal3f( 0.149148002767953,-0.0766250565064358,-0.985841505509743 );
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(-0.046492623+$x,0.31664642+$y,-0.060802042+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(-0.017310461+$x,0.32019674+$y,-0.056663022+$z);

    OpenGL::glNormal3f( 0.604949371316891,-0.537952623477133,0.587063227461377 );
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(-0.046492623+$x,0.31664642+$y,-0.060802042+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);
    OpenGL::glTexCoord2f(0.498678,0.081409); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);

    OpenGL::glNormal3f( 0.258609674188185,-0.0722837373992885,0.963273635953913 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(-0.046492623+$x,0.31664642+$y,-0.060802042+$z);

    OpenGL::glNormal3f( 0.679463802985651,-0.183895547029558,-0.710289636848923 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.050630979+$x,0.29756037+$y,-0.078891295+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);

    OpenGL::glNormal3f( -0.471813237548896,-0.424642822937492,-0.772703527752596 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(-0.093449003+$x,0.26397181+$y,-0.023626631+$z);

    OpenGL::glNormal3f( 0.592405743673544,0.14248100808797,-0.792940475191443 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);

    OpenGL::glNormal3f( 0.570379338866551,0.328886601888193,-0.752662615580576 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.432926,0.238482); OpenGL::glVertex3f(0.011706868+$x,0.38129724+$y,-0.026325564+$z);

    OpenGL::glNormal3f( 0.436769702213704,-0.899153803233754,0.0274711732262636 );
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.028988584+$x,0.31705986+$y,-0.0073183876+$z);
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.032418946+$x,0.3187978+$y,-0.004974215+$z);
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.029762198+$x,0.31786774+$y,0.0068243363+$z);

    OpenGL::glNormal3f( 0.530544327936343,0.089722895327208,-0.842895318618319 );
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.028988584+$x,0.31705986+$y,-0.0073183876+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.032418946+$x,0.3187978+$y,-0.004974215+$z);

    OpenGL::glNormal3f( 0.903837402703507,0.424723994318865,-0.0518408923920814 );
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.032418946+$x,0.3187978+$y,-0.004974215+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.033199391+$x,0.3184578+$y,0.0058471501+$z);

    OpenGL::glNormal3f( 0.398833080942528,0.911508264575904,-0.100423389485295 );
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);

    OpenGL::glNormal3f( 0.962748486769082,0.028557993974601,-0.268886206793857 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.012626277+$x,0.30576006+$y,-0.013082317+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);

    OpenGL::glNormal3f( 0.970871349913939,0.0795893333971259,-0.225996371487876 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.01133926+$x,0.28374094+$y,-0.023037533+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.0065153108+$x,0.30272908+$y,-0.037073956+$z);

    OpenGL::glNormal3f( 0.988129902899626,-0.153249739577764,-0.010668285472531 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.009915703+$x,0.30011303+$y,-0.023387304+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.012524083+$x,0.31616264+$y,-0.012343381+$z);

    OpenGL::glNormal3f( 0.389891817477615,0.411265039075708,-0.823920771857378 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.026991561+$x,0.33007717+$y,-0.007189734+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);

    OpenGL::glNormal3f( 0.725246323177671,0.00267212399357958,-0.688484299363923 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.0189962+$x,0.34488067+$y,-0.0035840036+$z);

    OpenGL::glNormal3f( 0.175342904444179,0.984490321468021,0.00580282662784519 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);

    OpenGL::glNormal3f( 0.412945905419136,0.00549242278292457,-0.910738992516266 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.0053274415+$x,0.34314315+$y,-0.014487378+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);

    OpenGL::glNormal3f( 0.68339533158677,0.301064613451288,-0.665079633797965 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.474002,0.23214); OpenGL::glVertex3f(0.0053274415+$x,0.34314315+$y,-0.014487378+$z);

    OpenGL::glNormal3f( 0.964251705250146,-0.201946101989868,0.171570454371617 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);

    OpenGL::glNormal3f( 0.278588582763259,-0.958723247849081,0.0569046183333841 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);

    OpenGL::glNormal3f( 0.990033971115103,-0.0797403699635807,0.116078462412843 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.01267123+$x,0.31879809+$y,-0.036572361+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.011137539+$x,0.33567479+$y,-0.011898012+$z);

    OpenGL::glNormal3f( 0.487822835095826,0.102709015776899,0.86687931088313 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0055312401+$x,0.34236992+$y,-0.030567551+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);

    OpenGL::glNormal3f( 0.600624086986239,-0.0352334339161803,-0.798754850543282 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);

    OpenGL::glNormal3f( 0.627226240367844,0.0117144879658887,-0.778749005884255 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.016956105+$x,0.36260515+$y,-0.030515385+$z);

    OpenGL::glNormal3f( 0.379788537801763,-0.0540817362264833,0.923491111143539 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0055312401+$x,0.34236992+$y,-0.030567551+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.013744011+$x,0.33534294+$y,-0.034356594+$z);

    OpenGL::glNormal3f( 0.479674554566294,-0.195018444725745,0.855499928648962 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.015110171+$x,0.35082049+$y,-0.034012031+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.0055312401+$x,0.34236992+$y,-0.030567551+$z);

    OpenGL::glNormal3f( 0.627821288321327,-0.446352278223403,-0.637659841651744 );
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.0055312401+$x,0.34236992+$y,-0.030567551+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);

    OpenGL::glNormal3f( 0.521015102110166,0.409031479761824,-0.74915720108465 );
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.0055312401+$x,0.34236992+$y,-0.030567551+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);

    OpenGL::glNormal3f( 0.409867897709322,-0.602668187894189,0.684689244641447 );
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.0053274415+$x,0.34314315+$y,-0.014487378+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);

    OpenGL::glNormal3f( 0.681891859719343,-0.275541290883545,-0.677569545262127 );
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.0053274415+$x,0.34314315+$y,-0.014487378+$z);
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.0044466002+$x,0.34732639+$y,-0.017075+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);

    OpenGL::glNormal3f( 0.540619563426186,-0.324328582372433,-0.776235439990451 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093656627+$x,0.33981584+$y,-0.025917713+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);

    OpenGL::glNormal3f( 0.981558220342633,-0.126084163914814,-0.143688008155533 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.010286224+$x,0.33980335+$y,-0.019618236+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093656627+$x,0.33981584+$y,-0.025917713+$z);

    OpenGL::glNormal3f( 0.987794523616033,-0.0896939406700645,-0.127345891654382 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.0099773757+$x,0.34598135+$y,-0.026365276+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.010286224+$x,0.33980335+$y,-0.019618236+$z);

    OpenGL::glNormal3f( 0.399952096323054,0.225903582958216,-0.888260036168145 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.0096282644+$x,0.34332055+$y,-0.027199167+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.0099773757+$x,0.34598135+$y,-0.026365276+$z);

    OpenGL::glNormal3f( 0.984548429623922,0.114704796339287,0.132314774011947 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.0099773757+$x,0.34598135+$y,-0.026365276+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0091125636+$x,0.34587755+$y,-0.019840262+$z);

    OpenGL::glNormal3f( 0.326283750755376,-0.507366512882888,0.797570144625575 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.010286224+$x,0.33980335+$y,-0.019618236+$z);

    OpenGL::glNormal3f( 0.615650972977563,0.504227691996564,0.605580972369177 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0044466002+$x,0.34732639+$y,-0.017075+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.0053274415+$x,0.34314315+$y,-0.014487378+$z);

    OpenGL::glNormal3f( 0.391180180667156,-0.917781501997809,0.0682288856999458 );
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093656627+$x,0.33981584+$y,-0.025917713+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.003559832+$x,0.33712426+$y,-0.028836659+$z);

    OpenGL::glNormal3f( 0.947650520131438,0.255918754073731,0.190955709545341 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.010286224+$x,0.33980335+$y,-0.019618236+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.0099773757+$x,0.34598135+$y,-0.026365276+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);

    OpenGL::glNormal3f( 0.251503881496381,-0.967083447208368,-0.038670450318489 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.010286224+$x,0.33980335+$y,-0.019618236+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.0040041576+$x,0.33810992+$y,-0.018125519+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.0093656627+$x,0.33981584+$y,-0.025917713+$z);

    OpenGL::glNormal3f( 0.555175255007894,0.435576541277599,0.708557346243452 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0091125636+$x,0.34587755+$y,-0.019840262+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0044466002+$x,0.34732639+$y,-0.017075+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.0092524201+$x,0.34218528+$y,-0.017680068+$z);

    OpenGL::glNormal3f( 0.319292237660809,0.946691785516244,0.0427449436263458 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0091125636+$x,0.34587755+$y,-0.019840262+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.0044466002+$x,0.34732639+$y,-0.017075+$z);

    OpenGL::glNormal3f( 0.300404450737182,0.952226984964416,0.0549630337851712 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.0099773757+$x,0.34598135+$y,-0.026365276+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.0091125636+$x,0.34587755+$y,-0.019840262+$z);

    OpenGL::glNormal3f( 0.514428679500955,-0.855308408884928,-0.0617305386145017 );
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.0044466002+$x,0.34732639+$y,-0.017075+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.0041176649+$x,0.34795329+$y,-0.02850219+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.011192451+$x,0.3510016+$y,-0.011780682+$z);

    OpenGL::glNormal3f( -0.418985443160829,0.907983614752432,-0.0041174944359357 );
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(-0.074606455+$x,0.40314652+$y,-0.02351956+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.075080876+$x,0.40313366+$y,0.02192041+$z);

    OpenGL::glNormal3f( -0.0195931785327096,0.438744098398452,-0.898398421345182 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.036474318+$x,0.33514831+$y,-0.074740243+$z);

    OpenGL::glNormal3f( -0.227406047504684,0.73585819783323,-0.637808123372483 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(-0.074606455+$x,0.40314652+$y,-0.02351956+$z);

    OpenGL::glNormal3f( -0.262134519489899,0.334493429379742,-0.905206959426174 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.036474318+$x,0.33514831+$y,-0.074740243+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);

    OpenGL::glNormal3f( 0.676838651898265,-0.00840542952520879,-0.736083411069042 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.036474318+$x,0.33514831+$y,-0.074740243+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);

    OpenGL::glNormal3f( 0.668622772716401,-0.171926777403458,-0.723453364783587 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.050630979+$x,0.29756037+$y,-0.078891295+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.036474318+$x,0.33514831+$y,-0.074740243+$z);

    OpenGL::glNormal3f( 0.616201028764206,-0.00206464485274413,-0.787586204419279 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(-0.025820894+$x,0.33536947+$y,-0.064946801+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(-0.024372698+$x,0.35794132+$y,-0.063872916+$z);
    OpenGL::glTexCoord2f(0.503631,0.08026); OpenGL::glVertex3f(-0.01835622+$x,0.35009514+$y,-0.059145104+$z);

    OpenGL::glNormal3f( -0.0729704782158179,-0.659249424965532,-0.748375243438457 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.050630979+$x,0.29756037+$y,-0.078891295+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);

    OpenGL::glNormal3f( -0.449902376088993,-0.126744812767169,-0.884038236970604 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.050630979+$x,0.29756037+$y,-0.078891295+$z);

    OpenGL::glNormal3f( -0.273017174598593,0.206587449526835,-0.93956545704501 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(-0.050630979+$x,0.29756037+$y,-0.078891295+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(-0.036474318+$x,0.33514831+$y,-0.074740243+$z);

    OpenGL::glNormal3f( -0.856246624909468,-0.0884940678260785,-0.508930758837328 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13158283+$x,0.33533761+$y,-0.022490694+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(-0.11213845+$x,0.26325035+$y,-0.04267004+$z);

    OpenGL::glNormal3f( -0.798068690810026,0.377956299978424,-0.469292446194684 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(-0.13158283+$x,0.33533761+$y,-0.022490694+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);

    OpenGL::glNormal3f( -0.356468302407603,0.435837664186098,-0.826423547495742 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(-0.1140212+$x,0.33566286+$y,-0.052093678+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(-0.10201553+$x,0.39047674+$y,-0.028364547+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(-0.058735778+$x,0.38530851+$y,-0.049758382+$z);

    OpenGL::glNormal3f( -0.00266597526636703,0.125343457281341,0.992109827737151 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(-0.11718932+$x,-0.39615641+$y,-0.033120652+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036983993+$x,-0.39592395+$y,-0.03273573+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(-0.035193611+$x,-0.3459273+$y,-0.039246276+$z);

    OpenGL::glNormal3f( 0.00149097910912512,-0.999976332858504,0.00671645026439155 );
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(-0.11718932+$x,-0.39615641+$y,-0.033120652+$z);
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.800276,0.441019); OpenGL::glVertex3f(0.036983993+$x,-0.39592395+$y,-0.03273573+$z);

    OpenGL::glNormal3f( 0.986333692018132,0.164732868708626,-0.00298830334913766 );
    OpenGL::glTexCoord2f(0.646629,0.978498); OpenGL::glVertex3f(0.036983993+$x,-0.39592395+$y,-0.03273573+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.036791821+$x,-0.39660092+$y,-0.13348351+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.031499939+$x,-0.36312986+$y,-0.03502556+$z);

    OpenGL::glNormal3f( -0.518275993037863,-0.399322169310841,-0.756261727272709 );
    OpenGL::glTexCoord2f(0.16806,0.270577); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(-0.04071022+$x,0.28074776+$y,-0.065048265+$z);

    OpenGL::glNormal3f( 0.561788697184067,0.82724623298257,0.00755842128861922 );
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.0086816981+$x,0.21522475+$y,-0.064299655+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);

    OpenGL::glNormal3f( 0.407708926133165,0.901212967818101,-0.146930657753351 );
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(-0.04846014+$x,0.25385876+$y,-0.045539184+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.0088711081+$x,0.21561445+$y,-0.12102926+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(-0.06850838+$x,0.24340403+$y,-0.16529489+$z);

    OpenGL::glNormal3f( -0.0216169732733245,-0.153847375540222,0.987858133289333 );
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.030022734+$x,-0.10821521+$y,0.23790979+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.074955177+$x,-0.14024401+$y,0.23390492+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.026873009+$x,-0.081016033+$y,0.24207682+$z);
};



$DRAW_MODEL{'Cursor'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
};



$DRAW_MODEL{'Floor'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}
};



$DRAW_MODEL{'N'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -0.707106781186547,0.707106781186547,0 );# top west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,0.707106781186547 );# top south face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0.707106781186547,-0.707106781186547 );# top north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.707106781186547,0.707106781186547,0 );# top east face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.70710678); OpenGL::glVertex3f(0+$x,0.1+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
};



$DRAW_MODEL{'Sapling'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.15000276,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    OpenGL::glNormal3f( 0,0.999234513896439,0.0391201511819484 );
    OpenGL::glTexCoord2f(0.61840762,0.53439169); OpenGL::glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.61705267,0.52757992); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.58416256,0.54120346); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.58280762,0.53439169); OpenGL::glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    OpenGL::glNormal3f( 0.979253696964734,0.0634406526299195,-0.192451242071314 );
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    OpenGL::glNormal3f( 0,0.99923451390125,0.0391201511821367 );
    OpenGL::glTexCoord2f(0.61705267,0.52757992); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    OpenGL::glNormal3f( 0.979253700925903,0.0482005021893658,0.196822002864555 );
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    OpenGL::glNormal3f( 0.979253708876079,0.0482005055688002,0.196821962482229 );
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887348); OpenGL::glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);

    OpenGL::glNormal3f( 0.830171195095948,0.0341204450084621,0.556463459775563 );
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887348); OpenGL::glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    OpenGL::glNormal3f( 0,0.999234512202863,0.0391201945583273 );
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    OpenGL::glNormal3f( 0,0.999234512203072,0.0391201945583355 );
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    OpenGL::glNormal3f( 0.830171252695131,0.0341204438669332,0.556463373915049 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    OpenGL::glNormal3f( 0,0.999234503253314,0.0391204231582761 );
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    OpenGL::glNormal3f( 0,0.9992345032532,0.0391204231582716 );
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    OpenGL::glNormal3f( 0.554702615193727,0.0233440284060303,0.831721146199265 );
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    OpenGL::glNormal3f( 0.554702690956925,0.0233440343693552,0.831721095502878 );
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21276391); OpenGL::glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( 0.194785730661177,0.017511883374407,0.98068947841377 );
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21276391); OpenGL::glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,0.999234505353034,0.0391203695261294 );
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    OpenGL::glNormal3f( 0,0.999234505353034,0.0391203695261294 );
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);

    OpenGL::glNormal3f( 0.194785718170122,0.0175118838325021,0.980689480886579 );
    OpenGL::glTexCoord2f(0.44753904,0.21970913); OpenGL::glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    OpenGL::glNormal3f( 0,0.9992345032532,0.0391204231582716 );
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    OpenGL::glNormal3f( -0.194785718170122,0.0175118838325021,0.980689480886579 );
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    OpenGL::glTexCoord2f(0.44753904,0.21970913); OpenGL::glVertex3f(0+$x,-0.15489579+$y,0.026086044+$z);

    OpenGL::glNormal3f( -0.194785730661177,0.017511883374407,0.98068947841377 );
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.22665434); OpenGL::glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    OpenGL::glNormal3f( -0.554702690956925,0.0233440343693552,0.831721095502878 );
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);
    OpenGL::glTexCoord2f(0.25176752,0.23359956); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.25176752,0.22665434); OpenGL::glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,0.999234512203072,0.0391201945583355 );
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    OpenGL::glNormal3f( 0,0.999234512202864,0.0391201945583273 );
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    OpenGL::glNormal3f( -0.554702615193727,0.0233440284060303,0.831721146199265 );
    OpenGL::glTexCoord2f(0.44753904,0.23359956); OpenGL::glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);
    OpenGL::glTexCoord2f(0.25176752,0.23359956); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.0080923768+$x,-0.15483282+$y,0.024477602+$z);

    OpenGL::glNormal3f( 0,0.999234513901249,0.0391201511821367 );
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.58416256,0.54120346); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    OpenGL::glNormal3f( -0.830171252695131,0.0341204438669332,0.556463373915049 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(-0.014952763+$x,-0.15465349+$y,0.019897148+$z);

    OpenGL::glNormal3f( -0.830171195095948,0.0341204450084621,0.556463459775563 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( -0.979253708876079,0.0482005055688002,0.196821962482229 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    OpenGL::glNormal3f( -0.979253700925903,0.0482005021893658,0.196822002864555 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.019536726+$x,-0.15438511+$y,0.013042013+$z);

    OpenGL::glNormal3f( -0.979253696964734,0.0634406526299195,-0.192451242071314 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.0211464+$x,-0.15406853+$y,0.004955831+$z);

    OpenGL::glNormal3f( -0.97925370673822,0.063440652890506,-0.19245119225477 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);

    OpenGL::glNormal3f( -0.830171207446931,0.0775207115069962,-0.552092660351099 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);

    OpenGL::glNormal3f( -0.830171235041929,0.0775207077458453,-0.552092619385137 );
    OpenGL::glTexCoord2f(0.44753904,0.21970912); OpenGL::glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    OpenGL::glNormal3f( -0.554702676867285,0.088297120594236,-0.827350324089521 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(-0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    OpenGL::glNormal3f( -0.554702667234012,0.0882971203422769,-0.827350330575104 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);

    OpenGL::glNormal3f( -0.194785714988963,0.094129271895914,-0.976318700736897 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);

    OpenGL::glNormal3f( -0.194785705826057,0.0941292723727401,-0.97631870251902 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    OpenGL::glNormal3f( 0.194785705826057,0.0941292723727401,-0.97631870251902 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0+$x,-0.15324128+$y,-0.016174382+$z);

    OpenGL::glNormal3f( 0.194785714988963,0.0941292718959139,-0.976318700736898 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);

    OpenGL::glNormal3f( 0.554702667234012,0.0882971203422769,-0.827350330575104 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);

    OpenGL::glNormal3f( 0.554702676867285,0.088297120594236,-0.827350324089521 );
    OpenGL::glTexCoord2f(0.44753904,0.21970912); OpenGL::glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.0080923768+$x,-0.15330425+$y,-0.01456594+$z);

    OpenGL::glNormal3f( 0.830171235041929,0.0775207077458453,-0.552092619385137 );
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.25176752,0.17803783); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.44753904,0.17803783); OpenGL::glVertex3f(0.014952763+$x,-0.15348358+$y,-0.0099854858+$z);

    OpenGL::glNormal3f( 0.830171207446931,0.0775207115069962,-0.552092660351098 );
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);
    OpenGL::glTexCoord2f(0.25176752,0.18498305); OpenGL::glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.25176752,0.17803783); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);

    OpenGL::glNormal3f( 0.97925370673822,0.063440652890506,-0.19245119225477 );
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.25176752,0.18498305); OpenGL::glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.019536726+$x,-0.15375196+$y,-0.0031303512+$z);

    OpenGL::glNormal3f( 0,-0.999234512592127,-0.0391201845773796 );
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    OpenGL::glTexCoord2f(0.82508346,0.35855901); OpenGL::glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.82372851,0.35174724); OpenGL::glVertex3f(0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.85932851,0.35174724); OpenGL::glVertex3f(-0.0356+$x,-0.40723826+$y,-0.004955831+$z);
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.85797357,0.34493548); OpenGL::glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    OpenGL::glNormal3f( 0,-0.999234508603607,-0.0391202864978603 );
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    OpenGL::glNormal3f( 0,-0.999234509279886,-0.0391202692223623 );
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( 0,-0.999234505528077,-0.039120365055047 );
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,-0.999234509279957,-0.0391202692223651 );
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    OpenGL::glNormal3f( 0,-0.99923450860355,-0.0391202864978581 );
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,-0.999234512593773,-0.0391201845774441 );
    OpenGL::glTexCoord2f(0.85797357,0.34493548); OpenGL::glVertex3f(-0.032890111+$x,-0.40777121+$y,0.0086572703+$z);
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( 0,-0.999234508603608,-0.0391202864978603 );
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( 0,-0.999234509279853,-0.039120269222361 );
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,-0.999234505527907,-0.0391203650550403 );
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0+$x,-0.40863094+$y,0.030616918+$z);

    OpenGL::glNormal3f( 0,-0.999234509279772,-0.0391202692223579 );
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0+$x,-0.40584557+$y,-0.040528579+$z);
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01362353+$x,-0.40852493+$y,0.027909103+$z);

    OpenGL::glNormal3f( 0,-0.999234508603508,-0.0391202864978564 );
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01362353+$x,-0.40595159+$y,-0.037820765+$z);
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.025173001+$x,-0.40822303+$y,0.0201979+$z);

    OpenGL::glNormal3f( 0,-0.999234512593774,-0.0391201845774441 );
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.025173001+$x,-0.40625348+$y,-0.030109562+$z);
    OpenGL::glTexCoord2f(0.82508346,0.35855901); OpenGL::glVertex3f(0.032890111+$x,-0.4067053+$y,-0.018568932+$z);
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.032890111+$x,-0.40777121+$y,0.0086572703+$z);

    OpenGL::glNormal3f( 0.878183960296039,0.445285571646999,-0.174681686394914 );
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    OpenGL::glNormal3f( 0.644162108715998,0.754080506454736,0.128131836323089 );
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);
    OpenGL::glTexCoord2f(0.63474982,0.99807288); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);

    OpenGL::glNormal3f( 0.878183960296039,0.445285571646999,0.174681686394914 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);

    OpenGL::glNormal3f( 0.8781839593158,0.445285565699255,0.174681706484448 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    OpenGL::glNormal3f( 0.744488411701077,0.44528555242655,0.497451285698399 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);

    OpenGL::glNormal3f( 0.54609427773606,0.75408050728672,0.364888514966056 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.6190637,0.99107142); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.744488442328843,0.445285538945063,0.497451251928446 );
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,0.016145212+$z);

    OpenGL::glNormal3f( 0.364888514966056,0.75408050728672,0.54609427773606 );
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.60097156,0.98553187); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);

    OpenGL::glNormal3f( 0.497451251928446,0.445285538945063,0.744488442328843 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.497451285698399,0.44528555242655,0.744488411701077 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);

    OpenGL::glNormal3f( 0.174681706484448,0.445285565699255,0.8781839593158 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);

    OpenGL::glNormal3f( 0.128131836323089,0.754080506454736,0.644162108715998 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.5808086,0.98202248); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);

    OpenGL::glNormal3f( 0.174681686394914,0.445285571646999,0.878183960296039 );
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.128131836323089,0.754080506454736,0.644162108715998 );
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.55871849,0.98091334); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.174681686394914,0.445285571646999,0.878183960296039 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,0.042189471+$z);

    OpenGL::glNormal3f( -0.174681706484448,0.445285565699255,0.8781839593158 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);

    OpenGL::glNormal3f( -0.497451285698399,0.44528555242655,0.744488411701077 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);

    OpenGL::glNormal3f( -0.364888514966056,0.75408050728672,0.54609427773606 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.53489502,0.98197441); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.497451251928446,0.445285538945063,0.744488442328843 );
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.54609427773606,0.75408050728672,0.364888514966056 );
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.50928954,0.9857555); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);

    OpenGL::glNormal3f( -0.744488442328843,0.445285538945063,0.497451251928446 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.744488411701077,0.44528555242655,0.497451285698399 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);

    OpenGL::glNormal3f( -0.8781839593158,0.445285565699255,0.174681706484448 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);

    OpenGL::glNormal3f( -0.644162108715998,0.754080506454736,0.128131836323089 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.46801984,0.9857555); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);

    OpenGL::glNormal3f( -0.878183960296039,0.445285571646999,0.174681686394914 );
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,0.016145212+$z);

    OpenGL::glNormal3f( -0.644162108715998,0.754080506454736,-0.128131836323089 );
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);
    OpenGL::glTexCoord2f(0.44241434,0.98197441); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    OpenGL::glNormal3f( -0.878183960296039,0.445285571646999,-0.174681686394914 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.042189471+$x,0.095416179+$y,0+$z);

    OpenGL::glNormal3f( -0.8781839593158,0.445285565699255,-0.174681706484448 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);

    OpenGL::glNormal3f( -0.744488411701077,0.44528555242655,-0.497451285698399 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    OpenGL::glNormal3f( -0.54609427773606,0.75408050728672,-0.364888514966056 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.4185909,0.98091334); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.744488442328843,0.445285538945063,-0.497451251928446 );
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    OpenGL::glNormal3f( -0.364888514966056,0.75408050728672,-0.54609427773606 );
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.39650076,0.98202248); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( -0.497451251928446,0.445285538945063,-0.744488442328843 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.497451285698399,0.44528555242655,-0.744488411701077 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    OpenGL::glNormal3f( -0.174681706484448,0.445285565699255,-0.8781839593158 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    OpenGL::glNormal3f( -0.128131836323089,0.754080506454736,-0.644162108715998 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.37633783,0.98553186); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);

    OpenGL::glNormal3f( -0.174681686394914,0.445285571646999,-0.878183960296039 );
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.128131836323089,0.754080506454736,-0.644162108715998 );
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.35824565,0.99107143); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.174681686394914,0.445285571646999,-0.878183960296039 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(0+$x,0.095416179+$y,-0.042189471+$z);

    OpenGL::glNormal3f( 0.174681706484448,0.445285565699255,-0.8781839593158 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);

    OpenGL::glNormal3f( 0.497451285698399,0.44528555242655,-0.744488411701077 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    OpenGL::glNormal3f( 0.364888514966056,0.75408050728672,-0.54609427773606 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.34255958,0.99807286); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    OpenGL::glNormal3f( 0.497451251928446,0.445285538945063,-0.744488442328843 );
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.016145212+$x,0.095416179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.54609427773606,0.75408050728672,-0.364888514966056 );
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.33057252,1.00599943); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    OpenGL::glNormal3f( 0.744488442328843,0.445285538945063,-0.497451251928446 );
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.029832461+$x,0.095416179+$y,-0.029832461+$z);

    OpenGL::glNormal3f( 0.744488411701077,0.44528555242655,-0.497451285698399 );
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.18086972,0.87319155); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    OpenGL::glNormal3f( 0.644162108715998,0.754080506454736,-0.128131836323089 );
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.64673683,1.00599941); OpenGL::glVertex3f(0+$x,0.13145591+$y,0+$z);
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.042189471+$x,0.095416179+$y,0+$z);

    OpenGL::glNormal3f( 0.8781839593158,0.445285565699255,-0.174681706484448 );
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.79643966,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.038977988+$x,0.095416179+$y,-0.016145212+$z);

    OpenGL::glNormal3f( 0.942179486742844,0.277803666525894,0.187411145948579 );
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);

    OpenGL::glNormal3f( 0.942179466633407,0.27780369257129,-0.187411208437874 );
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.79643966,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    OpenGL::glNormal3f( 0.942179466633407,0.27780369257129,0.187411208437874 );
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    OpenGL::glNormal3f( 0.798741176077898,0.277803697324677,0.533701826294829 );
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,0.027803853+$z);

    OpenGL::glNormal3f( 0.798741213751524,0.27780373006808,0.533701752868588 );
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    OpenGL::glNormal3f( 0.533701752868588,0.27780373006808,0.798741213751524 );
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    OpenGL::glNormal3f( 0.533701826294829,0.277803697324677,0.798741176077898 );
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,0.051374822+$z);

    OpenGL::glNormal3f( 0.187411208437874,0.27780369257129,0.942179466633407 );
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,0.067124441+$z);

    OpenGL::glNormal3f( 0.187411145948579,0.277803666525894,0.942179486742845 );
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    OpenGL::glNormal3f( -0.187411145948579,0.277803666525894,0.942179486742845 );
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);

    OpenGL::glNormal3f( -0.187411208437874,0.27780369257129,0.942179466633407 );
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,0.072654973+$z);

    OpenGL::glNormal3f( -0.533701826294829,0.277803697324677,0.798741176077898 );
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,0.067124441+$z);

    OpenGL::glNormal3f( -0.533701752868588,0.27780373006808,0.798741213751524 );
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    OpenGL::glNormal3f( -0.798741213751524,0.27780373006808,0.533701752868588 );
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    OpenGL::glNormal3f( -0.798741176077898,0.277803697324677,0.533701826294829 );
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,0.051374822+$z);

    OpenGL::glNormal3f( -0.942179466633407,0.27780369257129,0.187411208437874 );
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,0.027803853+$z);

    OpenGL::glNormal3f( -0.942179486742844,0.277803666525894,0.187411145948579 );
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    OpenGL::glNormal3f( -0.942179486742844,0.277803666525894,-0.187411145948579 );
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);

    OpenGL::glNormal3f( -0.942179466633407,0.27780369257129,-0.187411208437874 );
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.072654973+$x,0.03533268+$y,0+$z);

    OpenGL::glNormal3f( -0.798741176077898,0.277803697324677,-0.533701826294829 );
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.067124441+$x,0.03533268+$y,-0.027803853+$z);

    OpenGL::glNormal3f( -0.798741213751524,0.27780373006808,-0.533701752868588 );
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    OpenGL::glNormal3f( -0.533701752868588,0.27780373006808,-0.798741213751524 );
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    OpenGL::glNormal3f( -0.533701826294829,0.277803697324677,-0.798741176077898 );
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    OpenGL::glNormal3f( -0.187411208437874,0.27780369257129,-0.942179466633407 );
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    OpenGL::glNormal3f( -0.187411145948579,0.277803666525894,-0.942179486742845 );
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    OpenGL::glNormal3f( 0.187411145948579,0.277803666525894,-0.942179486742845 );
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);

    OpenGL::glNormal3f( 0.187411208437874,0.27780369257129,-0.942179466633407 );
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(0+$x,0.03533268+$y,-0.072654973+$z);

    OpenGL::glNormal3f( 0.533701826294829,0.277803697324677,-0.798741176077898 );
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.027803853+$x,0.03533268+$y,-0.067124441+$z);

    OpenGL::glNormal3f( 0.533701752868588,0.27780373006808,-0.798741213751524 );
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    OpenGL::glNormal3f( 0.798741213751524,0.27780373006808,-0.533701752868588 );
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    OpenGL::glNormal3f( 0.798741176077898,0.277803697324677,-0.533701826294829 );
    OpenGL::glTexCoord2f(0.18086972,0.87319155); OpenGL::glVertex3f(0.067124441+$x,0.03533268+$y,-0.027803853+$z);
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.051374822+$x,0.03533268+$y,-0.051374822+$z);

    OpenGL::glNormal3f( 0.942179486742844,0.277803666525894,-0.187411145948579 );
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.072654973+$x,0.03533268+$y,0+$z);

    OpenGL::glNormal3f( 0.962917055651036,0.190012274653134,-0.191536104736111 );
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    OpenGL::glNormal3f( 0.962917055651036,0.190012274653134,0.191536104736111 );
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.094928292+$x,-0.040207951+$y,0+$z);

    OpenGL::glNormal3f( 0.962917049505553,0.190012244334688,0.191536165708764 );
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    OpenGL::glNormal3f( 0.81632170804583,0.190012244506253,0.545448637280206 );
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    OpenGL::glNormal3f( 0.81632169487454,0.190012254806661,0.545448653404192 );
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    OpenGL::glNormal3f( 0.545448653404192,0.190012254806661,0.81632169487454 );
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    OpenGL::glNormal3f( 0.545448637280206,0.190012244506253,0.81632170804583 );
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    OpenGL::glNormal3f( 0.191536165708764,0.190012244334688,0.962917049505553 );
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    OpenGL::glNormal3f( 0.191536104736111,0.190012274653134,0.962917055651036 );
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    OpenGL::glNormal3f( -0.191536104736111,0.190012274653134,0.962917055651036 );
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,0.094928292+$z);

    OpenGL::glNormal3f( -0.191536165708764,0.190012244334688,0.962917049505553 );
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);

    OpenGL::glNormal3f( -0.545448637280206,0.190012244506253,0.81632170804583 );
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    OpenGL::glNormal3f( -0.545448653404192,0.190012254806661,0.81632169487454 );
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,0.087702306+$z);

    OpenGL::glNormal3f( -0.81632169487454,0.190012254806661,0.545448653404192 );
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,0.067124441+$z);

    OpenGL::glNormal3f( -0.81632170804583,0.190012244506253,0.545448637280206 );
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    OpenGL::glNormal3f( -0.962917049505553,0.190012244334688,0.191536165708764 );
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    OpenGL::glNormal3f( -0.962917055651036,0.190012274653134,0.191536104736111 );
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,0.036327486+$z);

    OpenGL::glNormal3f( -0.962917055651036,0.190012274653134,-0.191536104736111 );
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.094928292+$x,-0.040207951+$y,0+$z);

    OpenGL::glNormal3f( -0.962917049505553,0.190012244334688,-0.191536165708764 );
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);

    OpenGL::glNormal3f( -0.81632170804583,0.190012244506253,-0.545448637280206 );
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    OpenGL::glNormal3f( -0.81632169487454,0.190012254806661,-0.545448653404192 );
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    OpenGL::glNormal3f( -0.545448653404192,0.190012254806661,-0.81632169487454 );
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    OpenGL::glNormal3f( -0.545448637280206,0.190012244506253,-0.81632170804583 );
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    OpenGL::glNormal3f( -0.191536165708764,0.190012244334688,-0.962917049505553 );
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    OpenGL::glNormal3f( -0.191536104736111,0.190012274653134,-0.962917055651036 );
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    OpenGL::glNormal3f( 0.191536104736111,0.190012274653134,-0.962917055651036 );
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(0+$x,-0.040207951+$y,-0.094928292+$z);

    OpenGL::glNormal3f( 0.191536165708764,0.190012244334688,-0.962917049505553 );
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);

    OpenGL::glNormal3f( 0.545448637280206,0.190012244506253,-0.81632170804583 );
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    OpenGL::glNormal3f( 0.545448653404192,0.190012254806661,-0.81632169487454 );
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.036327486+$x,-0.040207951+$y,-0.087702306+$z);

    OpenGL::glNormal3f( 0.81632169487454,0.190012254806661,-0.545448653404192 );
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.067124441+$x,-0.040207951+$y,-0.067124441+$z);

    OpenGL::glNormal3f( 0.81632170804583,0.190012244506253,-0.545448637280206 );
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);
    OpenGL::glTexCoord2f(0.071592505,0.67046678); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    OpenGL::glNormal3f( 0.962917049505553,0.190012244334688,-0.191536165708764 );
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.90571687,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.087702306+$x,-0.040207951+$y,-0.036327486+$z);

    OpenGL::glNormal3f( 0.975318207039005,-0.105438682182075,0.194002781727292 );
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);

    OpenGL::glNormal3f( 0.975318189387232,-0.105438615850187,-0.194002906519485 );
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.90571687,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    OpenGL::glNormal3f( 0.975318189387232,-0.105438615850187,0.194002906519485 );
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    OpenGL::glNormal3f( 0.826834886635256,-0.10543862537532,0.552473317474995 );
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    OpenGL::glNormal3f( 0.826834805542256,-0.1054386963768,0.552473425288729 );
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    OpenGL::glNormal3f( 0.552473425288729,-0.1054386963768,0.826834805542256 );
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    OpenGL::glNormal3f( 0.552473317474995,-0.10543862537532,0.826834886635256 );
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    OpenGL::glNormal3f( 0.194002906519485,-0.105438615850187,0.975318189387232 );
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    OpenGL::glNormal3f( 0.194002781727292,-0.105438682182075,0.975318207039005 );
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    OpenGL::glNormal3f( -0.194002781727292,-0.105438682182075,0.975318207039005 );
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);

    OpenGL::glNormal3f( -0.194002906519485,-0.105438615850187,0.975318189387232 );
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(0+$x,-0.11783487+$y,0.1102464+$z);

    OpenGL::glNormal3f( -0.552473317474995,-0.10543862537532,0.826834886635256 );
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,0.10185439+$z);

    OpenGL::glNormal3f( -0.552473425288729,-0.1054386963768,0.826834805542256 );
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    OpenGL::glNormal3f( -0.826834805542256,-0.1054386963768,0.552473425288729 );
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    OpenGL::glNormal3f( -0.826834886635256,-0.10543862537532,0.552473317474995 );
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,0.077955978+$z);

    OpenGL::glNormal3f( -0.975318189387232,-0.105438615850187,0.194002906519485 );
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,0.042189471+$z);

    OpenGL::glNormal3f( -0.975318207039005,-0.105438682182075,0.194002781727292 );
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.975318207039005,-0.105438682182075,-0.194002781727292 );
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);

    OpenGL::glNormal3f( -0.975318189387232,-0.105438615850187,-0.194002906519485 );
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1102464+$x,-0.11783487+$y,0+$z);

    OpenGL::glNormal3f( -0.826834886635256,-0.10543862537532,-0.552473317474995 );
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.10185439+$x,-0.11783487+$y,-0.042189471+$z);

    OpenGL::glNormal3f( -0.826834805542256,-0.1054386963768,-0.552473425288729 );
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( -0.552473425288729,-0.1054386963768,-0.826834805542256 );
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    OpenGL::glNormal3f( -0.552473317474995,-0.10543862537532,-0.826834886635256 );
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    OpenGL::glNormal3f( -0.194002906519485,-0.105438615850187,-0.975318189387232 );
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    OpenGL::glNormal3f( -0.194002781727292,-0.105438682182075,-0.975318207039005 );
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    OpenGL::glNormal3f( 0.194002781727292,-0.105438682182075,-0.975318207039005 );
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);

    OpenGL::glNormal3f( 0.194002906519485,-0.105438615850187,-0.975318189387232 );
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(0+$x,-0.11783487+$y,-0.1102464+$z);

    OpenGL::glNormal3f( 0.552473317474995,-0.10543862537532,-0.826834886635256 );
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.042189471+$x,-0.11783487+$y,-0.10185439+$z);

    OpenGL::glNormal3f( 0.552473425288729,-0.1054386963768,-0.826834805542256 );
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    OpenGL::glNormal3f( 0.826834805542256,-0.1054386963768,-0.552473425288729 );
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    OpenGL::glNormal3f( 0.826834886635256,-0.10543862537532,-0.552473317474995 );
    OpenGL::glTexCoord2f(0.071592505,0.67046678); OpenGL::glVertex3f(0.10185439+$x,-0.11783487+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.077955978+$x,-0.11783487+$y,-0.077955978+$z);

    OpenGL::glNormal3f( 0.975318207039005,-0.105438682182075,-0.194002781727292 );
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1102464+$x,-0.11783487+$y,0+$z);

    OpenGL::glNormal3f( 0.923930781119175,-0.335524046154038,-0.183781190966142 );
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.923930781119175,-0.335524046154038,0.183781190966142 );
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.10185439+$x,-0.19546179+$y,0+$z);

    OpenGL::glNormal3f( 0.923930729091407,-0.335524114454675,0.183781327832907 );
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    OpenGL::glNormal3f( 0.783270688656413,-0.335524105075374,0.523364694266893 );
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.783270648931591,-0.335524059847498,0.523364782714443 );
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    OpenGL::glNormal3f( 0.523364782714443,-0.335524059847498,0.783270648931591 );
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    OpenGL::glNormal3f( 0.523364694266893,-0.335524105075374,0.783270688656413 );
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    OpenGL::glNormal3f( 0.183781327832907,-0.335524114454675,0.923930729091407 );
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    OpenGL::glNormal3f( 0.183781190966142,-0.335524046154038,0.923930781119175 );
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    OpenGL::glNormal3f( -0.183781190966142,-0.335524046154038,0.923930781119175 );
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,0.10185439+$z);

    OpenGL::glNormal3f( -0.183781327832907,-0.335524114454675,0.923930729091407 );
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);

    OpenGL::glNormal3f( -0.523364694266893,-0.335524105075374,0.783270688656413 );
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    OpenGL::glNormal3f( -0.523364782714443,-0.335524059847498,0.783270648931591 );
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,0.094101189+$z);

    OpenGL::glNormal3f( -0.783270648931591,-0.335524059847498,0.523364782714443 );
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,0.07202193+$z);

    OpenGL::glNormal3f( -0.783270688656413,-0.335524105075374,0.523364694266893 );
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    OpenGL::glNormal3f( -0.923930729091407,-0.335524114454675,0.183781327832907 );
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.923930781119175,-0.335524046154038,0.183781190966142 );
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.923930781119175,-0.335524046154038,-0.183781190966142 );
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.10185439+$x,-0.19546179+$y,0+$z);

    OpenGL::glNormal3f( -0.923930729091407,-0.335524114454675,-0.183781327832907 );
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);

    OpenGL::glNormal3f( -0.783270688656413,-0.335524105075374,-0.523364694266893 );
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.783270648931591,-0.335524059847498,-0.523364782714443 );
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( -0.523364782714443,-0.335524059847498,-0.783270648931591 );
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    OpenGL::glNormal3f( -0.523364694266893,-0.335524105075374,-0.783270688656413 );
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    OpenGL::glNormal3f( -0.183781327832907,-0.335524114454675,-0.923930729091407 );
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    OpenGL::glNormal3f( -0.183781190966142,-0.335524046154038,-0.923930781119175 );
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    OpenGL::glNormal3f( 0.183781190966142,-0.335524046154038,-0.923930781119175 );
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(0+$x,-0.19546179+$y,-0.10185439+$z);

    OpenGL::glNormal3f( 0.183781327832907,-0.335524114454675,-0.923930729091407 );
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);

    OpenGL::glNormal3f( 0.523364694266893,-0.335524105075374,-0.783270688656413 );
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    OpenGL::glNormal3f( 0.523364782714443,-0.335524059847498,-0.783270648931591 );
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.038977988+$x,-0.19546179+$y,-0.094101189+$z);

    OpenGL::glNormal3f( 0.783270648931591,-0.335524059847498,-0.523364782714443 );
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.07202193+$x,-0.19546179+$y,-0.07202193+$z);

    OpenGL::glNormal3f( 0.783270688656413,-0.335524105075374,-0.523364694266893 );
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.070228823,0.45795639); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    OpenGL::glNormal3f( 0.923930729091407,-0.335524114454675,-0.183781327832907 );
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.90708053,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.094101189+$x,-0.19546179+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.671498852777226,-0.728867952169112,0.133569453916961 );
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.84919307,0.38385446); OpenGL::glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);

    OpenGL::glNormal3f( 0.671498857303792,-0.728867942308,-0.133569484970946 );
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.90708053,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    OpenGL::glNormal3f( 0.671498857303792,-0.728867942308,0.133569484970946 );
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    OpenGL::glNormal3f( 0.569269270970117,-0.728867939801861,0.380373531489959 );
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.569269258080571,-0.728867944853889,0.380373541099883 );
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.77619885,0.37859741); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    OpenGL::glNormal3f( 0.380373541099883,-0.728867944853889,0.569269258080571 );
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.75518378,0.374797); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.380373531489959,-0.728867939801861,0.569269270970117 );
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    OpenGL::glNormal3f( 0.133569484970946,-0.728867942308,0.671498857303792 );
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    OpenGL::glNormal3f( 0.133569453916961,-0.728867952169112,0.671498852777226 );
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.67818786,0.36245149); OpenGL::glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.133569453916961,-0.728867952169112,0.671498852777226 );
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.65589456,0.35595595); OpenGL::glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);

    OpenGL::glNormal3f( -0.133569484970946,-0.728867942308,0.671498857303792 );
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(0+$x,-0.26127072+$y,0.077955978+$z);

    OpenGL::glNormal3f( -0.380373531489959,-0.728867939801861,0.569269270970117 );
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,0.07202193+$z);

    OpenGL::glNormal3f( -0.380373541099883,-0.728867944853889,0.569269258080571 );
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.57086482,0.34094282); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.569269258080571,-0.728867944853889,0.380373541099883 );
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.54245419,0.33267348); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.569269270970117,-0.728867939801861,0.380373531489959 );
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,0.0551232+$z);

    OpenGL::glNormal3f( -0.671498857303792,-0.728867942308,0.133569484970946 );
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.671498852777226,-0.728867952169112,0.133569453916961 );
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.4348549,0.33267337); OpenGL::glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    OpenGL::glNormal3f( -0.671498852777226,-0.728867952169112,-0.133569453916961 );
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.40644448,0.34094235); OpenGL::glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);

    OpenGL::glNormal3f( -0.671498857303792,-0.728867942308,-0.133569484970946 );
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.077955978+$x,-0.26127072+$y,0+$z);

    OpenGL::glNormal3f( -0.569269270970117,-0.728867939801861,-0.380373531489959 );
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.07202193+$x,-0.26127072+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.569269258080571,-0.728867944853889,-0.380373541099883 );
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.32141542,0.35595561); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    OpenGL::glNormal3f( -0.380373541099883,-0.728867944853889,-0.569269258080571 );
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.29912214,0.36245196); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.380373531489959,-0.728867939801861,-0.569269270970117 );
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    OpenGL::glNormal3f( -0.133569484970946,-0.728867942308,-0.671498857303792 );
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    OpenGL::glNormal3f( -0.133569453916961,-0.728867952169112,-0.671498852777226 );
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.22212535,0.3747977); OpenGL::glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.133569453916961,-0.728867952169112,-0.671498852777226 );
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.20110988,0.37859758); OpenGL::glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);

    OpenGL::glNormal3f( 0.133569484970946,-0.728867942308,-0.671498857303792 );
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(0+$x,-0.26127072+$y,-0.077955978+$z);

    OpenGL::glNormal3f( 0.380373531489959,-0.728867939801861,-0.569269270970117 );
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.029832461+$x,-0.26127072+$y,-0.07202193+$z);

    OpenGL::glNormal3f( 0.380373541099883,-0.728867944853889,-0.569269258080571 );
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.12811605,0.38385414); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.569269258080571,-0.728867944853889,-0.380373541099883 );
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.11168619,0.38378728); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    OpenGL::glNormal3f( 0.569269270970117,-0.728867939801861,-0.380373531489959 );
    OpenGL::glTexCoord2f(0.070228823,0.45795639); OpenGL::glVertex3f(0.07202193+$x,-0.26127072+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0551232+$x,-0.26127072+$y,-0.0551232+$z);

    OpenGL::glNormal3f( 0.671498852777226,-0.728867952169112,-0.133569453916961 );
    OpenGL::glTexCoord2f(0.86562334,0.38378742); OpenGL::glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.077955978+$x,-0.26127072+$y,0+$z);

    OpenGL::glNormal3f( 0.342894574756044,-0.936894473314623,-0.0682059856272723 );
    OpenGL::glTexCoord2f(0.86562334,0.38378742); OpenGL::glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);
    OpenGL::glTexCoord2f(0.87692441,0.31094667); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    OpenGL::glNormal3f( 0.342894574756044,-0.936894473314623,0.0682059856272723 );
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.83919279,0.31126907); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.84919307,0.38385446); OpenGL::glVertex3f(0.042189471+$x,-0.29422205+$y,0+$z);

    OpenGL::glNormal3f( 0.290691989577293,-0.936894473607523,0.194234169288719 );
    OpenGL::glTexCoord2f(0.77619885,0.37859741); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.79707636,0.3089041); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    OpenGL::glNormal3f( 0.194234169288719,-0.936894473607523,0.290691989577293 );
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.75093491,0.30094888); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.75518378,0.374797); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    OpenGL::glNormal3f( 0.0682059856272723,-0.936894473314623,0.342894574756044 );
    OpenGL::glTexCoord2f(0.67818786,0.36245149); OpenGL::glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);
    OpenGL::glTexCoord2f(0.70267303,0.29107259); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.0682059856272723,-0.936894473314623,0.342894574756044 );
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);
    OpenGL::glTexCoord2f(0.65363307,0.27763999); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.65589456,0.35595595); OpenGL::glVertex3f(0+$x,-0.29422205+$y,0.042189471+$z);

    OpenGL::glNormal3f( -0.194234169288719,-0.936894473607523,0.290691989577293 );
    OpenGL::glTexCoord2f(0.57086482,0.34094282); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);
    OpenGL::glTexCoord2f(0.59626992,0.2641011); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,0.038977988+$z);

    OpenGL::glNormal3f( -0.290691989577293,-0.936894473607523,0.194234169288719 );
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);
    OpenGL::glTexCoord2f(0.53490917,0.24713356); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.54245419,0.33267348); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,0.029832461+$z);

    OpenGL::glNormal3f( -0.342894574756044,-0.936894473314623,0.0682059856272723 );
    OpenGL::glTexCoord2f(0.4348549,0.33267337); OpenGL::glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);
    OpenGL::glTexCoord2f(0.44239984,0.2471346); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,0.016145212+$z);

    OpenGL::glNormal3f( -0.342894574756044,-0.936894473314623,-0.0682059856272723 );
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.38104115,0.26410093); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.40644448,0.34094235); OpenGL::glVertex3f(-0.042189471+$x,-0.29422205+$y,0+$z);

    OpenGL::glNormal3f( -0.290691989577293,-0.936894473607523,-0.194234169288719 );
    OpenGL::glTexCoord2f(0.32141542,0.35595561); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.32367495,0.27763785); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.038977988+$x,-0.29422205+$y,-0.016145212+$z);

    OpenGL::glNormal3f( -0.194234169288719,-0.936894473607523,-0.290691989577293 );
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.27463456,0.29107476); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.29912214,0.36245196); OpenGL::glVertex3f(-0.029832461+$x,-0.29422205+$y,-0.029832461+$z);

    OpenGL::glNormal3f( -0.0682059856272723,-0.936894473314623,-0.342894574756044 );
    OpenGL::glTexCoord2f(0.22212535,0.3747977); OpenGL::glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);
    OpenGL::glTexCoord2f(0.22637703,0.30094966); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.0682059856272723,-0.936894473314623,-0.342894574756044 );
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);
    OpenGL::glTexCoord2f(0.18023255,0.30890174); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.20110988,0.37859758); OpenGL::glVertex3f(0+$x,-0.29422205+$y,-0.042189471+$z);

    OpenGL::glNormal3f( 0.194234169288719,-0.936894473607523,-0.290691989577293 );
    OpenGL::glTexCoord2f(0.12811605,0.38385414); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
    OpenGL::glTexCoord2f(0.13811544,0.31127004); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.016145212+$x,-0.29422205+$y,-0.038977988+$z);

    OpenGL::glNormal3f( 0.290691989577293,-0.936894473607523,-0.194234169288719 );
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.038977988+$x,-0.29422205+$y,-0.016145212+$z);
    OpenGL::glTexCoord2f(0.10038548,0.31094724); OpenGL::glVertex3f(0+$x,-0.309663+$y,0+$z);
    OpenGL::glTexCoord2f(0.11168619,0.38378728); OpenGL::glVertex3f(0.029832461+$x,-0.29422205+$y,-0.029832461+$z);
};



$DRAW_MODEL{'Shrub'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.0074533333,0.1501283); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.1501283); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.1501283); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1030322,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.055242766,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.055242766,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1030322,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.0087933422,0.0081000089); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.058034241,0.060858114); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.054996102); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.0081000089); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.079137483,0.054996102); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.058034241,0.060858114); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.0081000089); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.10024073,0.060858114); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.0081000089); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.14878829); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.10024073,0.096030186); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.14878829); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.14878829); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.079137483,0.1018922); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.10024073,0.096030186); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.14878829); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.10024073,0.096030186); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.1018922); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.1018922); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.058034241,0.096030186); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.14878829); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.1018922); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.050999827,0.07844415); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.058034241,0.096030186); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.054996102); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.10024073,0.060858114); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.0081000089); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.14948162,0.054996102); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.10727514,0.07844415); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.10024073,0.060858114); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.058034241,0.060858114); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.050999827,0.07844415); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.1018922); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.079137483,0.1018922); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.14878829); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.058034241,0.096030186); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.10727514,0.07844415); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.14948162,0.054996102); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.10024073,0.096030186); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.079137483,0.054996102); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.0081000089); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.10024073,0.060858114); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.055242766,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1030322,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.055242766,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1030322,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.0074533333,0.00676); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.00676); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15082163,0.02109683); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0074533333,0.02109683); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.0087933422,0.054996102); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.058034241,0.060858114); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.0087933422,0.1018922); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.14948162,0.1018922); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.10024073,0.096030186); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.14948162,0.054996102); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.16666667+$z);
}

    OpenGL::glNormal3f( -0.262483110323801,-0.195429458680657,-0.944939121570553 );
    OpenGL::glTexCoord2f(0.30034109,0.96363191); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.51506351,0.99605022); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);

    OpenGL::glNormal3f( 0.928476690885259,0,-0.371390676354104 );
    OpenGL::glTexCoord2f(0.92015794,0.75673844); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.89403246,0.56010743); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);

    OpenGL::glNormal3f( 0.176708409866431,-0.131566655794025,-0.975430342446683 );
    OpenGL::glTexCoord2f(0.73908489,0.97334538); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);

    OpenGL::glNormal3f( 0.90476677156459,-0.224545370302313,0.361906708625836 );
    OpenGL::glTexCoord2f(0.8269528,0.37703254); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.89403246,0.56010743); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);

    OpenGL::glNormal3f( 0.262483110323801,-0.195429458680657,0.944939121570553 );
    OpenGL::glTexCoord2f(0.69891764,0.28441387); OpenGL::glVertex3f(0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.48240691,0.25464786); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);

    OpenGL::glNormal3f( -0.176708409866431,-0.131566655794025,0.975430342446683 );
    OpenGL::glTexCoord2f(0.25931383,0.27826082); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    OpenGL::glNormal3f( 0.383561553011393,0.71394337692172,-0.585803200401892 );
    OpenGL::glTexCoord2f(0.65289765,0.73029341); OpenGL::glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);

    OpenGL::glNormal3f( -0.119835344791728,0.334583736075777,-0.934715579035796 );
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    OpenGL::glNormal3f( -0.905881109439556,0.389114789276421,-0.16723963742763 );
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);

    OpenGL::glNormal3f( -0.311951558006999,0.580651911045146,0.752017010217605 );
    OpenGL::glTexCoord2f(0.33934164,0.51446499); OpenGL::glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    OpenGL::glNormal3f( -0.650193491769631,0.638567424755678,0.411679568719795 );
    OpenGL::glTexCoord2f(0.33934164,0.51446499); OpenGL::glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    OpenGL::glNormal3f( 0.207547541120402,0.35949825569901,0.909771961715816 );
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    OpenGL::glNormal3f( 0.134573882740895,0.978157951754866,0.158419984543509 );
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    OpenGL::glNormal3f( 0.883241313849124,0.403117265026277,0.239543841807314 );
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);

    OpenGL::glNormal3f( -0.341163391279438,-0.366488825782845,-0.865617398754799 );
    OpenGL::glTexCoord2f(0.51506351,0.99605022); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.4338309,0.88613372); OpenGL::glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);

    OpenGL::glNormal3f( 0.267643883663828,0,-0.963517904108348 );
    OpenGL::glTexCoord2f(0.51506351,0.99605022); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.73908489,0.97334538); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);

    OpenGL::glNormal3f( -0.90476677156459,-0.224545370302313,-0.361906708625836 );
    OpenGL::glTexCoord2f(0.10672194,0.69221941); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.17554203,0.8731049); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,-0.125+$z);

    OpenGL::glNormal3f( -0.645488440644096,-0.561982845713747,-0.517223311654002 );
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.10672194,0.69221941); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.22833401,0.73306801); OpenGL::glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);

    OpenGL::glNormal3f( -0.929001569771096,0.266030755559964,-0.257261968543805 );
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    OpenGL::glNormal3f( 0.670227113438415,0.623764450737793,-0.402136203801385 );
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.72339625,0.66881691); OpenGL::glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);

    OpenGL::glNormal3f( 0.955964174052732,-0.154729263967988,-0.24938194160685 );
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.92015794,0.75673844); OpenGL::glVertex3f(0.15+$x,-0.4+$y,-0.125+$z);

    OpenGL::glNormal3f( 0.16492923477811,-0.0010145825530033,0.986304880925645 );
    OpenGL::glTexCoord2f(0.48240691,0.25464786); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.565208,0.36406494); OpenGL::glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);

    OpenGL::glNormal3f( -0.267643883663828,0,0.963517904108348 );
    OpenGL::glTexCoord2f(0.48240691,0.25464786); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.25931383,0.27826082); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    OpenGL::glNormal3f( 0.916937623996139,-0.196951524780328,0.347038168775452 );
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.89403246,0.56010743); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.77220061,0.51768602); OpenGL::glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);

    OpenGL::glNormal3f( 0.88933350553576,0.374909325403606,0.261780277440625 );
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    OpenGL::glNormal3f( -0.670227113438415,0.623764450737793,0.402136203801385 );
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.27613587,0.58236756); OpenGL::glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);

    OpenGL::glNormal3f( -0.955964174052732,-0.154729263967988,0.24938194160685 );
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.078853106,0.49570944); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    OpenGL::glNormal3f( 0.312734722361293,0.582109656221635,-0.750563349467008 );
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.5974624,0.80472281); OpenGL::glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);

    OpenGL::glNormal3f( 0.352406905887475,0.834850203552426,-0.422888295311291 );
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.65289765,0.73029341); OpenGL::glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);

    OpenGL::glNormal3f( 0.49826779781017,0.728712288158119,-0.46979527749091 );
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.65289765,0.73029341); OpenGL::glVertex3f(0.12592593+$x,-0.22489833+$y,-0.10493827+$z);

    OpenGL::glNormal3f( 0.247699907715026,0.922113442319399,-0.297239895054209 );
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.56970699,0.67271676); OpenGL::glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);

    OpenGL::glNormal3f( 0.132025358739482,0.977975356175003,0.16165861364025 );
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    OpenGL::glNormal3f( -0.247699907715026,0.922113442319399,0.297239895054209 );
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.42886541,0.57761023); OpenGL::glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);

    OpenGL::glNormal3f( -0.122445642125336,0.987629276894256,-0.0979565012944218 );
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    OpenGL::glNormal3f( -0.312734722361293,0.582109656221635,0.750563349467008 );
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.40055082,0.44616798); OpenGL::glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);

    OpenGL::glNormal3f( -0.26530731240058,0.91008425390991,0.318368781088887 );
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.33934164,0.51446499); OpenGL::glVertex3f(-0.13198661+$x,-0.22279905+$y,0.11324471+$z);

    OpenGL::glNormal3f( -0.928476690885259,0,0.371390676354104 );
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.10672194,0.69221941); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.078853106,0.49570944); OpenGL::glVertex3f(-0.15+$x,-0.4+$y,0.125+$z);

    OpenGL::glNormal3f( -0.0814812404319664,0.985824435120814,-0.146666255752292 );
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    OpenGL::glNormal3f( -0.183866307077927,0.228160017576006,-0.956104694843218 );
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.37228833,0.74994668); OpenGL::glVertex3f(-0.14444444+$x,-0.21494938+$y,-0.12037037+$z);

    OpenGL::glNormal3f( 0.191809730289227,0.384482954930314,0.902984985885384 );
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.62786707,0.50660024); OpenGL::glVertex3f(0.1385538+$x,-0.22149053+$y,0.10697841+$z);

    OpenGL::glNormal3f( 0.190676476131653,-0.35491613831717,-0.915246970064388 );
    OpenGL::glTexCoord2f(0.5974624,0.80472281); OpenGL::glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    OpenGL::glNormal3f( -0.190676478527532,0.354916142776746,-0.915246967835904 );
    OpenGL::glTexCoord2f(0.5974624,0.80472281); OpenGL::glVertex3f(0.066666667+$x,-0.256735+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);

    OpenGL::glNormal3f( 0.874860322293886,0.407105849038198,0.262458080757148 );
    OpenGL::glTexCoord2f(0.72339625,0.66881691); OpenGL::glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);

    OpenGL::glNormal3f( 0.874860316751887,-0.407105857451153,-0.262458086180917 );
    OpenGL::glTexCoord2f(0.72339625,0.66881691); OpenGL::glVertex3f(0.2+$x,-0.256735+$y,-0.055555557+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.73594437,0.78949876); OpenGL::glVertex3f(0.16666667+$x,-0.27464312+$y,-0.13888889+$z);

    OpenGL::glNormal3f( -0.190676476131653,-0.35491613831717,0.915246970064388 );
    OpenGL::glTexCoord2f(0.40055082,0.44616798); OpenGL::glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    OpenGL::glNormal3f( 0.190676478527532,0.354916142776746,0.915246967835904 );
    OpenGL::glTexCoord2f(0.40055082,0.44616798); OpenGL::glVertex3f(-0.066666667+$x,-0.256735+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);

    OpenGL::glNormal3f( -0.874860322293886,0.407105849038198,-0.262458080757148 );
    OpenGL::glTexCoord2f(0.27613587,0.58236756); OpenGL::glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);

    OpenGL::glNormal3f( -0.874860316751887,-0.407105857451153,0.262458086180917 );
    OpenGL::glTexCoord2f(0.27613587,0.58236756); OpenGL::glVertex3f(-0.2+$x,-0.256735+$y,0.055555557+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.26308277,0.46134073); OpenGL::glVertex3f(-0.16666667+$x,-0.27464312+$y,0.13888889+$z);

    OpenGL::glNormal3f( 0.131449180501891,0.97869275905759,0.15773901328975 );
    OpenGL::glTexCoord2f(0.42886541,0.57761023); OpenGL::glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);
    OpenGL::glTexCoord2f(0.44879384,0.49425597); OpenGL::glVertex3f(-0.033333333+$x,-0.20301063+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);

    OpenGL::glNormal3f( -0.131449175213788,0.9786927607906,-0.157739006944027 );
    OpenGL::glTexCoord2f(0.42886541,0.57761023); OpenGL::glVertex3f(-0.066666667+$x,-0.1851025+$y,0.055555557+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.33448922,0.61074027); OpenGL::glVertex3f(-0.16666667+$x,-0.20301063+$y,0.027777778+$z);

    OpenGL::glNormal3f( -0.946385128651128,0,0.323040536570858 );
    OpenGL::glTexCoord2f(0.22833401,0.73306801); OpenGL::glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);
    OpenGL::glTexCoord2f(0.10672194,0.69221941); OpenGL::glVertex3f(-0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);

    OpenGL::glNormal3f( -0.770697745511202,0.58175297233223,-0.259977814912286 );
    OpenGL::glTexCoord2f(0.22833401,0.73306801); OpenGL::glVertex3f(-0.21658449+$x,-0.33623468+$y,-0.048586208+$z);
    OpenGL::glTexCoord2f(0.24357991,0.65608459); OpenGL::glVertex3f(-0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);

    OpenGL::glNormal3f( -0.131449180501891,0.97869275905759,-0.15773901328975 );
    OpenGL::glTexCoord2f(0.56970699,0.67271676); OpenGL::glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);
    OpenGL::glTexCoord2f(0.54819781,0.75627186); OpenGL::glVertex3f(0.033333333+$x,-0.20301063+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);

    OpenGL::glNormal3f( 0.131449175213788,0.9786927607906,0.157739006944027 );
    OpenGL::glTexCoord2f(0.56970699,0.67271676); OpenGL::glVertex3f(0.066666667+$x,-0.1851025+$y,-0.055555557+$z);
    OpenGL::glTexCoord2f(0.49955821,0.62471065); OpenGL::glVertex3f(0+$x,-0.1851025+$y,0+$z);
    OpenGL::glTexCoord2f(0.66523661,0.64040398); OpenGL::glVertex3f(0.16666667+$x,-0.20301063+$y,-0.027777778+$z);

    OpenGL::glNormal3f( 0.99359121487026,0,0.11303317093951 );
    OpenGL::glTexCoord2f(0.77220061,0.51768602); OpenGL::glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);
    OpenGL::glTexCoord2f(0.89403246,0.56010743); OpenGL::glVertex3f(0.2+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);

    OpenGL::glNormal3f( 0.967354177437774,0.0755473896227836,0.241905947249901 );
    OpenGL::glTexCoord2f(0.77220061,0.51768602); OpenGL::glVertex3f(0.19589505+$x,-0.35553018+$y,0.036083587+$z);
    OpenGL::glTexCoord2f(0.75629284,0.59546408); OpenGL::glVertex3f(0.2+$x,-0.29255125+$y,0+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);

    OpenGL::glNormal3f( -0.192615368979999,0.409206782478953,-0.891879548372941 );
    OpenGL::glTexCoord2f(0.4338309,0.88613372); OpenGL::glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);
    OpenGL::glTexCoord2f(0.30242002,0.83510814); OpenGL::glVertex3f(-0.16666667+$x,-0.31045938+$y,-0.13888889+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);

    OpenGL::glNormal3f( 0.0279181356746902,0,-0.999610212883227 );
    OpenGL::glTexCoord2f(0.4338309,0.88613372); OpenGL::glVertex3f(-0.070299633+$x,-0.32992088+$y,-0.16863007+$z);
    OpenGL::glTexCoord2f(0.51820943,0.85688082); OpenGL::glVertex3f(0+$x,-0.29255125+$y,-0.16666667+$z);
    OpenGL::glTexCoord2f(0.51506351,0.99605022); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.16666667+$z);

    OpenGL::glNormal3f( 0.164464174658085,0.000623752907321731,0.986382859840106 );
    OpenGL::glTexCoord2f(0.565208,0.36406494); OpenGL::glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);
    OpenGL::glTexCoord2f(0.69863663,0.41370795); OpenGL::glVertex3f(0.16666667+$x,-0.31045938+$y,0.13888889+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);

    OpenGL::glNormal3f( 0.164086062874053,0,0.986446026891736 );
    OpenGL::glTexCoord2f(0.565208,0.36406494); OpenGL::glVertex3f(0.072736765+$x,-0.3378687+$y,0.15456759+$z);
    OpenGL::glTexCoord2f(0.47980427,0.39429239); OpenGL::glVertex3f(0+$x,-0.29255125+$y,0.16666667+$z);
    OpenGL::glTexCoord2f(0.48240691,0.25464786); OpenGL::glVertex3f(0+$x,-0.4+$y,0.16666667+$z);
};



$DRAW_MODEL{'Stair_Down'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.29145882,0.94328043); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.29145891,0.94328041); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.29145891,0.94328041); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.29145882,0.94328043); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.29145882,0.94328043); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.29145891,0.94328041); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.29145882,0.94328043); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.29145882,0.94328043); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.29145891,0.94328041); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.29145891,0.94328041); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.49999998+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.18170058,1.07304199); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.18170068,1.07304196); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.5+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(0.5+$x,0.6+$y,0.49999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(-0.5+$x,0.6+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.4999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.4999998+$z);

    OpenGL::glNormal3f( 0.999999999999875,0,0 );
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);

    OpenGL::glNormal3f( -0.999999999999875,0,0 );
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,0.624694957087903,0.780868881816239 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251723); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251733); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251733); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    OpenGL::glNormal3f( -0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486952,-0.043304327); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486967,-0.043304327); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    OpenGL::glNormal3f( -0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,-0.043304327); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513048,0.055478278); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,-0.043304327); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,-0.043304327); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463813,-0.3242368); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423681); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.66463813,-0.32423669); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463813,-0.3242368); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463731,-0.13251733); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(0.33333316+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(0.33333316+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(-0.33333316+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(-0.33333316+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Stair_Up'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,-0.043304327); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,-0.043304327); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,-0.043304327); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0,0.624694957087903,0.780868881816239 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251723); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251733); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251733); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    OpenGL::glNormal3f( -0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486952,-0.043304327); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486967,-0.043304327); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    OpenGL::glNormal3f( -0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,-0.043304327); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513048,0.055478278); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,-0.043304327); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,0.055478278); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463813,-0.3242368); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423681); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.66463813,-0.32423669); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251733); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423681); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Stairs'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958045); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958045); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060868111,0.0060869244); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.1707247,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.50000015,0.10486951); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391299,0.0060869244); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.17072464,0.89513063); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.49999993,0.89513049); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060871581,0.99391319); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927518,0.89513034); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927556,0.1048695); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.99391308,0.99391275); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391294,0.99391313); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.82927541,0.89513059); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.17072438,0.10486955); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.0060870017); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.82927527,0.10486951); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.49999979,0.10486952); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.9939131,0.0060868782); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.1707249,0.89513044); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.50000012,0.89513051); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.0060869711,0.99391284); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.4506087); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.5493913); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.0060869754,0.5493913); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.99391302,0.4506087); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.66463767,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463767,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.5493913); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536233,0.4506087); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,1.03958038); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536205,1.03958038); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0.999999999999875,0,0 );
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(-0.33333353+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(-0.33333353+$x,-0.5+$y,0.40000001+$z);

    OpenGL::glNormal3f( -0.999999999999875,0,0 );
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.5493913); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513049,0.4506087); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486951,0.5493913); OpenGL::glVertex3f(0.33333353+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486951,0.4506087); OpenGL::glVertex3f(0.33333353+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,0.624694957087903,0.780868881816239 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251723); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251723); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251723); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251723); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463731,-0.13251733); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536196,-0.13251733); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);

    OpenGL::glNormal3f( -0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486952,-0.043304327); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,1.04330433); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.10486952,0.055478278); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.89513048,0.94452172); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0.999999999999572,0,0 );
    OpenGL::glTexCoord2f(0.10486967,-0.043304327); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.055478278); OpenGL::glVertex3f(0.33333313+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,1.04330433); OpenGL::glVertex3f(0.33333387+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,-0.043304327); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.89513033,0.94452172); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);

    OpenGL::glNormal3f( -0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,-0.043304327); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.10486967,1.04330433); OpenGL::glVertex3f(5.3333333e-007+$x,0.6+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.10486967,0.94452172); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.89513033,0.055478278); OpenGL::glVertex3f(-2e-007+$x,-0.4+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0.99999999999958,0,0 );
    OpenGL::glTexCoord2f(0.89513048,0.055478278); OpenGL::glVertex3f(2e-007+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,-0.043304327); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,0.94452172); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.89513048,-0.043304327); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.10486952,1.04330433); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.66463813,-0.3242368); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423681); OpenGL::glVertex3f(-0.33333313+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.66463813,-0.32423669); OpenGL::glVertex3f(-2e-007+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);

    OpenGL::glNormal3f( 0,-0.624695099929767,0.780868767542753 );
    OpenGL::glTexCoord2f(0.6646374,0.94079785); OpenGL::glVertex3f(-5.3333333e-007+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.33536205,0.94079785); OpenGL::glVertex3f(-0.33333387+$x,0.5+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463813,-0.3242368); OpenGL::glVertex3f(2e-007+$x,-0.5+$y,-0.40000013+$z);

    OpenGL::glNormal3f( 0,0.624695099929767,-0.780868767542753 );
    OpenGL::glTexCoord2f(0.33536269,1.13251733); OpenGL::glVertex3f(-5.3333333e-007+$x,0.6+$y,0.39999998+$z);
    OpenGL::glTexCoord2f(0.66463731,-0.13251733); OpenGL::glVertex3f(-0.33333313+$x,-0.4+$y,-0.40000013+$z);
    OpenGL::glTexCoord2f(0.66463804,1.13251733); OpenGL::glVertex3f(-0.33333387+$x,0.6+$y,0.39999998+$z);

    OpenGL::glNormal3f( 0,-0.624694957087903,-0.780868881816238 );
    OpenGL::glTexCoord2f(0.33536205,0.94079778); OpenGL::glVertex3f(0.33333387+$x,0.5+$y,-0.3999998+$z);
    OpenGL::glTexCoord2f(0.33536278,-0.32423669); OpenGL::glVertex3f(0.33333313+$x,-0.5+$y,0.40000001+$z);
    OpenGL::glTexCoord2f(0.6646374,0.94079778); OpenGL::glVertex3f(5.3333333e-007+$x,0.5+$y,-0.3999998+$z);
};



$DRAW_MODEL{'Tree'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south == EMPTY || $south == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(0.15000276,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $west == EMPTY || $west == RAMP_TOP ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $top == EMPTY || $top == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.24340308); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.10361004); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.24340308); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.10361004); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
}

if ( $east == EMPTY || $east == RAMP_TOP ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
}

if ( $north == EMPTY || $north == RAMP_TOP ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(0.15000276,0.18049621); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.18049621); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.01020972,0.16651691); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.15000276,0.16651691); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}

    OpenGL::glNormal3f( 0.852949898907319,0.493650865949391,-0.169662289567867 );
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( 0.594969430303541,0.794987683041385,0.11834678202964 );
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.63474982,0.99807288); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( 0.852949898907319,0.493650865949391,0.169662289567867 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.7230960078548,0.493650840686481,0.48315733556884 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);

    OpenGL::glNormal3f( 0.504390727878012,0.794987683180421,0.337023110813065 );
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.6190637,0.99107142); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.723096024396823,0.493650833159972,0.48315731850193 );
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( 0.337023110813065,0.794987683180421,0.504390727878013 );
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.60097156,0.98553187); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( 0.48315731850193,0.493650833159972,0.723096024396823 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.64463275,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.169662336840592,0.493650850977916,0.852949898169036 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);

    OpenGL::glNormal3f( 0.11834678202964,0.794987683041384,0.594969430303541 );
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.5808086,0.98202248); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);

    OpenGL::glNormal3f( 0.169662289567867,0.493650865949391,0.852949898907319 );
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.11834678202964,0.794987683041384,0.594969430303541 );
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.55871849,0.98091334); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.169662289567867,0.493650865949391,0.852949898907319 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.58586785,0.94655254); OpenGL::glVertex3f(-3.1341658e-017+$x,0.35203633+$y,0.071026045+$z);

    OpenGL::glNormal3f( -0.48315733556884,0.493650840686481,0.7230960078548 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);

    OpenGL::glNormal3f( -0.337023110813065,0.794987683180421,0.504390727878013 );
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.53489502,0.98197441); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.48315731850193,0.493650833159972,0.723096024396823 );
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.504390727878013,0.794987683180421,0.337023110813065 );
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.50928954,0.9857555); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( -0.723096024396823,0.493650833159972,0.48315731850193 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.5221988,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.852949898169036,0.493650850977917,0.169662336840592 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);

    OpenGL::glNormal3f( -0.594969430303541,0.794987683041384,0.11834678202964 );
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.46801984,0.9857555); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);

    OpenGL::glNormal3f( -0.852949898907319,0.493650865949391,0.169662289567867 );
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( -0.594969430303541,0.794987683041384,-0.11834678202964 );
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);
    OpenGL::glTexCoord2f(0.44241434,0.98197441); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( -0.852949898907319,0.493650865949391,-0.169662289567867 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.45511058,0.94655254); OpenGL::glVertex3f(-0.071026045+$x,0.35203633+$y,6.5170806e-018+$z);

    OpenGL::glNormal3f( -0.7230960078548,0.493650840686481,-0.48315733556884 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    OpenGL::glNormal3f( -0.504390727878013,0.794987683180421,-0.337023110813065 );
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.4185909,0.98091334); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.723096024396823,0.493650833159972,-0.48315731850193 );
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( -0.337023110813065,0.794987683180421,-0.504390727878013 );
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.39650076,0.98202248); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( -0.48315731850193,0.493650833159972,-0.723096024396823 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.39144152,0.94655254); OpenGL::glVertex3f(-0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.169662336840592,0.493650850977916,-0.852949898169036 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    OpenGL::glNormal3f( -0.11834678202964,0.794987683041384,-0.594969430303541 );
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.37633783,0.98553186); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);

    OpenGL::glNormal3f( -0.169662289567867,0.493650865949391,-0.852949898907319 );
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.11834678202964,0.794987683041384,-0.594969430303541 );
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.35824565,0.99107143); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.169662289567867,0.493650865949391,-0.852949898907319 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.33267662,0.94655254); OpenGL::glVertex3f(-4.8738021e-017+$x,0.35203633+$y,-0.071026045+$z);

    OpenGL::glNormal3f( 0.48315733556884,0.493650840686481,-0.7230960078548 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    OpenGL::glNormal3f( 0.337023110813065,0.794987683180421,-0.504390727878013 );
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.34255958,0.99807286); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    OpenGL::glNormal3f( 0.48315731850193,0.493650833159972,-0.723096024396823 );
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.504390727878012,0.794987683180421,-0.337023110813065 );
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.33057252,1.00599943); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( 0.852949898169036,0.493650850977916,-0.169662336840592 );
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.79643966,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    OpenGL::glNormal3f( 0.723096024396823,0.493650833159972,-0.48315731850193 );
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.28083544,0.94655254); OpenGL::glVertex3f(0.050222998+$x,0.35203633+$y,-0.050222998+$z);

    OpenGL::glNormal3f( 0.594969430303541,0.794987683041384,-0.11834678202964 );
    OpenGL::glTexCoord2f(0.71832119,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.64673683,1.00599941); OpenGL::glVertex3f(-3.5690749e-017+$x,0.40519228+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.69647393,0.94655254); OpenGL::glVertex3f(0.071026045+$x,0.35203633+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.931359139010414,0.313447461780265,0.185258853729829 );
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);

    OpenGL::glNormal3f( 0.931359120462821,0.313447486131001,-0.185258905774798 );
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.79643966,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    OpenGL::glNormal3f( 0.852949898169036,0.493650850977916,0.169662336840592 );
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.67167514,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( 0.931359120462821,0.313447486131001,0.185258905774798 );
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);

    OpenGL::glNormal3f( 0.789568131042117,0.313447487805829,0.527572591053471 );
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.72081993,0.87319156); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,0.046807834+$z);

    OpenGL::glNormal3f( 0.527572503462268,0.313447530535408,0.78956817260564 );
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);

    OpenGL::glNormal3f( 0.48315733556884,0.493650840686481,0.7230960078548 );
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.61595449,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( 0.527572591053471,0.313447487805829,0.789568131042117 );
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);

    OpenGL::glNormal3f( 0.185258905774798,0.313447486131001,0.931359120462822 );
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.64418163,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,0.11300411+$z);

    OpenGL::glNormal3f( -0.185258853729829,0.313447461780265,0.931359139010414 );
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);

    OpenGL::glNormal3f( -0.169662336840592,0.493650850977916,0.852949898169036 );
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);
    OpenGL::glTexCoord2f(0.55459223,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.185258905774798,0.313447486131001,0.931359120462821 );
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);

    OpenGL::glNormal3f( -0.527572591053471,0.313447487805829,0.789568131042117 );
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.56682798,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,0.11300411+$z);

    OpenGL::glNormal3f( -0.78956817260564,0.313447530535408,0.527572503462268 );
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);

    OpenGL::glNormal3f( -0.7230960078548,0.493650840686481,0.48315733556884 );
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);
    OpenGL::glTexCoord2f(0.48865469,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,0.027180491+$z);

    OpenGL::glNormal3f( -0.789568131042117,0.313447487805829,0.527572591053471 );
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);

    OpenGL::glNormal3f( -0.931359120462821,0.313447486131001,0.185258905774798 );
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.48865469,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,0.046807834+$z);

    OpenGL::glNormal3f( -0.931359139010414,0.313447461780265,-0.185258853729829 );
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);

    OpenGL::glNormal3f( -0.852949898169036,0.493650850977917,-0.169662336840592 );
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);
    OpenGL::glTexCoord2f(0.42271714,0.94655254); OpenGL::glVertex3f(-0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( -0.931359120462822,0.313447486131001,-0.185258905774798 );
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);

    OpenGL::glNormal3f( -0.789568131042117,0.313447487805829,-0.527572591053471 );
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.41048139,0.87319156); OpenGL::glVertex3f(-0.11300411+$x,0.2634176+$y,-0.046807834+$z);

    OpenGL::glNormal3f( -0.527572503462268,0.313447530535408,-0.78956817260564 );
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    OpenGL::glNormal3f( -0.48315733556884,0.493650840686481,-0.7230960078548 );
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.36135488,0.94655254); OpenGL::glVertex3f(-0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( -0.527572591053471,0.313447487805829,-0.789568131042117 );
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    OpenGL::glNormal3f( -0.185258905774798,0.313447486131001,-0.931359120462821 );
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.33312775,0.87319156); OpenGL::glVertex3f(-0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    OpenGL::glNormal3f( 0.185258853729829,0.313447461780265,-0.931359139010414 );
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);

    OpenGL::glNormal3f( 0.169662336840592,0.493650850977917,-0.852949898169036 );
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);
    OpenGL::glTexCoord2f(0.30563423,0.94655254); OpenGL::glVertex3f(0.027180491+$x,0.35203633+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.185258905774797,0.313447486131001,-0.931359120462822 );
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);

    OpenGL::glNormal3f( 0.527572591053471,0.313447487805829,-0.789568131042117 );
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.25648944,0.87319156); OpenGL::glVertex3f(0.046807834+$x,0.2634176+$y,-0.11300411+$z);

    OpenGL::glNormal3f( 0.78956817260564,0.313447530535408,-0.527572503462268 );
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    OpenGL::glNormal3f( 0.7230960078548,0.493650840686481,-0.48315733556884 );
    OpenGL::glTexCoord2f(0.18086972,0.87319155); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);
    OpenGL::glTexCoord2f(0.25898819,0.94655254); OpenGL::glVertex3f(0.065619509+$x,0.35203633+$y,-0.027180491+$z);

    OpenGL::glNormal3f( 0.789568131042117,0.313447487805829,-0.527572591053471 );
    OpenGL::glTexCoord2f(0.18086972,0.87319155); OpenGL::glVertex3f(0.11300411+$x,0.2634176+$y,-0.046807834+$z);
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    OpenGL::glNormal3f( 0.931359139010414,0.313447461780265,-0.185258853729829 );
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.75886466,0.87319156); OpenGL::glVertex3f(0.12231477+$x,0.2634176+$y,-2.2438533e-018+$z);

    OpenGL::glNormal3f( 0.957695834075037,0.215706684037452,-0.190497548165026 );
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    OpenGL::glNormal3f( 0.957695834075037,0.215706684037452,0.190497548165026 );
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.81014554,0.7761601); OpenGL::glVertex3f(0.15981194+$x,0.15200074+$y,-2.2438533e-018+$z);

    OpenGL::glNormal3f( 0.811895349615271,0.215706674378969,0.542491080020181 );
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);

    OpenGL::glNormal3f( 0.78956817260564,0.313447530535408,0.527572503462268 );
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.68258438,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,0.0864896+$z);

    OpenGL::glNormal3f( 0.811895369424797,0.215706657501,0.542491057084187 );
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);

    OpenGL::glNormal3f( 0.542491057084187,0.215706657501,0.811895369424797 );
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.71324045,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,0.11300411+$z);

    OpenGL::glNormal3f( 0.190497562148215,0.215706676229254,0.957695833052287 );
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);

    OpenGL::glNormal3f( 0.185258853729829,0.313447461780265,0.931359139010414 );
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.60561381,0.87319156); OpenGL::glVertex3f(-2.8723188e-017+$x,0.2634176+$y,0.12231477+$z);

    OpenGL::glNormal3f( 0.190497548165026,0.215706684037452,0.957695834075037 );
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);

    OpenGL::glNormal3f( -0.190497548165026,0.215706684037452,0.957695834075037 );
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.62217874,0.7761601); OpenGL::glVertex3f(-2.6427148e-017+$x,0.15200074+$y,0.15981194+$z);

    OpenGL::glNormal3f( -0.542491080020181,0.215706674378969,0.811895349615271 );
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);

    OpenGL::glNormal3f( -0.527572503462268,0.313447530535408,0.78956817260564 );
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);
    OpenGL::glTexCoord2f(0.52783221,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,0.0864896+$z);

    OpenGL::glNormal3f( -0.542491057084187,0.215706657501,0.811895369424797 );
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);

    OpenGL::glNormal3f( -0.811895369424797,0.215706657501,0.542491057084187 );
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.53306431,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,0.11300411+$z);

    OpenGL::glNormal3f( -0.957695833052287,0.215706676229254,0.190497562148215 );
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);

    OpenGL::glNormal3f( -0.931359139010414,0.313447461780265,0.185258853729829 );
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);
    OpenGL::glTexCoord2f(0.44947716,0.87319156); OpenGL::glVertex3f(-0.12231477+$x,0.2634176+$y,1.2735385e-017+$z);

    OpenGL::glNormal3f( -0.957695834075037,0.215706684037452,0.190497548165026 );
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);

    OpenGL::glNormal3f( -0.957695834075037,0.215706684037452,-0.190497548165026 );
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.44424507,0.7761601); OpenGL::glVertex3f(-0.15981194+$x,0.15200074+$y,1.7327465e-017+$z);

    OpenGL::glNormal3f( -0.811895349615271,0.215706674378969,-0.542491080020181 );
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    OpenGL::glNormal3f( -0.78956817260564,0.313447530535408,-0.527572503462268 );
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.37169556,0.87319156); OpenGL::glVertex3f(-0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    OpenGL::glNormal3f( -0.811895369424797,0.215706657501,-0.542491057084187 );
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    OpenGL::glNormal3f( -0.542491057084187,0.215706657501,-0.811895369424797 );
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.35513063,0.7761601); OpenGL::glVertex3f(-0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    OpenGL::glNormal3f( -0.190497562148215,0.215706676229254,-0.957695833052287 );
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    OpenGL::glNormal3f( -0.185258853729829,0.313447461780265,-0.931359139010414 );
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.29472499,0.87319156); OpenGL::glVertex3f(-5.8681665e-017+$x,0.2634176+$y,-0.12231477+$z);

    OpenGL::glNormal3f( -0.190497548165026,0.215706684037452,-0.957695834075037 );
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    OpenGL::glNormal3f( 0.190497548165026,0.215706684037452,-0.957695834075037 );
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.26406892,0.7761601); OpenGL::glVertex3f(-6.5569785e-017+$x,0.15200074+$y,-0.15981194+$z);

    OpenGL::glNormal3f( 0.542491080020181,0.215706674378969,-0.811895349615271 );
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    OpenGL::glNormal3f( 0.527572503462268,0.313447530535408,-0.78956817260564 );
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);
    OpenGL::glTexCoord2f(0.21844471,0.87319156); OpenGL::glVertex3f(0.0864896+$x,0.2634176+$y,-0.0864896+$z);

    OpenGL::glNormal3f( 0.542491057084187,0.215706657501,-0.811895369424797 );
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    OpenGL::glNormal3f( 0.957695833052287,0.215706676229254,-0.190497562148215 );
    OpenGL::glTexCoord2f(0.86251781,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.90571687,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    OpenGL::glNormal3f( 0.811895369424797,0.215706657501,-0.542491057084187 );
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.16716383,0.7761601); OpenGL::glVertex3f(0.11300411+$x,0.15200074+$y,-0.11300411+$z);

    OpenGL::glNormal3f( 0.973680575432198,-0.120147099626964,0.193677080412869 );
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.973680569967618,-0.120147073182655,-0.193677124289825 );
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.90571687,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    OpenGL::glNormal3f( 0.957695833052287,0.215706676229254,0.190497562148215 );
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.76063077,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,0.061157383+$z);

    OpenGL::glNormal3f( 0.973680569967618,-0.120147073182655,0.193677124289825 );
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.82544655493486,-0.120147077001901,0.551545705117963 );
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.78618012,0.67046677); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,0.071026045+$z);

    OpenGL::glNormal3f( 0.551545793876656,-0.120147144275624,0.82544648583623 );
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    OpenGL::glNormal3f( 0.542491080020181,0.215706674378969,0.811895349615271 );
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.66724769,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,0.14764698+$z);

    OpenGL::glNormal3f( 0.551545705117963,-0.120147077001901,0.82544655493486 );
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);

    OpenGL::glNormal3f( 0.193677124289825,-0.120147073182655,0.973680569967618 );
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.68327389,0.67046677); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,0.17147204+$z);

    OpenGL::glNormal3f( -0.193677080412869,-0.120147099626964,0.973680575432198 );
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);

    OpenGL::glNormal3f( -0.190497562148215,0.215706676229254,0.957695833052287 );
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);
    OpenGL::glTexCoord2f(0.57755196,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,0.14764698+$z);

    OpenGL::glNormal3f( -0.193677124289825,-0.120147073182655,0.973680569967618 );
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);

    OpenGL::glNormal3f( -0.551545705117963,-0.120147077001901,0.82544655493486 );
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.58561474,0.67046677); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,0.17147204+$z);

    OpenGL::glNormal3f( -0.82544648583623,-0.120147144275624,0.551545793876656 );
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    OpenGL::glNormal3f( -0.811895349615271,0.215706674378969,0.542491080020181 );
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.48865469,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,0.061157383+$z);

    OpenGL::glNormal3f( -0.82544655493486,-0.120147077001901,0.551545705117963 );
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);

    OpenGL::glNormal3f( -0.973680569967618,-0.120147073182655,0.193677124289825 );
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.48865469,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,0.071026045+$z);

    OpenGL::glNormal3f( -0.973680575432198,-0.120147099626964,-0.193677080412869 );
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);

    OpenGL::glNormal3f( -0.957695833052287,0.215706676229254,-0.190497562148215 );
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);
    OpenGL::glTexCoord2f(0.39975741,0.7761601); OpenGL::glVertex3f(-0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    OpenGL::glNormal3f( -0.973680569967618,-0.120147073182655,-0.193677124289825 );
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);

    OpenGL::glNormal3f( -0.82544655493486,-0.120147077001901,-0.551545705117963 );
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.39169463,0.67046678); OpenGL::glVertex3f(-0.17147204+$x,0.037506756+$y,-0.071026045+$z);

    OpenGL::glNormal3f( -0.551545793876656,-0.120147144275624,-0.82544648583623 );
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    OpenGL::glNormal3f( -0.542491080020181,0.215706674378969,-0.811895349615271 );
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.31006169,0.7761601); OpenGL::glVertex3f(-0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    OpenGL::glNormal3f( -0.551545705117963,-0.120147077001901,-0.82544655493486 );
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    OpenGL::glNormal3f( -0.193677124289825,-0.120147073182655,-0.973680569967618 );
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.29403548,0.67046678); OpenGL::glVertex3f(-0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    OpenGL::glNormal3f( 0.193677080412869,-0.120147099626964,-0.973680575432198 );
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);

    OpenGL::glNormal3f( 0.190497562148214,0.215706676229254,-0.957695833052287 );
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);
    OpenGL::glTexCoord2f(0.2166786,0.7761601); OpenGL::glVertex3f(0.061157383+$x,0.15200074+$y,-0.14764698+$z);

    OpenGL::glNormal3f( 0.193677124289825,-0.120147073182655,-0.973680569967618 );
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);

    OpenGL::glNormal3f( 0.551545705117963,-0.120147077001901,-0.82544655493486 );
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.19112925,0.67046678); OpenGL::glVertex3f(0.071026045+$x,0.037506756+$y,-0.17147204+$z);

    OpenGL::glNormal3f( 0.82544648583623,-0.120147144275624,-0.551545793876656 );
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    OpenGL::glNormal3f( 0.811895349615271,0.215706674378969,-0.542491080020181 );
    OpenGL::glTexCoord2f(0.071592505,0.67046678); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.11479157,0.7761601); OpenGL::glVertex3f(0.14764698+$x,0.15200074+$y,-0.061157383+$z);

    OpenGL::glNormal3f( 0.82544655493486,-0.120147077001901,-0.551545705117963 );
    OpenGL::glTexCoord2f(0.071592505,0.67046678); OpenGL::glVertex3f(0.17147204+$x,0.037506756+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    OpenGL::glNormal3f( 0.973680575432198,-0.120147099626964,-0.193677080412869 );
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.84266568,0.67046677); OpenGL::glVertex3f(0.1856+$x,0.037506756+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.908573417652906,-0.376606280038167,-0.18072646339242 );
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.908573417652906,-0.376606280038167,0.18072646339242 );
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.85651769,0.56001899); OpenGL::glVertex3f(0.17147204+$x,-0.076987229+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.770251357334272,-0.376606328144515,0.514665444853468 );
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.82544648583623,-0.120147144275624,0.551545793876656 );
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.7335797,0.67046677); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,0.13123902+$z);

    OpenGL::glNormal3f( 0.770251313983723,-0.376606268434297,0.514665553425078 );
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    OpenGL::glNormal3f( 0.514665553425078,-0.376606268434297,0.770251313983723 );
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.74698157,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    OpenGL::glNormal3f( 0.180726563579611,-0.376606335725282,0.908573374641961 );
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    OpenGL::glNormal3f( 0.193677080412869,-0.120147099626964,0.973680575432198 );
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.63418383,0.67046677); OpenGL::glVertex3f(-2.4326026e-017+$x,0.037506756+$y,0.1856+$z);

    OpenGL::glNormal3f( 0.18072646339242,-0.376606280038167,0.908573417652906 );
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    OpenGL::glNormal3f( -0.18072646339242,-0.376606280038167,0.908573417652906 );
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.6442054,0.56001899); OpenGL::glVertex3f(-2.5191114e-017+$x,-0.076987229+$y,0.17147204+$z);

    OpenGL::glNormal3f( -0.514665444853468,-0.376606328144515,0.770251357334272 );
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    OpenGL::glNormal3f( -0.551545793876656,-0.120147144275624,0.82544648583623 );
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);
    OpenGL::glTexCoord2f(0.53712915,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,0.13123902+$z);

    OpenGL::glNormal3f( -0.514665553425078,-0.376606268434297,0.770251313983723 );
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    OpenGL::glNormal3f( -0.770251313983723,-0.376606268434297,0.514665553425078 );
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.54107387,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,0.12124904+$z);

    OpenGL::glNormal3f( -0.908573374641961,-0.376606335725282,0.180726563579612 );
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.973680575432198,-0.120147099626964,0.193677080412869 );
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.44018022,0.67046678); OpenGL::glVertex3f(-0.1856+$x,0.037506756+$y,2.0548343e-017+$z);

    OpenGL::glNormal3f( -0.908573417652906,-0.376606280038167,0.18072646339242 );
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.908573417652906,-0.376606280038167,-0.18072646339242 );
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.4362355,0.56001899); OpenGL::glVertex3f(-0.17147204+$x,-0.076987229+$y,1.8818167e-017+$z);

    OpenGL::glNormal3f( -0.770251357334272,-0.376606328144515,-0.514665444853468 );
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.82544648583623,-0.120147144275624,-0.551545793876656 );
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.34312555,0.67046678); OpenGL::glVertex3f(-0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    OpenGL::glNormal3f( -0.770251313983723,-0.376606268434297,-0.514665553425078 );
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    OpenGL::glNormal3f( -0.514665553425078,-0.376606268434297,-0.770251313983723 );
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.33310398,0.56001899); OpenGL::glVertex3f(-0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    OpenGL::glNormal3f( -0.180726563579612,-0.376606335725282,-0.908573374641961 );
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    OpenGL::glNormal3f( -0.19367708041287,-0.120147099626964,-0.973680575432198 );
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.24372968,0.67046678); OpenGL::glVertex3f(-6.9784915e-017+$x,0.037506756+$y,-0.1856+$z);

    OpenGL::glNormal3f( -0.18072646339242,-0.376606280038167,-0.908573417652906 );
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    OpenGL::glNormal3f( 0.18072646339242,-0.376606280038167,-0.908573417652906 );
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.2303278,0.56001899); OpenGL::glVertex3f(-6.7189652e-017+$x,-0.076987229+$y,-0.17147204+$z);

    OpenGL::glNormal3f( 0.514665444853468,-0.376606328144515,-0.770251357334272 );
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    OpenGL::glNormal3f( 0.551545793876656,-0.120147144275624,-0.82544648583623 );
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);
    OpenGL::glTexCoord2f(0.1346437,0.67046678); OpenGL::glVertex3f(0.13123902+$x,0.037506756+$y,-0.13123902+$z);

    OpenGL::glNormal3f( 0.514665553425078,-0.376606268434297,-0.770251313983723 );
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    OpenGL::glNormal3f( 0.908573374641961,-0.376606335725282,-0.180726563579612 );
    OpenGL::glTexCoord2f(0.91779901,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.90708053,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    OpenGL::glNormal3f( 0.770251313983723,-0.376606268434297,-0.514665553425078 );
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.12079168,0.56001899); OpenGL::glVertex3f(0.12124904+$x,-0.076987229+$y,-0.12124904+$z);

    OpenGL::glNormal3f( 0.623235819575763,-0.772145531445475,0.123969316633238 );
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.84919307,0.38385446); OpenGL::glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.623235829629093,-0.772145514597524,-0.123969371029544 );
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.90708053,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    OpenGL::glNormal3f( 0.908573374641961,-0.376606335725282,0.180726563579612 );
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.80024957,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    OpenGL::glNormal3f( 0.623235829629093,-0.772145514597524,0.123969371029544 );
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.528353852482258,-0.772145513899506,0.353034717743204 );
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.80684273,0.45795642); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.353034738588375,-0.772145525100142,0.528353822185156 );
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.75518378,0.374797); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.514665444853468,-0.376606328144515,0.770251357334272 );
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.6953124,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    OpenGL::glNormal3f( 0.353034717743204,-0.772145513899506,0.528353852482258 );
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);

    OpenGL::glNormal3f( 0.123969371029544,-0.772145514597524,0.623235829629093 );
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.70654887,0.45795641); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    OpenGL::glNormal3f( -0.123969316633238,-0.772145531445475,0.623235819575763 );
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.65589456,0.35595595); OpenGL::glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);

    OpenGL::glNormal3f( -0.180726563579612,-0.376606335725282,0.908573374641961 );
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);
    OpenGL::glTexCoord2f(0.59291331,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,0.15841951+$z);

    OpenGL::glNormal3f( -0.123969371029544,-0.772145514597524,0.623235829629093 );
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);

    OpenGL::glNormal3f( -0.353034717743204,-0.772145513899506,0.528353852482258 );
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.60234152,0.45795641); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,0.12124904+$z);

    OpenGL::glNormal3f( -0.528353822185156,-0.772145525100142,0.353034738588375 );
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.54245419,0.33267348); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.770251357334272,-0.376606328144515,0.514665444853468 );
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);
    OpenGL::glTexCoord2f(0.48865468,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.528353852482258,-0.772145513899506,0.353034717743204 );
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);

    OpenGL::glNormal3f( -0.623235829629093,-0.772145514597524,0.123969371029544 );
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.48865469,0.45795641); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.623235819575763,-0.772145531445475,-0.123969316633238 );
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.40644448,0.34094235); OpenGL::glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);

    OpenGL::glNormal3f( -0.908573374641961,-0.376606335725282,-0.180726563579611 );
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);
    OpenGL::glTexCoord2f(0.38439606,0.56001899); OpenGL::glVertex3f(-0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    OpenGL::glNormal3f( -0.623235829629093,-0.772145514597524,-0.123969371029544 );
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);

    OpenGL::glNormal3f( -0.528353852482258,-0.772145513899506,-0.353034717743204 );
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.37496786,0.4579564); OpenGL::glVertex3f(-0.12124904+$x,-0.17405054+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.353034738588375,-0.772145525100142,-0.528353822185156 );
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.29912214,0.36245196); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.514665444853468,-0.376606328144515,-0.770251357334272 );
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.28199698,0.56001899); OpenGL::glVertex3f(-0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    OpenGL::glNormal3f( -0.353034717743204,-0.772145513899506,-0.528353852482258 );
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);

    OpenGL::glNormal3f( -0.123969371029544,-0.772145514597524,-0.623235829629093 );
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.2707605,0.4579564); OpenGL::glVertex3f(-0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    OpenGL::glNormal3f( 0.123969316633238,-0.772145531445475,-0.623235819575763 );
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.20110988,0.37859758); OpenGL::glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);

    OpenGL::glNormal3f( 0.180726563579611,-0.376606335725282,-0.908573374641961 );
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);
    OpenGL::glTexCoord2f(0.17705981,0.56001899); OpenGL::glVertex3f(0.065619509+$x,-0.076987229+$y,-0.15841951+$z);

    OpenGL::glNormal3f( 0.123969371029544,-0.772145514597524,-0.623235829629093 );
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);

    OpenGL::glNormal3f( 0.353034717743204,-0.772145513899506,-0.528353852482258 );
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.17046663,0.4579564); OpenGL::glVertex3f(0.050222998+$x,-0.17405054+$y,-0.12124904+$z);

    OpenGL::glNormal3f( 0.528353822185156,-0.772145525100142,-0.353034738588375 );
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.11168619,0.38378728); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    OpenGL::glNormal3f( 0.770251357334272,-0.376606328144515,-0.514665444853468 );
    OpenGL::glTexCoord2f(0.070228823,0.45795639); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);
    OpenGL::glTexCoord2f(0.059510376,0.56001899); OpenGL::glVertex3f(0.15841951+$x,-0.076987229+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.528353852482258,-0.772145513899506,-0.353034717743204 );
    OpenGL::glTexCoord2f(0.070228823,0.45795639); OpenGL::glVertex3f(0.12124904+$x,-0.17405054+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);

    OpenGL::glNormal3f( 0.623235819575763,-0.772145531445475,-0.123969316633238 );
    OpenGL::glTexCoord2f(0.86562334,0.38378742); OpenGL::glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.85693278,0.45795642); OpenGL::glVertex3f(0.13123902+$x,-0.17405054+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.304772613607861,-0.95049381928895,-0.0606230442005259 );
    OpenGL::glTexCoord2f(0.86562334,0.38378742); OpenGL::glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.87692441,0.31094667); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.89296828,0.38285837); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);

    OpenGL::glNormal3f( 0.304772613607861,-0.95049381928895,0.0606230442005259 );
    OpenGL::glTexCoord2f(0.82199662,0.38250436); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.83919279,0.31126907); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.84919307,0.38385446); OpenGL::glVertex3f(0.071026045+$x,-0.22265133+$y,-2.1811013e-018+$z);

    OpenGL::glNormal3f( 0.528353822185156,-0.772145525100142,0.353034738588375 );
    OpenGL::glTexCoord2f(0.77619885,0.37859741); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.75693081,0.45795641); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,0.0928+$z);

    OpenGL::glNormal3f( 0.258373745885895,-0.950493819332569,0.172639818256034 );
    OpenGL::glTexCoord2f(0.77619885,0.37859741); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.79707636,0.3089041); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.80310571,0.38139168); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,0.027180491+$z);

    OpenGL::glNormal3f( 0.172639818256034,-0.950493819332569,0.258373745885895 );
    OpenGL::glTexCoord2f(0.72792485,0.37125113); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.75093491,0.30094888); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.75518378,0.374797); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    OpenGL::glNormal3f( 0.123969316633238,-0.772145531445475,0.623235819575763 );
    OpenGL::glTexCoord2f(0.67818786,0.36245149); OpenGL::glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.65535627,0.45795641); OpenGL::glVertex3f(-2.7654676e-017+$x,-0.17405054+$y,0.13123902+$z);

    OpenGL::glNormal3f( 0.0606230442005257,-0.95049381928895,0.304772613607861 );
    OpenGL::glTexCoord2f(0.67818786,0.36245149); OpenGL::glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);
    OpenGL::glTexCoord2f(0.70267303,0.29107259); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.70592598,0.36647373); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.0606230442005258,-0.95049381928895,0.304772613607861 );
    OpenGL::glTexCoord2f(0.62714796,0.35137963); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.65363307,0.27763999); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.65589456,0.35595595); OpenGL::glVertex3f(-3.1341658e-017+$x,-0.22265133+$y,0.071026045+$z);

    OpenGL::glNormal3f( -0.353034738588375,-0.772145525100142,0.528353822185156 );
    OpenGL::glTexCoord2f(0.57086482,0.34094282); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);
    OpenGL::glTexCoord2f(0.54709445,0.45795641); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,0.0928+$z);

    OpenGL::glNormal3f( -0.172639818256034,-0.950493819332569,0.258373745885895 );
    OpenGL::glTexCoord2f(0.57086482,0.34094282); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);
    OpenGL::glTexCoord2f(0.59626992,0.2641011); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.60067338,0.3449307); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,0.065619509+$z);

    OpenGL::glNormal3f( -0.258373745885895,-0.950493819332569,0.172639818256034 );
    OpenGL::glTexCoord2f(0.51074328,0.32952243); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.53490917,0.24713356); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.54245419,0.33267348); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,0.050222998+$z);

    OpenGL::glNormal3f( -0.623235819575763,-0.772145531445475,0.123969316633238 );
    OpenGL::glTexCoord2f(0.4348549,0.33267337); OpenGL::glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);
    OpenGL::glTexCoord2f(0.4302149,0.4579564); OpenGL::glVertex3f(-0.13123902+$x,-0.17405054+$y,1.3891043e-017+$z);

    OpenGL::glNormal3f( -0.304772613607861,-0.95049381928895,0.0606230442005259 );
    OpenGL::glTexCoord2f(0.4348549,0.33267337); OpenGL::glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);
    OpenGL::glTexCoord2f(0.44239984,0.2471346); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.46656638,0.32952251); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,0.027180491+$z);

    OpenGL::glNormal3f( -0.304772613607861,-0.95049381928895,-0.0606230442005259 );
    OpenGL::glTexCoord2f(0.37663601,0.34493118); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.38104115,0.26410093); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.40644448,0.34094235); OpenGL::glVertex3f(-0.071026045+$x,-0.22265133+$y,6.5170806e-018+$z);

    OpenGL::glNormal3f( -0.528353822185156,-0.772145525100142,-0.353034738588375 );
    OpenGL::glTexCoord2f(0.32141542,0.35595561); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.32195311,0.4579564); OpenGL::glVertex3f(-0.0928+$x,-0.17405054+$y,-0.0928+$z);

    OpenGL::glNormal3f( -0.258373745885895,-0.950493819332569,-0.172639818256034 );
    OpenGL::glTexCoord2f(0.32141542,0.35595561); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.32367495,0.27763785); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.35016083,0.35138003); OpenGL::glVertex3f(-0.065619509+$x,-0.22265133+$y,-0.027180491+$z);

    OpenGL::glNormal3f( -0.172639818256034,-0.950493819332569,-0.258373745885895 );
    OpenGL::glTexCoord2f(0.27138281,0.36647321); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.27463456,0.29107476); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.29912214,0.36245196); OpenGL::glVertex3f(-0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.123969316633238,-0.772145531445475,-0.623235819575763 );
    OpenGL::glTexCoord2f(0.22212535,0.3747977); OpenGL::glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.22037856,0.4579564); OpenGL::glVertex3f(-5.9798965e-017+$x,-0.17405054+$y,-0.13123902+$z);

    OpenGL::glNormal3f( -0.0606230442005259,-0.95049381928895,-0.304772613607861 );
    OpenGL::glTexCoord2f(0.22212535,0.3747977); OpenGL::glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);
    OpenGL::glTexCoord2f(0.22637703,0.30094966); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.2493847,0.37125042); OpenGL::glVertex3f(-0.027180491+$x,-0.22265133+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.0606230442005257,-0.95049381928895,-0.304772613607861 );
    OpenGL::glTexCoord2f(0.17420432,0.38139158); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.18023255,0.30890174); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.20110988,0.37859758); OpenGL::glVertex3f(-4.8738021e-017+$x,-0.22265133+$y,-0.071026045+$z);

    OpenGL::glNormal3f( 0.353034738588375,-0.772145525100142,-0.528353822185156 );
    OpenGL::glTexCoord2f(0.12811605,0.38385414); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);
    OpenGL::glTexCoord2f(0.12037663,0.45795639); OpenGL::glVertex3f(0.0928+$x,-0.17405054+$y,-0.0928+$z);

    OpenGL::glNormal3f( 0.172639818256034,-0.950493819332569,-0.258373745885895 );
    OpenGL::glTexCoord2f(0.12811605,0.38385414); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);
    OpenGL::glTexCoord2f(0.13811544,0.31127004); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.15531303,0.38250466); OpenGL::glVertex3f(0.027180491+$x,-0.22265133+$y,-0.065619509+$z);

    OpenGL::glNormal3f( 0.258373745885895,-0.950493819332569,-0.172639818256034 );
    OpenGL::glTexCoord2f(0.084340929,0.38285852); OpenGL::glVertex3f(0.065619509+$x,-0.22265133+$y,-0.027180491+$z);
    OpenGL::glTexCoord2f(0.10038548,0.31094724); OpenGL::glVertex3f(-3.5690749e-017+$x,-0.24542559+$y,-2.1811013e-018+$z);
    OpenGL::glTexCoord2f(0.11168619,0.38378728); OpenGL::glVertex3f(0.050222998+$x,-0.22265133+$y,-0.050222998+$z);

    OpenGL::glNormal3f( -0.00453782273431179,0.999989704029412,0 );
    OpenGL::glTexCoord2f(0.61840762,0.53439169); OpenGL::glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.61705267,0.52757992); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    OpenGL::glNormal3f( 0.980775164337572,0.00445064486016523,-0.195090411806777 );
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);

    OpenGL::glNormal3f( -0.00453783896691178,0.999989703955751,0 );
    OpenGL::glTexCoord2f(0.61705267,0.52757992); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);

    OpenGL::glNormal3f( 0.980775164337572,0.00445064486016523,0.195090411806777 );
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(0.034711254+$x,-0.015632656+$y,-3.3459346e-018+$z);

    OpenGL::glNormal3f( 0.831461062795286,0.00377307683658746,0.555570216036208 );
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887348); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);

    OpenGL::glNormal3f( -0.0045377836269756,0.999989704206876,0 );
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);

    OpenGL::glNormal3f( 0.831461062946238,0.00377307682763593,0.555570215810355 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    OpenGL::glNormal3f( -0.0045378840169434,0.999989703751318,0 );
    OpenGL::glTexCoord2f(0.60741938,0.51794663); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);

    OpenGL::glNormal3f( 0.555564525681146,0.00252108935886468,0.831469603721704 );
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);

    OpenGL::glNormal3f( 0.195088336315928,0.000885288935368095,0.980785275836146 );
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21276391); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);

    OpenGL::glNormal3f( -0.00453781057607134,0.999989704084585,0 );
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    OpenGL::glNormal3f( 0.195088337844137,0.000885288887033798,0.980785275532213 );
    OpenGL::glTexCoord2f(0.44753904,0.21970913); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);

    OpenGL::glNormal3f( -0.00453787020924549,0.999989703813976,0 );
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    OpenGL::glNormal3f( -0.195088336253671,-0.00088528887981644,0.98078527584858 );
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.21970913); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);

    OpenGL::glNormal3f( -0.555564525530471,-0.00252108930666955,0.83146960382254 );
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.23359956); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.22665434); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);

    OpenGL::glNormal3f( -0.00453783896691177,0.999989703955751,0 );
    OpenGL::glTexCoord2f(0.58802112,0.52180519); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.58416256,0.54120346); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.58802112,0.54697819); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);

    OpenGL::glNormal3f( -0.555564525530471,-0.00252108930666955,0.831469603822539 );
    OpenGL::glTexCoord2f(0.44753904,0.23359956); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.23359956); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    OpenGL::glNormal3f( -0.00453782440883781,0.999989704021814,0 );
    OpenGL::glTexCoord2f(0.58416256,0.52757992); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.58416256,0.54120346); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.58280762,0.53439169); OpenGL::glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);

    OpenGL::glNormal3f( -0.831461062946588,-0.00377307675054529,0.555570215810355 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,0.025173001+$z);

    OpenGL::glNormal3f( -0.980775164138318,-0.00445064744375367,0.195090412749541 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);

    OpenGL::glNormal3f( -0.98077517811216,-0.00445064496814094,0.195090342555518 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);

    OpenGL::glNormal3f( -0.98077517811216,-0.00445064496814094,-0.195090342555517 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.036488013+$x,-0.01595575+$y,1.013808e-018+$z);

    OpenGL::glNormal3f( -0.831461064304374,-0.00377307684343553,-0.555570213777676 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);

    OpenGL::glNormal3f( -0.831461062946588,-0.00377307675054529,-0.555570215810355 );
    OpenGL::glTexCoord2f(0.44753904,0.21970912); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);

    OpenGL::glNormal3f( -0.00453781057607134,0.999989704084585,0 );
    OpenGL::glTexCoord2f(0.59379585,0.55083675); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.59379585,0.51794663); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);

    OpenGL::glNormal3f( -0.555564525530471,-0.00252108930666955,-0.831469603822539 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19192826); OpenGL::glVertex3f(-0.026061122+$x,-0.015908434+$y,-0.025173001+$z);

    OpenGL::glNormal3f( -0.19508833734389,-0.000885288924205527,-0.980785275631683 );
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);

    OpenGL::glNormal3f( -0.0045378840169434,0.999989703751318,0 );
    OpenGL::glTexCoord2f(0.60060762,0.55219169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.60060762,0.51659169); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.60741938,0.55083675); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    OpenGL::glNormal3f( -0.195088336253671,-0.00088528887981644,-0.98078527584858 );
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.195088337844137,0.000885288887033798,-0.980785275532213 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.20581869); OpenGL::glVertex3f(-0.00088837994+$x,-0.015794203+$y,-0.0356+$z);

    OpenGL::glNormal3f( 0.555564525530266,0.00252108935174108,-0.831469603822539 );
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);

    OpenGL::glNormal3f( -0.00453783896691177,0.999989703955751,0 );
    OpenGL::glTexCoord2f(0.61319412,0.54697819); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.61319412,0.52180519); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.61705267,0.54120346); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);

    OpenGL::glNormal3f( 0.555564525681146,0.00252108935886468,-0.831469603721704 );
    OpenGL::glTexCoord2f(0.44753904,0.21970912); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970912); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.980775178538197,0.0044506475090987,-0.195090340355736 );
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.25176752,0.18498305); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);

    OpenGL::glNormal3f( 0.831461062946238,0.00377307682763593,-0.555570215810355 );
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.17803783); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.17803783); OpenGL::glVertex3f(0.024284362+$x,-0.015679972+$y,-0.025173001+$z);

    OpenGL::glNormal3f( 0.980775178538197,0.0044506475090987,0.195090340355736 );
    OpenGL::glTexCoord2f(0.25176752,0.19887348); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887348); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,0.01362353+$z);

    OpenGL::glNormal3f( 0.00453524133026469,-0.999989715740155,0 );
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.82508346,0.35855901); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.82372851,0.35174724); OpenGL::glVertex3f(0.036488013+$x,-0.40717167+$y,-3.3459346e-018+$z);

    OpenGL::glNormal3f( 0.00453796854644008,-0.999989703367725,0 );
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);

    OpenGL::glNormal3f( 0.555564525530266,0.00252108935174108,0.831469603822539 );
    OpenGL::glTexCoord2f(0.25176752,0.21276391); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.21276391); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,0.032890111+$z);

    OpenGL::glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);

    OpenGL::glNormal3f( 0.00453773717516903,-0.999989704417665,0 );
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.83471675,0.33530219); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);

    OpenGL::glNormal3f( -0.19508833734389,-0.000885288924205527,0.980785275631683 );
    OpenGL::glTexCoord2f(0.25176752,0.22665434); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.21970913); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.22665434); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,0.032890111+$z);

    OpenGL::glNormal3f( 0.00453847122415697,-0.99998970108644,0 );
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);

    OpenGL::glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.84834028,0.33530219); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,0.032890111+$z);
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);

    OpenGL::glNormal3f( -0.831461064304374,-0.00377307684343553,0.555570213777676 );
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,0.01362353+$z);

    OpenGL::glNormal3f( 0.00453667275114226,-0.999989709247225,0 );
    OpenGL::glTexCoord2f(0.85797357,0.34493548); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);

    OpenGL::glNormal3f( 0.00453892976756193,-0.999989699005227,0 );
    OpenGL::glTexCoord2f(0.85932851,0.35174724); OpenGL::glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.85797357,0.34493548); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,0.01362353+$z);

    OpenGL::glNormal3f( -0.980775164138318,-0.00445064744375367,-0.195090412749541 );
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(-0.034711254+$x,-0.40749476+$y,1.013808e-018+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(-0.033778152+$x,-0.015943453+$y,-0.01362353+$z);

    OpenGL::glNormal3f( 0.00453667275114226,-0.999989709247225,0 );
    OpenGL::glTexCoord2f(0.85411502,0.36433374); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.85411502,0.33916074); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.85797357,0.35855901); OpenGL::glVertex3f(-0.032001392+$x,-0.40748246+$y,-0.01362353+$z);

    OpenGL::glNormal3f( -0.555564525530471,-0.00252108930666955,-0.83146960382254 );
    OpenGL::glTexCoord2f(0.25176752,0.19887347); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.19192826); OpenGL::glVertex3f(-0.024284362+$x,-0.40744745+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.19887347); OpenGL::glVertex3f(-0.01451177+$x,-0.015856024+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.00453847122415697,-0.99998970108644,0 );
    OpenGL::glTexCoord2f(0.84152851,0.36954724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.84152851,0.33394724); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,0.0356+$z);
    OpenGL::glTexCoord2f(0.84834028,0.3681923); OpenGL::glVertex3f(-0.01273501+$x,-0.40739504+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.195088336315928,0.000885288935368095,-0.980785275836146 );
    OpenGL::glTexCoord2f(0.25176752,0.2127639); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);
    OpenGL::glTexCoord2f(0.25176752,0.20581869); OpenGL::glVertex3f(0.00088837994+$x,-0.40733321+$y,-0.0356+$z);
    OpenGL::glTexCoord2f(0.44753904,0.2127639); OpenGL::glVertex3f(0.01273501+$x,-0.015732381+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.00453787020924579,-0.999989703813976,0 );
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.82894201,0.33916074); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,0.025173001+$z);
    OpenGL::glTexCoord2f(0.83471675,0.3681923); OpenGL::glVertex3f(0.01451177+$x,-0.40727139+$y,-0.032890111+$z);

    OpenGL::glNormal3f( 0.00453796854644008,-0.999989703367726,0 );
    OpenGL::glTexCoord2f(0.82508346,0.35855901); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.82508346,0.34493548); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,0.01362353+$z);
    OpenGL::glTexCoord2f(0.82894201,0.36433374); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);

    OpenGL::glNormal3f( 0.831461062795286,0.00377307683658746,-0.555570216036208 );
    OpenGL::glTexCoord2f(0.25176752,0.18498305); OpenGL::glVertex3f(0.033778152+$x,-0.40718396+$y,-0.01362353+$z);
    OpenGL::glTexCoord2f(0.25176752,0.17803783); OpenGL::glVertex3f(0.026061122+$x,-0.40721898+$y,-0.025173001+$z);
    OpenGL::glTexCoord2f(0.44753904,0.18498305); OpenGL::glVertex3f(0.032001392+$x,-0.015644953+$y,-0.01362353+$z);
};



$DRAW_MODEL{'Wall'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

if ( $south != WALL ) {

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
}

if ( $bottom != WALL ) {

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
}

if ( $west != WALL ) {

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
}

if ( $top != WALL ) {

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
}

if ( $east != WALL ) {

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
}

if ( $north != WALL ) {

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
}
};
    
    
    sub get_model_subs {
        return %DRAW_MODEL;
    }
    
    sub set_zcount_for_models {
        ($ZCOUNT) = @_;
    }
    
    1;
    