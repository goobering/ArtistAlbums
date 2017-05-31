require 'pry-byebug'
require_relative 'models/artist'
require_relative 'models/album'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Name 1'
  })

artist2 = Artist.new({
  'name' => 'Name 2'
  })

artist1.save()
artist2.save()

artist1.name = 'New name'
artist1.update()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Womp-rat',
  'genre' => 'Cantina'
  })

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Space Cowboy',
  'genre' => 'Egads'
  })

album1.save()
album2.save()

album1.title = 'New title'
album1.update()

album2.title = 'New title 2'
album2.update()

artist1.delete()

binding.pry()
nil