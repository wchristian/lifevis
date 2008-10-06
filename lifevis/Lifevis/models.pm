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



$DRAW_MODEL{'Bldg_No_Block'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.2+$y,0+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.5); OpenGL::glVertex3f(-0.5+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,-0.3+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.5); OpenGL::glVertex3f(0+$x,0.2+$y,0+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(0.5+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,1); OpenGL::glVertex3f(0+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(-0.5+$x,0.2+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.5,0.1); OpenGL::glVertex3f(0+$x,-0.3+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
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

    OpenGL::glNormal3f( -0.00539878093344108,-0.999983547892128,0.00193832647025352 );
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(0.19089706+$x,-0.39975798+$y,0.20074104+$z);
    OpenGL::glTexCoord2f(0.800276,0.441019); OpenGL::glVertex3f(0.24891632+$x,-0.40007133+$y,0.20068348+$z);

    OpenGL::glNormal3f( -0.000565909540649183,-0.999982999890339,-0.00580341939814009 );
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);
    OpenGL::glTexCoord2f(0.623546,0.549776); OpenGL::glVertex3f(0.19267622+$x,-0.39996618+$y,0.23644234+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(0.19089706+$x,-0.39975798+$y,0.20074104+$z);

    OpenGL::glNormal3f( -0.00930914391994223,0.0757501684560073,0.997083372551345 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19267622+$x,-0.39996618+$y,0.23644234+$z);

    OpenGL::glNormal3f( 0.0264605163962819,0.126691323063581,0.991589204122575 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24686221+$x,-0.38798213+$y,0.23548985+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);

    OpenGL::glNormal3f( 0.98538614632649,0.170276526436198,0.00447740691153464 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24699627+$x,-0.38787399+$y,0.20187339+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24686221+$x,-0.38798213+$y,0.23548985+$z);

    OpenGL::glNormal3f( 0.98782445570502,0.155570882589354,-0.000738377579813884 );
    OpenGL::glTexCoord2f(0.646629,0.978498); OpenGL::glVertex3f(0.24891632+$x,-0.40007133+$y,0.20068348+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24699627+$x,-0.38787399+$y,0.20187339+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24893238+$x,-0.40000108+$y,0.23697022+$z);

    OpenGL::glNormal3f( -0.0158025483360105,0.0946174151969655,-0.995388278114391 );
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24891632+$x,-0.40007133+$y,0.20068348+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24699627+$x,-0.38787399+$y,0.20187339+$z);

    OpenGL::glNormal3f( -0.000358973072891137,0.115985843627925,-0.99325080176975 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19089706+$x,-0.39975798+$y,0.20074104+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24891632+$x,-0.40007133+$y,0.20068348+$z);

    OpenGL::glNormal3f( -0.0104463841213401,0.132512918933439,-0.991126227770474 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19089706+$x,-0.39975798+$y,0.20074104+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19296872+$x,-0.38363849+$y,0.20287437+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);

    OpenGL::glNormal3f( -0.0326501111732109,0.112487390227292,0.993116587959455 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19267622+$x,-0.39996618+$y,0.23644234+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19502189+$x,-0.38364257+$y,0.23467053+$z);

    OpenGL::glNormal3f( -0.991413252857854,0.120783458769953,0.0501110581147041 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19267622+$x,-0.39996618+$y,0.23644234+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(0.19296872+$x,-0.38363849+$y,0.20287437+$z);
    OpenGL::glTexCoord2f(0.823359,0.97848); OpenGL::glVertex3f(0.19089706+$x,-0.39975798+$y,0.20074104+$z);

    OpenGL::glNormal3f( -0.968683050576334,0.176339068230799,0.174807552873499 );
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19502189+$x,-0.38364257+$y,0.23467053+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);

    OpenGL::glNormal3f( -0.986822443607271,0.148723036969577,0.0637410626481931 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19502189+$x,-0.38364257+$y,0.23467053+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(0.19296872+$x,-0.38363849+$y,0.20287437+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19267622+$x,-0.39996618+$y,0.23644234+$z);

    OpenGL::glNormal3f( -0.0244552433353405,0.0129461304722143,0.999617096081898 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19502189+$x,-0.38364257+$y,0.23467053+$z);

    OpenGL::glNormal3f( 0.998680193228114,-0.051360139719832,0 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.2245383+$x,-0.33470067+$y,0.20291904+$z);

    OpenGL::glNormal3f( -0.00196860875858385,-0.179299100739599,0.983792639255614 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);

    OpenGL::glNormal3f( 0.971478017053576,-0.0631650469213809,0.228562112409453 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22182277+$x,-0.33424607+$y,0.23278775+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);

    OpenGL::glNormal3f( 0.0803150117772967,-0.170979792069278,0.981995626052967 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22182277+$x,-0.33424607+$y,0.23278775+$z);

    OpenGL::glNormal3f( 0.91648521499321,-0.0943123458564965,0.388793045356903 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);

    OpenGL::glNormal3f( -0.0438184899097798,-0.998860487051186,-0.0189120953332814 );
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);

    OpenGL::glNormal3f( 0.98177874484059,-0.166387628107948,0.0917913579366109 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22182277+$x,-0.33424607+$y,0.23278775+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.2245383+$x,-0.33470067+$y,0.20291904+$z);

    OpenGL::glNormal3f( 0.00398025156053138,-0.157203911200062,-0.987558144060854 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);
    OpenGL::glTexCoord2f(0.964423,0.497747); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);

    OpenGL::glNormal3f( -0.148702840023209,-0.98861492446251,0.0229781744056823 );
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);
    OpenGL::glTexCoord2f(0.632024,0.752693); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);

    OpenGL::glNormal3f( -0.00666682181144116,-0.999754345377484,0.0211377005791296 );
    OpenGL::glTexCoord2f(0.556016,0.376286); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.546823,0.335187); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);

    OpenGL::glNormal3f( -0.981719255042232,-0.164880642740942,0.0950877380562701 );
    OpenGL::glTexCoord2f(0.96259,0.987723); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);

    OpenGL::glNormal3f( 0.00264021621922491,-0.999969690578211,-0.007324423747498 );
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.556016,0.376286); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);

    OpenGL::glNormal3f( -0.0385711054161506,-0.999254677498992,0.00153600890685966 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.18334297+$x,-0.28330988+$y,0.20981518+$z);
    OpenGL::glTexCoord2f(0.469506,0.401201); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);

    OpenGL::glNormal3f( -0.9498167831703,-0.0794746051391828,0.302542336782794 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.18334297+$x,-0.28330988+$y,0.20981518+$z);

    OpenGL::glNormal3f( -0.900355362388246,-0.0655105426740217,0.430195990470953 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);

    OpenGL::glNormal3f( -0.00174678779010405,-0.141007211068217,0.990007027833227 );
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);

    OpenGL::glNormal3f( 0.882095013149833,-0.055110261058208,0.467836773781511 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2230594+$x,-0.28382715+$y,0.24146528+$z);

    OpenGL::glNormal3f( 0.998053541852435,-0.0615724641821268,0.00989743655453408 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);
    OpenGL::glTexCoord2f(0.449811,0.966089); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);

    OpenGL::glNormal3f( 0.997392158365553,-0.0715712749627395,-0.00929704421373303 );
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);
    OpenGL::glTexCoord2f(0.652416,0.797749); OpenGL::glVertex3f(0.23935864+$x,-0.28360778+$y,0.16673705+$z);
    OpenGL::glTexCoord2f(0.449811,0.966089); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);

    OpenGL::glNormal3f( -0.00643932291757591,-0.999883264496948,0.013856135799326 );
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.18334297+$x,-0.28330988+$y,0.20981518+$z);
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(0.1832855+$x,-0.28390253+$y,0.1670218+$z);
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);

    OpenGL::glNormal3f( 0.907629784819283,-0.0914459171925456,0.409689904608005 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22182466+$x,-0.17083083+$y,0.27072021+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);

    OpenGL::glNormal3f( -0.0235375004520303,0.891969002929454,0.451483425925588 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22182466+$x,-0.17083083+$y,0.27072021+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);

    OpenGL::glNormal3f( -0.0223540268461942,0.540032593096086,0.841347191044028 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22494945+$x,-0.20170243+$y,0.29061868+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22182466+$x,-0.17083083+$y,0.27072021+$z);

    OpenGL::glNormal3f( 0.0167920057272381,0.5647613531127,0.825083415524738 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19423491+$x,-0.20152183+$y,0.29112016+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22494945+$x,-0.20170243+$y,0.29061868+$z);

    OpenGL::glNormal3f( -0.995182703021197,0.0978527802067184,-0.00601838958862676 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19423491+$x,-0.20152183+$y,0.29112016+$z);

    OpenGL::glNormal3f( -0.434769107896638,0.879491251015092,0.193574177530656 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);

    OpenGL::glNormal3f( 0.581893530132008,0.813255916448432,0.00383848305073189 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);

    OpenGL::glNormal3f( 0.418641553920587,0.887638149158595,0.191931668802366 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22182466+$x,-0.17083083+$y,0.27072021+$z);

    OpenGL::glNormal3f( 0.979765641925875,0.200116032148139,-0.00358616492411187 );
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);

    OpenGL::glNormal3f( -0.914348911731551,-0.0988030465711442,0.39268820405455 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);
    OpenGL::glTexCoord2f(0.001952,0.833096); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19733197+$x,-0.17130028+$y,0.27037078+$z);

    OpenGL::glNormal3f( -0.418576971762689,0.894704219006257,0.15587712854162 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(0.20056562+$x,-0.15575769+$y,0.19709418+$z);

    OpenGL::glNormal3f( -0.999874736857387,-0.0144999301013746,-0.00634528340000443 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.18334297+$x,-0.28330988+$y,0.20981518+$z);

    OpenGL::glNormal3f( -0.623713327654148,0.781652936455638,-0.000609784279650583 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);
    OpenGL::glTexCoord2f(0.023627,0.446331); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);

    OpenGL::glNormal3f( 0.994405560308995,0.105375056887929,0.00732659623696918 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22494945+$x,-0.20170243+$y,0.29061868+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22182466+$x,-0.17083083+$y,0.27072021+$z);

    OpenGL::glNormal3f( -0.153645619309752,-0.988073984443021,-0.01014026300524 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22494945+$x,-0.20170243+$y,0.29061868+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);

    OpenGL::glNormal3f( -0.00826067676504196,-0.988667344847091,-0.149895438397527 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19423491+$x,-0.20152183+$y,0.29112016+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22494945+$x,-0.20170243+$y,0.29061868+$z);

    OpenGL::glNormal3f( -0.0139603880604592,-0.174805041935468,0.984504090839211 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);

    OpenGL::glNormal3f( 0.0157113327794867,-0.0870101866636373,-0.996083521316888 );
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);

    OpenGL::glNormal3f( 0.914908146438352,-0.110706993490589,0.388184292795336 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);

    OpenGL::glNormal3f( 0.00190503815998333,-0.999997193272246,0.00140864375857755 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19423491+$x,-0.20152183+$y,0.29112016+$z);

    OpenGL::glNormal3f( -0.996253622572392,0.0575149812320917,0.0645813165339513 );
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19206683+$x,-0.25127742+$y,0.26364878+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);

    OpenGL::glNormal3f( 0.0100094777954512,-0.999918525607243,0.00792164766312428 );
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19423491+$x,-0.20152183+$y,0.29112016+$z);

    OpenGL::glNormal3f( 0.0150415257340363,-0.0654495341886084,0.997742507352517 );
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);

    OpenGL::glNormal3f( -0.996684566525671,0.0779292593159354,0.0233860084667234 );
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19206683+$x,-0.25127742+$y,0.26364878+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19249562+$x,-0.25124118+$y,0.28180255+$z);

    OpenGL::glNormal3f( 0.981221379514166,-0.170862578504458,0.0895018639533555 );
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(0.22516735+$x,-0.20138611+$y,0.25649462+$z);

    OpenGL::glNormal3f( -0.0759567930647385,-0.12232407038374,0.989579399235895 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(0.19249562+$x,-0.25124118+$y,0.28180255+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(0.19653461+$x,-0.20152148+$y,0.28825853+$z);

    OpenGL::glNormal3f( -0.191183136949843,0.0976932195357524,0.976680624873227 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(0.19249562+$x,-0.25124118+$y,0.28180255+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);

    OpenGL::glNormal3f( 0.995780496276766,-0.0906819849557282,-0.014070566416688 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22232482+$x,-0.20126626+$y,0.28788647+$z);

    OpenGL::glNormal3f( 0.770387319567217,0.637424250460731,-0.0139177144177395 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);

    OpenGL::glNormal3f( -0.0750623651125798,-0.147647592158238,-0.986187522671819 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19206683+$x,-0.25127742+$y,0.26364878+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19444232+$x,-0.20157087+$y,0.25602613+$z);

    OpenGL::glNormal3f( -0.208714106279387,0.109595391429519,-0.971816480626567 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19206683+$x,-0.25127742+$y,0.26364878+$z);

    OpenGL::glNormal3f( 0.750532774149672,0.660832648828323,0.00087473981280576 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22806933+$x,-0.24793261+$y,0.25687079+$z);

    OpenGL::glNormal3f( -0.646069030040866,-0.763094440410075,0.0167834274595121 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19206683+$x,-0.25127742+$y,0.26364878+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19249562+$x,-0.25124118+$y,0.28180255+$z);

    OpenGL::glNormal3f( 0.995841996103483,0.0115536746774917,0.0903616699606544 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.2245383+$x,-0.33470067+$y,0.20291904+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22182277+$x,-0.33424607+$y,0.23278775+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);

    OpenGL::glNormal3f( -0.0168179574753209,-0.143024826804663,-0.989576199806692 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.2245383+$x,-0.33470067+$y,0.20291904+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23393498+$x,-0.2834311+$y,0.19534928+$z);

    OpenGL::glNormal3f( -0.0161985595019033,0.000701204686243039,-0.999868548851323 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.2245383+$x,-0.33470067+$y,0.20291904+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);

    OpenGL::glNormal3f( 0.0812785958430602,0.0537045934576047,0.995243491061024 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22182277+$x,-0.33424607+$y,0.23278775+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);

    OpenGL::glNormal3f( -0.958446486833615,-0.223841651475468,0.176848090012405 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.20393624+$x,-0.33425552+$y,0.234249+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19344428+$x,-0.28365118+$y,0.24143809+$z);

    OpenGL::glNormal3f( -0.992165570878753,0.107243349438772,0.0640807612625812 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);
    OpenGL::glTexCoord2f(0.639452,0.910131); OpenGL::glVertex3f(0.19296872+$x,-0.38363849+$y,0.20287437+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19502189+$x,-0.38364257+$y,0.23467053+$z);

    OpenGL::glNormal3f( -0.446437081738381,-0.0394961227593089,0.893942944675945 );
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(0.20056562+$x,-0.15575769+$y,0.19709418+$z);

    OpenGL::glNormal3f( 0.411251459077734,0.894621053520058,0.174715219729412 );
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23860546+$x,-0.17071243+$y,0.23357034+$z);

    OpenGL::glNormal3f( -0.456716860173509,-0.478215586147236,0.750146360918392 );
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);

    OpenGL::glNormal3f( -0.0512509707692279,0.993550334907609,0.101148751846917 );
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(0.20056562+$x,-0.15575769+$y,0.19709418+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.20977311+$x,-0.1606708+$y,0.25001935+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);

    OpenGL::glNormal3f( -0.633863183818885,0.773418854585108,-0.00638275577208917 );
    OpenGL::glTexCoord2f(0.035327,0.498638); OpenGL::glVertex3f(0.20056562+$x,-0.15575769+$y,0.19709418+$z);
    OpenGL::glTexCoord2f(0.023627,0.446331); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18156299+$x,-0.17102921+$y,0.23372194+$z);

    OpenGL::glNormal3f( -0.993995596982044,-0.107531504221975,0.0202417583245573 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);
    OpenGL::glTexCoord2f(0.534654,0.2158); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(0.20056562+$x,-0.15575769+$y,0.19709418+$z);

    OpenGL::glNormal3f( 0.730730402107227,0.12060053040598,0.67192900778431 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);

    OpenGL::glNormal3f( 0.690737587306462,0.0832446640854377,0.718297926617744 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);
    OpenGL::glTexCoord2f(0.229164,0.01486); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);

    OpenGL::glNormal3f( -0.548536650875225,-0.431728866625847,0.7160431051051 );
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.070532,0.006139); OpenGL::glVertex3f(0.21787042+$x,-0.15574491+$y,0.2057368+$z);

    OpenGL::glNormal3f( 0.258447495648884,-0.964059373877386,-0.0615988281703723 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);

    OpenGL::glNormal3f( 0.58419781568311,-0.439827254943242,-0.682103289803073 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23683294+$x,-0.12310224+$y,0.19963539+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);

    OpenGL::glNormal3f( 0.597117330566828,0.14273010296222,0.789353540085265 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);

    OpenGL::glNormal3f( 0.601983286611197,0.0121735198594305,0.798415886649942 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);

    OpenGL::glNormal3f( 0.633302241932575,-0.0096306618416648,0.773844636032108 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);

    OpenGL::glNormal3f( 0.576765641584976,-0.074005046836976,0.813550642387877 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);

    OpenGL::glNormal3f( 0.224232883384214,-0.131875360441682,0.96557159409211 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(0.2182893+$x,-0.132631+$y,0.21143202+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);

    OpenGL::glNormal3f( 0.386911756825545,-0.0459143194875333,-0.920972946234669 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23683294+$x,-0.12310224+$y,0.19963539+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);

    OpenGL::glNormal3f( 0.525941228201432,0.0645727243168299,0.848066145859079 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);

    OpenGL::glNormal3f( 0.988501811261311,-0.0727068450900951,-0.132581611885484 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);

    OpenGL::glNormal3f( 0.992268609549242,0.124098316533046,0.00161689111497049 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);

    OpenGL::glNormal3f( 0.912352250483465,-0.316362757528293,0.259861456716556 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23811255+$x,-0.13832104+$y,0.20204624+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);

    OpenGL::glNormal3f( 0.461470622311443,0.340226512619356,0.819323370138043 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.135544,0.039428); OpenGL::glVertex3f(0.23849199+$x,-0.17053235+$y,0.2126184+$z);

    OpenGL::glNormal3f( 0.382924396427793,0.00885360795740509,0.923737257149752 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);
    OpenGL::glTexCoord2f(0.020867,0.090074); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);
    OpenGL::glTexCoord2f(0.046267,0.037845); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);

    OpenGL::glNormal3f( 0.720071870594596,0.316976068965092,0.617270340192883 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);
    OpenGL::glTexCoord2f(0.056483,0.113005); OpenGL::glVertex3f(0.23811255+$x,-0.13832104+$y,0.20204624+$z);
    OpenGL::glTexCoord2f(0.020867,0.090074); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);

    OpenGL::glNormal3f( 0.860354350079301,0.509213235793743,0.022187221369268 );
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.083833,0.121737); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);

    OpenGL::glNormal3f( 0.711954442064813,-0.074388122596619,0.6982745016401 );
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);

    OpenGL::glNormal3f( 0.965870936409264,0.190657518982381,-0.175336946064925 );
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);

    OpenGL::glNormal3f( 0.694680824512827,-0.0705927469349567,0.715845804719394 );
    OpenGL::glTexCoord2f(0.229164,0.01486); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);

    OpenGL::glNormal3f( -0.990997892002471,-0.13385010265061,0.00270704028040664 );
    OpenGL::glTexCoord2f(0.39126,0.246155); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);

    OpenGL::glNormal3f( -0.992817713454777,-0.119205803207939,-0.0101471341756347 );
    OpenGL::glTexCoord2f(0.39126,0.246155); OpenGL::glVertex3f(0.2448192+$x,-0.2015549+$y,0.21012921+$z);
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);

    OpenGL::glNormal3f( 0.999680543409223,-0.0249018364425947,0.0043254677004101 );
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);

    OpenGL::glNormal3f( 0.702350214975056,-0.185717411915092,0.68717771968833 );
    OpenGL::glTexCoord2f(0.328689,0.007321); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.24954477+$x,-0.25319694+$y,0.19683904+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);

    OpenGL::glNormal3f( -0.999465295041831,-0.0311401045101722,0.00997085242300007 );
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);
    OpenGL::glTexCoord2f(0.455921,0.089119); OpenGL::glVertex3f(0.24954477+$x,-0.25319694+$y,0.19683904+$z);

    OpenGL::glNormal3f( -0.999733833987104,-0.0229103256183625,0.0027162771407885 );
    OpenGL::glTexCoord2f(0.433698,0.153513); OpenGL::glVertex3f(0.24895695+$x,-0.23233252+$y,0.20307868+$z);
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);

    OpenGL::glNormal3f( -0.160686977275339,0.101934736578318,-0.98172756140022 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22806933+$x,-0.24793261+$y,0.25687079+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21864838+$x,-0.23723639+$y,0.2595234+$z);

    OpenGL::glNormal3f( -0.144322439430384,0.0903341080731212,-0.985398793583338 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22806933+$x,-0.24793261+$y,0.25687079+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);

    OpenGL::glNormal3f( -0.650943057043116,-0.759063408573786,0.00979174405860679 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19249562+$x,-0.25124118+$y,0.28180255+$z);

    OpenGL::glNormal3f( -0.75385082911087,-0.65694379579451,0.0115661841570868 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);

    OpenGL::glNormal3f( -0.743666873605198,-0.668547777722942,-0.00185741863545318 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);

    OpenGL::glNormal3f( -0.20598938134884,-0.386068130522559,-0.899177275828487 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21305561+$x,-0.26919101+$y,0.2571209+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);

    OpenGL::glNormal3f( -0.189098504044501,0.09736687950398,0.977118952095286 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902679+$x,-0.23712472+$y,0.28558396+$z);

    OpenGL::glNormal3f( -0.155412305174198,0.0748585331588168,0.985009246359521 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23775636+$x,-0.2730257+$y,0.29183083+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);

    OpenGL::glNormal3f( 0.543547627606151,0.839375132534142,-0.00231590306725729 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22806933+$x,-0.24793261+$y,0.25687079+$z);

    OpenGL::glNormal3f( 0.350547494894492,0.261624243422854,0.899260367789338 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23775636+$x,-0.2730257+$y,0.29183083+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24751704+$x,-0.25984906+$y,0.28419243+$z);

    OpenGL::glNormal3f( -0.212114808058284,-0.375295778336024,0.902308365784977 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23775636+$x,-0.2730257+$y,0.29183083+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21355232+$x,-0.26922221+$y,0.28772292+$z);

    OpenGL::glNormal3f( -0.263990516763574,-0.340653278230306,0.902365974031516 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23775636+$x,-0.2730257+$y,0.29183083+$z);

    OpenGL::glNormal3f( -0.242301860304048,-0.374538064116114,0.894992205005916 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);

    OpenGL::glNormal3f( 0.521625005689802,0.852830477842152,-0.0242390078724549 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24751704+$x,-0.25984906+$y,0.28419243+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22780619+$x,-0.2476754+$y,0.28833435+$z);

    OpenGL::glNormal3f( 0.582020873075053,0.812838441211218,-0.0233531966606233 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24751704+$x,-0.25984906+$y,0.28419243+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);

    OpenGL::glNormal3f( 0.357553775758399,0.269580043425434,-0.894137516060954 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22806933+$x,-0.24793261+$y,0.25687079+$z);

    OpenGL::glNormal3f( 0.200518602275723,0.392427177033238,-0.897659846972735 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);

    OpenGL::glNormal3f( 0.508940288027779,0.860778032719484,0.00640012576257341 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24744801+$x,-0.26047056+$y,0.26083991+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);

    OpenGL::glNormal3f( -0.568141940801684,-0.822914225173095,-0.00518778467749193 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22866408+$x,-0.28662805+$y,0.28403581+$z);

    OpenGL::glNormal3f( 0.231728044821929,0.353670116617111,0.906211654005313 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23775636+$x,-0.2730257+$y,0.29183083+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24751704+$x,-0.25984906+$y,0.28419243+$z);

    OpenGL::glNormal3f( -0.219194191738892,-0.377206917596651,-0.899816007651102 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24440424+$x,-0.27776974+$y,0.25347857+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);

    OpenGL::glNormal3f( 0.257140867680146,0.30235055446204,-0.917857677630469 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23773677+$x,-0.27310498+$y,0.25314727+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24440424+$x,-0.27776974+$y,0.25347857+$z);

    OpenGL::glNormal3f( 0.258332848971947,0.965976304095252,0.0124064123949696 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24686221+$x,-0.38798213+$y,0.23548985+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.705683,0.93425); OpenGL::glVertex3f(0.22214111+$x,-0.38136854+$y,0.23530454+$z);

    OpenGL::glNormal3f( -0.239582599858017,-0.345788899778067,-0.907210127057424 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24440424+$x,-0.27776974+$y,0.25347857+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23513891+$x,-0.29143669+$y,0.26113467+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);

    OpenGL::glNormal3f( 0.837979086003391,-0.544005037203757,0.0430066380674088 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24440424+$x,-0.27776974+$y,0.25347857+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23513891+$x,-0.29143669+$y,0.26113467+$z);

    OpenGL::glNormal3f( 0.282214229242096,0.341863193443403,0.89637307287868 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24751704+$x,-0.25984906+$y,0.28419243+$z);

    OpenGL::glNormal3f( 0.782528330356764,-0.61228300773779,-0.112955436454473 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);

    OpenGL::glNormal3f( 0.794658857197271,-0.605540144408171,0.0428769657048809 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24440424+$x,-0.27776974+$y,0.25347857+$z);

    OpenGL::glNormal3f( -0.606739435345562,-0.794812564375059,0.011842512743978 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23513891+$x,-0.29143669+$y,0.26113467+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.22847123+$x,-0.28634941+$y,0.26095647+$z);

    OpenGL::glNormal3f( 0.911461353857179,-0.41134356985221,0.00588795092360531 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23513891+$x,-0.29143669+$y,0.26113467+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);

    OpenGL::glNormal3f( 0.608404555503399,-0.793615752309995,-0.00423491772674243 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);

    OpenGL::glNormal3f( 0.74555141376118,-0.660479135966329,-0.0889966313512874 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.2506636+$x,-0.2678581+$y,0.27902003+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);

    OpenGL::glNormal3f( 0.782709264824698,-0.603162945492499,-0.153494846631391 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25413721+$x,-0.26459719+$y,0.283919+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.2506636+$x,-0.2678581+$y,0.27902003+$z);

    OpenGL::glNormal3f( 0.83137983831565,-0.544232362565527,-0.112332987045607 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24478219+$x,-0.27804275+$y,0.29199227+$z);

    OpenGL::glNormal3f( 0.838724732097807,-0.540020849074177,-0.0701306376177124 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.906343,0.303733); OpenGL::glVertex3f(0.23764934+$x,-0.28647624+$y,0.27827921+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);

    OpenGL::glNormal3f( 0.850017052688987,-0.524170871431309,-0.0521143711548948 );
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23514339+$x,-0.29110064+$y,0.28391826+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.786136,0.312218); OpenGL::glVertex3f(0.23764934+$x,-0.28647624+$y,0.27827921+$z);

    OpenGL::glNormal3f( 0.878981489234223,-0.476489992138327,-0.0186769637683825 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);

    OpenGL::glNormal3f( 0.957787081607102,0.285906718775546,-0.0300209004786926 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.23955523+$x,-0.10852182+$y,0.19830585+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);

    OpenGL::glNormal3f( 0.966513036762353,0.256449411953808,0.00928702734793651 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);
    OpenGL::glTexCoord2f(0.443463,0.169879); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.23955523+$x,-0.10852182+$y,0.19830585+$z);

    OpenGL::glNormal3f( 0.956628430509229,0.289994340302502,0.027664571819683 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);
    OpenGL::glTexCoord2f(0.443463,0.169879); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);

    OpenGL::glNormal3f( 0.409459151931126,-0.246253591288658,0.878465919473989 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);

    OpenGL::glNormal3f( 0.558410637371002,0.0927553970770454,0.82436278202257 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.23682741+$x,-0.12303184+$y,0.19430151+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);

    OpenGL::glNormal3f( 0.953105685141739,-0.229959574070635,-0.196743862023057 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24088701+$x,-0.1201289+$y,0.20119032+$z);

    OpenGL::glNormal3f( 0.613786909543235,0.0954951217343731,0.783674876079552 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);

    OpenGL::glNormal3f( 0.08780431220349,0.996015170944423,-0.015626324168643 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);

    OpenGL::glNormal3f( 0.579893184066725,0.131799360604007,0.803960710244804 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);
    OpenGL::glTexCoord2f(0.474002,0.23214); OpenGL::glVertex3f(0.23682741+$x,-0.12303184+$y,0.19430151+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);

    OpenGL::glNormal3f( 0.292884389696743,0.06182779463788,0.954146769675495 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);

    OpenGL::glNormal3f( 0.956692887572573,0.0213579572520437,0.290314582014188 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24040799+$x,-0.14263178+$y,0.19297351+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);

    OpenGL::glNormal3f( 0.880382483642531,0.351768476475488,-0.31809687432215 );
    OpenGL::glTexCoord2f(0.083833,0.121737); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);
    OpenGL::glTexCoord2f(0.056483,0.113005); OpenGL::glVertex3f(0.23811255+$x,-0.13832104+$y,0.20204624+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);

    OpenGL::glNormal3f( 0.84412852841516,-0.534093239479522,-0.0468128086951243 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.24004117+$x,-0.14243147+$y,0.18407365+$z);
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24040799+$x,-0.14263178+$y,0.19297351+$z);

    OpenGL::glNormal3f( 0.979068128627313,-0.201603773884623,0.0279556409636626 );
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);
    OpenGL::glTexCoord2f(0.556157,0.237438); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.24004117+$x,-0.14243147+$y,0.18407365+$z);

    OpenGL::glNormal3f( 0.387941808587365,0.372343944963093,0.84312581492876 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);

    OpenGL::glNormal3f( 0.261657610523224,0.0699553112652461,0.962622225632184 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.24651707+$x,-0.13231628+$y,0.19108203+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.24780602+$x,-0.132095+$y,0.19071559+$z);

    OpenGL::glNormal3f( 0.818758078574084,0.561941363686129,0.117716237402698 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);

    OpenGL::glNormal3f( 0.87346548784867,0.484199457233344,-0.0510776580533951 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);

    OpenGL::glNormal3f( 0.993687696972372,0.109572219434247,0.0240559683654054 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24149625+$x,-0.11562871+$y,0.19254907+$z);

    OpenGL::glNormal3f( 0.986865716925522,0.145040092147164,0.0711296592640328 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24232038+$x,-0.12258983+$y,0.19021358+$z);
    OpenGL::glTexCoord2f(0.4727,0.198869); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);
    OpenGL::glTexCoord2f(0.450879,0.189897); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);

    OpenGL::glNormal3f( 0.894244385131107,0.18112559325597,0.409292681499634 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24057099+$x,-0.1396837+$y,0.1938207+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.24036145+$x,-0.1369227+$y,0.19305668+$z);

    OpenGL::glNormal3f( 0.981963601657324,-0.182812187690875,0.0482409478747362 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);

    OpenGL::glNormal3f( 0.980535637921502,0.0113929846330851,0.196010363672496 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23811255+$x,-0.13832104+$y,0.20204624+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23912103+$x,-0.14505314+$y,0.19739265+$z);

    OpenGL::glNormal3f( 0.890344612186686,-0.170538114755046,0.422141235803771 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24040799+$x,-0.14263178+$y,0.19297351+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24057099+$x,-0.1396837+$y,0.1938207+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);

    OpenGL::glNormal3f( 0.998590644053875,-0.0512575743971345,-0.0137617831325917 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24040799+$x,-0.14263178+$y,0.19297351+$z);
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.24042932+$x,-0.13954032+$y,0.18300672+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24057099+$x,-0.1396837+$y,0.1938207+$z);

    OpenGL::glNormal3f( 0.987871566278016,-0.148888617940622,-0.0440675389277786 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24040799+$x,-0.14263178+$y,0.19297351+$z);
    OpenGL::glTexCoord2f(0.542188,0.241035); OpenGL::glVertex3f(0.24004117+$x,-0.14243147+$y,0.18407365+$z);
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.24042932+$x,-0.13954032+$y,0.18300672+$z);

    OpenGL::glNormal3f( 0.960038321048834,-0.037159158157898,0.277390733592045 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.24036145+$x,-0.1369227+$y,0.19305668+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23917074+$x,-0.13955842+$y,0.1968246+$z);

    OpenGL::glNormal3f( 0.997098404544539,-0.0516257795720586,-0.0559423858832733 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.24036145+$x,-0.1369227+$y,0.19305668+$z);
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);

    OpenGL::glNormal3f( 0.999522361361805,0.0118460402692957,-0.0285433086319798 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.24036145+$x,-0.1369227+$y,0.19305668+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.2400911+$x,-0.13685666+$y,0.18361704+$z);
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);

    OpenGL::glNormal3f( 0.997295653047331,0.0679152814562665,-0.0280872739441309 );
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24057099+$x,-0.1396837+$y,0.1938207+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.2400911+$x,-0.13685666+$y,0.18361704+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.24036145+$x,-0.1369227+$y,0.19305668+$z);

    OpenGL::glNormal3f( 0.40741264498219,-0.91321457035062,-0.00735426460957556 );
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.2368855+$x,-0.1210537+$y,0.194672+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);

    OpenGL::glNormal3f( 0.391840341633549,0.918490103303208,-0.0532642169055987 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23897423+$x,-0.12188237+$y,0.19574821+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.2368855+$x,-0.1210537+$y,0.194672+$z);

    OpenGL::glNormal3f( 0.482006550089596,0.370965394480847,0.793759637275917 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23912215+$x,-0.12189578+$y,0.19780631+$z);

    OpenGL::glNormal3f( 0.452385693590158,0.344261422184585,0.8226975491822 );
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.23683294+$x,-0.12310224+$y,0.19963539+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);

    OpenGL::glNormal3f( 0.736351388152382,-0.145385316819269,0.660794781168421 );
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.2368855+$x,-0.1210537+$y,0.194672+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.23682741+$x,-0.12303184+$y,0.19430151+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23909761+$x,-0.12004874+$y,0.19242806+$z);

    OpenGL::glNormal3f( 0.0996767008024295,0.994949732161866,-0.0118146429558734 );
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23956726+$x,-0.12537158+$y,0.19270884+$z);

    OpenGL::glNormal3f( 0.333676936784439,-0.938280764492747,-0.0910434448000468 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23887812+$x,-0.12450272+$y,0.19813396+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);

    OpenGL::glNormal3f( 0.429857453753664,-0.159410377973802,-0.888713058780316 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23882519+$x,-0.12410562+$y,0.19584042+$z);

    OpenGL::glNormal3f( 0.542348250203524,-0.315418355772912,-0.778697397159313 );
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.23682741+$x,-0.12303184+$y,0.19430151+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);

    OpenGL::glNormal3f( 0.545982062978565,0.360470795168916,-0.756283275456994 );
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23683294+$x,-0.12310224+$y,0.19963539+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24073346+$x,-0.12533826+$y,0.20138552+$z);

    OpenGL::glNormal3f( 0.428219960353759,0.903331662649072,-0.0248912195420094 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23912215+$x,-0.12189578+$y,0.19780631+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23897423+$x,-0.12188237+$y,0.19574821+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23717869+$x,-0.1209541+$y,0.19854637+$z);

    OpenGL::glNormal3f( 0.99592818288489,-0.0543380507200535,-0.0719335163852503 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23912215+$x,-0.12189578+$y,0.19780631+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23897423+$x,-0.12188237+$y,0.19574821+$z);

    OpenGL::glNormal3f( 0.989472173604335,-0.00427535489064935,-0.144660080890589 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23912215+$x,-0.12189578+$y,0.19780631+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23882519+$x,-0.12410562+$y,0.19584042+$z);

    OpenGL::glNormal3f( 0.480801439781699,0.0776132374635706,-0.873387749441374 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23897423+$x,-0.12188237+$y,0.19574821+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.2368855+$x,-0.1210537+$y,0.194672+$z);

    OpenGL::glNormal3f( 0.422654439593263,-0.891315125725003,-0.164074895538368 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23882519+$x,-0.12410562+$y,0.19584042+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23887812+$x,-0.12450272+$y,0.19813396+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23648636+$x,-0.12503719+$y,0.19487626+$z);

    OpenGL::glNormal3f( 0.994984457421311,-0.0780474133174729,-0.0625662110445442 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23882519+$x,-0.12410562+$y,0.19584042+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23912215+$x,-0.12189578+$y,0.19780631+$z);

    OpenGL::glNormal3f( 0.964817606044481,-0.254419366573748,-0.0663157068786132 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23882519+$x,-0.12410562+$y,0.19584042+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23887812+$x,-0.12450272+$y,0.19813396+$z);

    OpenGL::glNormal3f( 0.660537757913225,-0.351629622619592,0.663359991910405 );
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23887812+$x,-0.12450272+$y,0.19813396+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);

    OpenGL::glNormal3f( 0.519853135204597,0.142487989670884,-0.84228848420093 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.23891958+$x,-0.12274295+$y,0.19564165+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.23682741+$x,-0.12303184+$y,0.19430151+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.2368855+$x,-0.1210537+$y,0.194672+$z);

    OpenGL::glNormal3f( 0.449307925664544,-0.0499569147923132,0.891979088655927 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23920665+$x,-0.12333318+$y,0.19842677+$z);
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.23683294+$x,-0.12310224+$y,0.19963539+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23751481+$x,-0.12508911+$y,0.19918064+$z);

    OpenGL::glNormal3f( 0.905452381986648,0.420712608674153,-0.0561861625072788 );
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.24780602+$x,-0.132095+$y,0.19071559+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);

    OpenGL::glNormal3f( 0.282916407883972,0.0727937040208484,0.95637826345278 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.24651707+$x,-0.13231628+$y,0.19108203+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24588966+$x,-0.12794138+$y,0.19093464+$z);

    OpenGL::glNormal3f( 0.160785946070152,-0.985844729014547,0.0475189417028689 );
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.24622697+$x,-0.13261923+$y,0.18577851+$z);
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.24651707+$x,-0.13231628+$y,0.19108203+$z);

    OpenGL::glNormal3f( 0.1573413278897,-0.986635913229667,-0.0423471517739638 );
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.24651707+$x,-0.13231628+$y,0.19108203+$z);
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.24751335+$x,-0.1319675+$y,0.18665758+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.24780602+$x,-0.132095+$y,0.19071559+$z);

    OpenGL::glNormal3f( -0.784771133751468,0.368300715713015,0.498486559934886 );
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19697363+$x,-0.10505233+$y,0.19867478+$z);
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18591276+$x,-0.12629809+$y,0.19695874+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);

    OpenGL::glNormal3f( -0.886771040960459,0.462167383723056,-0.00619922063567565 );
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19697363+$x,-0.10505233+$y,0.19867478+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18591276+$x,-0.12629809+$y,0.19695874+$z);

    OpenGL::glNormal3f( 0.668162081297607,0.0405126854106106,0.742911943259005 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);
    OpenGL::glTexCoord2f(0.503631,0.08026); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);

    OpenGL::glNormal3f( 0.606460643713982,0.0380997973681501,0.794200159321646 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22210219+$x,-0.12584135+$y,0.21594083+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);

    OpenGL::glNormal3f( -0.0494732014027059,0.399259730575866,0.915502086225615 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22210219+$x,-0.12584135+$y,0.21594083+$z);

    OpenGL::glNormal3f( 0.239045028370172,0.650938912483356,0.720510934425349 );
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);

    OpenGL::glNormal3f( 0.571536764286596,0.328826367968058,0.751810446055216 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24169611+$x,-0.11554224+$y,0.19974891+$z);
    OpenGL::glTexCoord2f(0.432926,0.238482); OpenGL::glVertex3f(0.23955523+$x,-0.10852182+$y,0.19830585+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);

    OpenGL::glNormal3f( 0.320599362298382,0.631665001993607,0.705843732103847 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.23955523+$x,-0.10852182+$y,0.19830585+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22602943+$x,-0.11756822+$y,0.21254506+$z);

    OpenGL::glNormal3f( 0.537879298204265,0.843007800993558,0.00486908895918839 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.23955523+$x,-0.10852182+$y,0.19830585+$z);
    OpenGL::glTexCoord2f(0.569474,0.007328); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);

    OpenGL::glNormal3f( -0.4540276568947,-0.103286486368818,0.884980671262538 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21625665+$x,-0.14018941+$y,0.21799903+$z);

    OpenGL::glNormal3f( -0.385065187740575,0.430187600793492,0.816494598459693 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19697363+$x,-0.10505233+$y,0.19867478+$z);

    OpenGL::glNormal3f( -0.832895870591692,-0.0673785233544821,0.549312846510872 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18591276+$x,-0.12629809+$y,0.19695874+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);

    OpenGL::glNormal3f( -0.962932297733158,-0.269368379962049,-0.0142149871249427 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18591276+$x,-0.12629809+$y,0.19695874+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(0.18601269+$x,-0.12576507+$y,0.1800889+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);

    OpenGL::glNormal3f( -0.880816287879885,0.473358031372201,0.00973864163703825 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18591276+$x,-0.12629809+$y,0.19695874+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(0.18601269+$x,-0.12576507+$y,0.1800889+$z);

    OpenGL::glNormal3f( 0.176955080012163,-0.971602862377219,0.157082072428028 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);

    OpenGL::glNormal3f( 0.657962137876657,-0.196195140246571,0.72704421603119 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21625665+$x,-0.14018941+$y,0.21799903+$z);

    OpenGL::glNormal3f( 0.214947728052957,-0.0861842780071926,-0.972815370164992 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(0.2182893+$x,-0.132631+$y,0.21143202+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);

    OpenGL::glNormal3f( -0.0794872329812013,-0.657805580735342,0.748981707217493 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21625665+$x,-0.14018941+$y,0.21799903+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);

    OpenGL::glNormal3f( -0.26307305882039,0.241179589669516,0.934143977794498 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21625665+$x,-0.14018941+$y,0.21799903+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22210219+$x,-0.12584135+$y,0.21594083+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);

    OpenGL::glNormal3f( 0.0100656879073188,-0.999946624807218,0.00233012094238171 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);

    OpenGL::glNormal3f( 0.0303014350278464,-0.999507753984465,0.00812851525082938 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.563769,0.218347); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);

    OpenGL::glNormal3f( -0.96569148506036,-0.259676179791127,-0.00287007508669166 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19313968+$x,-0.15254112+$y,0.2046976+$z);
    OpenGL::glTexCoord2f(0.59779,0.157153); OpenGL::glVertex3f(0.18601269+$x,-0.12576507+$y,0.1800889+$z);
    OpenGL::glTexCoord2f(0.563769,0.218347); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);

    OpenGL::glNormal3f( 0.599526267943946,-0.130991688344594,0.789562810439953 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22210219+$x,-0.12584135+$y,0.21594083+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21625665+$x,-0.14018941+$y,0.21799903+$z);

    OpenGL::glNormal3f( 0.411693794108858,-0.34878374939491,-0.841937121197469 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22643335+$x,-0.12592838+$y,0.21263768+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(0.2182893+$x,-0.132631+$y,0.21143202+$z);
    OpenGL::glTexCoord2f(0.498678,0.081409); OpenGL::glVertex3f(0.22798632+$x,-0.11993476+$y,0.21091412+$z);

    OpenGL::glNormal3f( -0.258519905830117,0.300348429389952,0.918127594211489 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22210219+$x,-0.12584135+$y,0.21594083+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.19298123+$x,-0.12582174+$y,0.20773474+$z);

    OpenGL::glNormal3f( -0.236551389752689,0.76118373221353,0.603856577193254 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20720092+$x,-0.10034156+$y,0.19674306+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19697363+$x,-0.10505233+$y,0.19867478+$z);

    OpenGL::glNormal3f( 0.00958070387831372,0.852009889705105,0.523438017302804 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21297977+$x,-0.1067949+$y,0.20714151+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20720092+$x,-0.10034156+$y,0.19674306+$z);

    OpenGL::glNormal3f( -0.418997867264671,0.907977919806903,-0.00410905959897274 );
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20720092+$x,-0.10034156+$y,0.19674306+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19697363+$x,-0.10505233+$y,0.19867478+$z);

    OpenGL::glNormal3f( 0.564591602851284,0.824781772011896,0.0311664971842258 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);
    OpenGL::glTexCoord2f(0.569474,0.007328); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);
    OpenGL::glTexCoord2f(0.582086,0.037976); OpenGL::glVertex3f(0.22756257+$x,-0.10024202+$y,0.18002687+$z);

    OpenGL::glNormal3f( 0.0147251181596104,0.999891484004796,0.00043716115088779 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(0.20737883+$x,-0.10033673+$y,0.17970307+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20720092+$x,-0.10034156+$y,0.19674306+$z);

    OpenGL::glNormal3f( 0.197885399342635,0.135836027846092,0.970767707675735 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(0.2182893+$x,-0.132631+$y,0.21143202+$z);
    OpenGL::glTexCoord2f(0.504443,0.329853); OpenGL::glVertex3f(0.21994299+$x,-0.14631566+$y,0.21300977+$z);

    OpenGL::glNormal3f( 0.513522958004089,-0.185004487820472,0.837894689736732 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22909495+$x,-0.13152177+$y,0.20907414+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23811255+$x,-0.13832104+$y,0.20204624+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.2403557+$x,-0.13179832+$y,0.20211167+$z);

    OpenGL::glNormal3f( 0.616898491486458,-0.177999577070983,0.766650116914022 );
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.24954477+$x,-0.25319694+$y,0.19683904+$z);
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.25212669+$x,-0.25264423+$y,0.19488978+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);

    OpenGL::glNormal3f( 0.616336124761087,-0.269148105106756,0.740060185952418 );
    OpenGL::glTexCoord2f(0.395216,0.00627); OpenGL::glVertex3f(0.24954477+$x,-0.25319694+$y,0.19683904+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.25033195+$x,-0.27352247+$y,0.18879139+$z);
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.25212669+$x,-0.25264423+$y,0.19488978+$z);

    OpenGL::glNormal3f( 0.998629622898878,-0.0519804613189962,-0.00607518805548196 );
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.25212669+$x,-0.25264423+$y,0.19488978+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.25203547+$x,-0.25288594+$y,0.1819633+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);

    OpenGL::glNormal3f( 0.996445577649449,-0.084061884208693,-0.00545989067101846 );
    OpenGL::glTexCoord2f(0.397064,0.016717); OpenGL::glVertex3f(0.25212669+$x,-0.25264423+$y,0.19488978+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.25033195+$x,-0.27352247+$y,0.18879139+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.25203547+$x,-0.25288594+$y,0.1819633+$z);

    OpenGL::glNormal3f( -0.119910565884769,-0.148973500258657,-0.981543861684173 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24199308+$x,-0.28670178+$y,0.27372023+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26106914+$x,-0.30232291+$y,0.27376069+$z);

    OpenGL::glNormal3f( 0.144117022125986,-0.449371762432604,-0.881643523801856 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24199308+$x,-0.28670178+$y,0.27372023+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);

    OpenGL::glNormal3f( -0.784870171330747,-0.614840690909471,0.077134550995051 );
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24199308+$x,-0.28670178+$y,0.27372023+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.24594637+$x,-0.29169014+$y,0.274184+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24661477+$x,-0.29209738+$y,0.27773908+$z);

    OpenGL::glNormal3f( -0.0235043953865532,-0.999612048910273,-0.0149430609621385 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24222975+$x,-0.28676452+$y,0.27754494+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24199308+$x,-0.28670178+$y,0.27372023+$z);

    OpenGL::glNormal3f( 0.190105703006376,0.158567407208526,0.968873675489027 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);

    OpenGL::glNormal3f( 0.559597646907823,0.827944602325712,-0.036853887921693 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27140855+$x,-0.28630076+$y,0.27421099+$z);

    OpenGL::glNormal3f( 0.577946429168513,0.815602212858706,-0.0277660834715324 );
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27793146+$x,-0.29107401+$y,0.26744069+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);

    OpenGL::glNormal3f( -0.0426201686014666,-0.170427481903315,0.984448065994584 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26754507+$x,-0.29783342+$y,0.2775002+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);

    OpenGL::glNormal3f( 0.724663427225321,-0.55380453486738,0.410077376116237 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26754507+$x,-0.29783342+$y,0.2775002+$z);

    OpenGL::glNormal3f( -0.579455077986601,-0.814854828024619,0.0156019819417511 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24661477+$x,-0.29209738+$y,0.27773908+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.24594637+$x,-0.29169014+$y,0.274184+$z);

    OpenGL::glNormal3f( -0.476459431656677,-0.864125121174845,-0.162093136621991 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26106914+$x,-0.30232291+$y,0.27376069+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);

    OpenGL::glNormal3f( 0.599417975186289,0.794542871266067,-0.0969521363552356 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27140855+$x,-0.28630076+$y,0.27421099+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);

    OpenGL::glNormal3f( -0.411613021380552,0.618591873505144,-0.66926737158132 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27140855+$x,-0.28630076+$y,0.27421099+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);

    OpenGL::glNormal3f( 0.62766592689948,0.777088347495808,0.0465745037080555 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27140855+$x,-0.28630076+$y,0.27421099+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);

    OpenGL::glNormal3f( 0.275064100244401,-0.249048601283373,0.928608924658563 );
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);

    OpenGL::glNormal3f( -0.000525194552911303,-0.0566698749567291,-0.99839283322902 );
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);

    OpenGL::glNormal3f( -0.196473714937175,-0.321338794494145,-0.926358169657846 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);

    OpenGL::glNormal3f( -0.297740960025918,0.502091220024695,-0.811945027386065 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25221628+$x,-0.27243787+$y,0.27323025+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);

    OpenGL::glNormal3f( 0.427679485885076,0.0349861242322025,-0.903253136426487 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25221628+$x,-0.27243787+$y,0.27323025+$z);

    OpenGL::glNormal3f( 0.204999794437651,0.0671839779640581,-0.976453479375974 );
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);
    OpenGL::glTexCoord2f(0.783541,0.359685); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);

    OpenGL::glNormal3f( -0.168942480242924,-0.27478561564204,-0.946547042574004 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24199308+$x,-0.28670178+$y,0.27372023+$z);

    OpenGL::glNormal3f( 0.0108873997179943,-0.0282645286084331,-0.99954118521946 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);

    OpenGL::glNormal3f( 0.209203994310599,-0.226611133245253,-0.951252376109407 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.24892552+$x,-0.27720777+$y,0.27148736+$z);

    OpenGL::glNormal3f( 0.0317082894031884,-0.28142704007779,-0.959058603786118 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24511204+$x,-0.28184059+$y,0.27175233+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);

    OpenGL::glNormal3f( 0.0418530228264657,-0.0628256420291884,0.997146560533559 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);

    OpenGL::glNormal3f( 0.0517285013435193,-0.0410265268458983,0.997818112805995 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26754507+$x,-0.29783342+$y,0.2775002+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);

    OpenGL::glNormal3f( 0.119703722705455,-0.40586134428277,0.90606158068171 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23764934+$x,-0.28647624+$y,0.27827921+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24222975+$x,-0.28676452+$y,0.27754494+$z);

    OpenGL::glNormal3f( 0.21183944290602,0.170970928758643,0.962233335500633 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);

    OpenGL::glNormal3f( 0.846374993643075,-0.25709688353067,0.466423158317103 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);

    OpenGL::glNormal3f( 0.718984442178251,-0.496027938889227,0.486844590959923 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26754507+$x,-0.29783342+$y,0.2775002+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);

    OpenGL::glNormal3f( -0.670958061943336,0.2007520768603,-0.713802411560453 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26106914+$x,-0.30232291+$y,0.27376069+$z);

    OpenGL::glNormal3f( -0.53933513669189,0.330978686959334,-0.774319520035634 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);

    OpenGL::glNormal3f( 0.374823118742684,0.0897424189905404,-0.922742611939935 );
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27140855+$x,-0.28630076+$y,0.27421099+$z);

    OpenGL::glNormal3f( -0.294648000757595,0.506492787036142,-0.810337961797369 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25221628+$x,-0.27243787+$y,0.27323025+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);

    OpenGL::glNormal3f( 0.581252394200518,0.148355663733239,-0.800085152514678 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);

    OpenGL::glNormal3f( 0.203968111593614,0.0992848432063595,0.973929940684865 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);

    OpenGL::glNormal3f( 0.83213690073916,-0.198851336611473,0.517693272465516 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);

    OpenGL::glNormal3f( 0.192385293452246,0.923973782397467,0.330545531365062 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);

    OpenGL::glNormal3f( -0.131410330030432,0.989632450838133,-0.0579563405452986 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25221628+$x,-0.27243787+$y,0.27323025+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);

    OpenGL::glNormal3f( -0.689566223079712,0.609806887479469,-0.390683995026905 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.2636404+$x,-0.27313996+$y,0.26444778+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);

    OpenGL::glNormal3f( 0.286020363317761,0.224844863584156,0.931470417719961 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26243434+$x,-0.2792097+$y,0.27683959+$z);

    OpenGL::glNormal3f( 0.392150750354169,0.905247683195088,0.163537216151518 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);

    OpenGL::glNormal3f( 0.8406614246716,-0.194907790576554,0.505271533179618 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);

    OpenGL::glNormal3f( 0.381430495122089,-0.0215177618984209,0.924147046369679 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.2506636+$x,-0.2678581+$y,0.27902003+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);

    OpenGL::glNormal3f( 0.908772533547688,0.414860539960366,-0.044980158438032 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25221628+$x,-0.27243787+$y,0.27323025+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);

    OpenGL::glNormal3f( 0.87188437034768,-0.144664353421143,0.467856676336538 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27159542+$x,-0.27776848+$y,0.26164448+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.27042122+$x,-0.28043817+$y,0.2630072+$z);

    OpenGL::glNormal3f( 0.866192538203566,0.129202089768329,0.482718662121076 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27159542+$x,-0.27776848+$y,0.26164448+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);

    OpenGL::glNormal3f( 0.628932676423626,0.0953411676566557,-0.771591699201385 );
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27159542+$x,-0.27776848+$y,0.26164448+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26997176+$x,-0.27959957+$y,0.26009476+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);

    OpenGL::glNormal3f( -0.302522858185587,-0.921010432160153,0.245397033656461 );
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27042122+$x,-0.28043817+$y,0.2630072+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.2672735+$x,-0.28014928+$y,0.26021097+$z);

    OpenGL::glNormal3f( 0.822523925932917,-0.500056589982571,-0.27092027994025 );
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.27042122+$x,-0.28043817+$y,0.2630072+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26997176+$x,-0.27959957+$y,0.26009476+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27159542+$x,-0.27776848+$y,0.26164448+$z);

    OpenGL::glNormal3f( 0.340870769901983,0.840217776643351,-0.421712231312933 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27159542+$x,-0.27776848+$y,0.26164448+$z);

    OpenGL::glNormal3f( 0.33988060008795,0.840489130197674,-0.42197061473924 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.2636404+$x,-0.27313996+$y,0.26444778+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);

    OpenGL::glNormal3f( -0.70570407365221,0.036344196642069,-0.707573925325912 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.2636404+$x,-0.27313996+$y,0.26444778+$z);

    OpenGL::glNormal3f( 0.0427794893743499,-0.403226624103761,-0.914099669020153 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26997176+$x,-0.27959957+$y,0.26009476+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.2672735+$x,-0.28014928+$y,0.26021097+$z);

    OpenGL::glNormal3f( -0.704116918424112,0.113814124317471,-0.700903495707347 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.2672735+$x,-0.28014928+$y,0.26021097+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.2686339+$x,-0.27777927+$y,0.25922918+$z);

    OpenGL::glNormal3f( 0.178262259120802,-0.93790992149049,-0.297569397188037 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.2672735+$x,-0.28014928+$y,0.26021097+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26997176+$x,-0.27959957+$y,0.26009476+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27042122+$x,-0.28043817+$y,0.2630072+$z);

    OpenGL::glNormal3f( 0.932390543174516,0.140266573167763,0.333126347577769 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26517414+$x,-0.273514+$y,0.27462343+$z);

    OpenGL::glNormal3f( -0.27968634188565,-0.895527610961448,0.346129814041358 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27042122+$x,-0.28043817+$y,0.2630072+$z);

    OpenGL::glNormal3f( 0.256194967653506,-0.902270471603738,-0.346802731565061 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.26846487+$x,-0.27814384+$y,0.26736242+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);

    OpenGL::glNormal3f( 0.205357688235452,0.951575461822114,-0.228762672524654 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26772724+$x,-0.27331383+$y,0.26739325+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.2636404+$x,-0.27313996+$y,0.26444778+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.2618653+$x,-0.2713212+$y,0.27041972+$z);

    OpenGL::glNormal3f( -0.694318202238042,0.0383554061906709,-0.718645320625468 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.2636404+$x,-0.27313996+$y,0.26444778+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);

    OpenGL::glNormal3f( -0.592618860397344,-0.780003257981881,-0.200992049193506 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26395837+$x,-0.27808365+$y,0.26387672+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26495768+$x,-0.28096435+$y,0.27210961+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25901337+$x,-0.27559198+$y,0.26878731+$z);

    OpenGL::glNormal3f( -0.426716288931966,0.472996065139051,-0.770835865228848 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27147631+$x,-0.29338708+$y,0.26862737+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);

    OpenGL::glNormal3f( -0.702504372992242,0.69888870639184,0.134321189708538 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27147631+$x,-0.29338708+$y,0.26862737+$z);

    OpenGL::glNormal3f( -0.527116129058929,0.33525287182078,-0.780867529368363 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.27147631+$x,-0.29338708+$y,0.26862737+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26769055+$x,-0.29089181+$y,0.27225421+$z);

    OpenGL::glNormal3f( -0.865815893182532,0.491441320511852,0.0940652305908082 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.27147631+$x,-0.29338708+$y,0.26862737+$z);
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);

    OpenGL::glNormal3f( -0.600345016292509,0.236352797414525,-0.764017811681819 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.26449629+$x,-0.29585028+$y,0.27235963+$z);

    OpenGL::glNormal3f( -0.882175304099189,0.409007925884412,0.233407903467802 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);

    OpenGL::glNormal3f( -0.868481589944983,0.463753438370386,0.175135594115755 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);

    OpenGL::glNormal3f( -0.814592526440065,0.549608212870893,0.185391014380026 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26838487+$x,-0.29878906+$y,0.26839496+$z);
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);

    OpenGL::glNormal3f( -0.583722816284757,-0.787562394886499,-0.197517462289374 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);

    OpenGL::glNormal3f( -0.545455775723364,-0.838137897895889,0.00169140198765973 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26599628+$x,-0.30407826+$y,0.26863561+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);

    OpenGL::glNormal3f( 0.599879015204691,-0.640979980794419,0.478842177901901 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26754507+$x,-0.29783342+$y,0.2775002+$z);

    OpenGL::glNormal3f( 0.638392865514477,-0.724808359720598,-0.259050942749396 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);

    OpenGL::glNormal3f( 0.7170578172827,-0.497731878021444,0.487945759562492 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27067183+$x,-0.29327643+$y,0.27752547+$z);

    OpenGL::glNormal3f( 0.789522556386007,-0.525336684140187,-0.317294029654353 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);

    OpenGL::glNormal3f( 0.749933492369097,-0.356706349194894,0.557099934901396 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27793146+$x,-0.29107401+$y,0.26744069+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27324219+$x,-0.2874574+$y,0.27606878+$z);

    OpenGL::glNormal3f( 0.793671029788365,-0.483704842411957,-0.368938913509946 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27793146+$x,-0.29107401+$y,0.26744069+$z);

    OpenGL::glNormal3f( 0.863893211115335,-0.410845261352937,-0.291366935345574 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);

    OpenGL::glNormal3f( 0.783032539422597,-0.541749504933903,-0.305560985908328 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27494703+$x,-0.29642291+$y,0.26803329+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);

    OpenGL::glNormal3f( 0.580028555356688,0.814281284225463,-0.0226465258034266 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27793146+$x,-0.29107401+$y,0.26744069+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27554903+$x,-0.28933755+$y,0.26885766+$z);

    OpenGL::glNormal3f( 0.541221835947584,0.840529942722173,0.0242557143986033 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27793146+$x,-0.29107401+$y,0.26744069+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);

    OpenGL::glNormal3f( -0.412768384926111,-0.906546976265737,-0.0882883923794074 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26737996+$x,-0.30497975+$y,0.26814094+$z);

    OpenGL::glNormal3f( -0.6708385780025,-0.685004813242241,-0.284154901591625 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26276489+$x,-0.29951789+$y,0.25900835+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);

    OpenGL::glNormal3f( 0.66845311012511,-0.677852082545248,-0.306083311784778 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27192058+$x,-0.30089952+$y,0.2679144+$z);

    OpenGL::glNormal3f( 0.359396267624677,-0.490901725472371,-0.793630782382904 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.26300653+$x,-0.29957785+$y,0.25741172+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);

    OpenGL::glNormal3f( -0.735821039891026,0.671660553053102,0.0862525288098252 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27147631+$x,-0.29338708+$y,0.26862737+$z);

    OpenGL::glNormal3f( -0.583765657132515,0.482603464761372,0.652925381152366 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.26953242+$x,-0.2888915+$y,0.25888987+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);

    OpenGL::glNormal3f( 0.132088042955001,0.983943244688563,-0.120035162098697 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.26953242+$x,-0.2888915+$y,0.25888987+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27489849+$x,-0.2890154+$y,0.26377913+$z);

    OpenGL::glNormal3f( 0.169481994782381,0.95202840946229,-0.254789640726007 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.26998913+$x,-0.28929463+$y,0.25768736+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.26953242+$x,-0.2888915+$y,0.25888987+$z);

    OpenGL::glNormal3f( 0.463430658837438,-0.110708791779051,-0.879190302421678 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.26998913+$x,-0.28929463+$y,0.25768736+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27578896+$x,-0.28950196+$y,0.26077062+$z);

    OpenGL::glNormal3f( 0.493185146996036,-0.399958424092058,-0.772529397356694 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.26611822+$x,-0.29702477+$y,0.25683945+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);

    OpenGL::glNormal3f( -0.702036062536924,0.315760480910274,0.638310806420324 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26276489+$x,-0.29951789+$y,0.25900835+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.26490115+$x,-0.30337639+$y,0.26326661+$z);

    OpenGL::glNormal3f( -0.50353691994717,0.408006585356092,0.761564965420666 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);

    OpenGL::glNormal3f( -0.377707688183234,0.602800154199055,0.702829194317419 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.26953242+$x,-0.2888915+$y,0.25888987+$z);
    OpenGL::glTexCoord2f(0.901713,0.490842); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27098346+$x,-0.29325757+$y,0.26341435+$z);

    OpenGL::glNormal3f( -0.6364822045714,0.625405846558531,-0.4513955364803 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.26953242+$x,-0.2888915+$y,0.25888987+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.26998913+$x,-0.28929463+$y,0.25768736+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);

    OpenGL::glNormal3f( -0.458376653758502,0.429371754498307,0.7781585569331 );
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);

    OpenGL::glNormal3f( -0.605870883781532,0.470890838733101,-0.641234972676181 );
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.26856311+$x,-0.29271923+$y,0.25669046+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);

    OpenGL::glNormal3f( -0.622369475278162,0.446333351120112,-0.642995160106105 );
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.26649233+$x,-0.2915308+$y,0.25951976+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.26998913+$x,-0.28929463+$y,0.25768736+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.26856311+$x,-0.29271923+$y,0.25669046+$z);

    OpenGL::glNormal3f( -0.682001282843765,-0.0404590064164294,0.730231003860596 );
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26276489+$x,-0.29951789+$y,0.25900835+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26792183+$x,-0.29796279+$y,0.26391085+$z);

    OpenGL::glNormal3f( -0.976399916647556,0.151946147518495,-0.153478242838957 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.26300653+$x,-0.29957785+$y,0.25741172+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26276489+$x,-0.29951789+$y,0.25900835+$z);

    OpenGL::glNormal3f( -0.500370976124527,0.44312480074803,-0.743820742661972 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.26611822+$x,-0.29702477+$y,0.25683945+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.26300653+$x,-0.29957785+$y,0.25741172+$z);

    OpenGL::glNormal3f( -0.586962776246987,0.30738704425284,-0.748991257843462 );
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26330039+$x,-0.29533767+$y,0.25974009+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.26856311+$x,-0.29271923+$y,0.25669046+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.26611822+$x,-0.29702477+$y,0.25683945+$z);

    OpenGL::glNormal3f( -0.758378638689066,-0.645496150619299,-0.0905348547013057 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26276489+$x,-0.29951789+$y,0.25900835+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.26300653+$x,-0.29957785+$y,0.25741172+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26605931+$x,-0.30371753+$y,0.26135478+$z);

    OpenGL::glNormal3f( 0.335313748254341,-0.575817275887664,-0.745653508689481 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.26300653+$x,-0.29957785+$y,0.25741172+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.26611822+$x,-0.29702477+$y,0.25683945+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.26974836+$x,-0.29971646+$y,0.2605505+$z);

    OpenGL::glNormal3f( 0.480378576534427,-0.301284908619189,-0.82368915680922 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.26611822+$x,-0.29702477+$y,0.25683945+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.26856311+$x,-0.29271923+$y,0.25669046+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);

    OpenGL::glNormal3f( 0.583347661273738,-0.00647856920733541,-0.812196733696637 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.26856311+$x,-0.29271923+$y,0.25669046+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.26998913+$x,-0.28929463+$y,0.25768736+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27317705+$x,-0.2944605+$y,0.26001824+$z);

    OpenGL::glNormal3f( 0.923821264083638,0.373984169342164,-0.0817931116192566 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.2506636+$x,-0.2678581+$y,0.27902003+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25232369+$x,-0.27213049+$y,0.27823537+$z);

    OpenGL::glNormal3f( 0.820442694144713,-0.555132099510126,0.13675575935969 );
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25001045+$x,-0.26769923+$y,0.27236936+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25417325+$x,-0.26444515+$y,0.26060463+$z);

    OpenGL::glNormal3f( 0.287235634511055,-0.00472485982988588,0.957848300080248 );
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.2506636+$x,-0.2678581+$y,0.27902003+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24912434+$x,-0.27732476+$y,0.27943492+$z);

    OpenGL::glNormal3f( 0.82297551115636,-0.561821912041203,0.0840681104063517 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24379238+$x,-0.27737465+$y,0.27039821+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23513891+$x,-0.29143669+$y,0.26113467+$z);

    OpenGL::glNormal3f( 0.0680554025707819,-0.326261204425579,0.942826648259212 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24381886+$x,-0.2772509+$y,0.28102627+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23764934+$x,-0.28647624+$y,0.27827921+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);

    OpenGL::glNormal3f( -0.0591068726659052,-0.997984240489112,0.0231048336723437 );
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23764934+$x,-0.28647624+$y,0.27827921+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23725581+$x,-0.28657787+$y,0.2728827+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24222975+$x,-0.28676452+$y,0.27754494+$z);

    OpenGL::glNormal3f( 0.998155575979275,-0.060542682238591,0.00447546297476088 );
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.25203547+$x,-0.25288594+$y,0.1819633+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);
    OpenGL::glTexCoord2f(0.333562,0.02429); OpenGL::glVertex3f(0.25321079+$x,-0.23226787+$y,0.19874839+$z);

    OpenGL::glNormal3f( 0.57885874529286,-0.298819016341654,-0.758702674616732 );
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.25203547+$x,-0.25288594+$y,0.1819633+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.25033195+$x,-0.27352247+$y,0.18879139+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);

    OpenGL::glNormal3f( 0.599029547545958,-0.187717151780525,-0.77841240489492 );
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);
    OpenGL::glTexCoord2f(0.407871,0.052659); OpenGL::glVertex3f(0.25203547+$x,-0.25288594+$y,0.1819633+$z);

    OpenGL::glNormal3f( -0.999048527610013,-0.042524516629268,0.00968013252559585 );
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);
    OpenGL::glTexCoord2f(0.463428,0.018434); OpenGL::glVertex3f(0.25033195+$x,-0.27352247+$y,0.18879139+$z);
    OpenGL::glTexCoord2f(0.455921,0.089119); OpenGL::glVertex3f(0.24954477+$x,-0.25319694+$y,0.19683904+$z);

    OpenGL::glNormal3f( 0.73287460474032,0.336498161555844,-0.591323770024728 );
    OpenGL::glTexCoord2f(0.075002,0.239425); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);
    OpenGL::glTexCoord2f(0.087071,0.19858); OpenGL::glVertex3f(0.23779949+$x,-0.13799327+$y,0.17462017+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);

    OpenGL::glNormal3f( 0.122875119119786,0.136070552140241,-0.983049596887944 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);
    OpenGL::glTexCoord2f(0.504443,0.329853); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(0.21792151+$x,-0.13277427+$y,0.16572214+$z);

    OpenGL::glNormal3f( 0.541523700308053,-0.18183290702267,-0.820785523707844 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23779949+$x,-0.13799327+$y,0.17462017+$z);

    OpenGL::glNormal3f( 0.557520201823922,0.0745798138843283,-0.826806552900491 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);

    OpenGL::glNormal3f( 0.597356818763974,-0.0455763070744063,-0.800679481009502 );
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);

    OpenGL::glNormal3f( -0.00506505630474317,0.999715385121864,0.023312956811016 );
    OpenGL::glTexCoord2f(0.582086,0.037976); OpenGL::glVertex3f(0.22756257+$x,-0.10024202+$y,0.18002687+$z);
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(0.20737883+$x,-0.10033673+$y,0.17970307+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22720948+$x,-0.10063627+$y,0.19685654+$z);

    OpenGL::glNormal3f( 0.00509820330696357,0.828410927987508,-0.5600976189147 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22756257+$x,-0.10024202+$y,0.18002687+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20737883+$x,-0.10033673+$y,0.17970307+$z);

    OpenGL::glNormal3f( 0.214420079575408,0.646735732210275,-0.731954180367402 );
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22756257+$x,-0.10024202+$y,0.18002687+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);

    OpenGL::glNormal3f( 0.339505035483694,0.616954611494132,-0.710002350867474 );
    OpenGL::glTexCoord2f(0.526655,0.031921); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.54694,0.05581); OpenGL::glVertex3f(0.22756257+$x,-0.10024202+$y,0.18002687+$z);

    OpenGL::glNormal3f( 0.608965488344068,-0.188887930407128,-0.770378078447449 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);
    OpenGL::glTexCoord2f(0.411946,0.061948); OpenGL::glVertex3f(0.24936228+$x,-0.2527705+$y,0.1798783+$z);

    OpenGL::glNormal3f( 0.620584685348957,0.0278636905331745,-0.783644219694249 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);

    OpenGL::glNormal3f( 0.910559739550291,0.00470953103601869,-0.413350675610343 );
    OpenGL::glTexCoord2f(0.361471,0.100203); OpenGL::glVertex3f(0.24887935+$x,-0.23233625+$y,0.17448631+$z);
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);

    OpenGL::glNormal3f( 0.977892726173421,0.111145050331606,-0.177123103755266 );
    OpenGL::glTexCoord2f(0.354515,0.084197); OpenGL::glVertex3f(0.25329836+$x,-0.232359+$y,0.17798501+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);
    OpenGL::glTexCoord2f(0.2441,0.051292); OpenGL::glVertex3f(0.25397424+$x,-0.20117921+$y,0.2012819+$z);

    OpenGL::glNormal3f( 0.995498203270241,0.094612098643407,-0.00564606730499131 );
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);

    OpenGL::glNormal3f( 0.787802143122971,0.0453183115768182,-0.614258930685326 );
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);

    OpenGL::glNormal3f( 0.3567850479816,-0.0130823902077727,-0.934094899142062 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);
    OpenGL::glTexCoord2f(0.075002,0.239425); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);

    OpenGL::glNormal3f( 0.881256548917116,0.472638187129939,0.000197628994008543 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.109254,0.094482); OpenGL::glVertex3f(0.24521634+$x,-0.15557947+$y,0.20262179+$z);

    OpenGL::glNormal3f( 0.440140634873418,0.322206747494657,-0.838128291732321 );
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);

    OpenGL::glNormal3f( -0.99984908258907,0.0163476916371342,-0.00587920266119892 );
    OpenGL::glTexCoord2f(0.540133,0.212749); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);
    OpenGL::glTexCoord2f(0.534654,0.2158); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20021121+$x,-0.15248773+$y,0.19706166+$z);

    OpenGL::glNormal3f( 0.190563368362847,-0.970105665857852,-0.150268425521461 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);

    OpenGL::glNormal3f( -0.435931048258597,0.0106253670314818,-0.899917342170717 );
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);
    OpenGL::glTexCoord2f(0.517331,0.185991); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);

    OpenGL::glNormal3f( -0.999950142411336,-0.00987538803248699,0.00147966305540335 );
    OpenGL::glTexCoord2f(0.063737,0.320971); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(0.1832855+$x,-0.28390253+$y,0.1670218+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.18334297+$x,-0.28330988+$y,0.20981518+$z);

    OpenGL::glNormal3f( -0.949238698822337,-0.0739271231191528,-0.305746092575854 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.1832855+$x,-0.28390253+$y,0.1670218+$z);

    OpenGL::glNormal3f( -0.91160967917228,-0.0634267284260319,-0.406134020934694 );
    OpenGL::glTexCoord2f(0.125023,0.594963); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);

    OpenGL::glNormal3f( -0.424993514798311,0.893667170543065,-0.144012154601375 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);

    OpenGL::glNormal3f( -0.922322759778165,-0.0894580093853753,-0.375922852925962 );
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);
    OpenGL::glTexCoord2f(0.001952,0.833096); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);

    OpenGL::glNormal3f( 0.0386593689392456,-0.999241003426227,0.00478228658343069 );
    OpenGL::glTexCoord2f(0.422372,0.315946); OpenGL::glVertex3f(0.1832855+$x,-0.28390253+$y,0.1670218+$z);
    OpenGL::glTexCoord2f(0.448746,0.357125); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.457939,0.398224); OpenGL::glVertex3f(0.18894723+$x,-0.28354869+$y,0.19518668+$z);

    OpenGL::glNormal3f( 0.962912607222243,0.269799619225515,0.00273428568906314 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);
    OpenGL::glTexCoord2f(0.434776,0.232484); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);

    OpenGL::glNormal3f( 0.902916249885402,-0.429658209794823,0.011664838138203 );
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);

    OpenGL::glNormal3f( 0.633385243308923,-0.1952254716349,-0.748805815137294 );
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);
    OpenGL::glTexCoord2f(0.447676,0.215559); OpenGL::glVertex3f(0.24166449+$x,-0.11543776+$y,0.18472977+$z);

    OpenGL::glNormal3f( 0.991766226253104,0.127561865751423,-0.0113014543176378 );
    OpenGL::glTexCoord2f(0.537535,0.232723); OpenGL::glVertex3f(0.24042932+$x,-0.13954032+$y,0.18300672+$z);
    OpenGL::glTexCoord2f(0.528807,0.227595); OpenGL::glVertex3f(0.2400911+$x,-0.13685666+$y,0.18361704+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24057099+$x,-0.1396837+$y,0.1938207+$z);

    OpenGL::glNormal3f( 0.91708376883872,0.194703580961767,-0.347919353432997 );
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24042932+$x,-0.13954032+$y,0.18300672+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.2400911+$x,-0.13685666+$y,0.18361704+$z);

    OpenGL::glNormal3f( 0.871920017541094,-0.268231111350678,-0.409643203183843 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24004117+$x,-0.14243147+$y,0.18407365+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);
    OpenGL::glTexCoord2f(0.517824,0.253433); OpenGL::glVertex3f(0.24042932+$x,-0.13954032+$y,0.18300672+$z);

    OpenGL::glNormal3f( 0.984577388872058,0.0823106710823844,-0.15437719633368 );
    OpenGL::glTexCoord2f(0.525814,0.258488); OpenGL::glVertex3f(0.24004117+$x,-0.14243147+$y,0.18407365+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);

    OpenGL::glNormal3f( 0.0637238653839249,-0.997495649296374,-0.0306871082921795 );
    OpenGL::glTexCoord2f(0.522075,0.220624); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.24622697+$x,-0.13261923+$y,0.18577851+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.2405462+$x,-0.13320171+$y,0.19291573+$z);

    OpenGL::glNormal3f( 0.288805562040992,0.0537550390192742,-0.95587747285634 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.24622697+$x,-0.13261923+$y,0.18577851+$z);

    OpenGL::glNormal3f( 0.298335590108571,0.0429633674962836,-0.953493589243237 );
    OpenGL::glTexCoord2f(0.487812,0.223993); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);

    OpenGL::glNormal3f( 0.997412716617348,0.0705640232152362,0.0137328568652583 );
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);

    OpenGL::glNormal3f( 0.0891492909745893,-0.174451140667987,-0.980621845278988 );
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22161991+$x,-0.33424168+$y,0.14433255+$z);

    OpenGL::glNormal3f( -0.969413156707535,0.182393621590741,-0.164227581134676 );
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19486911+$x,-0.38400643+$y,0.14061689+$z);
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);

    OpenGL::glNormal3f( -0.960562457504525,-0.220880506575016,-0.168912897814321 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);

    OpenGL::glNormal3f( -0.0167779201611994,-0.00169151094608484,0.999857809983892 );
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.22418267+$x,-0.33491101+$y,0.17391789+$z);

    OpenGL::glNormal3f( 0.0034651447311864,0.00863215833757933,0.999956738371429 );
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);
    OpenGL::glTexCoord2f(0.639912,0.566668); OpenGL::glVertex3f(0.19284167+$x,-0.38371819+$y,0.17392854+$z);
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);

    OpenGL::glNormal3f( -0.991453073628912,0.115144858486471,-0.0613389301823344 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19486911+$x,-0.38400643+$y,0.14061689+$z);
    OpenGL::glTexCoord2f(0.639452,0.910131); OpenGL::glVertex3f(0.19284167+$x,-0.38371819+$y,0.17392854+$z);

    OpenGL::glNormal3f( -0.994967676746215,-0.100196200967463,-0.000208667022850522 );
    OpenGL::glTexCoord2f(0.798014,0.934199); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);
    OpenGL::glTexCoord2f(0.96259,0.987723); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);

    OpenGL::glNormal3f( 0.981511476408003,-0.169528025442341,-0.088856458791709 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22161991+$x,-0.33424168+$y,0.14433255+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.22418267+$x,-0.33491101+$y,0.17391789+$z);

    OpenGL::glNormal3f( 0.0874048036837049,0.0771430538074111,-0.993181428311202 );
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22161991+$x,-0.33424168+$y,0.14433255+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);

    OpenGL::glNormal3f( -0.0165554044708354,-0.148747119520781,0.988736675266513 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.22418267+$x,-0.33491101+$y,0.17391789+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);

    OpenGL::glNormal3f( 0.995957244973859,0.0270449867706398,-0.085660579467196 );
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.22418267+$x,-0.33491101+$y,0.17391789+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22161991+$x,-0.33424168+$y,0.14433255+$z);

    OpenGL::glNormal3f( -0.00604779920581668,-0.139611084880879,-0.990187946353191 );
    OpenGL::glTexCoord2f(0.985358,0.837917); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);

    OpenGL::glNormal3f( -0.00615686847864994,-0.175071971062247,-0.9845363873006 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);

    OpenGL::glNormal3f( 0.0448991570274278,-0.998991342162164,0.000603310255285923 );
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);
    OpenGL::glTexCoord2f(0.469506,0.401201); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.451622,0.446715); OpenGL::glVertex3f(0.1832855+$x,-0.28390253+$y,0.1670218+$z);

    OpenGL::glNormal3f( -0.00254232618820541,-0.999963234993026,-0.0081893369593742 );
    OpenGL::glTexCoord2f(0.632024,0.752693); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.652416,0.797749); OpenGL::glVertex3f(0.23935864+$x,-0.28360778+$y,0.16673705+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23973646+$x,-0.28396309+$y,0.21000507+$z);

    OpenGL::glNormal3f( 0.00618069625168092,-0.164006128138372,0.986439957081476 );
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.964423,0.497747); OpenGL::glVertex3f(0.19335096+$x,-0.28344105+$y,0.18207849+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19853657+$x,-0.33491727+$y,0.17348753+$z);

    OpenGL::glNormal3f( 0.972634668084523,-0.0687716157494598,-0.221928518463308 );
    OpenGL::glTexCoord2f(0.985358,0.752418); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);
    OpenGL::glTexCoord2f(0.983795,0.602548); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);
    OpenGL::glTexCoord2f(0.820203,0.742307); OpenGL::glVertex3f(0.22161991+$x,-0.33424168+$y,0.14433255+$z);

    OpenGL::glNormal3f( 0.00736410829740539,-0.999962817758534,-0.00448698221499562 );
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23935864+$x,-0.28360778+$y,0.16673705+$z);
    OpenGL::glTexCoord2f(0.602563,0.723134); OpenGL::glVertex3f(0.23373675+$x,-0.28371668+$y,0.18177962+$z);

    OpenGL::glNormal3f( 0.998959951981338,-0.0436750604777329,0.0130959317999581 );
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.813471,0.62914); OpenGL::glVertex3f(0.22418267+$x,-0.33491101+$y,0.17391789+$z);

    OpenGL::glNormal3f( -0.0471729744199694,0.0617251806930987,0.996977789397927 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24922524+$x,-0.39998816+$y,0.17624701+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24716872+$x,-0.38769038+$y,0.17538832+$z);

    OpenGL::glNormal3f( -0.00703282551861887,0.132358383800647,0.991176975924535 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19284167+$x,-0.38371819+$y,0.17392854+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19141025+$x,-0.40007533+$y,0.17610266+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);

    OpenGL::glNormal3f( 0.268427885370811,0.963290759656987,0.00416925830566617 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24699627+$x,-0.38787399+$y,0.20187339+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24686221+$x,-0.38798213+$y,0.23548985+$z);

    OpenGL::glNormal3f( 0.000868830361844552,0.00947657968331234,-0.999954718760459 );
    OpenGL::glTexCoord2f(0.659818,0.646009); OpenGL::glVertex3f(0.2221594+$x,-0.38095757+$y,0.20292514+$z);
    OpenGL::glTexCoord2f(0.639912,0.566668); OpenGL::glVertex3f(0.19296872+$x,-0.38363849+$y,0.20287437+$z);
    OpenGL::glTexCoord2f(0.801934,0.560641); OpenGL::glVertex3f(0.19830427+$x,-0.33455717+$y,0.20334415+$z);

    OpenGL::glNormal3f( 0.249921251381247,0.968262302833873,-0.00273514512904899 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24716872+$x,-0.38769038+$y,0.17538832+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24709449+$x,-0.3877721+$y,0.13967612+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);

    OpenGL::glNormal3f( 0.986603919673692,0.163116001771642,-0.00242397412150935 );
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24716872+$x,-0.38769038+$y,0.17538832+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24709449+$x,-0.3877721+$y,0.13967612+$z);

    OpenGL::glNormal3f( 0.256376723666508,0.966574190008866,0.002304510952933 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24709449+$x,-0.3877721+$y,0.13967612+$z);
    OpenGL::glTexCoord2f(0.705683,0.93425); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.66361,0.92367); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);

    OpenGL::glNormal3f( -0.019475426163268,0.0933386440322149,-0.995443923737539 );
    OpenGL::glTexCoord2f(0.697806,0.97193); OpenGL::glVertex3f(0.24709449+$x,-0.3877721+$y,0.13967612+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);

    OpenGL::glNormal3f( 0.00110841380816445,0.0428284540979574,-0.999081825947409 );
    OpenGL::glTexCoord2f(0.669819,0.738906); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.654329,0.817364); OpenGL::glVertex3f(0.19486911+$x,-0.38400643+$y,0.14061689+$z);
    OpenGL::glTexCoord2f(0.816218,0.822246); OpenGL::glVertex3f(0.2038326+$x,-0.33444394+$y,0.14275147+$z);

    OpenGL::glNormal3f( -0.00768152417232317,0.131618131300463,-0.991270730779117 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19279547+$x,-0.40004457+$y,0.13850346+$z);
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19486911+$x,-0.38400643+$y,0.14061689+$z);

    OpenGL::glNormal3f( -0.000229173265805287,0.119969748090562,-0.99277752141288 );
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22259023+$x,-0.38127512+$y,0.14076473+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19279547+$x,-0.40004457+$y,0.13850346+$z);

    OpenGL::glNormal3f( -0.988816041722439,0.135933780514853,-0.0613583160403451 );
    OpenGL::glTexCoord2f(0.772184,0.965605); OpenGL::glVertex3f(0.19486911+$x,-0.38400643+$y,0.14061689+$z);
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19279547+$x,-0.40004457+$y,0.13850346+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(0.19284167+$x,-0.38371819+$y,0.17392854+$z);

    OpenGL::glNormal3f( -0.995935503463559,0.0822867292703656,-0.0366246792036912 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19279547+$x,-0.40004457+$y,0.13850346+$z);
    OpenGL::glTexCoord2f(0.823359,0.97848); OpenGL::glVertex3f(0.19141025+$x,-0.40007533+$y,0.17610266+$z);
    OpenGL::glTexCoord2f(0.814253,0.95501); OpenGL::glVertex3f(0.19284167+$x,-0.38371819+$y,0.17392854+$z);

    OpenGL::glNormal3f( -0.00350411012557042,-0.999993411995568,-0.000947194641937724 );
    OpenGL::glTexCoord2f(0.623546,0.549776); OpenGL::glVertex3f(0.19279547+$x,-0.40004457+$y,0.13850346+$z);
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(0.19141025+$x,-0.40007533+$y,0.17610266+$z);

    OpenGL::glNormal3f( -0.0284664278151555,-0.217421426098939,0.97566263942028 );
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);

    OpenGL::glNormal3f( 0.0785727905627387,-0.379496388288275,0.921850751401407 );
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24223845+$x,-0.28650682+$y,0.10370285+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);

    OpenGL::glNormal3f( 0.917291051211142,-0.398206492884313,-0.00295235376152834 );
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);
    OpenGL::glTexCoord2f(0.786136,0.312218); OpenGL::glVertex3f(0.23735935+$x,-0.28686961+$y,0.098487575+$z);

    OpenGL::glNormal3f( 0.916908746170635,-0.399088814216444,-0.00254353358650142 );
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23558576+$x,-0.29106057+$y,0.1159041+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);

    OpenGL::glNormal3f( 0.0353474593933801,-0.998688144619918,0.0370479002111953 );
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23735935+$x,-0.28686961+$y,0.098487575+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24249182+$x,-0.28665523+$y,0.099369649+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);

    OpenGL::glNormal3f( 0.825551635286577,-0.548641185071647,0.132126255978279 );
    OpenGL::glTexCoord2f(0.906343,0.303733); OpenGL::glVertex3f(0.23735935+$x,-0.28686961+$y,0.098487575+$z);
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);

    OpenGL::glNormal3f( -0.0664741695873756,-0.191890407529373,-0.979162528018653 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23735935+$x,-0.28686961+$y,0.098487575+$z);

    OpenGL::glNormal3f( 0.156414123320157,-0.135387878207746,-0.978368409373683 );
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);

    OpenGL::glNormal3f( 0.798934013347328,-0.57398404787527,0.179573815188775 );
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.25049938+$x,-0.26782704+$y,0.097958363+$z);

    OpenGL::glNormal3f( 0.790829799657268,-0.61086949101567,0.0377715887976884 );
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);

    OpenGL::glNormal3f( 0.219118973245542,0.0481261745670764,0.974510516559651 );
    OpenGL::glTexCoord2f(0.783541,0.359685); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);

    OpenGL::glNormal3f( 0.853740620917764,-0.517616902457793,-0.0565658420334222 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23558576+$x,-0.29106057+$y,0.1159041+$z);
    OpenGL::glTexCoord2f(0.793448,0.298779); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);

    OpenGL::glNormal3f( 0.846339674078143,-0.527148481429816,-0.0763127421047142 );
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24452731+$x,-0.27783102+$y,0.12368329+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23558576+$x,-0.29106057+$y,0.1159041+$z);

    OpenGL::glNormal3f( 0.151441874790763,0.0808389869841557,-0.985155021680971 );
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.25049938+$x,-0.26782704+$y,0.097958363+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.867907,0.332355); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);

    OpenGL::glNormal3f( 0.702900217877552,-0.709717271299765,0.0472512277777483 );
    OpenGL::glTexCoord2f(0.865727,0.262754); OpenGL::glVertex3f(0.25049938+$x,-0.26782704+$y,0.097958363+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);

    OpenGL::glNormal3f( 0.932626420260472,0.360745614660594,0.00840010329028262 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.25049938+$x,-0.26782704+$y,0.097958363+$z);

    OpenGL::glNormal3f( 0.336747276398146,0.0239861501996505,0.941289507238358 );
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25253954+$x,-0.27254412+$y,0.103609+$z);

    OpenGL::glNormal3f( 0.796945344371229,-0.597044889281978,-0.0917361339238484 );
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);

    OpenGL::glNormal3f( 0.238600983141768,-0.881264895948329,0.407972736850103 );
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);

    OpenGL::glNormal3f( 0.871387569184883,-0.152026346882885,-0.466445810489821 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);

    OpenGL::glNormal3f( 0.863136401682007,-0.156731035258481,-0.480032222541615 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);

    OpenGL::glNormal3f( 0.609538446485621,0.792370306899818,-0.0247422512998277 );
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27173873+$x,-0.28632613+$y,0.10086409+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);

    OpenGL::glNormal3f( -0.603931247286821,0.544182970210643,0.582350361452027 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.27181922+$x,-0.28950871+$y,0.1185803+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.2700763+$x,-0.29260666+$y,0.1196677+$z);

    OpenGL::glNormal3f( -0.545850228550332,0.818430225338668,0.179497894816754 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.27181922+$x,-0.28950871+$y,0.1185803+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.27164493+$x,-0.28935579+$y,0.11735304+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);

    OpenGL::glNormal3f( 0.0839014253129704,0.990219799585043,0.111468826764297 );
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.27181922+$x,-0.28950871+$y,0.1185803+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.27164493+$x,-0.28935579+$y,0.11735304+$z);

    OpenGL::glNormal3f( -0.69779911866107,0.452555863969272,0.55522029860485 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.2700763+$x,-0.29260666+$y,0.1196677+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.267464+$x,-0.29695191+$y,0.11992635+$z);

    OpenGL::glNormal3f( -0.696152265494394,0.429267860378808,0.575413874783032 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.2700763+$x,-0.29260666+$y,0.1196677+$z);
    OpenGL::glTexCoord2f(0.921769,0.487782); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);

    OpenGL::glNormal3f( 0.506474168459834,0.0176490401207573,0.862074491019039 );
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.2700763+$x,-0.29260666+$y,0.1196677+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.27181922+$x,-0.28950871+$y,0.1185803+$z);

    OpenGL::glNormal3f( -0.726521408968641,0.404210503662018,0.555680223725407 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.267464+$x,-0.29695191+$y,0.11992635+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.2649978+$x,-0.29979044+$y,0.11876672+$z);

    OpenGL::glNormal3f( 0.413346071149794,-0.195560605770949,0.889326191526781 );
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.267464+$x,-0.29695191+$y,0.11992635+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);
    OpenGL::glTexCoord2f(0.920762,0.473761); OpenGL::glVertex3f(0.2700763+$x,-0.29260666+$y,0.1196677+$z);

    OpenGL::glNormal3f( -0.830471838414467,0.345272679900557,0.437153636739743 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.2649978+$x,-0.29979044+$y,0.11876672+$z);
    OpenGL::glTexCoord2f(0.943349,0.479048); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26428884+$x,-0.29929896+$y,0.11703171+$z);

    OpenGL::glNormal3f( 0.209814360003548,-0.520442350149898,0.827718366660274 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.2649978+$x,-0.29979044+$y,0.11876672+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.267464+$x,-0.29695191+$y,0.11992635+$z);

    OpenGL::glNormal3f( 0.216775111603343,-0.466104359562431,0.85776178335611 );
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.2649978+$x,-0.29979044+$y,0.11876672+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);

    OpenGL::glNormal3f( -0.852196509815464,-0.477981468259396,0.212825808253918 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26428884+$x,-0.29929896+$y,0.11703171+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);
    OpenGL::glTexCoord2f(0.939942,0.462946); OpenGL::glVertex3f(0.2649978+$x,-0.29979044+$y,0.11876672+$z);

    OpenGL::glNormal3f( -0.831001917583351,-0.479262389062118,0.282388695601056 );
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26428884+$x,-0.29929896+$y,0.11703171+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);

    OpenGL::glNormal3f( -0.586924891970885,0.0429671408482426,-0.808500461343277 );
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26428884+$x,-0.29929896+$y,0.11703171+$z);

    OpenGL::glNormal3f( -0.392963894793691,0.37687548888874,-0.83877544269217 );
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);
    OpenGL::glTexCoord2f(0.957303,0.463029); OpenGL::glVertex3f(0.26542121+$x,-0.29577185+$y,0.11639712+$z);

    OpenGL::glNormal3f( -0.272179601992291,0.599386784542557,-0.752764071123917 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.27164493+$x,-0.28935579+$y,0.11735304+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);
    OpenGL::glTexCoord2f(0.901713,0.490842); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);

    OpenGL::glNormal3f( -0.569131689164171,0.516751033643963,-0.639576023328762 );
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.27164493+$x,-0.28935579+$y,0.11735304+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);

    OpenGL::glNormal3f( -0.496675510854416,0.353898530042377,-0.792508212797413 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);
    OpenGL::glTexCoord2f(0.974392,0.460852); OpenGL::glVertex3f(0.2686239+$x,-0.29127506+$y,0.11691715+$z);

    OpenGL::glNormal3f( -0.82241133065176,0.531813356178812,-0.202025140528177 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);

    OpenGL::glNormal3f( -0.851270683195862,0.501670939701837,-0.153832675949965 );
    OpenGL::glTexCoord2f(0.973265,0.44587); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.27222843+$x,-0.29373653+$y,0.10956846+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);

    OpenGL::glNormal3f( -0.609283315960162,0.229953662696501,-0.758877561866902 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);
    OpenGL::glTexCoord2f(0.945136,0.46285); OpenGL::glVertex3f(0.26428884+$x,-0.29929896+$y,0.11703171+$z);

    OpenGL::glNormal3f( -0.880564491509227,0.430829836172942,-0.197463486640677 );
    OpenGL::glTexCoord2f(0.954864,0.448282); OpenGL::glVertex3f(0.26874002+$x,-0.29792852+$y,0.11387324+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);

    OpenGL::glNormal3f( 0.433893342677852,-0.300620073893569,0.849331583277147 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);
    OpenGL::glTexCoord2f(0.932644,0.468099); OpenGL::glVertex3f(0.267464+$x,-0.29695191+$y,0.11992635+$z);

    OpenGL::glNormal3f( 0.776127765167144,-0.556521069788017,0.29649619056348 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);

    OpenGL::glNormal3f( 0.792640260110816,-0.512034999244029,0.330970659727756 );
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);

    OpenGL::glNormal3f( 0.364840035918355,-0.0614096961413772,0.929042839384125 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);
    OpenGL::glTexCoord2f(0.912471,0.475591); OpenGL::glVertex3f(0.27181922+$x,-0.28950871+$y,0.1185803+$z);

    OpenGL::glNormal3f( 0.883563607427254,-0.372648929083245,0.28363379079942 );
    OpenGL::glTexCoord2f(0.917177,0.464146); OpenGL::glVertex3f(0.27411159+$x,-0.29466687+$y,0.11733912+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);

    OpenGL::glNormal3f( 0.106059058755821,0.941051992927228,0.321204954294794 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);
    OpenGL::glTexCoord2f(0.908671,0.480349); OpenGL::glVertex3f(0.27164493+$x,-0.28935579+$y,0.11735304+$z);

    OpenGL::glNormal3f( 0.732043795659863,0.673277850524667,0.103965461711017 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27853886+$x,-0.29092672+$y,0.10964362+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);

    OpenGL::glNormal3f( 0.849298884539547,-0.41403839898533,0.327511234747062 );
    OpenGL::glTexCoord2f(0.90692,0.466975); OpenGL::glVertex3f(0.27639136+$x,-0.28969262+$y,0.11677264+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27853886+$x,-0.29092672+$y,0.10964362+$z);

    OpenGL::glNormal3f( -0.733145146118286,0.6644674648458,-0.144848827694922 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27222843+$x,-0.29373653+$y,0.10956846+$z);
    OpenGL::glTexCoord2f(0.890365,0.479613); OpenGL::glVertex3f(0.27155315+$x,-0.29349604+$y,0.11408956+$z);

    OpenGL::glNormal3f( -0.733542739727306,0.664169923624129,-0.144199034485245 );
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27222843+$x,-0.29373653+$y,0.10956846+$z);

    OpenGL::glNormal3f( 0.62539112805762,-0.711914087719416,0.319474989089051 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);
    OpenGL::glTexCoord2f(0.927761,0.459064); OpenGL::glVertex3f(0.27044287+$x,-0.29974175+$y,0.11741709+$z);

    OpenGL::glNormal3f( 0.635482765979248,-0.694792510672459,0.336786313939308 );
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);

    OpenGL::glNormal3f( -0.486860965909194,-0.865740300014929,0.116017812442865 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);
    OpenGL::glTexCoord2f(0.936661,0.452705); OpenGL::glVertex3f(0.26655253+$x,-0.30367791+$y,0.11626137+$z);

    OpenGL::glNormal3f( -0.787882107434573,-0.603165694357363,-0.124229344097343 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);

    OpenGL::glNormal3f( -0.875832947226118,0.450285239280654,-0.17366592020076 );
    OpenGL::glTexCoord2f(0.939464,0.449606); OpenGL::glVertex3f(0.2658629+$x,-0.30352794+$y,0.11448648+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);

    OpenGL::glNormal3f( 0.445352307932366,0.879222124230961,-0.169203363093383 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27853886+$x,-0.29092672+$y,0.10964362+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);
    OpenGL::glTexCoord2f(0.901134,0.467276); OpenGL::glVertex3f(0.27587841+$x,-0.28872189+$y,0.11409801+$z);

    OpenGL::glNormal3f( 0.390456759012071,0.913201105190322,0.116650164256048 );
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27853886+$x,-0.29092672+$y,0.10964362+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);

    OpenGL::glNormal3f( 0.775092860355971,-0.458029119353513,-0.435247497005376 );
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.899799,0.456066); OpenGL::glVertex3f(0.27853886+$x,-0.29092672+$y,0.10964362+$z);

    OpenGL::glNormal3f( 0.775913605710004,-0.500957833217815,-0.383404911042899 );
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);

    OpenGL::glNormal3f( 0.684286686782121,-0.613044324271458,-0.394877685836133 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26801356+$x,-0.29782792+$y,0.097224381+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);

    OpenGL::glNormal3f( 0.664583872102298,-0.628399878772945,-0.404279444567325 );
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26395404+$x,-0.30293774+$y,0.098493599+$z);
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26801356+$x,-0.29782792+$y,0.097224381+$z);

    OpenGL::glNormal3f( -0.82753318085483,-0.526122474532559,0.195918290049766 );
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26395404+$x,-0.30293774+$y,0.098493599+$z);
    OpenGL::glTexCoord2f(0.93291,0.440141); OpenGL::glVertex3f(0.26817556+$x,-0.30550662+$y,0.10942623+$z);

    OpenGL::glNormal3f( -0.773086439258718,0.281327582425684,0.568499910994537 );
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);

    OpenGL::glNormal3f( -0.744670376143089,0.452446602839009,0.490671073606699 );
    OpenGL::glTexCoord2f(0.97096,0.431379); OpenGL::glVertex3f(0.27222843+$x,-0.29373653+$y,0.10956846+$z);
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);

    OpenGL::glNormal3f( -0.60242090993761,0.630846653806042,0.489000558948211 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.880141,0.468254); OpenGL::glVertex3f(0.27222843+$x,-0.29373653+$y,0.10956846+$z);

    OpenGL::glNormal3f( -0.648208481488443,0.521784013145923,0.55458742155929 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27173873+$x,-0.28632613+$y,0.10086409+$z);
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);

    OpenGL::glNormal3f( 0.532725696840242,0.842731185321324,0.0775079429026136 );
    OpenGL::glTexCoord2f(0.893197,0.45668); OpenGL::glVertex3f(0.27595636+$x,-0.28974117+$y,0.10900675+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27173873+$x,-0.28632613+$y,0.10086409+$z);

    OpenGL::glNormal3f( -0.162993363595812,-0.526232725367673,0.834573113738895 );
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26951953+$x,-0.27977774+$y,0.11687219+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.26731771+$x,-0.28004326+$y,0.11627475+$z);

    OpenGL::glNormal3f( 0.526918840376499,-0.129415971423964,0.840004786889145 );
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26951953+$x,-0.27977774+$y,0.11687219+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27192284+$x,-0.27791717+$y,0.11565129+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);

    OpenGL::glNormal3f( -0.737889673932987,0.0192780562936674,0.674645970601329 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.26346673+$x,-0.27342018+$y,0.1123384+$z);

    OpenGL::glNormal3f( -0.305920699670911,-0.92429226836586,-0.228246200739361 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27051776+$x,-0.28048955+$y,0.11379296+$z);
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.26731771+$x,-0.28004326+$y,0.11627475+$z);

    OpenGL::glNormal3f( -0.598739325033869,-0.774133668671364,0.205495215728743 );
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);

    OpenGL::glNormal3f( 0.320470027180946,0.857824438781016,0.401791231746885 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.26346673+$x,-0.27342018+$y,0.1123384+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);

    OpenGL::glNormal3f( -0.723954912566987,0.0214104152603779,0.689514959002707 );
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.26346673+$x,-0.27342018+$y,0.1123384+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);

    OpenGL::glNormal3f( 0.846415109827385,-0.0226188341032059,-0.532043090547849 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27192284+$x,-0.27791717+$y,0.11565129+$z);
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);

    OpenGL::glNormal3f( 0.245313355452815,0.920310674943497,0.304712354888224 );
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.26346673+$x,-0.27342018+$y,0.1123384+$z);

    OpenGL::glNormal3f( -0.30249753075782,-0.921457039986653,-0.243746112470451 );
    OpenGL::glTexCoord2f(0.805074,0.426772); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27051776+$x,-0.28048955+$y,0.11379296+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);

    OpenGL::glNormal3f( 0.846021523784418,-0.0814812293807925,-0.526885557357654 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27192284+$x,-0.27791717+$y,0.11565129+$z);
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.27051776+$x,-0.28048955+$y,0.11379296+$z);

    OpenGL::glNormal3f( 0.921652503930423,-0.0108775548715167,-0.387863817336445 );
    OpenGL::glTexCoord2f(0.839583,0.42282); OpenGL::glVertex3f(0.26791615+$x,-0.27844691+$y,0.10929966+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);

    OpenGL::glNormal3f( -0.730380053308578,-0.125430264425674,0.671425518203668 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.26731771+$x,-0.28004326+$y,0.11627475+$z);
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);
    OpenGL::glTexCoord2f(0.813555,0.418242); OpenGL::glVertex3f(0.26372478+$x,-0.27798393+$y,0.11275105+$z);

    OpenGL::glNormal3f( 0.0515509974097241,-0.969214611068111,0.240760321394855 );
    OpenGL::glTexCoord2f(0.818783,0.426149); OpenGL::glVertex3f(0.26731771+$x,-0.28004326+$y,0.11627475+$z);
    OpenGL::glTexCoord2f(0.814848,0.433907); OpenGL::glVertex3f(0.27051776+$x,-0.28048955+$y,0.11379296+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26951953+$x,-0.27977774+$y,0.11687219+$z);

    OpenGL::glNormal3f( 0.274103444556555,0.869627653213429,0.410627625043343 );
    OpenGL::glTexCoord2f(0.822225,0.424901); OpenGL::glVertex3f(0.26840572+$x,-0.27785487+$y,0.11786711+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27192284+$x,-0.27791717+$y,0.11565129+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);

    OpenGL::glNormal3f( 0.678823635305102,-0.635967034118888,0.36707547407201 );
    OpenGL::glTexCoord2f(0.830874,0.431761); OpenGL::glVertex3f(0.27051776+$x,-0.28048955+$y,0.11379296+$z);
    OpenGL::glTexCoord2f(0.827376,0.426744); OpenGL::glVertex3f(0.27192284+$x,-0.27791717+$y,0.11565129+$z);
    OpenGL::glTexCoord2f(0.822778,0.430757); OpenGL::glVertex3f(0.26951953+$x,-0.27977774+$y,0.11687219+$z);

    OpenGL::glNormal3f( 0.912362130489106,0.407710198776505,-0.036982923937984 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25253954+$x,-0.27254412+$y,0.103609+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);
    OpenGL::glTexCoord2f(0.816489,0.344658); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);

    OpenGL::glNormal3f( -0.138282931840187,0.988389455253457,0.0629612222360446 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25253954+$x,-0.27254412+$y,0.103609+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);

    OpenGL::glNormal3f( -0.291976861929193,0.482940717514959,0.825540898722842 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25253954+$x,-0.27254412+$y,0.103609+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);

    OpenGL::glNormal3f( -0.274031734677137,0.508171281853815,0.816497738324418 );
    OpenGL::glTexCoord2f(0.818909,0.360997); OpenGL::glVertex3f(0.25253954+$x,-0.27254412+$y,0.103609+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);

    OpenGL::glNormal3f( 0.219405361772769,0.889523205320493,-0.400761468234804 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);

    OpenGL::glNormal3f( 0.41695053124278,0.0368066591736033,-0.908183640205461 );
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.831242,0.339277); OpenGL::glVertex3f(0.25049938+$x,-0.26782704+$y,0.097958363+$z);

    OpenGL::glNormal3f( 0.473071212365023,0.851065935213436,-0.227794648643832 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);
    OpenGL::glTexCoord2f(0.83243,0.414334); OpenGL::glVertex3f(0.26782422+$x,-0.27345691+$y,0.10894127+$z);

    OpenGL::glNormal3f( 0.308912003855154,0.31647886361208,-0.896891578041069 );
    OpenGL::glTexCoord2f(0.841467,0.402667); OpenGL::glVertex3f(0.26511689+$x,-0.27367231+$y,0.10251408+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);

    OpenGL::glNormal3f( -0.670647574707662,0.667583046183355,0.323364665644353 );
    OpenGL::glTexCoord2f(0.828331,0.399863); OpenGL::glVertex3f(0.26276214+$x,-0.27129777+$y,0.10649541+$z);
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.821891,0.412361); OpenGL::glVertex3f(0.26346673+$x,-0.27342018+$y,0.1123384+$z);

    OpenGL::glNormal3f( 0.218044974890804,0.17291790010208,-0.960497677638606 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.839708,0.354437); OpenGL::glVertex3f(0.25221195+$x,-0.27226862+$y,0.098564603+$z);

    OpenGL::glNormal3f( 0.0448538590578315,0.248843211012286,-0.96750461893508 );
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);

    OpenGL::glNormal3f( 0.194647611498274,-0.241590696594552,0.950655690908636 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.794126,0.416689); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);

    OpenGL::glNormal3f( -0.160728544606324,-0.441064055528331,0.88296593018623 );
    OpenGL::glTexCoord2f(0.811739,0.396842); OpenGL::glVertex3f(0.25900401+$x,-0.27566756+$y,0.10772256+$z);
    OpenGL::glTexCoord2f(0.797972,0.367395); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.765431,0.427273); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);

    OpenGL::glNormal3f( -0.59953696494448,0.555265577527801,0.576398790836587 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);
    OpenGL::glTexCoord2f(0.952963,0.434202); OpenGL::glVertex3f(0.26940259+$x,-0.29849985+$y,0.10967205+$z);

    OpenGL::glNormal3f( 0.141641191669752,-0.0332843283903697,0.989358340696623 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);

    OpenGL::glNormal3f( 0.144873042263766,-0.0253505857253186,0.98912544676023 );
    OpenGL::glTexCoord2f(0.965829,0.404151); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);

    OpenGL::glNormal3f( 0.467628625337189,-0.118299096191721,0.875973054725699 );
    OpenGL::glTexCoord2f(0.865453,0.445571); OpenGL::glVertex3f(0.26875856+$x,-0.29104236+$y,0.1018181+$z);
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27173873+$x,-0.28632613+$y,0.10086409+$z);
    OpenGL::glTexCoord2f(0.853025,0.415047); OpenGL::glVertex3f(0.26517836+$x,-0.28114831+$y,0.10506553+$z);

    OpenGL::glNormal3f( -0.756672602063927,0.296544744114943,0.582672968330958 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26161111+$x,-0.30144149+$y,0.10082385+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);

    OpenGL::glNormal3f( 0.0325850688468898,-0.0833417775761025,0.995988133161585 );
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24223845+$x,-0.28650682+$y,0.10370285+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.24611299+$x,-0.29187313+$y,0.10312705+$z);

    OpenGL::glNormal3f( 0.752242379263017,-0.526041611016672,-0.396751340665284 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26801356+$x,-0.29782792+$y,0.097224381+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);
    OpenGL::glTexCoord2f(0.921469,0.445317); OpenGL::glVertex3f(0.27256987+$x,-0.30110707+$y,0.1102109+$z);

    OpenGL::glNormal3f( -0.0518705325164239,-0.0868315996314989,-0.994871710906435 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26801356+$x,-0.29782792+$y,0.097224381+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);

    OpenGL::glNormal3f( -0.103160369934026,-0.161815275898497,-0.981414160566765 );
    OpenGL::glTexCoord2f(0.909802,0.419117); OpenGL::glVertex3f(0.26801356+$x,-0.29782792+$y,0.097224381+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26395404+$x,-0.30293774+$y,0.098493599+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);

    OpenGL::glNormal3f( 0.234783617280574,0.358873994201964,-0.903374844315568 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);

    OpenGL::glNormal3f( 0.858157731030207,-0.353043852542071,-0.372726906535254 );
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.910939,0.450268); OpenGL::glVertex3f(0.27577825+$x,-0.2961392+$y,0.11021281+$z);

    OpenGL::glNormal3f( -0.0172668770305461,0.000280272064019948,-0.999850877083769 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);
    OpenGL::glTexCoord2f(0.862041,0.349058); OpenGL::glVertex3f(0.24921796+$x,-0.27724977+$y,0.096988176+$z);
    OpenGL::glTexCoord2f(0.897734,0.424584); OpenGL::glVertex3f(0.27129631+$x,-0.29266459+$y,0.096602574+$z);

    OpenGL::glNormal3f( 0.164257504813471,-0.542343720971031,-0.823943420652018 );
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24526588+$x,-0.2822986+$y,0.097055011+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24249182+$x,-0.28665523+$y,0.099369649+$z);
    OpenGL::glTexCoord2f(0.902297,0.314408); OpenGL::glVertex3f(0.23735935+$x,-0.28686961+$y,0.098487575+$z);

    OpenGL::glNormal3f( 0.221788330991659,-0.0742566967000304,0.972263276706024 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);
    OpenGL::glTexCoord2f(0.958514,0.329857); OpenGL::glVertex3f(0.24862785+$x,-0.27708803+$y,0.1051242+$z);
    OpenGL::glTexCoord2f(0.950401,0.31691); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);

    OpenGL::glNormal3f( -0.0534893953218878,-0.294324302778737,0.954207571433967 );
    OpenGL::glTexCoord2f(0.939999,0.329352); OpenGL::glVertex3f(0.24582661+$x,-0.28159521+$y,0.10541897+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24223845+$x,-0.28650682+$y,0.10370285+$z);
    OpenGL::glTexCoord2f(0.947684,0.406919); OpenGL::glVertex3f(0.2650044+$x,-0.29549815+$y,0.10220566+$z);

    OpenGL::glNormal3f( 0.589226602163578,0.795017023840209,0.144083111803642 );
    OpenGL::glTexCoord2f(0.878243,0.431704); OpenGL::glVertex3f(0.27173873+$x,-0.28632613+$y,0.10086409+$z);
    OpenGL::glTexCoord2f(0.886397,0.430437); OpenGL::glVertex3f(0.27404119+$x,-0.287523+$y,0.09805225+$z);
    OpenGL::glTexCoord2f(0.858074,0.399042); OpenGL::glVertex3f(0.26250497+$x,-0.27926112+$y,0.099642391+$z);

    OpenGL::glNormal3f( -0.48442339813992,-0.871805571197834,0.0727256307156669 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26161111+$x,-0.30144149+$y,0.10082385+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26395404+$x,-0.30293774+$y,0.098493599+$z);
    OpenGL::glTexCoord2f(0.936304,0.4368); OpenGL::glVertex3f(0.26689145+$x,-0.30370732+$y,0.10883419+$z);

    OpenGL::glNormal3f( -0.525248710214185,-0.850948396056723,0.000787189192713592 );
    OpenGL::glTexCoord2f(0.929538,0.408809); OpenGL::glVertex3f(0.26161111+$x,-0.30144149+$y,0.10082385+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.24611299+$x,-0.29187313+$y,0.10312705+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24678426+$x,-0.29229111+$y,0.099194439+$z);

    OpenGL::glNormal3f( -0.0407842241029768,0,-0.999167977401354 );
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26395404+$x,-0.30293774+$y,0.098493599+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24678426+$x,-0.29229111+$y,0.099194439+$z);
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24249182+$x,-0.28665523+$y,0.099369649+$z);

    OpenGL::glNormal3f( 0.0345848661724295,-0.998744894359869,0.0362287595968995 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24249182+$x,-0.28665523+$y,0.099369649+$z);
    OpenGL::glTexCoord2f(0.918647,0.326933); OpenGL::glVertex3f(0.24223845+$x,-0.28650682+$y,0.10370285+$z);
    OpenGL::glTexCoord2f(0.915163,0.312139); OpenGL::glVertex3f(0.23746844+$x,-0.28665953+$y,0.10404655+$z);

    OpenGL::glNormal3f( -0.794570373282516,-0.602942306511795,-0.0715436714176742 );
    OpenGL::glTexCoord2f(0.904356,0.331005); OpenGL::glVertex3f(0.24249182+$x,-0.28665523+$y,0.099369649+$z);
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24678426+$x,-0.29229111+$y,0.099194439+$z);
    OpenGL::glTexCoord2f(0.9208252,0.3433082); OpenGL::glVertex3f(0.24611299+$x,-0.29187313+$y,0.10312705+$z);

    OpenGL::glNormal3f( 0.844720741061456,-0.5340147266246,0.035709121644731 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);
    OpenGL::glTexCoord2f(0.882297,0.284235); OpenGL::glVertex3f(0.24402583+$x,-0.27739459+$y,0.096178138+$z);

    OpenGL::glNormal3f( -0.270680185975012,-0.327678015316048,-0.905184707780168 );
    OpenGL::glTexCoord2f(0.924678,0.295114); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);

    OpenGL::glNormal3f( 0.625093724350871,-0.780516252843962,0.00722598253369304 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);
    OpenGL::glTexCoord2f(0.851447,0.263599); OpenGL::glVertex3f(0.25034079+$x,-0.26756398+$y,0.1042687+$z);

    OpenGL::glNormal3f( 0.542867500182193,0.839804433127316,-0.00483646003225324 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);

    OpenGL::glNormal3f( 0.605375291634607,0.795622930588313,0.0224701713473634 );
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24724202+$x,-0.25968959+$y,0.092750364+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);

    OpenGL::glNormal3f( -0.539512734407503,-0.841942732326252,0.00764492610458591 );
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23558576+$x,-0.29106057+$y,0.1159041+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);

    OpenGL::glNormal3f( 0.79222313940267,-0.605562337988457,-0.0753442247616288 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24452731+$x,-0.27783102+$y,0.12368329+$z);
    OpenGL::glTexCoord2f(0.829597,0.291772); OpenGL::glVertex3f(0.24333896+$x,-0.27722535+$y,0.10632019+$z);

    OpenGL::glNormal3f( 0.238135689687107,0.360995324395274,0.901650580359153 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24452731+$x,-0.27783102+$y,0.12368329+$z);

    OpenGL::glNormal3f( 0.245912668639129,0.349157210617758,0.904221323391795 );
    OpenGL::glTexCoord2f(0.832953,0.249176); OpenGL::glVertex3f(0.25389444+$x,-0.26461013+$y,0.11591606+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);

    OpenGL::glNormal3f( 0.213769359931465,0.356609785028223,-0.909468043405933 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24724202+$x,-0.25968959+$y,0.092750364+$z);
    OpenGL::glTexCoord2f(0.872927,0.253021); OpenGL::glVertex3f(0.25395146+$x,-0.26478282+$y,0.092330313+$z);

    OpenGL::glNormal3f( -0.234411142682609,-0.382174350057358,-0.893864744994717 );
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23781083+$x,-0.27349806+$y,0.084753214+$z);

    OpenGL::glNormal3f( -0.24357207917984,-0.363995011933225,0.898988472413157 );
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24452731+$x,-0.27783102+$y,0.12368329+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);
    OpenGL::glTexCoord2f(0.791788,0.272175); OpenGL::glVertex3f(0.23558576+$x,-0.29106057+$y,0.1159041+$z);

    OpenGL::glNormal3f( -0.258052956622102,-0.341757145488995,0.903665162040567 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);
    OpenGL::glTexCoord2f(0.80995,0.256477); OpenGL::glVertex3f(0.24452731+$x,-0.27783102+$y,0.12368329+$z);

    OpenGL::glNormal3f( -0.20322220218075,-0.380409843667277,0.902213437819369 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);

    OpenGL::glNormal3f( -0.127452673509234,0.0967887186337204,0.98711081442794 );
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22781284+$x,-0.24812273+$y,0.11976352+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);

    OpenGL::glNormal3f( 0.258281743158795,0.345980083877784,-0.901991309664775 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23781083+$x,-0.27349806+$y,0.084753214+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24724202+$x,-0.25968959+$y,0.092750364+$z);
    OpenGL::glTexCoord2f(0.898911,0.265308); OpenGL::glVertex3f(0.24422314+$x,-0.27783491+$y,0.084925853+$z);

    OpenGL::glNormal3f( 0.361696780634141,0.269795418497813,-0.89240454449565 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23781083+$x,-0.27349806+$y,0.084753214+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24724202+$x,-0.25968959+$y,0.092750364+$z);

    OpenGL::glNormal3f( -0.138521173625324,0.0998235841639987,-0.985315754721356 );
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23781083+$x,-0.27349806+$y,0.084753214+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);

    OpenGL::glNormal3f( -0.588742254390784,-0.808208367422889,-0.0134830531588941 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);
    OpenGL::glTexCoord2f(0.766151,0.320006); OpenGL::glVertex3f(0.23546205+$x,-0.29119488+$y,0.092382035+$z);

    OpenGL::glNormal3f( -0.769437648466863,-0.638543289148229,-0.0151053965702862 );
    OpenGL::glTexCoord2f(0.78051,0.262664); OpenGL::glVertex3f(0.2285727+$x,-0.28656737+$y,0.11582325+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);

    OpenGL::glNormal3f( 0.347099673229459,0.27728768004819,0.895898074190081 );
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22781284+$x,-0.24812273+$y,0.11976352+$z);
    OpenGL::glTexCoord2f(0.803982,0.244361); OpenGL::glVertex3f(0.23812349+$x,-0.27330985+$y,0.12356446+$z);

    OpenGL::glNormal3f( 0.529684616067148,0.847902858201889,0.0222474842367475 );
    OpenGL::glTexCoord2f(0.87717,0.238396); OpenGL::glVertex3f(0.24724202+$x,-0.25968959+$y,0.092750364+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);

    OpenGL::glNormal3f( -0.212736988827991,-0.396573394260019,-0.893013167063894 );
    OpenGL::glTexCoord2f(0.940278,0.27911); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);
    OpenGL::glTexCoord2f(0.907715,0.252479); OpenGL::glVertex3f(0.23781083+$x,-0.27349806+$y,0.084753214+$z);

    OpenGL::glNormal3f( -0.749505302145994,-0.661907025617442,0.0109950667716181 );
    OpenGL::glTexCoord2f(0.74706,0.306639); OpenGL::glVertex3f(0.22891232+$x,-0.28642759+$y,0.092614856+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);

    OpenGL::glNormal3f( 0.533613715171439,0.845525631482836,0.0185151150816136 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22781284+$x,-0.24812273+$y,0.11976352+$z);
    OpenGL::glTexCoord2f(0.832552,0.234676); OpenGL::glVertex3f(0.24689883+$x,-0.26008712+$y,0.11607207+$z);

    OpenGL::glNormal3f( 0.772895320910891,0.634212189145271,0.0201921285062694 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22781284+$x,-0.24812273+$y,0.11976352+$z);

    OpenGL::glNormal3f( 0.741260675274858,0.671207354049533,-0.00364680145967556 );
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);

    OpenGL::glNormal3f( -0.157651453428373,0.112977233241348,-0.98101078689332 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);
    OpenGL::glTexCoord2f(0.896866,0.188001); OpenGL::glVertex3f(0.22833852+$x,-0.24777407+$y,0.088691014+$z);

    OpenGL::glNormal3f( -0.19270609259553,0.11835573408872,-0.974092542875102 );
    OpenGL::glTexCoord2f(0.957354,0.21896); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(0.19229919+$x,-0.25087996+$y,0.09503206+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);

    OpenGL::glNormal3f( -0.203122113252778,0.106596304596136,0.973333773663574 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19208477+$x,-0.25117475+$y,0.11352395+$z);

    OpenGL::glNormal3f( -0.649122618290921,-0.760593821660132,0.011698926257313 );
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19229919+$x,-0.25087996+$y,0.09503206+$z);
    OpenGL::glTexCoord2f(0.699601,0.262747); OpenGL::glVertex3f(0.21360859+$x,-0.26916531+$y,0.088594656+$z);

    OpenGL::glNormal3f( -0.124561886347099,0.0948280253565163,0.987669976296048 );
    OpenGL::glTexCoord2f(0.813758,0.189015); OpenGL::glVertex3f(0.22781284+$x,-0.24812273+$y,0.11976352+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);

    OpenGL::glNormal3f( -0.627485690615737,-0.778379231430181,-0.019684515504642 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19208477+$x,-0.25117475+$y,0.11352395+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19229919+$x,-0.25087996+$y,0.09503206+$z);
    OpenGL::glTexCoord2f(0.760683,0.221396); OpenGL::glVertex3f(0.21374697+$x,-0.26880074+$y,0.11997491+$z);

    OpenGL::glNormal3f( -0.995770640082724,0.0913181966048828,-0.0100905558852776 );
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19208477+$x,-0.25117475+$y,0.11352395+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);
    OpenGL::glTexCoord2f(0.679501,0.188379); OpenGL::glVertex3f(0.19229919+$x,-0.25087996+$y,0.09503206+$z);

    OpenGL::glNormal3f( -0.0769126534939342,-0.139892780831783,0.987174986313811 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19208477+$x,-0.25117475+$y,0.11352395+$z);

    OpenGL::glNormal3f( -0.007304755764934,-0.0923090841744265,0.995703607265783 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);

    OpenGL::glNormal3f( 0.98499411245697,-0.155383549984388,-0.0751169143359565 );
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);
    OpenGL::glTexCoord2f(0.808988,0.029422); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);

    OpenGL::glNormal3f( 0.995836473210668,-0.0910231329432481,0.00495054467044108 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);
    OpenGL::glTexCoord2f(0.808285,0.143947); OpenGL::glVertex3f(0.21891401+$x,-0.2372089+$y,0.11759337+$z);

    OpenGL::glNormal3f( -0.018391868865018,-0.0789989290379476,-0.996705025757626 );
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);
    OpenGL::glTexCoord2f(0.895129,0.032726); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);

    OpenGL::glNormal3f( -0.0778752803674261,-0.114871258343517,-0.990323197099953 );
    OpenGL::glTexCoord2f(0.987175,0.161027); OpenGL::glVertex3f(0.19229919+$x,-0.25087996+$y,0.09503206+$z);
    OpenGL::glTexCoord2f(0.956553,0.031526); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);
    OpenGL::glTexCoord2f(0.897591,0.144656); OpenGL::glVertex3f(0.21902057+$x,-0.23746903+$y,0.091375208+$z);

    OpenGL::glNormal3f( 0.00698869046987904,-0.179965692800756,-0.9836480608532 );
    OpenGL::glTexCoord2f(0.236033,0.645849); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);
    OpenGL::glTexCoord2f(0.475037,0.544954); OpenGL::glVertex3f(0.19336347+$x,-0.28346854+$y,0.13562816+$z);

    OpenGL::glNormal3f( -0.99519010631107,0.0569403614929495,-0.0797147886757181 );
    OpenGL::glTexCoord2f(0.725615,0.036217); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.630466,0.053895); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);
    OpenGL::glTexCoord2f(0.723619,0.171849); OpenGL::glVertex3f(0.19208477+$x,-0.25117475+$y,0.11352395+$z);

    OpenGL::glNormal3f( 0.167220341619055,-0.985912064292313,-0.00384172248816269 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19422377+$x,-0.20169253+$y,0.085933454+$z);
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);

    OpenGL::glNormal3f( -0.995513995331358,0.0945496945340455,0.00349862300261252 );
    OpenGL::glTexCoord2f(0.032484,0.733101); OpenGL::glVertex3f(0.19433486+$x,-0.20180914+$y,0.12069487+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19422377+$x,-0.20169253+$y,0.085933454+$z);

    OpenGL::glNormal3f( 0.909725894811109,-0.0896123957403162,-0.405423747256877 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);

    OpenGL::glNormal3f( 0.90715460637412,-0.117491571654246,-0.404062186704509 );
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);

    OpenGL::glNormal3f( 0.886383623531802,-0.0629907650940528,-0.458646089536909 );
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.559982,0.703643); OpenGL::glVertex3f(0.23935864+$x,-0.28360778+$y,0.16673705+$z);
    OpenGL::glTexCoord2f(0.508998,0.619936); OpenGL::glVertex3f(0.2231777+$x,-0.28358661+$y,0.13546271+$z);

    OpenGL::glNormal3f( 0.897421917565913,0.161653267528675,-0.410490100939868 );
    OpenGL::glTexCoord2f(0.282494,0.159876); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);
    OpenGL::glTexCoord2f(0.269807,0.122429); OpenGL::glVertex3f(0.24941083+$x,-0.20130148+$y,0.17601069+$z);

    OpenGL::glNormal3f( 0.977269575830896,0.211947888545068,0.00471897198420776 );
    OpenGL::glTexCoord2f(0.362422,0.85694); OpenGL::glVertex3f(0.24525286+$x,-0.20148256+$y,0.16684914+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);

    OpenGL::glNormal3f( -0.438899926013578,0.881406321266445,-0.174613148923065 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);
    OpenGL::glTexCoord2f(0.097058,0.90907); OpenGL::glVertex3f(0.18213177+$x,-0.17064596+$y,0.14321915+$z);

    OpenGL::glNormal3f( 0.0305484540078225,0.886546395547701,-0.461630025560633 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22168445+$x,-0.17114241+$y,0.10639525+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);

    OpenGL::glNormal3f( 0.435944007144943,0.874371012139432,-0.213138818061551 );
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22168445+$x,-0.17114241+$y,0.10639525+$z);

    OpenGL::glNormal3f( -0.03014517301045,0.996182841360915,-0.081920785654586 );
    OpenGL::glTexCoord2f(0.195808,0.996522); OpenGL::glVertex3f(0.2002536+$x,-0.15615738+$y,0.17964877+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);

    OpenGL::glNormal3f( 0.0876738225729624,-0.996030810165842,-0.015359883978128 );
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22466908+$x,-0.20129788+$y,0.085658157+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);

    OpenGL::glNormal3f( -0.00894353969115362,-0.98780123241795,0.155462980581783 );
    OpenGL::glTexCoord2f(0.078629,0.717748); OpenGL::glVertex3f(0.19691275+$x,-0.20124806+$y,0.088912279+$z);
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19422377+$x,-0.20169253+$y,0.085933454+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);

    OpenGL::glNormal3f( 0.0122109767673354,-0.996832935179377,-0.0785811134309938 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19422377+$x,-0.20169253+$y,0.085933454+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22466908+$x,-0.20129788+$y,0.085658157+$z);
    OpenGL::glTexCoord2f(0.110989,0.690951); OpenGL::glVertex3f(0.22231833+$x,-0.20154812+$y,0.088467261+$z);

    OpenGL::glNormal3f( -0.0146295950583904,0.542846753534183,-0.839704339113372 );
    OpenGL::glTexCoord2f(0.081935,0.72282); OpenGL::glVertex3f(0.19422377+$x,-0.20169253+$y,0.085933454+$z);
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22466908+$x,-0.20129788+$y,0.085658157+$z);

    OpenGL::glNormal3f( 0.995089371733684,0.0989779577111653,-0.000711442190225225 );
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22466908+$x,-0.20129788+$y,0.085658157+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22168445+$x,-0.17114241+$y,0.10639525+$z);
    OpenGL::glTexCoord2f(0.161387,0.644271); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);

    OpenGL::glNormal3f( 0.0267534243156445,0.568219036081162,-0.82244232704937 );
    OpenGL::glTexCoord2f(0.097751,0.78839); OpenGL::glVertex3f(0.19725951+$x,-0.17047405+$y,0.10606249+$z);
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22168445+$x,-0.17114241+$y,0.10639525+$z);
    OpenGL::glTexCoord2f(0.1158,0.698465); OpenGL::glVertex3f(0.22466908+$x,-0.20129788+$y,0.085658157+$z);

    OpenGL::glNormal3f( 0.902912741451457,-0.106849579501234,-0.416331296787815 );
    OpenGL::glTexCoord2f(0.17087,0.759872); OpenGL::glVertex3f(0.22168445+$x,-0.17114241+$y,0.10639525+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.275522,0.733037); OpenGL::glVertex3f(0.22474768+$x,-0.20183467+$y,0.12091562+$z);

    OpenGL::glNormal3f( 0.908504726787064,0.371803848683901,0.190738196251829 );
    OpenGL::glTexCoord2f(0.087071,0.19858); OpenGL::glVertex3f(0.23779949+$x,-0.13799327+$y,0.17462017+$z);
    OpenGL::glTexCoord2f(0.102179,0.173903); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.139641,0.178015); OpenGL::glVertex3f(0.24501611+$x,-0.15519407+$y,0.17377603+$z);

    OpenGL::glNormal3f( 0.897498195033451,-0.334867093641638,-0.286986096366532 );
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23779949+$x,-0.13799327+$y,0.17462017+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);

    OpenGL::glNormal3f( 0.149147785766972,-0.0766249962760042,-0.985841543021246 );
    OpenGL::glTexCoord2f(0.46882,0.324498); OpenGL::glVertex3f(0.21792151+$x,-0.13277427+$y,0.16572214+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);
    OpenGL::glTexCoord2f(0.472818,0.295409); OpenGL::glVertex3f(0.22886482+$x,-0.1314429+$y,0.16727427+$z);

    OpenGL::glNormal3f( 0.60494811342005,-0.53795154247569,0.587065514246536 );
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(0.21792151+$x,-0.13277427+$y,0.16572214+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);
    OpenGL::glTexCoord2f(0.498678,0.081409); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);

    OpenGL::glNormal3f( 0.258608950646381,-0.0722836267041747,0.963273838509107 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);
    OpenGL::glTexCoord2f(0.481876,0.111985); OpenGL::glVertex3f(0.21792151+$x,-0.13277427+$y,0.16572214+$z);

    OpenGL::glNormal3f( 0.679464271907078,-0.183895743548847,-0.710289137398567 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21636963+$x,-0.13993154+$y,0.15893867+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);

    OpenGL::glNormal3f( -0.471813342169021,-0.4246426243064,-0.772703573030093 );
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);
    OpenGL::glTexCoord2f(0.486223,0.161684); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);
    OpenGL::glTexCoord2f(0.52325,0.180832); OpenGL::glVertex3f(0.20031287+$x,-0.15252725+$y,0.17966292+$z);

    OpenGL::glNormal3f( 0.592406008579179,0.14248015471598,-0.792940430619725 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);

    OpenGL::glNormal3f( 0.570379522331544,0.328886953455903,-0.752662322925317 );
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.432926,0.238482); OpenGL::glVertex3f(0.23974632+$x,-0.10853022+$y,0.17865082+$z);

    OpenGL::glNormal3f( 0.436772959514251,-0.899152241598595,0.0274704980913054 );
    OpenGL::glTexCoord2f(0.510749,0.211823); OpenGL::glVertex3f(0.24622697+$x,-0.13261923+$y,0.18577851+$z);
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.24751335+$x,-0.1319675+$y,0.18665758+$z);
    OpenGL::glTexCoord2f(0.497953,0.222083); OpenGL::glVertex3f(0.24651707+$x,-0.13231628+$y,0.19108203+$z);

    OpenGL::glNormal3f( 0.530547462267722,0.0897249164845151,-0.842893130618067 );
    OpenGL::glTexCoord2f(0.497227,0.221501); OpenGL::glVertex3f(0.24622697+$x,-0.13261923+$y,0.18577851+$z);
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.24751335+$x,-0.1319675+$y,0.18665758+$z);

    OpenGL::glNormal3f( 0.903837228887187,0.424724278892953,-0.0518415913759591 );
    OpenGL::glTexCoord2f(0.506195,0.211116); OpenGL::glVertex3f(0.24751335+$x,-0.1319675+$y,0.18665758+$z);
    OpenGL::glTexCoord2f(0.495486,0.199903); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.499096,0.216908); OpenGL::glVertex3f(0.24780602+$x,-0.132095+$y,0.19071559+$z);

    OpenGL::glNormal3f( 0.398832953923074,0.911508303309476,-0.100423542373665 );
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);

    OpenGL::glNormal3f( 0.962748986867813,0.0285571124219876,-0.268884509808798 );
    OpenGL::glTexCoord2f(0.510973,0.246935); OpenGL::glVertex3f(0.2400911+$x,-0.13685666+$y,0.18361704+$z);
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);

    OpenGL::glNormal3f( 0.970871300752191,0.0795889091017016,-0.225996732108564 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);
    OpenGL::glTexCoord2f(0.523272,0.272322); OpenGL::glVertex3f(0.23960847+$x,-0.14511382+$y,0.17988383+$z);
    OpenGL::glTexCoord2f(0.499041,0.272254); OpenGL::glVertex3f(0.23779949+$x,-0.13799327+$y,0.17462017+$z);

    OpenGL::glNormal3f( 0.988129942743646,-0.153249488250642,-0.010668205301486 );
    OpenGL::glTexCoord2f(0.510431,0.262939); OpenGL::glVertex3f(0.23907464+$x,-0.13897429+$y,0.17975267+$z);
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);
    OpenGL::glTexCoord2f(0.501715,0.239439); OpenGL::glVertex3f(0.24005278+$x,-0.13295569+$y,0.18389414+$z);

    OpenGL::glNormal3f( 0.389892677224319,0.411265651948123,-0.823920059092227 );
    OpenGL::glTexCoord2f(0.489314,0.213248); OpenGL::glVertex3f(0.24547808+$x,-0.12773774+$y,0.18582676+$z);
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);

    OpenGL::glNormal3f( 0.725247318281809,0.00267125443733969,-0.688483254498448 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);
    OpenGL::glTexCoord2f(0.471734,0.209806); OpenGL::glVertex3f(0.24247982+$x,-0.12218643+$y,0.18717891+$z);

    OpenGL::glNormal3f( 0.175343733275912,0.984490177213936,0.00580225560784499 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);

    OpenGL::glNormal3f( 0.412945750265207,0.00549205077108412,-0.910739065109339 );
    OpenGL::glTexCoord2f(0.478439,0.222513); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.23735404+$x,-0.122838+$y,0.18309014+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);

    OpenGL::glNormal3f( 0.683395528451951,0.301064250193067,-0.66507959594891 );
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);
    OpenGL::glTexCoord2f(0.474647,0.235935); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.474002,0.23214); OpenGL::glVertex3f(0.23735404+$x,-0.122838+$y,0.18309014+$z);

    OpenGL::glNormal3f( 0.964251587570701,-0.201947191193027,0.171569833702287 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);

    OpenGL::glNormal3f( 0.278590494844285,-0.958722722680913,0.0569041052799711 );
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);

    OpenGL::glNormal3f( 0.990033964698936,-0.0797398964895546,0.116078842388872 );
    OpenGL::glTexCoord2f(0.485443,0.261859); OpenGL::glVertex3f(0.24010796+$x,-0.1319674+$y,0.17480827+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);
    OpenGL::glTexCoord2f(0.482164,0.234032); OpenGL::glVertex3f(0.23953282+$x,-0.12563863+$y,0.18406115+$z);

    OpenGL::glNormal3f( 0.487823209580962,0.10270656219856,0.866879390847125 );
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23743046+$x,-0.12312796+$y,0.17706008+$z);
    OpenGL::glTexCoord2f(0.470952,0.242281); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);

    OpenGL::glNormal3f( 0.600624309806172,-0.0352321815964819,-0.79875473823309 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);

    OpenGL::glNormal3f( 0.627226578924759,0.0117127822710526,-0.778748758857319 );
    OpenGL::glTexCoord2f(0.441533,0.291149); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);
    OpenGL::glTexCoord2f(0.432926,0.294799); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.443154,0.23887); OpenGL::glVertex3f(0.24171479+$x,-0.11553975+$y,0.17707964+$z);

    OpenGL::glNormal3f( 0.379789595312881,-0.0540831486193199,0.923490593524102 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23743046+$x,-0.12312796+$y,0.17706008+$z);
    OpenGL::glTexCoord2f(0.471154,0.253063); OpenGL::glVertex3f(0.24051025+$x,-0.12576308+$y,0.17563918+$z);

    OpenGL::glNormal3f( 0.4796748662774,-0.19501864103275,0.855499709124145 );
    OpenGL::glTexCoord2f(0.454705,0.246699); OpenGL::glVertex3f(0.24102256+$x,-0.11995899+$y,0.1757684+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.467221,0.242035); OpenGL::glVertex3f(0.23743046+$x,-0.12312796+$y,0.17706008+$z);

    OpenGL::glNormal3f( 0.62781969671926,-0.446351996991216,-0.637661605550538 );
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.23743046+$x,-0.12312796+$y,0.17706008+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);

    OpenGL::glNormal3f( 0.521011798004357,0.409031843934522,-0.749159300141026 );
    OpenGL::glTexCoord2f(0.466877,0.184331); OpenGL::glVertex3f(0.23743046+$x,-0.12312796+$y,0.17706008+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);

    OpenGL::glNormal3f( 0.409870492436014,-0.602667331084726,0.684688445552772 );
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.23735404+$x,-0.122838+$y,0.18309014+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);

    OpenGL::glNormal3f( 0.68189073234618,-0.275540376278437,-0.67757105175821 );
    OpenGL::glTexCoord2f(0.472332,0.229352); OpenGL::glVertex3f(0.23735404+$x,-0.122838+$y,0.18309014+$z);
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.23702372+$x,-0.12126928+$y,0.18211978+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);

    OpenGL::glNormal3f( 0.540617100448512,-0.324327030431929,-0.776237803790727 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23886837+$x,-0.12408574+$y,0.17880376+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);

    OpenGL::glNormal3f( 0.981558076345824,-0.126086187820709,-0.143687215858357 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23921358+$x,-0.12409042+$y,0.18116607+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23886837+$x,-0.12408574+$y,0.17880376+$z);

    OpenGL::glNormal3f( 0.987795541283528,-0.0896885841714639,-0.127341770404291 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23909776+$x,-0.12177367+$y,0.17863593+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23921358+$x,-0.12409042+$y,0.18116607+$z);

    OpenGL::glNormal3f( 0.39995143142882,0.225906973345935,-0.888259473291288 );
    OpenGL::glTexCoord2f(0.46921,0.178487); OpenGL::glVertex3f(0.23896685+$x,-0.12277147+$y,0.17832322+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23909776+$x,-0.12177367+$y,0.17863593+$z);

    OpenGL::glNormal3f( 0.984549271549091,0.114699360797501,0.132313221277388 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23909776+$x,-0.12177367+$y,0.17863593+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23877346+$x,-0.1218126+$y,0.18108281+$z);

    OpenGL::glNormal3f( 0.326285240378683,-0.507364547121369,0.797570785720837 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23921358+$x,-0.12409042+$y,0.18116607+$z);

    OpenGL::glNormal3f( 0.615652591602061,0.504227799140573,0.605579237612651 );
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.23702372+$x,-0.12126928+$y,0.18211978+$z);
    OpenGL::glTexCoord2f(0.473521,0.165783); OpenGL::glVertex3f(0.23735404+$x,-0.122838+$y,0.18309014+$z);

    OpenGL::glNormal3f( 0.391179493252546,-0.917781893012916,0.0682275671287639 );
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23886837+$x,-0.12408574+$y,0.17880376+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.474323,0.184388); OpenGL::glVertex3f(0.23669118+$x,-0.12509508+$y,0.17770916+$z);

    OpenGL::glNormal3f( 0.947649234181226,0.255921870309961,0.190957914873373 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23921358+$x,-0.12409042+$y,0.18116607+$z);
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23909776+$x,-0.12177367+$y,0.17863593+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);

    OpenGL::glNormal3f( 0.25150610806638,-0.967082922655499,-0.0386690873101466 );
    OpenGL::glTexCoord2f(0.472793,0.17392); OpenGL::glVertex3f(0.23921358+$x,-0.12409042+$y,0.18116607+$z);
    OpenGL::glTexCoord2f(0.47895,0.171676); OpenGL::glVertex3f(0.23685781+$x,-0.12472546+$y,0.18172584+$z);
    OpenGL::glTexCoord2f(0.471911,0.177951); OpenGL::glVertex3f(0.23886837+$x,-0.12408574+$y,0.17880376+$z);

    OpenGL::glNormal3f( 0.555174484824742,0.435574208969136,0.708559383453846 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23877346+$x,-0.1218126+$y,0.18108281+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.23702372+$x,-0.12126928+$y,0.18211978+$z);
    OpenGL::glTexCoord2f(0.471189,0.171608); OpenGL::glVertex3f(0.2388259+$x,-0.1231972+$y,0.18189288+$z);

    OpenGL::glNormal3f( 0.319293171783206,0.946691541795951,0.0427433637495498 );
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23877346+$x,-0.1218126+$y,0.18108281+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.465934,0.165956); OpenGL::glVertex3f(0.23702372+$x,-0.12126928+$y,0.18211978+$z);

    OpenGL::glNormal3f( 0.300401416815873,0.952227883988843,0.0549640403277093 );
    OpenGL::glTexCoord2f(0.467631,0.176064); OpenGL::glVertex3f(0.23909776+$x,-0.12177367+$y,0.17863593+$z);
    OpenGL::glTexCoord2f(0.461451,0.17813); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.468469,0.172249); OpenGL::glVertex3f(0.23877346+$x,-0.1218126+$y,0.18108281+$z);

    OpenGL::glNormal3f( 0.514425996870227,-0.8553101290527,-0.0617290602870924 );
    OpenGL::glTexCoord2f(0.466981,0.230493); OpenGL::glVertex3f(0.23702372+$x,-0.12126928+$y,0.18211978+$z);
    OpenGL::glTexCoord2f(0.46452,0.238631); OpenGL::glVertex3f(0.23690037+$x,-0.1210342+$y,0.17783459+$z);
    OpenGL::glTexCoord2f(0.462263,0.22187); OpenGL::glVertex3f(0.23955342+$x,-0.11989108+$y,0.18410515+$z);

    OpenGL::glNormal3f( -0.418985445494882,0.907983615251922,-0.00411714676747578 );
    OpenGL::glTexCoord2f(0.602778,0.083706); OpenGL::glVertex3f(0.20737883+$x,-0.10033673+$y,0.17970307+$z);
    OpenGL::glTexCoord2f(0.612457,0.11041); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20720092+$x,-0.10034156+$y,0.19674306+$z);

    OpenGL::glNormal3f( -0.0195937961594211,0.438743661697256,-0.898398621143503 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22167838+$x,-0.12583606+$y,0.16049532+$z);

    OpenGL::glNormal3f( -0.227405999739545,0.735858078668423,-0.63780827788676 );
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.564169,0.093297); OpenGL::glVertex3f(0.20737883+$x,-0.10033673+$y,0.17970307+$z);

    OpenGL::glNormal3f( -0.262134569815165,0.334493129987061,-0.905207055484698 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22167838+$x,-0.12583606+$y,0.16049532+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);

    OpenGL::glNormal3f( 0.676838944918957,-0.00840657317730293,-0.736083128572044 );
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22167838+$x,-0.12583606+$y,0.16049532+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);

    OpenGL::glNormal3f( 0.668622958407119,-0.171926650992935,-0.723453223207462 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21636963+$x,-0.13993154+$y,0.15893867+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22167838+$x,-0.12583606+$y,0.16049532+$z);

    OpenGL::glNormal3f( 0.616201742325991,-0.00206582870410004,-0.787585643029491 );
    OpenGL::glTexCoord2f(0.497729,0.095022); OpenGL::glVertex3f(0.22567341+$x,-0.12575313+$y,0.16416786+$z);
    OpenGL::glTexCoord2f(0.511765,0.079488); OpenGL::glVertex3f(0.22621649+$x,-0.11728868+$y,0.16457056+$z);
    OpenGL::glTexCoord2f(0.503631,0.08026); OpenGL::glVertex3f(0.22847266+$x,-0.120231+$y,0.16634349+$z);

    OpenGL::glNormal3f( -0.072970296913128,-0.659249522608795,-0.748375175101691 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21636963+$x,-0.13993154+$y,0.15893867+$z);
    OpenGL::glTexCoord2f(0.488988,0.140271); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);

    OpenGL::glNormal3f( -0.449902447199092,-0.126744659528352,-0.884038222751319 );
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21636963+$x,-0.13993154+$y,0.15893867+$z);

    OpenGL::glNormal3f( -0.273017143202154,0.206587801301086,-0.939565388821511 );
    OpenGL::glTexCoord2f(0.503642,0.129676); OpenGL::glVertex3f(0.21636963+$x,-0.13993154+$y,0.15893867+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);
    OpenGL::glTexCoord2f(0.507479,0.102001); OpenGL::glVertex3f(0.22167838+$x,-0.12583606+$y,0.16049532+$z);

    OpenGL::glNormal3f( -0.856246728800812,-0.0884939357737217,-0.50893060700766 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18601269+$x,-0.12576507+$y,0.1800889+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);
    OpenGL::glTexCoord2f(0.531534,0.165599); OpenGL::glVertex3f(0.19330433+$x,-0.1527978+$y,0.17252164+$z);

    OpenGL::glNormal3f( -0.798068734439724,0.377955965319373,-0.46929264152475 );
    OpenGL::glTexCoord2f(0.565073,0.140956); OpenGL::glVertex3f(0.18601269+$x,-0.12576507+$y,0.1800889+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);

    OpenGL::glNormal3f( -0.356468340464472,0.435837355613751,-0.826423693814569 );
    OpenGL::glTexCoord2f(0.547255,0.13087); OpenGL::glVertex3f(0.1925983+$x,-0.12564311+$y,0.16898778+$z);
    OpenGL::glTexCoord2f(0.565697,0.112333); OpenGL::glVertex3f(0.19710042+$x,-0.1050879+$y,0.1778862+$z);
    OpenGL::glTexCoord2f(0.540386,0.092496); OpenGL::glVertex3f(0.21333033+$x,-0.10702599+$y,0.16986351+$z);

    OpenGL::glNormal3f( -0.00266604312632884,0.125343659064965,0.992109802061372 );
    OpenGL::glTexCoord2f(0.77528,0.990588); OpenGL::glVertex3f(0.19141025+$x,-0.40007533+$y,0.17610266+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24922524+$x,-0.39998816+$y,0.17624701+$z);
    OpenGL::glTexCoord2f(0.734996,0.961992); OpenGL::glVertex3f(0.22215864+$x,-0.38123942+$y,0.17380555+$z);

    OpenGL::glNormal3f( 0.00149093568565643,-0.999976333591106,0.00671635082987231 );
    OpenGL::glTexCoord2f(0.623546,0.441019); OpenGL::glVertex3f(0.19141025+$x,-0.40007533+$y,0.17610266+$z);
    OpenGL::glTexCoord2f(0.800276,0.549776); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.800276,0.441019); OpenGL::glVertex3f(0.24922524+$x,-0.39998816+$y,0.17624701+$z);

    OpenGL::glNormal3f( 0.986333686138874,0.164732906337438,-0.00298816956047533 );
    OpenGL::glTexCoord2f(0.646629,0.978498); OpenGL::glVertex3f(0.24922524+$x,-0.39998816+$y,0.17624701+$z);
    OpenGL::glTexCoord2f(0.694712,0.990588); OpenGL::glVertex3f(0.24915318+$x,-0.40024202+$y,0.13846659+$z);
    OpenGL::glTexCoord2f(0.652728,0.960596); OpenGL::glVertex3f(0.24716872+$x,-0.38769038+$y,0.17538832+$z);

    OpenGL::glNormal3f( -0.518275854582562,-0.399322099633405,-0.756261858949057 );
    OpenGL::glTexCoord2f(0.16806,0.270577); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);
    OpenGL::glTexCoord2f(0.128783,0.262467); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);
    OpenGL::glTexCoord2f(0.195553,0.202588); OpenGL::glVertex3f(0.22008991+$x,-0.14623627+$y,0.16412981+$z);

    OpenGL::glNormal3f( 0.561788876982698,0.827246109686347,0.00755855193298899 );
    OpenGL::glTexCoord2f(0.296671,0.90537); OpenGL::glVertex3f(0.23861188+$x,-0.1708074+$y,0.16441054+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);

    OpenGL::glNormal3f( 0.407708928115054,0.901212946850518,-0.146930780860511 );
    OpenGL::glTexCoord2f(0.234719,0.950468); OpenGL::glVertex3f(0.21718369+$x,-0.15631964+$y,0.17144571+$z);
    OpenGL::glTexCoord2f(0.247076,0.845005); OpenGL::glVertex3f(0.23868291+$x,-0.17066126+$y,0.14313694+$z);
    OpenGL::glTexCoord2f(0.158868,0.83847); OpenGL::glVertex3f(0.2096656+$x,-0.16024017+$y,0.12653732+$z);

    OpenGL::glNormal3f( -0.0216162653016491,-0.153846712592646,0.987858252027509 );
    OpenGL::glTexCoord2f(0.907986,0.3475956); OpenGL::glVertex3f(0.24661477+$x,-0.29209738+$y,0.27773908+$z);
    OpenGL::glTexCoord2f(0.922506,0.413958); OpenGL::glVertex3f(0.26346444+$x,-0.30410818+$y,0.27623725+$z);
    OpenGL::glTexCoord2f(0.88223,0.341903); OpenGL::glVertex3f(0.24543363+$x,-0.28189769+$y,0.27930171+$z);
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



