#!/usr/bin/perl -w
use 5.010;
use strict;

use Math::Vec qw(:terse);
use Math::Trig ':pi';

my %side = (
                "0,0,1" => "south",
                "0,-1,0" => "bottom",
                "-1,0,0" => "left",
                "0,1,0" => "top",
                "1,0,0" => "right",
                "0,0,-1" => "north",
                "0.707106781186547,0.707106781186547,0" => "top right",
                "0,0.707106781186547,0.707106781186547" => "top south",
                "-0.707106781186547,0.707106781186547,0" => "top left",
                "0,0.707106781186547,-0.707106781186547" => "top north",

            );


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
        $model .= "\n\n\$draw{$input$rotation} = sub {
        my (\$x, \$y, \$z, \$s) = \@_;
        my \$brightness = \$y/(\$zcount-15);
        glColor3f(\$brightness, \$brightness, \$brightness);";
    
        my @old = (999,999,999);
        for my $nid ( 0..$#normals) {
            for my $fid ( 0..$#faces) {
                next if ( $faces[$fid]{normal} != $nid );
                
                if( $old[0] != $normals[$nid][0] || $old[1] != $normals[$nid][1] || $old[2] != $normals[$nid][2] ) {
                    my $vec = "$normals[$nid][0],$normals[$nid][1],$normals[$nid][2]";
                    $model .= "\n\n    glNormal3f( $vec );";
                    $model .= "# $side{$vec} face" if defined $side{$vec};
                }
                for my $vid ( 0..2) {
                    my $uv = $faces[$fid]{verts}[$vid]{uv};
                    my $vert = $faces[$fid]{verts}[$vid]{coords};
                    $model .= "\n    glTexCoord2f($uvs[$uv][0],$uvs[$uv][1]); glVertex3f($vertices[$vert][0]+\$x,$vertices[$vert][1]+\$y,$vertices[$vert][2]+\$z);";
                }
                @old = ( $normals[$nid][0],$normals[$nid][1],$normals[$nid][2]);
            }
        }
        
        $model .= "\n};";
            
        for my $vid (0..$#vertices) {
            ($vertices[$vid][0],$vertices[$vid][2]) = rotate_vector($vertices[$vid][0],$vertices[$vid][2]);
        }
    }
    
    return $model;
}


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

open my $OUT, ">", "models.pl" or die( "horribly: ".$! );
print $OUT "#!/usr/bin/perl -w
use 5.010;
use strict;

BEGIN {
	eval \"use constant base_visual => 0\"    unless(defined &base_visual);
	eval \"use constant EMPTY => 0\"          unless(defined &EMPTY);
	eval \"use constant FLOOR => 1\"          unless(defined &FLOOR);
	eval \"use constant WALL => 2\"           unless(defined &WALL);
	eval \"use constant RAMP => 3\"           unless(defined &RAMP);
	eval \"use constant STAIR => 4\"          unless(defined &STAIR);
	eval \"use constant FORTIF => 5\"         unless(defined &FORTIF);
	eval \"use constant PILLAR => 6\"         unless(defined &PILLAR);
}

our \$zcount;

our \%draw;

$code

";
close $OUT;    





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
    my $xnew = cos(pip2)*($x) - sin(pip2)*$z;
    my $znew = sin(pip2)*($x) + cos(pip2)*$z;
    return ($xnew,$znew);
}