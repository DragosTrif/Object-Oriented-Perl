package CD::Music;

use strict;
use warnings;

use Carp;
use Data::Dumper;

sub new {
  my $class = @_;

  bless {
    _name      => $_[1],
    _artist    => $_[2],
    _publisher => $_[3],
    _ISBN      => $_[4],
    _tracks    => $_[5],
    _room      => $_[6],
    _shelf     => $_[7],
    _rating    => $_[8],
  };
}

# sub read_only
sub read_only {
  croak "Can't change value of read-only attribute " . ( caller 1 )[3]
    if @_ > 1;
}

# $_[0] is $self;
# this acessor methods
sub get_name      { &read_only; $_[0]->{_name} }
sub get_artist    { &read_only; $_[0]->{_artist} }
sub get_publisher { &read_only; $_[0]->{_publisher} }
sub get_ISBN      { &read_only; $_[0]->{_ISBN} }
sub get_tracks    { &read_only; $_[0]->{_tracks} }

# location and rating are mutators
# they can change the state on an object
sub set_location {
  my ( $self, $shelf, $room ) = @_;

  # overide the location if necesary
  $self->{_room}  = $room  if $room;
  $self->{_shelf} = $shelf if $shelf;
  return ( $self->{_room}, $self->{_shelf} );
}

sub set_rating {
  my ( $self, $rating ) = @_;
  $self->{_rating} = $rating if defined $rating;
  return $self->{_rating};
}

1;