$DRAW_MODEL{'Fortif'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(3.1996628e-013,2.3758773e-014); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.1996628e-013,2.3758773e-014); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(3.1996628e-013,2.3758773e-014); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0635937e-013,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(6.3504757e-014,1.54321e-013); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(6.3504757e-014,1.54321e-013); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(6.3504757e-014,1.54321e-013); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(3.8813397e-013,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(3.8813397e-013,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(2.2781776e-013,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.0158102e-014,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(2.2781776e-013,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(2.2781776e-013,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1,5.2846616e-014); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1,5.2846616e-014); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(2.2781776e-013,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1,5.2846616e-014); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(8.0158102e-014,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.483258e-013); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0.1); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(2.0650148e-014,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(2.1982416e-013,1); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.483258e-013); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(2.0650148e-014,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(6.6613381e-016,0.9); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,1); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,1.483258e-013); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(2.0650148e-014,0.1); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(8.8817842e-016,0.9); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.9); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.375,2.0827784e-013); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,2.0827784e-013); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.25); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,9.0594199e-014); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.25); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(6.4837025e-014,0.375); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(5.7731597e-015,0.625); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(3.7081449e-014,0.75); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1,0.25); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.25); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1,0.375); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(1,0.25); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1,0.625); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.625); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(1,0.75); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1,0.625); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.375,1); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,1); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.375); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(6.4837025e-014,0.375); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.375); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.25); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.25); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.375); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.375); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.25); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.25); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.375); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.375); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.625); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.375); OpenGL::glVertex3f(0.125+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.375); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.625); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.75); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(3.7081449e-014,0.75); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.75); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.625); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.625); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.625); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.625,0.75); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.75); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.625); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,0.625); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.75); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.375,0.75); OpenGL::glVertex3f(-0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,1); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.625,0.75); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.75,0.75); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.625,1); OpenGL::glVertex3f(0.125+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(-0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.125+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,0.125+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.125+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0.25); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,0.25); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(0.25+$x,0.5+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.25,0); OpenGL::glVertex3f(0.5+$x,0.5+$y,-0.25+$z);
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



