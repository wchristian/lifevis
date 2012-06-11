package Image::BMP;

# Filename:	Image/BMP.pm
# Author:	David Ljung Madison <DaveSource.com>
# See License:	http://MarginalHacks.com/License/
#
# Description:	Reads a .bmp file.
# 		Can also "draw" bmp in ascii art.  Cute, eh?
#
# Limitations:	See perlpod doc at bottom
#
# I couldn't find a standard spec for the format.  I chose the fields using: 
#   http://www.daubnet.com/formats/BMP.html
#
# If you find a simple BMP image that this can't handle, I'd be interested
# in seeing it, though I can't guarantee I'll update the code to make it work..
#
# CHANGELOG
# ---------
#
# Version 1.16 2008/06/19
# -----------------------
# * Handle bitfield compression (Thanks Anatoly Savchenkov, asavchenkov alarity com)
#
# Version 1.15 2007/11/29
# -----------------------
# + Fix to avoid seeing 24b images as B&W (Thanks Christian Walde, mithaldu yahoo de)
#
# Version 1.14 2006/09/07
# -----------------------
# + Fix for border case on last byte in image (Thanks Peter Dons Tychsen, pdt gnmobile com)
# + Fix for ColorsUsed==0 (Thanks Marton Nemeth, Marton.Nemeth knorr-bremse com)
#   See MSDN / Administration and Management Graphics and Multimedia / Bitmaps /
#       About Bitmaps / Bitmap storage
#       http://windowssdk.msdn.microsoft.com/en-us/library/ms532311.aspx
#   and MSDN / Administration and Management Graphics and Multimedia / Bitmaps /
#       About Bitmaps / Bitmap reference / Bitmap structures / BITMAPINFOHEADER
#       http://windowssdk.msdn.microsoft.com/en-us/library/ms532290.aspx
#
# Version 1.13 2006/06/11
# -----------------------
# + Initial public release

use strict;
use IO::File;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $LIBRARY);
use Carp;

use Exporter ();
@ISA = qw(Exporter);
@EXPORT_OK = qw(open_file open_pipe close load colormap xy xy_rgb xy_index set save view_ascii debug remember_image ignore_imagemagick_bug add_pixel file);

$VERSION = '1.16';
$LIBRARY = __PACKAGE__;

##################################################
# Object stuff
##################################################
sub new {
  my $class = shift;
  my $self = bless {}, $class;
  return $self->init(@_);
}

