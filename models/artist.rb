require 'pry-byebug'
require_relative '../db/sql_runner'

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    result = SqlRunner.run(sql)
    return result.map { |album_hash| Album.new(album_hash)}
  end

  def delete()
    sql = "DELETE FROM artists where id = #{@id}"
    SqlRunner.run(sql)
  end

  def find()
    sql = "SELECT * from artists WHERE id = #{@id};"
    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    customers = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end
end