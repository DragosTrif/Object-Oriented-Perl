package CD::Music;
$VERSION = 1.00;
use strict;

use Carp;
use Data::Dumper;

my %ALLOWED_ATTRIBUTS =
  map { $_ => 1 } qw (name artist publisher ISBN tracks room shelf rating);

{    # encapsulating  $_count
  my $_count = 0;
  my $_incr_count = sub { ++$_count };

  sub new {
    my ( $class, $args_for ) = @_;

    my $self = bless {} => $class;
    $self->_initialize($args_for);

    $_incr_count->();

    return $self;
  }

  sub get_count { $_count }
}    # end encapsulating

sub _initialize {
  my ( $self, $arg_for ) = @_;

  my %arg_for = %$arg_for;

  foreach my $property ( keys %ALLOWED_ATTRIBUTS ) {
    my $value = delete $arg_for{$property};

    unless ( defined $value && $value =~ /\S/ ) {
      croak("property '$property' must have at a value");
    }

    $self->{$property} = $value;

  }

  if ( my $extra = join ',', keys %arg_for ) {
    croak("attr $extra not allowed");
  }
}

sub name      { shift->{name} }
sub artist    { shift->{artist} }
sub publisher { shift->{publisher} }
sub ISBN      { shift->{ISBN} }
sub tracks    { shift->{tracks} }
sub room      { shift->{room} }
sub shelf     { shift->{shelf} }
sub rating    { shift->{rating} }

sub set_location {
  my ( $self, $shelf, $room ) = @_;

  # overide the location if necesary
  $self->{room}  = $room  if $room;
  $self->{shelf} = $shelf if $shelf;
  return ( $self->{room}, $self->{shelf} );
}
1;

