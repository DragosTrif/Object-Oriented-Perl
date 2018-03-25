package Records::Music;

use Moo;
use MooX::late;

has name      => ( is => 'ro', isa => 'Str', required => 1 );
has artist    => ( is => 'ro', isa => 'Str', required => 1 );
has publisher => ( is => 'ro', isa => 'Str', required => 1 );
has ISBN      => ( is => 'ro', isa => 'Int', required => 1 );
has tracks    => ( is => 'ro', isa => 'Int', required => 1 );
has room      => ( is => 'rw', isa => 'Str', required => 1 );
has shelf     => ( is => 'rw', isa => 'Str', required => 1 );
has rating    => ( is => 'rw', isa => 'Int', required => 1 );

{ # encapsulating  $_count && $_incr_count
  my $_count = 0;

  # $_incr_count variable is accessible in this block
  my $_incr_count = sub { ++$_count };
  # add private method to new 
  around 'BUILDARGS' => sub {
    my $orig  = shift;
    my $class = shift;
    $_incr_count->();
    return $class->$orig(@_);
  };
  sub get_count { $_count }
} # end of encapsulation

sub set_location {
  my ( $self, $room, $shelf ) = @_;

  # overide the location if necesary
  $self->{room}  = $room  if $room;
  $self->{shelf} = $shelf if $shelf;
  return ( $self->{room}, $self->{shelf} );
}

sub set_rating {
  my ( $self, $rating ) = @_;
  $self->{rating} = $rating if defined $rating;
  return $self->{rating};
}

1;
