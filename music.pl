use strict;
use warnings;

use CD::Music;

my $music = CD::Music->new( 'Thrileer', 'Michel Jackson',
  'Sony', 12345, 5, "Alma's room", '1-A', '10' );

# if you try to passs arguments to get_methods
# it will throw an exeception.

print $music->get_name,      "\n";
print $music->get_artist,    "\n";
print $music->get_publisher, "\n";
print $music->get_ISBN,      "\n";
print $music->get_tracks,    "\n";

my ( $room, $shelf ) = $music->set_location;

print "$room\n";
print "$shelf\n";

print $music->set_rating, "\n";
