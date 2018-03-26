package Genere::Classical;

use strict;
use warnings;

use base 'CD::Music';    # inherit

  sub new {
    my $class = shift;
    my $self = $class->SUPER::new;
    # bless {
    #   _composer      => $_[1],
    #   _orchestra    => $_[2],
    #   _conductor => $_[3],
    #   _soloist      => $_[4],
    # };

#sub get_name      {  $_[0]->{_name} }
# sub get_artist    { &read_only; $_[0]->{_artist} }
# sub get_publisher { &read_only; $_[0]->{_publisher} }
# sub get_ISBN      { &read_only; $_[0]->{_ISBN} }
# sub get_tracks    { &read_only; $_[0]->{_tracks} }
#   my %_attr_data =       #DEFAULTACCESSIBILITY
#     (
#     _composer  => [ '???', 'read' ],
#     _orchestra => [ '???', 'read' ],
#     _conductor => [ '???', 'read' ],
#     _soloist   => [ undef, 'read' ],
#     );

#   # Class methods, to operate on encapsulated class data
#   # Is a specified object attribute accessible in a given mode
#   sub _accessible {
#     my ( $self, $attr, $mode ) = @_;
#     return $_attr_data{$attr}[1] =~ /$mode/ if exists $_attr_data{$attr};
#     return $self->SUPER::_accessible( $attr, $mode );
#   }

#   # Classwide default value for a specified object attribute
#   sub _default_for {
#     my ( $self, $attr ) = @_;
#     return $_attr_data{$attr}[0] if exists $_attr_data{$attr};
#     return $self->SUPER::_default_for($attr);
#   }

#   # List of names of all specified object attributes
#   sub _standard_keys {
#     my ($self) = @_;
#     ( $self->SUPER::_standard_keys(), keys %_attr_data );
#   }
 }
1;