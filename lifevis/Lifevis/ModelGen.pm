package Lifevis::ModelGen;
use 5.010;
use strict;

    
my %side = (
                "0,0,1" => "south",
                "0,-1,0" => "bottom",
                "-1,0,0" => "west",
                "0,1,0" => "top",
                "1,0,0" => "east",
                "0,0,-1" => "north",
                "0.707106781186547,0.707106781186547,0" => "top east",
                "0,0.707106781186547,0.707106781186547" => "top south",
                "-0.707106781186547,0.707106781186547,0" => "top west",
                "0,0.707106781186547,-0.707106781186547" => "top north",

            );

__PACKAGE__->run(@ARGV) unless caller();

sub run {
    use Math::Vec qw(:terse);
    use Math::Trig ':pi';
    
    
    my (@filelist,$code);
    
    my @files = <models/*.obj>;
    foreach my $file (@files) {
        push @filelist, $file;
    }
    
    foreach my $file (@filelist) {
        $file =~ m/^models\/(.+?)\.obj$/i or die("Bad data in first argument");
        my $input = "$1";
        say $input;
        my $model = generateModel($input);
        $code .= "\n\n$model";
    }
    
    open my $OUT, ">", 'Lifevis\models.pm' or die( "horribly: ".$! );
    print $OUT "package Lifevis::models;
    use strict;
    
    use base 'Exporter';
    
    use lib '.';
    use lib '..';
    use Lifevis::constants;
    
    our \@EXPORT = ( qw( get_model_subs set_zcount_for_models ) );
    
    my \$ZCOUNT;
    
    my \%DRAW_MODEL;
    
    $code
    
    
    sub get_model_subs {
        return \%DRAW_MODEL;
    }
    
    sub set_zcount_for_models {
        (\$ZCOUNT) = \@_;
    }
    
    1;
    ";
    close $OUT;
}    





sub calcFaceNormal {
    my $v1 = V($_[0]->[0], $_[0]->[1], $_[0]->[2]);
    my $v2 = V($_[1]->[0], $_[1]->[1], $_[1]->[2]);
    my $v3 = V($_[2]->[0], $_[2]->[1], $_[2]->[2]);
    
    my $edge1 = $v1-$v2;
    my $edge2 = $v2-$v3;
    my $cross = V($edge1->Cross($edge2));
    my $length = $cross->Length();
    
    my $normal = $cross/$length;
    
    for my $val (@{$normal}) {
        $val = 0 if( $val < 0.0001 && $val > -0.0001);
        $val = 0.707106781186547 if ( $val > 0.707106 && $val < 0.707107 );
        $val = -0.707106781186547 if ( $val < -0.707106 && $val > -0.707107 );
    }
    
    return $normal;
}


sub rotate_vector {
    my ($x,$z) = @_;
    my $xnew = cos(-1*pip2)*($x) - sin(-1*pip2)*$z;
    my $znew = sin(-1*pip2)*($x) + cos(-1*pip2)*$z;
    return ($xnew,$znew);
}


sub generateModel {
    my ($input) = @_;
    
    my @raw_data;
    
    my @vertices;
    my @faces;
    my @uvs;
    my @normals;
    my $model = '';
    
    open my $DAT, "<", "models/$input.obj" or die( "horribly: ".$! );
    @raw_data=<$DAT>;
    close $DAT;
    
    my $rotations = 1;
    $rotations = $1 if ( $input =~ s/(\d)$// );
    
    for my $line (@raw_data) {
        if ( $line =~ m/^v (.*?) (.*?) (.*?)$/ ){
            $vertices[$#vertices+1][0] = ($1+0);
            $vertices[$#vertices][1] = ($2+0);
            $vertices[$#vertices][2] = ($3+0);
        }
        if ( $line =~ m/^f (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*?$/ ){
            $faces[$#faces+1]{verts}[0]{coords} = ($1-1);
            $faces[$#faces]{verts}[0]{uv} = ($2-1);
            $faces[$#faces]{verts}[1]{coords} = ($3-1);
            $faces[$#faces]{verts}[1]{uv} = ($4-1);
            $faces[$#faces]{verts}[2]{coords} = ($5-1);
            $faces[$#faces]{verts}[2]{uv} = ($6-1);
            if ( $input =~ m/Cursor/ && $line =~ m/(\d+?)\/(\d+?)\/\d+$/ ) {
                $faces[$#faces]{verts}[3]{coords} = ($1-1);
                $faces[$#faces]{verts}[3]{uv} = ($2-1);
            }
        }
        if ( $line =~ m/^vt (.*?) (.*?)$/ ){
            $uvs[$#uvs+1][0] = ($1+0);
            $uvs[$#uvs][1] = ($2+0);
        }
    }
    
    for my $rotation (1..$rotations) {
        undef @normals;
        for my $id (@faces) {
            my $normal_is_new = 1;
            my $existing_normal;
            
            my $normal = calcFaceNormal(
                            $vertices[$id->{verts}[0]{coords}],
                            $vertices[$id->{verts}[1]{coords}],
                            $vertices[$id->{verts}[2]{coords}] );
            
            if ($#normals != -1) {
                for my $nid ( 0..$#normals) {
                    if ( $normal->[0] == $normals[$nid][0] && $normal->[1] == $normals[$nid][1] && $normal->[2] == $normals[$nid][2] ) {
                        $existing_normal = $nid;
                        $normal_is_new = 0;
                        last;
                    }
                }
            }
            
            if ($normal_is_new) {
                $normals[$#normals+1] = calcFaceNormal(
                                                       $vertices[$id->{verts}[0]{coords}],
                                                       $vertices[$id->{verts}[1]{coords}],
                                                       $vertices[$id->{verts}[2]{coords}] );
                $id->{normal} = $#normals;
            }
            else {
                $id->{normal} = $existing_normal;
            }
        }
        
        $rotation = '' if ( $rotations == 1 );
        $model .= "\n\n\$DRAW_MODEL{'$input$rotation'} = sub {
        my (\$x, \$y, \$z, \$s, \$brightness_modificator, \$north, \$west, \$south, \$east, \$bottom, \$top) = \@_;
        my \$brightness = (((\$y/(\$ZCOUNT-15)) * \$brightness_modificator)*.7)+.15;
        OpenGL::glColor3f(\$brightness, \$brightness, \$brightness);";
    
        my @old = (999,999,999);
        for my $nid ( 0..$#normals) {
            my $vec;
            my $close = 0;
            for my $fid ( 0..$#faces) {
                next if ( $faces[$fid]{normal} != $nid );
                
                if( $old[0] != $normals[$nid][0] || $old[1] != $normals[$nid][1] || $old[2] != $normals[$nid][2] ) {
                    $vec = "$normals[$nid][0],$normals[$nid][1],$normals[$nid][2]";
                    if ( $input =~ m/Wall/ && defined $side{$vec} ) {
                        $model .= "\n\nif ( \$$side{$vec} != WALL ) {";
                        $close = 1;
                    }
                    if ( $input =~ m/(Floor|Boulder|Sapling|Shrub|Tree)/ && defined $side{$vec} ) {
                        if ( $side{$vec} eq 'bottom' ) {
                            $model .= "\n\nif ( \$$side{$vec} != WALL ) {";
                        }
                        else {
                            $model .= "\n\nif ( \$$side{$vec} == EMPTY || \$$side{$vec} == RAMP_TOP ) {";
                            
                        }
                        $close = 1;
                    }
                    
                    $model .= "\n\n    OpenGL::glNormal3f( $vec );";
                    $model .= "# $side{$vec} face" if defined $side{$vec};
                    undef @old if ( $input =~ m/(Floor|Boulder|Sapling|Shrub|Tree|Wall)/);
                    undef $vec if ( $input =~ m/(Floor|Boulder|Sapling|Shrub|Tree|Wall)/);
                }
                
                my $max_verts = 2;
                if ( $input =~ m/Cursor/ ) {
                    $max_verts = 3;
                }
                
                for my $vid ( 0..$max_verts) {
                    my $uv = $faces[$fid]{verts}[$vid]{uv};
                    my $vert = $faces[$fid]{verts}[$vid]{coords};
                    $model .= "\n    OpenGL::glTexCoord2f($uvs[$uv][0],$uvs[$uv][1]); OpenGL::glVertex3f($vertices[$vert][0]+\$x,$vertices[$vert][1]+\$y,$vertices[$vert][2]+\$z);";
                }
                $vec = "$old[0],$old[1],$old[2]" if ( $input =~ m/(Floor|Boulder|Sapling|Shrub|Tree|Wall)/ && defined $old[0]);
                @old = ( $normals[$nid][0],$normals[$nid][1],$normals[$nid][2]);
            }
            if ( $input =~ m/(Floor|Boulder|Sapling|Shrub|Tree|Wall)/ && $close ) {
                $model .= "\n}";
                
            }
        }
        
        $model .= "\n};";
            
        for my $vid (0..$#vertices) {
            ($vertices[$vid][0],$vertices[$vid][2]) = rotate_vector($vertices[$vid][0],$vertices[$vid][2]);
        }
    }
    
    return $model;
}