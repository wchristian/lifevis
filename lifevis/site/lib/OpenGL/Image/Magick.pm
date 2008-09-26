############################################################
#
# OpenGL::Image::Magick - Copyright 2007 Graphcomp - ALL RIGHTS RESERVED
# Author: Bob "grafman" Free - grafman@graphcomp.com
#
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.
#
############################################################

package OpenGL::Image::Magick;

require Exporter;

use Carp;

use vars qw($VERSION $DESCRIPTION @ISA);
$VERSION = '1.01';

$DESCRIPTION = qq
{Supports optimized internal interfaces to the ImageMagick library.};

use OpenGL::Image::Common;
@ISA = qw(Exporter OpenGL::Image::Common);

use OpenGL(':constants');



=head1 NAME

  OpenGL::Image::Magick - copyright 2007 Graphcomp - ALL RIGHTS RESERVED
  Author: Bob "grafman" Free - grafman@graphcomp.com

  This program is free software; you can redistribute it and/or
  modify it under the same terms as Perl itself.


=head1 DESCRIPTION

  This is a driver module for use with the OpenGL module.
  While it may be called directly, it will more often be called
  by the OpenGL::Image abstraction module.

  Note: OpenGL::Image defaults to this module.

  This is a subclass of the OpenGL::Image::Common module.

  Requires the Image::Magick module; 6.3.5 or newer is recommended.


=head1 SYNOPSIS

  ##########
  # Check for installed imaging engines

  use OpenGL::Image;
  my $img = new OpenGL::Image(engine=>'Magick',source=>'MyImage.png');


  ##########
  # Methods defined in the OpenGL::Image::Common module:

  # Get native engine object
  # Note: must not change image dimensions
  my $obj = $img->Native;
  $obj->Quantize() if ($obj);

  # Alternately (Assuming the native engine supports Blur):
  $img->Native->Blur();

  # Test if image width is a power of 2
  if ($img->IsPowerOf2());

  # Test if all listed values are a power of 2
  if ($img->IsPowerOf2(@list));

  # Get largest power of 2 size within dimensions of image
  my $size = $img->GetPowerOf2();

  # Get all parameters as a hashref
  my $params = $img->Get();

  # Get one or more parameter values
  my @values = $img->Get(@params);

  # Get/Set Pixel values (normalized to 1.0)
  my($r,$g,$b,$a) = $img->GetPixel($x,$y);

  # Sync cache after done modifying pixels
  $img->SetPixel($x,$y,$r,$g,$b,$a);
  $frame->Sync();


  ##########
  # Supported parameters:

  # source - source image, if defined
  # width - width of image in pixels
  # height - height of image in pixels
  # pixels - number of pixels
  # components - number of pixel components
  # size - bytes per component
  # length - cache size in bytes
  # endian - 1 if big endian; otherwise 0
  # alpha - 1 if has alpha channel, -1 if has inverted alpha channel; 0 if none
  # flipped - 1 bit set if cache scanlines are top to bottom; others reserved
  # gl_internalformat - internal GL pixel format. eg: GL_RGBA8, GL_RGBA16
  # gl_format - GL pixel format. eg: GL_RGBA, GL_BGRA
  # gl_type - GL data type.  eg: GL_UNSIGNED_BYTE, GL_UNSIGNED_SHORT


  ##########
  # APIs defined in this module:

  # Get engine version
  my $ver = OpenGL::Image::THIS_MODULE::EngineVersion();

  # Get engine description
  my $desc = OpenGL::Image::ENGINE_MODULE::EngineDescription();


  ##########
  # Methods defined in this module:

  # Sync the image cache after modifying pixels.
  # Used by some engines for paged caches; otherwise a NOP.
  $img->Sync();

  # Return the image's cache as an OpenGL::Array object.
  # Note: OGA may change after a cache update
  my $oga = $img->GetArray();

  # Return a C pointer to the image's cache.
  # For use with OpenGL's "_c" APIs.
  # Note: pointer may change after a cache update
  $img->Ptr();

  # Save file - automatically does a Sync before write
  $img->Save('MyImage.png');

  # Get image blob.
  my $blob = $img->GetBlob();

=cut

eval 'use Image::Magick';


# Get engine version
sub EngineVersion
{
  return $Image::Magick::VERSION;
}

# Get engine description
sub EngineDescription
{
  return $DESCRIPTION;
}

# Base constructor
sub new
{
  my $this = shift;
  my $class = ref($this) || $this;

  my $self = new OpenGL::Image::Common(@_);
  return undef if (!$self);

  $self->{params}->{engine} = 'Magick';
  $self->{params}->{version} = EngineVersion();

  # Use source image if supplied
  if ($self->{params}->{source})
  {
    my $img = new Image::Magick();
    return undef if (!$img);

    my $stat = $img->Read($self->{params}->{source});
    return undef if ($stat);

    ($self->{params}->{width},$self->{params}->{height}) =
      $img->Get('Width','Height');
    return undef if (!$self->{params}->{width} || !$self->{params}->{height});

    $img->Flip();
    $self->{native} = $img;
  }
  # Otherwise create uninitialized image
  else
  {
    my $w = $self->{params}->{width};
    my $h = $self->{params}->{height};
    my $blob = $self->{params}->{blob};

    if ($w && $h)
    {
      my $dim = $w.'x'.$h;
      $self->{native} = new Image::Magick(size=>$dim,magick=>'RGBA',depth=>8);
    }
    elsif ($blob)
    {
      $self->{native} = new Image::Magick();
    }
    return undef if (!$self->{native});
    my $img = $self->{native};

    # Populate with blob
    if ($blob)
    {
      my $stat = $img->BlobToImage($blob);
      return undef if ($stat);

      if (!$w || !$h)
      {
        ($self->{params}->{width},$self->{params}->{height}) =
          $img->Get('Width','Height');
      }
    }
    # Otherwise fill with black
    else
    {
      my $stat = $img->Read('xc:black');
      return undef if ($stat);
      $img->Set(type=>'truecolormatte');
      $img->Negate(channel=>'alpha');
    }
  }

  # Good to go
  bless($self,$class);

  # Init params
  $self->init();

  return $self;
}