$DRAW_MODEL{'Pillar'} = sub {
        my ($x, $y, $z, $s, $brightness_modificator, $north, $west, $south, $east, $bottom, $top) = @_;
        my $brightness = ((($y/($ZCOUNT-15)) * $brightness_modificator)*.7)+.15;
        OpenGL::glColor3f($brightness, $brightness, $brightness);

    OpenGL::glNormal3f( 0,0,1 );# south face
    OpenGL::glTexCoord2f(0,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,-1,0 );# bottom face
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,1.0014739); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,1.0014739); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.110223e-016,1.0014739); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( -1,0,0 );# west face
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0,4.4408921e-016); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(1.4432899e-015,8.8817842e-016); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,1.4432899e-015); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.28181781,0.28181781); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(1.0014739,8.8817842e-016); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0.25036847); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.71965609,0.28181781); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(2.553513e-015,1.0014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.75110542); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.28181781,0.71965609); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(1.0014739,1.0014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,1.0014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.71965609,0.71965609); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.71965609,0.71965609); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.75110542,1.0014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.62014739,0.77936131); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.71965609,0.71965609); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(1.0014739,0.75110542); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(1.0014739,1.0014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.28181781,0.71965609); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0,0.75110542); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.22211259,0.62014739); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.28181781,0.71965609); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.25036847,1.0014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(2.553513e-015,1.0014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.28181781,0.28181781); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.25036847,1.4432899e-015); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.38132651,0.22211259); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.28181781,0.28181781); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(1.5543122e-015,0.25036847); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1.4432899e-015,8.8817842e-016); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.71965609,0.28181781); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(1.0014739,0.25036847); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.77936131,0.38132651); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.71965609,0.28181781); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.75110542,2.7755576e-015); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,8.8817842e-016); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.79926305); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.25036847,1.0014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.38132651,0.77936131); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.20221085,0.50073695); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.5543122e-015,0.25036847); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.22211259,0.38132651); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.50073695,0.20221085); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.75110542,2.7755576e-015); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.62014739,0.22211259); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.79926305,0.50073695); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.0014739,0.75110542); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.77936131,0.62014739); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.38132651,0.77936131); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.25036847,1.0014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.28181781,0.71965609); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.22211259,0.38132651); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(1.5543122e-015,0.25036847); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.28181781,0.28181781); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.62014739,0.22211259); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.75110542,2.7755576e-015); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.71965609,0.28181781); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.77936131,0.62014739); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(1.0014739,0.75110542); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.71965609,0.71965609); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.62014739,0.77936131); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.75110542,1.0014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.79926305); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.22211259,0.62014739); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0,0.75110542); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.20221085,0.50073695); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.38132651,0.22211259); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.25036847,1.4432899e-015); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.20221085); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.77936131,0.38132651); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(1.0014739,0.25036847); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.79926305,0.50073695); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.01990174,0.17911566); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.17911566,0.01990174); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0,0.2985261); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.07960696,0.07960696); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.17911566,0.01990174); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.01990174,0.17911566); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.17911566,0.01990174); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.2985261,0); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0,0.2985261); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.51744524,0.07960696); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.57715046,0.17911566); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.41793654,0.01990174); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.57715046,0.17911566); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.5970522,0.2985261); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.41793654,0.01990174); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.51744524,0.51744524); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.41793654,0.57715046); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.57715046,0.41793654); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.41793654,0.57715046); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.2985261,0.5970522); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.57715046,0.41793654); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.2985261,0.5970522); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.17911566,0.57715046); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0,0.2985261); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.17911566,0.57715046); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.01990174,0.41793654); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0,0.2985261); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.07960696,0.51744524); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.01990174,0.41793654); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.17911566,0.57715046); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);

    OpenGL::glNormal3f( 1,0,0 );# east face
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(4.4408921e-016,0); OpenGL::glVertex3f(0.5+$x,-0.5+$y,0.5+$z);

    OpenGL::glNormal3f( 0,0,-1 );# north face
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0.10014739); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,0.10014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0,0.10014739); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(3.3306691e-016,4.4408921e-016); OpenGL::glVertex3f(0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.10014739); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,0.10014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(1.0014739,0); OpenGL::glVertex3f(-0.5+$x,-0.5+$y,-0.5+$z);

    OpenGL::glNormal3f( 0.857492925712544,0,-0.514495755427527 );
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.47420729,0.90132651); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);

    OpenGL::glNormal3f( 0.514495755427527,0,-0.857492925712544 );
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0,0.90132651); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,-0.21859695+$z);

    OpenGL::glNormal3f( -0.514495755427527,0,-0.857492925712544 );
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.47420729,0.90132651); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);

    OpenGL::glNormal3f( -0.857492925712544,0,-0.514495755427527 );
    OpenGL::glTexCoord2f(2.220446e-016,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0,0.90132651); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,-0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(2.220446e-016,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,-0.21859695+$z);

    OpenGL::glNormal3f( -0.857492925712544,0,0.514495755427527 );
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.35816121,0); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.47420729,0.90132651); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);

    OpenGL::glNormal3f( -0.514495755427527,0,0.857492925712544 );
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0,0.90132651); OpenGL::glVertex3f(-0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(-0.21859695+$x,-0.4+$y,0.21859695+$z);

    OpenGL::glNormal3f( 0.514495755427527,0,0.857492925712544 );
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.47420729,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.47420729,0.90132651); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);

    OpenGL::glNormal3f( 0.857492925712544,0,0.514495755427527 );
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(2.220446e-016,0.90132651); OpenGL::glVertex3f(0.21859695+$x,0.5+$y,0.21859695+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0,3.3306691e-016); OpenGL::glVertex3f(0.21859695+$x,-0.4+$y,0.21859695+$z);

    OpenGL::glNormal3f( 0,1,0 );# top face
    OpenGL::glTexCoord2f(0.50073695,0.79926305); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.75110542,1.0014739); OpenGL::glVertex3f(0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,1.0014739); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.20221085,0.50073695); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0,0.75110542); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(6.6613381e-016,0.50073695); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.50073695,0.20221085); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.25036847,1.4432899e-015); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0); OpenGL::glVertex3f(0+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.79926305,0.50073695); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.0014739,0.25036847); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(1.0014739,0.50073695); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.50073695,1.0014739); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.25036847,1.0014739); OpenGL::glVertex3f(-0.25+$x,-0.4+$y,-0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.79926305); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(6.6613381e-016,0.50073695); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.5543122e-015,0.25036847); OpenGL::glVertex3f(-0.5+$x,-0.4+$y,0.25+$z);
    OpenGL::glTexCoord2f(0.20221085,0.50073695); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.50073695,0); OpenGL::glVertex3f(0+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.75110542,2.7755576e-015); OpenGL::glVertex3f(0.25+$x,-0.4+$y,0.5+$z);
    OpenGL::glTexCoord2f(0.50073695,0.20221085); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(1.0014739,0.50073695); OpenGL::glVertex3f(0.5+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(1.0014739,0.75110542); OpenGL::glVertex3f(0.5+$x,-0.4+$y,-0.25+$z);
    OpenGL::glTexCoord2f(0.79926305,0.50073695); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.2985261,0); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.2985261,0.5970522); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0,0.2985261); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.41793654,0.01990174); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.5970522,0.2985261); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.2985261,0); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.5970522,0.2985261); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.2985261,0.5970522); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.2985261,0); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.57715046,0.41793654); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.2985261,0.5970522); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.5970522,0.2985261); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);

    OpenGL::glNormal3f( 0.164398987305357,0,-0.986393923832144 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,-0.2782143+$z);

    OpenGL::glNormal3f( -0.164398987305357,0,-0.986393923832144 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0+$x,0.5+$y,-0.29808675+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,-0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,-0.29808675+$z);

    OpenGL::glNormal3f( -0.986393923832144,0,0.164398987305357 );
    OpenGL::glTexCoord2f(0.23710365,0); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.35816121,0); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,0); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);

    OpenGL::glNormal3f( -0.986393923832144,0,-0.164398987305357 );
    OpenGL::glTexCoord2f(0.23710365,0); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(-0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(-0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,0); OpenGL::glVertex3f(-0.29808675+$x,-0.4+$y,0+$z);

    OpenGL::glNormal3f( -0.164398987305357,0,0.986393923832144 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(-0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(-0.1192347+$x,0.5+$y,0.2782143+$z);

    OpenGL::glNormal3f( 0.164398987305357,0,0.986393923832144 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0+$x,0.5+$y,0.29808675+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(0.1192347+$x,-0.4+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.1192347+$x,0.5+$y,0.2782143+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0+$x,-0.4+$y,0.29808675+$z);

    OpenGL::glNormal3f( 0.986393923832144,0,0.164398987305357 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.11604609,0); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.11604609,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,0.1192347+$z);

    OpenGL::glNormal3f( 0.986393923832144,0,-0.164398987305357 );
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,0.90132651); OpenGL::glVertex3f(0.29808675+$x,0.5+$y,0+$z);
    OpenGL::glTexCoord2f(0.35816121,3.3306691e-016); OpenGL::glVertex3f(0.2782143+$x,-0.4+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.35816121,0.90132651); OpenGL::glVertex3f(0.2782143+$x,0.5+$y,-0.1192347+$z);
    OpenGL::glTexCoord2f(0.23710365,3.3306691e-016); OpenGL::glVertex3f(0.29808675+$x,-0.4+$y,0+$z);
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
    