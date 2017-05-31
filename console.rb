require 'pry-byebug'
require_relative 'models/artist'
require_relative 'models/album'

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Name 1'
  })

artist2 = Artist.new({
  'name' => 'Name 2'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'Womp-rat',
  'genre' => 'Cantina'
  })

album2 = Album.new({
  'title' => 'Space Cowboy',
  'genre' => 'Egads'
  })

album1.save()
album2.save()