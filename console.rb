require 'pry-byebug'
require_relative 'models/artist'

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Name 1'
  })

artist2 = Artist.new({
  'name' => 'Name 2'
  })

artist1.save()
artist2.save()