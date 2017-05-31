require 'pry-byebug'
require_relative '../db/sql_runner'

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    customers = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

end