# Initialize object
sub init
{
  my($self) = @_;

  my $params = $self->{params};
  $params->{components} = 4;
  $params->{flipped} = 1;

  my $w = $params->{width};
  my $h = $params->{height};
  $params->{pixels} = $w * $h; 
  my $elements = $params->{pixels} * $params->{components};

  my $img = $self->{native};

  # Use C pointer to image cache, if supported
  if ($params->{version} ge '6.3.5')
  {
    my $q = $img->Get('quantum');

    if ($q == 8)
    {
      $params->{gl_internalformat} = GL_RGBA8;
      $params->{gl_type} = GL_UNSIGNED_BYTE;
      $params->{size} = 1;
    }
    elsif ($q == 16)
    {
      $params->{gl_internalformat} = GL_RGBA16;
      $params->{gl_type} = GL_UNSIGNED_SHORT;
      $params->{size} = 2;
    }

    if ($params->{gl_type})
    {
      $params->{gl_format} = $params->{endian} ? GL_RGBA : GL_BGRA;
      my $alpha = $img->Get('matte');
      $img->Set('matte'=>'True') if (!$alpha);

      $img->Negate(channel=>'Alpha');
      $params->{alpha} = -1;
      $params->{length} =  $params->{size} * $elements;

      $self->{oga} = OpenGL::Array->new_pointer($params->{gl_type},
        $img->GetImagePixels(rows=>$h),$elements);

      return if ($self->{oga});
    }
  }

  # Fall back to using standard PerlMagick interface
  $self->{blobs} = 1;
  $params->{gl_internalformat} = GL_RGBA8;
  $params->{gl_type} = GL_UNSIGNED_BYTE;
  $params->{size} = 1;
  $params->{gl_format} = GL_RGBA;
  $params->{alpha} = 1;
  $params->{length} = $params->{pixels} * $params->{components} *
    $params->{size};

  $img->Set(magick=>'RGBA',depth=>8);
  $self->{oga} = OpenGL::Array->new_scalar($params->{gl_type},
    $img->ImageToBlob(),$elements);
}

# Sync image cache
sub Sync
{
  my($self) = @_;

  my $img = $self->{native};
  if ($self->{blobs})
  {
    $img->BlobToImage($self->{oga}->retrieve_data());
  }
  else
  {
    $img->SyncImagePixels();
  }
}

# Sync oga
sub SyncOGA
{
  my($self) = @_;

  my $img = $self->{native};
  my $params = $self->{params};

  my($w,$h) = $img->Get('width','height');
  if ($w != $params->{width} || $h != $params->{height})
  {
    $params->{width} = $w;
    $params->{height} = $h;
    $params->{pixels} = $w * $h; 

    my $elements = $params->{pixels} * $params->{components};
    $params->{length} = $elements * $params->{size};

    if ($self->{blobs})
    {
      $img->Set(magick=>'RGBA',depth=>8);

      $self->{oga} = OpenGL::Array->new_scalar($params->{gl_type},
        $img->ImageToBlob(),$elements);
    }
    else
    {
      my $alpha = $img->Get('matte');
      $img->Set('matte'=>'True') if (!$alpha);

      $img->Negate(channel=>'Alpha');

      $self->{oga} = OpenGL::Array->new_pointer($params->{gl_type},
        $img->GetImagePixels(rows=>$h),$elements);
    }
  }
  elsif ($self->{blobs})
  {
    my $elements = $params->{pixels} * $params->{components};

    $img->Set(magick=>'RGBA',depth=>8);

    $self->{oga} = OpenGL::Array->new_scalar($params->{gl_type},
      $img->ImageToBlob(),$elements);
  }
  else
  {
    my $h = $params->{height};
    $self->{oga}->update_pointer($img->GetImagePixels(rows=>$h));
  }
}

# Get OpenGL::Array object
sub GetArray
{
  my($self) = @_;
  $self->SyncOGA();
  return $self->{oga};
}

# Get C pointer to image cache
sub Ptr
{
  my($self) = @_;
  $self->SyncOGA() if (!$self->{blobs});
  return undef if (!$self->{oga});
  return $self->{oga}->ptr();
}

# Save image
sub Save
{
  my($self,$file,%user_params) = @_;
  my $img = $self->{native};
  my $params = $self->{params};

  $self->Sync();

  if ($params->{alpha} == -1)
  {
    $img->Negate(channel=>'alpha');
  }

  if ($params->{flipped})
  {
    $img->Flip();
  }

  my $blob;
  if ($file)
  {
    if ($self->{blobs} && $img->[1])
    {
      $img->[1]->Write(filename=>$file,%user_params);
    }
    else
    {
      $img->[0]->Write(filename=>$file,%user_params);
    }
  }
  else
  {
    %user_params = (magick=>'RGBA',depth=>8) if (!scalar(%user_params));
    delete($user_params{filename});

    my $clone = $img->Clone();
    $clone->Set(%user_params);
    ($blob) = $clone->ImageToBlob();
  }

  if ($params->{flipped})
  {
    $img->Flip();
    $self->SyncOGA();
  }

  if ($params->{alpha} == -1)
  {
    $img->Negate(channel=>'alpha');
  }

  return $blob;
}

# Get image blob
sub GetBlob
{
  my($self,%params) = @_;
  return $self->Save(undef,%params);
}

1;
__END__