sub init {
  my $self = shift;
  my %args = @_;

  # Init values
  $self->{debug} = 0;
  ## Pick one of the following for image->ascii conversion
  ## Simple and good for black and white:
  #my $ascii = ' .-xXX';
  ## 16 colors somewhat based off of Scarecrow's ASCII Art FAQ
  #my $ascii = ' .,;+xzmXYUCOMW%';
  ## Scarecrow's ASCII 70 colors (but very font dependent)
  my $ascii = ' .\'`^",:;Il!i><~+_-?][}{1)(|\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$';

  $self->{ascii_array} = [split(//,$ascii)];


  # Get arg values
  map($self->{$_}=$args{$_}, keys %args);

  $self->open_file() if $self->{file};

  $self;
}

END {
  # Cleanup code
}

# Access to fields
sub _setget {
  my ($field, $self, $val) = @_;
  $self->{$field} = $val if defined $val;
  $self->{$field};
}

sub debug { _setget('debug',@_); }
sub remember_image { _setget('remember_image',@_); }
sub ignore_imagemagick_bug { _setget('ignore_imagemagick_bug',@_); }
sub add_pixel {
  my ($self, $val) = @_;
  return $self->{add_pixel} unless defined $val;
  if ($val) {
    return error("add_pixel must be set to a code reference ('0' to clear)")
      unless ref $val eq 'CODE';
    $self->{add_pixel} = $val;
  } else {
    delete $self->{add_pixel}
  }
}

sub file { open_file(@_); }		# alias

##################################################
# Debugging and output
##################################################
sub _debug($@) {
  my ($self,$lvl) = (shift,shift);
  return unless $lvl <= $self->{debug};
  printf(@_);
}
sub error { carp "[$LIBRARY] ERROR: ",@_; return 0; }
sub fatal { croak "[$LIBRARY] ERROR: ",@_; }

##################################################
# Reading the bitmap
##################################################
sub open_file($$) {
  my ($bmp,$file) = @_;
  $file = $file || $bmp->{file};
  $bmp->_debug(1,"BMP: $file\n");
  $bmp->{fh} = new IO::File;
  $bmp->{file} = $file;

  # Avoid using open unless we need it.  Bit kludgy.  Unnecessary??
  $bmp->{_pipe} = ($file =~ /\|/) ? 1 : 0;
  if ($bmp->{_pipe}) {
    open($bmp->{fh},$bmp->{file})
      || fatal("Couldn't open pipe: $file");
  } else {
    sysopen($bmp->{fh},$bmp->{file},O_RDONLY)
      || fatal("Couldn't open file: $file");
  }

  $bmp->read_header;
  $bmp->read_infoheader;
  $bmp->read_index;

  # Clear the internal keys
  foreach my $k ( keys %$bmp ) {
    delete $bmp->{$k} if $k =~ /^_/ && $k ne '_pipe';
  }
  delete $bmp->{Image};
}

sub open_pipe($$) {
  my ($bmp,$pipe) = @_;
  # Perl is just too easy.
  $bmp->open_file("$pipe |");
}

sub close() {
  my ($bmp) = @_;
  return unless $bmp && $bmp->{fh};
  close $bmp->{fh};
}

sub read_bmp_str {
  my ($bmp,$bytes) = @_;
  my $str;
  my $num = sysread($bmp->{fh}, $str, $bytes);
  $bmp->{_byte}+=$num if defined $bmp->{_byte};
  fatal("Wanted $bytes bytes, saw $num") unless $num==$bytes;
  $bmp->_debug(5,"read_bmp_str($bmp->{file},$bytes) = $str\n");
  $str;
}

sub read_bmp {
  my ($bmp,$bytes) = @_;
  my $data = read_bmp_str($bmp,$bytes);
  my @data = unpack('C*',$data);
  my $num=0;
  foreach my $d ( reverse @data ) {
    $num = $num*256 + $d;
  }
  $bmp->_debug(4,"read_bmp($bmp->{file},$bytes) = $num\n");
  $num;
}

sub split_bits {
  my ($byte) = @_;
  split('',substr(unpack("B32",pack('N',$byte)),24,8));
}
sub read_bmp_bits {
  my ($bmp,$bits) = @_;

  # Just read bytes
  my $bytes = int($bits/8);
  return read_bmp($bmp,$bytes) if ($bytes*8 == $bits);

  # Otherwise pull the bits
  my @bits = ();
  while ($bits-->0) {
    @{$bmp->{_bits}} = split_bits(read_bmp($bmp,1))
      unless $bmp->{_bits} && @{$bmp->{_bits}};
    my $bit = shift(@{$bmp->{_bits}});
    push(@bits,$bit);
  }
# This code currently doesn't work...
  @bits;
}

# Read bmp to pad out to some chunksize (or 4 bytes)
sub pad_bmp {
  my ($bmp, $chunk) = @_;
  $chunk = $chunk || 4;
  my $pad = $chunk - $bmp->{_byte}%$chunk;
  $pad=0 if $pad==$chunk;
  $pad = $bmp->{_size}-$bmp->{_byte}-1 if ($bmp->{_byte}+$pad>=$bmp->{_size});
  read_bmp($bmp,$pad) if $pad>0;
}

# Writing files
sub write_file($$) {
  my ($bmp,$wfile) = @_;
  $wfile = $wfile || $bmp->{wfile};
  return unless $wfile;
  $bmp->{wfile} = $wfile;
  $bmp->{wfh} = new IO::File;
  sysopen($bmp->{wfh},$bmp->{wfile},O_WRONLY|O_CREAT)
    || fatal("Couldn't write file: $wfile");
}

sub write_bmp_str {
  my ($bmp,$bytes, $str) = @_;
  my $num = syswrite($bmp->{wfh}, $str, $bytes);
  fatal("Wanted to write $bytes bytes, wrote $num [$str]") unless $num==$bytes;
  $bmp->_debug(5,"write_bmp_str($bmp->{wfile},$bytes,$str)\n");
  $num;
}

sub write_bmp {
  my ($bmp,$bytes,$val) = @_;
  my @data;
  for(my $i=0; $i<$bytes; $i++) {
    push(@data, $val&255);
    $val >>= 8;
  }
  my $str = pack('C*',@data);
  my $num = write_bmp_str($bmp,$bytes,$str);
  $bmp->_debug(4,"write_bmp($bmp->{wfile},$val) <= $str\n");
  $num;
}

##################################################
# Header
##################################################
### short int of 2 bytes, int of 4 bytes, and long int of 8 bytes.
# typedef struct {
#    unsigned short int type;                 /* Magic identifier (BM)       */
#    unsigned int size;                       /* File size in bytes          */
#    unsigned short int reserved1, reserved2;
#    unsigned int offset;                     /* Offset to image data, bytes */
# } HEADER;
sub read_header() {
  my ($bmp) = @_;

  $bmp->{Signature} = read_bmp_str($bmp,2);
  $bmp->{FileSize} = read_bmp($bmp,4);
  read_bmp($bmp,2);	# reserved1
  read_bmp($bmp,2);	# reserved2
  $bmp->{DataOffset} = read_bmp($bmp,4);

  fatal("Not a bitmap: [$bmp->{file}]") unless $bmp->{Signature} eq "BM";
}

sub write_header() {
  my ($bmp) = @_;

  write_bmp_str($bmp,2, $bmp->{Signature});
  my $fsize = $bmp->{DataOffset} + $bmp->{Width}*$bmp->{Height}*$bmp->{BitCount}/8;
  write_bmp($bmp,4, $fsize);
  write_bmp($bmp,2,0);	# reserved1
  write_bmp($bmp,2,0);	# reserved2
# Arguably we should recalc DataOffset
  write_bmp($bmp,4, $bmp->{DataOffset});

  fatal("Not a bitmap: [$bmp->{file}]") unless $bmp->{Signature} eq "BM";
}

##################################################
# Image info data
##################################################
#typedef struct {
#   unsigned int size;               /* Header size in bytes      */
#   int width,height;                /* Width and height of image */
#   unsigned short int planes;       /* Number of colour planes   */
#   unsigned short int bits;         /* Bits per pixel            */
#   unsigned int compression;        /* Compression type          */
#   unsigned int imagesize;          /* Image size in bytes       */
#   int XpixelsPerM,YpixelsPerM;     /* Pixels per meter          */
#   unsigned int ColorsUsed;           /* Number of colours         */
#   unsigned int ColorsImportant;   /* Important colours         */
#} INFOHEADER;

sub read_infoheader() {
  my ($bmp) = @_;
  $bmp->{HeaderSize} = read_bmp($bmp,4);
  $bmp->{Width} = read_bmp($bmp,4);
  $bmp->{Height} = abs(read_bmp($bmp,4));	# Can be negative??
  $bmp->{Planes} = read_bmp($bmp,2);
  $bmp->{BitCount} = read_bmp($bmp,2);
  $bmp->{ColorBytes} = int(($bmp->{BitCount}+7)/8);
  $bmp->{Compression} = read_bmp($bmp,4);
    # Compression BI_RGB = 0;	(no compression)
    # Compression BI_RLE8 = 1;
    # Compression BI_RLE4 = 2;
    # Compression BI_BITFIELDS = 3;
  $bmp->{ImageSize} = read_bmp($bmp,4);
  $bmp->{XpixelsPerM} = read_bmp($bmp,4);
  $bmp->{YpixelsPerM} = read_bmp($bmp,4);
  $bmp->{ColorsUsed} = read_bmp($bmp,4);
  $bmp->{ColorsImportant} = read_bmp($bmp,4);
	$bmp->{ColorsUsed} = 1<<$bmp->{BitCount} if $bmp->{ColorsUsed} == 0;

  $bmp->_debug(1,"Image: $bmp->{BitCount}/$bmp->{ColorsUsed} colors. Geometry: $bmp->{Width}x$bmp->{Height} $bmp->{ImageSize} [comp: $bmp->{Compression}]\n");

  fatal("Unknown bitmap format (hdr size!=40?): [$bmp->{file}]")
    unless $bmp->{HeaderSize}==40;

  $bmp->{_colors} = $bmp->{ColorsUsed} || 1<<$bmp->{BitCount};
  $bmp->{_colors} = 0 if $bmp->{_colors}==(1<<24);	# No truecolor map

	# Treat mask colors as color indexes (just to skip them) and reset
	# compression to none [Thanks Anatoly Savchenkov, asavchenkov alarity com]
	# MSDN Article:  "BI_BITFIELDS"
	# Specifies that the bitmap is not compressed and that the color table
	# consists of three DWORD color masks that specify the red, green, and
	# blue components, respectively, of each pixel. This is valid when used
	# with 16- and 32-bpp bitmaps.
	($bmp->{_colors}, $bmp->{Compression}) = (3,0)
		if $bmp->{Compression} == 3;

  my $DataOffset = 14+40+4*$bmp->{_colors};
  error("Corrupt bitmap header?  [$bmp->{file}]\n  (DataOffset!=14+40+4*Colors?)")
    unless $bmp->{DataOffset} == $DataOffset;
  $bmp->{DataOffset} = $DataOffset;

  # Do we use indexed color?
  $bmp->{IndexedColor} = 1;
  $bmp->{IndexedColor} = 0 if $bmp->{BitCount}==24;	# True color
  $bmp->{IndexedColor} = 0 if $bmp->{BitCount}==1;	# B&W
  $bmp->{IndexedColor} = 0 if !$bmp->{ColorsUsed};
}

sub write_infoheader() {
  my ($bmp) = @_;
  write_bmp($bmp,4, $bmp->{HeaderSize});
  write_bmp($bmp,4, $bmp->{Width});
  write_bmp($bmp,4, $bmp->{Height});
  write_bmp($bmp,2, $bmp->{Planes});
  write_bmp($bmp,2, $bmp->{BitCount});
  write_bmp($bmp,4, 0);	# No compression on writing

  # Calc imagesize (width*height*bits + padding)
  my $line = $bmp->{Width} * $bmp->{BitCount};
  my $pad = 32-$line%32;  $pad=0 if $pad==32;
  my $size = ($line+$pad)*$bmp->{Height}; #*$bmp->{BitCount};

  write_bmp($bmp,4, int($size/8));
  write_bmp($bmp,4, $bmp->{XpixelsPerM});
  write_bmp($bmp,4, $bmp->{YpixelsPerM});
  write_bmp($bmp,4, $bmp->{ColorsUsed});
  write_bmp($bmp,4, $bmp->{ColorsImportant});
}

sub rgb {
  my ($rgb) = @_;
  $rgb=0 unless defined $rgb;
  ((($rgb>>16) & 0xff),
   (($rgb>>8 ) & 0xff),
   (($rgb>>0 ) & 0xff));
}

sub read_index() {
  my ($bmp) = @_;

  unless ($bmp->{IndexedColor}) {
    # Sometimes when ColorsUsed is 0 they still have the
    # basic greyscale map, we need to skip past it.
    if ($bmp->{_pipe}) {
      read_bmp($bmp,4*$bmp->{_colors});
    } else {
      sysseek($bmp->{fh},$bmp->{DataOffset},SEEK_SET);
    }
    return;
  }

  for(my $i=0; $i<$bmp->{ColorsUsed}; $i++) {
    # r,g,b
    my $rgb = read_bmp($bmp,4);
    $bmp->{Index}{rgb}[$i] = $rgb;
    $bmp->{Index}{back}{$rgb} = $i;
  }
}

sub write_index() {
  my ($bmp) = @_;

  unless ($bmp->{IndexedColor}) {
    # Sometimes when ColorsUsed is 0 they still have the
    # basic greyscale map, we need to get past the DataOffset we wrote
    # We could've recalced DataOffset above, but I'm lazy..
    write_bmp($bmp,4*$bmp->{_colors},0);
    return;
  }

  for(my $i=0; $i<$bmp->{ColorsUsed}; $i++) {
    write_bmp($bmp,4, $bmp->{Index}{rgb}[$i]);
  }
}

sub colormap {
  my ($bmp, $index) = @_;

  # B&W
  return $index ? 0xffffff : 0x000000
    if $bmp->{BitCount}==1 || (!$bmp->{ColorsUsed} && $bmp->{BitCount}!=24);

  # True color
  return $index unless $bmp->{IndexedColor};

  $bmp->{Index}{rgb}[$index];
}

sub decolormap {
  my ($bmp, $color) = @_;

  # B&W
  return $color ? 1 : 0 if $bmp->{BitCount}==1 || !$bmp->{ColorsUsed};

  # True color
  return $color unless $bmp->{IndexedColor};

  my $index = $bmp->{Index}{back}{$color};
  return $index if defined $index;
  fatal("Color [$color] not found in orginal colormap\nCurrently the colormap is not updated with new colors\n");
}

##################################################
# Image
##################################################
sub next_xy {
  my ($bmp,$x,$y,$pad) = @_;

  # Padding at end of each line
  pad_bmp($bmp) if $pad && $x==$bmp->{Width}-1;
  return (undef,undef) if $bmp->{_byte}>$bmp->{_size};

  ($x,$y) = (0, $y-1) if (++$x >= $bmp->{Width});
  return (undef,undef) unless defined $y && $y>=0;
  ($x,$y);
}

sub error_too_big {
  my ($bmp) = @_;
  error("Corrupt BMP - too big.\n",
        "  (ImageMagick sometimes incorrectly places endline marker",
        "   Set option 'ignore_imagemagick_bug' to hide this message)")
    unless $bmp->{ignore_imagemagick_bug}++;
}

sub _add_pixel {
  my ($bmp,$x,$y,$color) = @_;
  return error_too_big($bmp) unless defined $y && $y>=0;

  $bmp->_debug(3,"Pixel($x,$y) = %0.2x,%0.2x,%0.2x\n",rgb($color));

  # Save it in our 2D array
  $bmp->{Image}[$x][$y] = $color
    if !$bmp->{add_pixel} || $bmp->{remember_image};

  # add_pixel function?
  return unless $bmp->{add_pixel};
  fatal("add_pixel must be a subroutine pointer [not ".(ref $bmp->{add_pixel})."]")
    unless (ref $bmp->{add_pixel} eq 'CODE');
  &{$bmp->{add_pixel}}($bmp,$x,$y,rgb($color));
}

sub load() {
  my ($bmp, $file) = @_;

  $bmp->file($file) if $file;
  return error("You haven't opened a file yet") unless $bmp->{file};

  if ($bmp->{_image_loaded}) {
    if ($bmp->{_pipe}) {
      return error("You can't call load twice on a pipe.\n  Use 'remember_image' option");
    } elsif ($bmp->{_image_remembered} && !$bmp->{add_pixel}) {
      # There's no reason to do this again, unless they want
      # to save the image, or else call their add_pixel again.
      return 1;
    }
    sysseek($bmp->{fh},$bmp->{DataOffset},SEEK_SET);
  }

  # Compressed?
  my $rle = ($bmp->{Compression}==1 && $bmp->{BitCount}==8) ? 1 : 0;
  fatal("Can't handle this bitmap compression: [$bmp->{file}]\n\t(Try 'convert -compress None')")
    if $bmp->{Compression} && !$rle;

  # We need to read bits for this - which would mean buffering and shit..
  fatal("Can't handle non-byte indexes - sorry [$bmp->{BitCount} bits].")
    unless $bmp->{BitCount}==1 || $bmp->{BitCount}==8*(int($bmp->{BitCount}/8));

  # Calculate size
  my $line = $bmp->{Width} * $bmp->{BitCount};
  # Each line is padded to 4 bytes
  my $pad = 32-$line%32;  $pad=0 if $pad==32;
  $bmp->{_sizebits} = ($line+$pad)*$bmp->{Height}; #*$bmp->{BitCount};
  $bmp->{_size} = $bmp->{_sizebits}/8;

  $bmp->{_size} = $bmp->{ImageSize} if $rle;
  $bmp->{ImageSize} = $bmp->{ImageSize} || $bmp->{_size};

  error("Error - imagesize doesn't seem to be calculated properly:\n".
        "  (imagesize < width+padding * height)")
    unless $bmp->{_size} == $bmp->{ImageSize};

  $bmp->_debug(1,"Reading image data - [$bmp->{Width} x $bmp->{Height} x $bmp->{BitCount}]...\n");

  # Image starts from bottom left and reads right then up
  my ($x,$y) = (0, $bmp->{Height}-1);
  $bmp->{_byte}=0;
  while ($bmp->{_byte}<=$bmp->{_size}) {
    if ($rle) {
      my $n = read_bmp($bmp,1);
      my $c = read_bmp($bmp,1);
      if ($n) {
        # Repeat next byte 'n' times
#TODO: Compression lvl 2 (4-bit color) needs to flip colors back and forth...
        while ($n-->0) {
          _add_pixel($bmp,$x,$y,colormap($bmp,$c));
          ($x,$y) = next_xy($bmp,$x,$y);
        }
        last unless defined $x;
      } else {
        if ($c==0) {
          # End of line
          $x=0 if $x;
          #($x,$y) = (0,$y-1) if $x;
        } elsif ($c==1) {
          # End of bitmap
          last;
          # Sometimes there are bytes left in _size - I don't know why...
          # Oh - actually we should be 4byte aligned - that might be it.

        } elsif ($c==2) {
          # Delta.  Following 2 bytes are offset x,y
# Argh..  Not tested.  I need an image that uses this encoding.
print STDERR "Untested delta code.. Please send me a copy of this image for testing!\n";
          my $dx = read_bmp($bmp,1);
          my $dy = read_bmp($bmp,1);
          $x+=$dx;
          $y-=$dy;

        } else {
          # Following 'c' bytes are regular colors.  Pad if 'c' is odd.
          my $pad = $c&1;
          while ($c-->0) {
            my $index = read_bmp($bmp,1);
            _add_pixel($bmp,$x,$y,colormap($bmp,$index));
            ($x,$y) = next_xy($bmp,$x,$y);
          }
          error("Corrupt BMP: pad byte should be zero")
            if ($pad && read_bmp($bmp,1))
        }
      }
    } else {
      my ($index) = read_bmp_bits($bmp,$bmp->{BitCount});
      my $color = colormap($bmp,$index);
      _add_pixel($bmp,$x,$y,$color);

      ($x,$y) = next_xy($bmp,$x,$y,1);
      last unless defined $x;
    }
  }

  $bmp->{_image_loaded} = 1;
  $bmp->{_image_remembered} = (!$bmp->{add_pixel} || $bmp->{remember_image}) ? 1 : 0;

  # Should finish at:
  error("Premature end of BMP file [$x,$y]")
    if defined $x && ($x!=$bmp->{Width}-1 || $y);

  1;
}

# We can't do some things until we have the image read
sub needs_image {
  my ($bmp,$do) = @_;

  return undef if !$bmp->{_image_loaded} && !$bmp->load;

  # Do we have image data?
  unless ($bmp->{_image_remembered}) {
    error("Can't $do with add_pixel functions\n  (Unless you set 'remember_image')\n");
    return undef;
  }
}

sub save() {
  my ($bmp, $file) = @_;

  $bmp->needs_image("save images");

  $bmp->write_file($file);

  $bmp->write_header;
  $bmp->write_infoheader;
  $bmp->write_index;

  $bmp->_debug(1,"Writing image data...\n");

  # Each line is padded to 4 bytes
  my $line = $bmp->{Width} * $bmp->{BitCount};
  my $pad = 32-$line%32;  $pad=0 if $pad==32;

  # Image starts from bottom left and reads right then up
  for (my $y=$bmp->{Height}-1; $y>=0; $y--) {
    for (my $x=0; $x<$bmp->{Width}; $x++) {
      my $color = xy($bmp,$x,$y);
      my $index = $bmp->decolormap($color);
      write_bmp($bmp, $bmp->{BitCount}/8, $index);
    }
    write_bmp($bmp,int($pad/8),0) if $pad>0;
  }
  1;
}

# "Darkness" is distance from white (0 to 1)
my $MAXDARK = sqrt(0xff*0xff*3);
sub darkness {
  my ($r,$g,$b) = @_;
  ($r,$g,$b) = rgb($r) unless defined $g;
  my $dark = sqrt((0xff-$r)**2+(0xff-$g)**2+(0xff-$b)**2) / $MAXDARK;
}

# Get or set a given pixel, undef on error
sub xy_index {
  my ($bmp,$x,$y, $index) = @_;

  $bmp->needs_image("use xy method");

  if ($x>=$bmp->{Width} || $x<0 ||
      $y>=$bmp->{Height} || $y<0) {
    error("xy_index($x,$y) is out of bounds [$bmp->{Width}x$bmp->{Height}]");
    return undef;
  }

  return $bmp->{Image}[$x][$y] = $bmp->colormap($index) if defined($index);
  $bmp->decolormap($bmp->{Image}[$x][$y] || 0);
}

sub xy {
  my ($bmp,$x,$y, $val) = @_;

  $bmp->needs_image("use xy method");

  if ($x>=$bmp->{Width} || $x<0 ||
      $y>=$bmp->{Height} || $y<0) {
    error("xy($x,$y) is out of bounds [$bmp->{Width}x$bmp->{Height}]");
    return undef;
  }

  return $bmp->{Image}[$x][$y] || 0 unless defined $val;
  $bmp->{Image}[$x][$y] = $val;
}

sub xy_rgb {
  my ($bmp,$x,$y, $r,$g,$b) = @_;

  if (defined($r)) {
    my $color = (($r&0xff)<<16)|(($g&0xff)<<8)|(($b&0xff)<<0);
    return $bmp->xy($x,$y,$color);
  }
  my $color = $bmp->xy($x,$y);
  return undef unless defined $color;
  return rgb($color);
}

# Simple ascii viewer
sub view_ascii {
  my ($bmp) = @_;

  $bmp->needs_image("use view_ascii method");

  for(my $y=0; $y<$bmp->{Height}; $y++) {
    for(my $x=0; $x<$bmp->{Width}; $x++) {
      # Go ahead.  Just *try* to figure it out.
      print $bmp->{ascii_array}[int($#{$bmp->{ascii_array}}*darkness($bmp->{Image}[$x][$y]))];
    }
    print "\n";
  }
}

# View it upside-down.  More immediate gratification, due to upside-down
# nature of bitmaps.  Useful for testing, but only works with some images.
sub flipped_ascii {
  my ($bmp) = @_;
  my $saved_pixel = $bmp->{add_pixel};
  $bmp->{add_pixel} = sub {
    my ($bmp,$x,$y,$r,$g,$b) = @_;
    print "\n"x ($bmp->{_lasty} - $y);
    $bmp->{_lastx}=0 unless $bmp->{_lasty} == $y;
    print " "x ($bmp->{_lastx} - $x - 1);
    print $bmp->{ascii_array}[int($#{$bmp->{ascii_array}}*darkness($r,$g,$b))];
    ($bmp->{_lastx},$bmp->{_lasty}) = ($x,$y);
  };
  $bmp->load;
  $bmp->{add_pixel} = $saved_pixel;
}

1;

__END__

=pod

=head1 NAME

Image::BMP - Bitmap parser/viewer

=head1 SYNOPSIS

 use Image::BMP;

 # Example one:
 my $img = new Image::BMP(
        file            => 'some.bmp',
        debug           => 1,
        );
 $img->view_ascii;

 # Example two:
 my $img2 = new Image::BMP;
 $img2->open_file('another.bmp');
 my $color = $img2->xy(100,100);	# Get pixel at 100,100
 my ($r,$g,$b) = $img2->xy_rgb(100,200);

=head1 DESCRIPTION

C<Image::BMP> objects can parse and even ascii view bitmaps of the
.BMP format.  It can read most of the common forms of this format.

It can be used to:

=over

=item Just get image info, don't read the whole image:

 my $img = new Image::BMP(file => 'some.bmp');
 print "Resolution: $img->{Width} x $img->{Height}\n";

=item View images

  (See C<SYNOPSIS> example one)

=item Read images and poke at pixels

  (See C<SYNOPSIS> example two)

=item Parse through all pixel data

  (See C<ADD_PIXEL> below)

=back

It does not currently write bmap data, simply because I didn't
have a use for that yet.  Convince me and I'll add it.

=head1 IMAGE INFO

The following data/keys are read when opening an image:

  FileSize, DataOffset, HeaderSize, Width, Height,
  Planes, BitCount, ColorBytes, Compression,
    (compression enum: RGB, RLE8, RLE4, BITFIELDS)
  ImageSize, XpixelsPerM, YpixelsPerM, ColorsUsed, ColorsImportant

=head1 METHODS

=over

=item $img = new Image::BMP(%options);

Constructs a new C<Image::BMP> object:

=item $img->open_file($filename);

Opens a file and reads the initial image information and colormap.

=item $img->open_pipe($command);

Opens a pipe to a command that outputs a bitmap (and reads image
info/colormap).  Example:

  $img->open_pipe("convert some.jpg bmp:-");

=item $img->close;

Close a file.

=item $img->load;  $img->load($file);

Read the image in.  Uses the file in %options if not specified.

=item $color = $img->colormap($index);

Lookup an index in the colormap;

=item $color = $img->xy($x,$y);  $img->xy($x,$y,$color);

Lookup or set a pixel in the image by color.
(Calls C<load> if necessary)

=item $index = $img->xy_index($x,$y);  $img->xy_index($x,$y,$index);

Lookup or set a pixel in the image by index.
(Calls C<load> if necessary)

=item ($r,$g,$b) = $img->xy_rgb($x,$y);  $img->xy_rgb($x,$y,$r,$g,$b);

Lookup or set a pixel in the image by rgb values.
(Calls C<load> if necessary)

=item $img->view_ascii;

Do a print of the image in crude ASCII fashion.
Useful for debugging of small images.
For kicks, open an xterm, set the font to "unreadable" and view the output.
(Calls C<load> if necessary)

=item $img->debug( [$val] )

Get/set the C<debug> setting.  Values are:

=over

=item 0. quiet

=item 1. Minimal info

=item 2. Colorspace

=item 3. Pixel data

=back

Generally only debug=0 or =1 are useful.

=item $img->remember_image( [$val] )

Get/set the C<remember_image> setting.  See C<ADD_PIXEL> below.

=item $img->add_pixel( [$code] )

Get/set the add_pixel subroutine pointer.

=back

=head1 ADD_PIXEL

Instead of having the object read the image into memory (or in addition to),
you can process all the image data yourself by supplying a callback function:

 sub my_add {
   my ($img,$x,$y,$r,$g,$b) = @_;
   print "add pixel $x,$y = $r,$g,$b\n";
 }
 my $img = new Image::BMP(file => 'some.bmp', add_pixel = \&my_add);
 $img->load;

It may be useful to note that most bitmaps are read from left to right
and I<bottom to top> (x from 0 to width, y from height to 0), though
the compression can skip values.

If you supply an C<add_pixel> callback then C<load> will I<not>
store the image data for efficiency.  This means, however, that
C<view_ascii>, C<xy> and C<xy_rgb> will not work.  You can use
C<add_pixel> and still save the image in memory by setting
C<remember_image>.

=head1 LIMITATIONS

=over

=item	4-bit RLE compression

I haven't seen an image like this yet, it wouldn't be hard to add.

=item	bitfields compression

I don't even know what that is..

=item	RLE 'delta' compression

This isn't tested yet - I haven't seen an image that uses this portion
of RLE compression, so it currently does what I think is right and
then prints a message asking you to send me the image/results.

=back

=head1 COPYRIGHT

  Copyright 2004 <a href="http://GetDave.com/">David Ljung Madison</a>.  All rights reserved.
  See: <a href="http://MarginalHacks.com/">MarginalHacks.com</a>

=cut
