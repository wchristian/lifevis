package Lifevis::ModelGen;
use 5.010;
use strict;
use lib '.';
use lib '..';
use Lifevis::constants;

my %side = (
    "0,0,1"                                  => "south",
    "0,-1,0"                                 => "bottom",
    "-1,0,0"                                 => "west",
    "0,1,0"                                  => "top",
    "1,0,0"                                  => "east",
    "0,0,-1"                                 => "north",
);

__PACKAGE__->run(@ARGV) unless caller();

sub run {
    use Math::Vec qw(:terse);
    use Math::Trig ':pi';

    my ( @filelist, $code );

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

    open my $OUT, ">", 'Lifevis\models.pm' or die( "horribly: " . $! );
    print $OUT "package Lifevis::models;
    use strict;
    use OpenGL qw / :all /;
    
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

# this function takes 3 vertices as input and calculates their normal, thus generating the normal for one triangle face
sub calcFaceNormal {
    my $v1 = V( $_[0]->[0], $_[0]->[1], $_[0]->[2] );
    my $v2 = V( $_[1]->[0], $_[1]->[1], $_[1]->[2] );
    my $v3 = V( $_[2]->[0], $_[2]->[1], $_[2]->[2] );

    my $edge1  = $v1 - $v2;
    my $edge2  = $v2 - $v3;
    my $cross  = V( $edge1->Cross($edge2) );
    my $length = $cross->Length();

    my $normal = $cross / $length;

    for my $val ( @{$normal} ) {
        $val = 0                  if ( $val < 0.0001    && $val > -0.0001 );
        $val = 0.707106781186547  if ( $val > 0.707106  && $val < 0.707107 );
        $val = -0.707106781186547 if ( $val < -0.707106 && $val > -0.707107 );
    }

    return $normal;
}

# this function rotates a given 2-dimensional vector by 90°, it's used to perform the rotations for models like the ramps
sub rotate_vector {
    my ( $x, $z ) = @_;
    my $xnew = cos( -1 * pip2 ) * ($x) - sin( -1 * pip2 ) * $z;
    my $znew = sin( -1 * pip2 ) * ($x) + cos( -1 * pip2 ) * $z;
    return ( $xnew, $znew );
}

# this function generates the code to draw one model
sub generateModel {
    my ($input) = @_;

    my @raw_data;

    my @vertices;
    my @faces;
    my @uvs;
    my @normals;
    my $model = '';

    open my $DAT, "<", "models/$input.obj" or die( "horribly: " . $! );
    @raw_data = <$DAT>;
    close $DAT;
    
    # get number of rotations if not 1
    my $rotations = 1;
    $rotations = $1 if ( $input =~ s/(\d)$// );
    
    # cycle through input .obj file and extract the vertex coords and uv coords for those vertices
    for my $line (@raw_data) {
        if ( $line =~ m/^v (.*?) (.*?) (.*?)$/ ) {
            $vertices[ $#vertices + 1 ][0] = ( $1 + 0 );
            $vertices[$#vertices][1]       = ( $2 + 0 );
            $vertices[$#vertices][2]       = ( $3 + 0 );
        }
        if ( $line =~ m/^f (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*?$/ ) {
            $faces[ $#faces + 1 ]{verts}[0]{coords} = ( $1 - 1 );
            $faces[$#faces]{verts}[0]{uv}           = ( $2 - 1 );
            $faces[$#faces]{verts}[1]{coords}       = ( $3 - 1 );
            $faces[$#faces]{verts}[1]{uv}           = ( $4 - 1 );
            $faces[$#faces]{verts}[2]{coords}       = ( $5 - 1 );
            $faces[$#faces]{verts}[2]{uv}           = ( $6 - 1 );
            if ( $input =~ m/Cursor/ && $line =~ m/(\d+?)\/(\d+?)\/\d+$/ ) {
                $faces[$#faces]{verts}[3]{coords} = ( $1 - 1 );
                $faces[$#faces]{verts}[3]{uv}     = ( $2 - 1 );
            }
        }
        if ( $line =~ m/^vt (.*?) (.*?)$/ ) {
            $uvs[ $#uvs + 1 ][0] = ( $1 + 0 );
            $uvs[$#uvs][1] = ( $2 + 0 );
        }
    }
    
    # loop through model rotations
    for my $rotation ( 1 .. $rotations ) {
        
        # delete old normals, then cycle through faces and calculate face normals for this rotation
        undef @normals;
        for my $face (@faces) {
            my $normal_is_new = 1;
            my $existing_normal;
            
            # calc normal for current face
            my $current_normal = calcFaceNormal(
                $vertices[ $face->{verts}[0]{coords} ],
                $vertices[ $face->{verts}[1]{coords} ],
                $vertices[ $face->{verts}[2]{coords} ]
            );
            
            # if we already have previous normals, see if any match the current one
            if ( $#normals > -1 ) {
                for my $nid ( 0 .. $#normals ) {
                    if (   $current_normal->[0] == $normals[$nid][0]
                        && $current_normal->[1] == $normals[$nid][1]
                        && $current_normal->[2] == $normals[$nid][2] )
                    {
                        # if so, note down which one, and stop the loop with a note that this is not a new one
                        $existing_normal = $nid;
                        $normal_is_new   = 0;
                        last;
                    }
                }
            }
            
            # store normal id in face data, either by appending at end of normals array or by storing existing id
            if ($normal_is_new) {
                $normals[ $#normals + 1 ] = calcFaceNormal(
                    $vertices[ $face->{verts}[0]{coords} ],
                    $vertices[ $face->{verts}[1]{coords} ],
                    $vertices[ $face->{verts}[2]{coords} ]
                );
                $face->{normal} = $#normals;
            }
            else {
                $face->{normal} = $existing_normal;
            }
        }
        
        
        # set up start of model sub-routine
        $rotation = '' if ( $rotations == 1 );
        
        my %subs;
        
        # cycle through the face normals so the faces get grouped by their direction
        for my $nid ( 0 .. $#normals ) {
            my $close = 0;
            
            my $sub_content;
            my $verts;
            my $texcoords;
            my $norms;
            my $target;
            my $vert_sum;

            # switch to quad mode for the cursor model
            my $max_verts = 3;
            if ( $input =~ m/Cursor/ ) {
                $max_verts = 4;
            }
            
            my $vec = "$normals[$nid][0],$normals[$nid][1],$normals[$nid][2]";
            
            # cycle through all faces in the model and skip the ones which aren't on the current normal
            for my $fid ( 0 .. $#faces ) {
                next if ( $faces[$fid]{normal} != $nid );
                
                # cycle through vertices and generate UV and position calls
                for my $vid (  0 .. ($max_verts-1) ) {
                    my $uv   = $faces[$fid]{verts}[$vid]{uv};
                    my $vert = $faces[$fid]{verts}[$vid]{coords};
                    $verts .= join (',',@{$vertices[$vert]}) . ",   ";
                    $texcoords .= join (',',@{$uvs[$uv]}) . ",   ";
                    $norms .= "$vec,   ";
                    $vert_sum++;
                }
            }
            
            $target = 'main';
            $target = $side{$vec} if ( defined $side{$vec} );
            
            $subs{$target}{verts} .= $verts;
            $subs{$target}{texcoords} .= $texcoords;
            $subs{$target}{norms} .= $norms;
            $subs{$target}{verts_per_face} = $max_verts;
            $subs{$target}{vertex_count} += $vert_sum;
        }
        
        for my $part ( keys %subs ) {
            my $render_mode = 'GL_TRIANGLES';
            $render_mode = 'GL_QUADS' if $subs{$part}{verts_per_face} == 4;
            
            # add skip conditions if it's a pre-defined normal and if the current normal is different from the last one
            $model .= "\$DRAW_MODEL{'$input$rotation'}[$part] = sub {\nmy (\$x, \$y, \$z, \$s, \$brightness_modificator, \$north, \$west, \$south, \$east, \$bottom, \$top) = \@_;\n\n";
            $model .= "my \@verts = (".$subs{$part}{verts}.");\nmy \$verts = OpenGL::Array->new_list( GL_FLOAT, \@verts );\n\n"; 
            $model .= "my \@texcoords = (".$subs{$part}{texcoords}.");\nmy \$texcoords = OpenGL::Array->new_list( GL_FLOAT, \@texcoords );\n\n"; 
            $model .= "my \@norms = (".$subs{$part}{norms}.");\nmy \$norms = OpenGL::Array->new_list( GL_FLOAT, \@norms );\n\n";
            $model .= "my \@indices = ( 0 .. " . $subs{$part}{vertex_count} . " );\nmy \$indices = OpenGL::Array->new_list( GL_UNSIGNED_INT, \@indices );\n\n";
            $model .= "glVertexPointer_p( 3, \$verts );\nglNormalPointer_p( \$norms );\nglTexCoordPointer_p( 2, \$texcoords );\n\n";
            $model .= "my \$dl = glGenLists(1);\nglNewList( \$dl, GL_COMPILE );\n";
            $model .= "glDrawArrays( $render_mode, 0, " . $subs{$part}{vertex_count} . " );\n";
            $model .= "glEndList();\nreturn \$dl;\n};\n\n";
        }
        
        # rotate model for next loop
        for my $vid ( 0 .. $#vertices ) {
            ( $vertices[$vid][0], $vertices[$vid][2] ) = rotate_vector( $vertices[$vid][0], $vertices[$vid][2] );
        }
    }

    return $model;
}
