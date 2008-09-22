#!/usr/bin/perl -w
use 5.010;
use strict;

use Math::Vec qw(:terse);

print "moo". 0.0000000e+0 . "moo";
sub generateModel {
    my ($input) = @_;
    my @raw_data;
    
    my @vertices;
    my @faces;
    my @uvs;
    my @normals;
    
    open my $DAT, "<", "models/$input.obj" or die( "horribly: ".$! );
    @raw_data=<$DAT>;
    close $DAT;
    
    for my $line (@raw_data) {
        if ( $line =~ m/^v (.*?) (.*?) (.*?)$/ ){
            $vertices[$#vertices+1][0] = ($1+0);
            $vertices[$#vertices][1] = ($2+0);
            $vertices[$#vertices][2] = ($3+0);
        }
        if ( $line =~ m/^f (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*? (\d+?)\/(\d+?)\/.*?$/ ){
            $faces[$#faces+1][0]{vert} = ($1-1);
            $faces[$#faces][0]{uv} = ($2-1);
            $faces[$#faces][1]{vert} = ($3-1);
            $faces[$#faces][1]{uv} = ($4-1);
            $faces[$#faces][2]{vert} = ($5-1);
            $faces[$#faces][2]{uv} = ($6-1);
        }
        if ( $line =~ m/^vt (.*?) (.*?)$/ ){
            $uvs[$#uvs+1][0] = ($1+0);
            $uvs[$#uvs][1] = ($2+0);
        }
    }
    for my $id (@faces) {
        $normals[$#normals+1] = calcFaceNormal(
                                               $vertices[$id->[0]{vert}],
                                               $vertices[$id->[1]{vert}],
                                               $vertices[$id->[2]{vert}] );
    }
    
    my $model = "
    
sub drawSingleNorthRamp {
    my (\$x, \$y, \$z, \$s) = \@_;
    my \$brightness = \$y/(\$zcount-15);
    glColor3f(\$brightness, \$brightness, \$brightness);
    
";


    for my $id ( 0..$#faces) {
        $model .= "\n\n    glNormal3f( $normals[$id][0],$normals[$id][1],$normals[$id][2]);\n";
        for my $vid ( 0..2) {
            my $uv = $faces[$id][$vid]{uv};
            my $vert = $faces[$id][$vid]{vert};
            $model .= "    glTexCoord2f($uvs[$uv][0],$uvs[$uv][1]); glVertex3f($vertices[$vert][0]+\$x,$vertices[$vert][1]+\$y,$vertices[$vert][2]+\$z);\n";
        }
    }
    
    $model .= "}\n\n";
    
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

open my $OUT, ">", "models2.pl" or die( "horribly: ".$! );
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

$code";
close $OUT;    





sub calcFaceNormal {
    my $v1 = V($_[0]->[0], $_[0]->[1], $_[0]->[2]);
    my $v2 = V($_[1]->[0], $_[1]->[1], $_[1]->[2]);
    my $v3 = V($_[2]->[0], $_[2]->[1], $_[2]->[2]);
    
    my $edge1 = $v1-$v2;
    my $edge2 = $v2-$v3;
    my @normal = $edge1->Cross($edge2);
    return \@normal;
}