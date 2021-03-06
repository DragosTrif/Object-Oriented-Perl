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


{    # encapsulating  $_count && $_incr_count
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
  
  sub get_count {
    my $self = shift;
    $self->{count} = $_count;
    return $self->{count};
  }
}    # end of encapsulation

1;
