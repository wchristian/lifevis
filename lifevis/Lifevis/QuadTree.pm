package Lifevis::QuadTree;

use 5.010;
use strict;
use warnings;
use Carp qw/ carp /;

use enum qw(BITMASK: NW SW SE NE);
use constant ALL => NW | SW | SE | NE;
my %pos_bitmask = (
    nw => NW,
    sw => SW,
    se => SE,
    ne => NE,
);
my @adjacent_pairs = ( [ 'nw', 'ne' ], [ 'sw', 'se' ], [ 'nw', 'sw' ], [ 'ne', 'se' ], );

###############################
#
# sub new() - constructor
#
# my $test = Lifevis::QuadTree->new(
#     -xmin   => 0,
#     -xmax   => 15,
#     -ymin   => 0,
#     -ymax   => 15,
#     -parent => undef,
#     -pos    => undef);
#
###############################

sub new {

    # create self as new object
    my $class = shift;
    my $self  = {};
    bless( $self, $class );

    # initialize base attributes
    $self->{CHILDREN}  = {};
    $self->{FILLSTATE} = 0;

    # set coordinates, parent, position, based on input, bail if input not complete
    my %args = @_;
    for my $arg (qw/ xmin ymin xmax ymax parent pos /) {
        if ( !exists $args{"-$arg"} ) {
            carp "- must specify $arg";
            return;
        }

        $self->{ uc $arg } = $args{"-$arg"};
    }

    # calculate middle of coordinate range
    if ( $self->{XMAX} != $self->{XMIN} ) {
        $self->{XMID} = $self->{XMIN} + int( ( $self->{XMAX} - $self->{XMIN} ) / 2 );
        $self->{YMID} = $self->{YMIN} + int( ( $self->{YMAX} - $self->{YMIN} ) / 2 );
    }

    return $self;
}

###############################
#
# sub set( $x, $y )
#
# This function drills down into the quad tree, creating nodes as needed, until it reaches
# the node that exactly matches the cordinates given as input. Once that node is reached
# it sets all fill bits on that node by calling the adjust_fillstate method.
#
###############################

sub fill {
    my ( $self, $x, $y ) = @_;

    # set working variables to make code below more readable
    my ( $xmin, $ymin, $xmax, $ymax, $xmid, $ymid ) =
      ( $self->{XMIN}, $self->{YMIN}, $self->{XMAX}, $self->{YMAX}, $self->{XMID}, $self->{YMID} );

    # initialize working variables
    my ( $pos,     $child );
    my ( @xcoords, @ycoords );

    # find out in what quadrant of the current node the given coordinates are
    if   ( $y <= $ymid ) { $pos = 'n'; }
    else                 { $pos = 's'; }

    if   ( $x <= $xmid ) { $pos .= 'w'; }
    else                 { $pos .= 'e'; }

    # get pointer to child node that corresponds with the quadrant, create new child if necessary
    $child = $self->{CHILDREN}{$pos};
    if ( !defined $child ) {

        # calculate the coordinate range fors the new child node based on the quadrant
        if ( $pos =~ /n/ ) { @ycoords = ( $ymin, $ymid ); }
        else               { @ycoords = ( 1 + $ymid, $ymax ); }

        if ( $pos =~ /w/ ) { @xcoords = ( $xmin, $xmid ); }
        else               { @xcoords = ( 1 + $xmid, $xmax ); }

        # create new node and assign it to the current node as child for the given quadrant
        $child = Lifevis::QuadTree->new(
            -xmin   => $xcoords[0],
            -xmax   => $xcoords[1],
            -ymin   => $ycoords[0],
            -ymax   => $ycoords[1],
            -parent => $self,
            -pos    => $pos_bitmask{$pos}
        );
        $self->{CHILDREN}{$pos} = $child;
    }

    # set all fill bits on child node if it matches the given coordinates exactly,
    # otherwise call set on the child for the given quadrant to drill deeper
    if ( defined $xcoords[0] && $xcoords[0] == $xcoords[1] ) {
        $child->adjust_fillstate(ALL);
    }
    else {
        $child->fill( $x, $y );
    }

    return;
}

###############################
#
# sub adjust_fillstate( $quadrant_bit )
#
###############################

sub adjust_fillstate {
    my ( $self, $quadrant_bit ) = @_;

    # activate the given fill bit on the current node
    $self->{FILLSTATE} |= $quadrant_bit;

    # if all fill bits on the current node are set, delete children and
    # activate the fill bit of the quadrant of the current node on the parent node
    if ( $self->{FILLSTATE} == ALL ) {
        undef $self->{CHILDREN};
        $self->{PARENT}->adjust_fillstate( $self->{POS} );
    }

    return;
}

###############################
#
# sub adjust_fillstate( $quadrant_bit )
#
# This function extracts all the non-overlapping rectangles in the tree,
# returning their coordinates seperated by : in sets seperated by |.
#
###############################

sub get_rectangles {
    my ($self) = @_;

    # in case the whole tree gets filled, return the coordinates of the root node
    if ( $self->{FILLSTATE} == ALL ) {
        return "$self->{XMIN}:$self->{XMAX}:$self->{YMIN}:$self->{YMAX}|";
    }

    my $rectangles;

    # check if childs are adjacent and combine their coordinates as well as remove them from the tree
    for my $i ( 0 .. 3 ) {

        # get pair of possible adjacent childs
        my $one = $adjacent_pairs[$i][0];
        my $two = $adjacent_pairs[$i][1];

        # check if fill bits of pair are set
        if ( ( $self->{FILLSTATE} & $pos_bitmask{$one} ) and ( $self->{FILLSTATE} & $pos_bitmask{$two} ) ) {

            # get pointers for pair, makes the next step more readable
            my $child1 = $self->{CHILDREN}{$one};
            my $child2 = $self->{CHILDREN}{$two};

            # combine their coords
            $rectangles .= "$child1->{XMIN}:$child2->{XMAX}:$child1->{YMIN}:$child2->{YMAX}|";

            # delete them from the hash and unset their fill bit
            delete $self->{CHILDREN}{$one};
            delete $self->{CHILDREN}{$two};
            $self->{FILLSTATE} ^= $pos_bitmask{$one};
            $self->{FILLSTATE} ^= $pos_bitmask{$two};
        }
    }

    # deal with remaining childs
    for my $pos ( keys %{ $self->{CHILDREN} } ) {
        my $child = $self->{CHILDREN}{$pos};

        # either get the coordinates of child if is completely set, or get rectangles within child
        if ( $child->{FILLSTATE} == ALL ) {
            $rectangles .= "$child->{XMIN}:$child->{XMAX}:$child->{YMIN}:$child->{YMAX}|";
        }
        else {
            $rectangles .= $self->{CHILDREN}{$pos}->get_rectangles;
        }
    }

    # return string with coordinates of rectangles within this node
    return $rectangles;
}

1;
