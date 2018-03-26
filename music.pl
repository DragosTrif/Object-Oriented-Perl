use strict;
use warnings;

{
  use CD::Music;


   my $music = CD::Music->new({ name => 'Thrileer', artist => 'Michel Jackson',
    publisher => 'Sony', ISBN => 12345, tracks =>5, room => "Alma's room", shelf => '1-A', rating =>'10' });


  # if you try to passs arguments to get_methods
  # it will throw an exeception.

  print "name: " . $music->name,            "\n";
  print "artist: " . $music->artist,        "\n";
  print "pusblisher: " . $music->publisher, "\n";
  print "isbn: " . $music->ISBN,            "\n";
  print "tarcks:" . $music->tracks,         "\n";

  my ( $room, $shelf ) = $music->set_location;

  print "room: $room\n";
  print "shelf: $shelf\n";

  print "rating: " . $music->rating, "\n";

  print "no of obj: " . $music->get_count, "\n";
  exit;

}

{
  print "#############################################\n";
  print "implement same class with Moo\n";

  use Records::Music;

  my $music = Records::Music->new(
    name      => 'Thrileer',
    artist    => 'Michel Jackson',
    publisher => 'Sony',
    ISBN      => 12345,
    tracks    => 5,
    room      => "Alma's room",
    shelf     => '1-A',
    rating    => '10',
  );

  # if you try to passs arguments to get_methods
  # it will throw an exeception.

  print "name: " . $music->name,           "\n";
  print "artist: " . $music->artist,       "\n";
  print "pusblisher:" . $music->publisher, "\n";
  print "isbn: " . $music->ISBN,           "\n";
  print "tarcks " . $music->tracks,        "\n";

  my ( $room, $shelf ) =
    ( $music->room('Master bedrom'), $music->shelf('1-B') );

  print "room: $room\n";
  print "shelf: $shelf\n";

  print "rating: " . $music->rating(9), "\n";

  print "print no of obj: " . $music->get_count, "\n";

}

{
  use lib 'CD';
  use Genere::Classical;
  my @data = ('Rapsodie', 'Enescu',
    'Electr-eocrd', 12345, 5, "Alma's room", '1-A', '10', 'Filarmonica',
    'Gica Petrescu', 'Pavaroti');
  my $classics = Genere::Classical->new(@data);
  
  print $classics->get_name . "her\n";
  #print $classics->get_composer;
}

