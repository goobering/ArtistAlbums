  require 'pg'

  class Album

    attr_reader :title, :genre

    def initialize(options)
      @id = options['id'].to_i() if options['id']
      @title = options['title']
      @genre = options['genre']
    end

    def save()
      sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *;"
      result = SqlRunner.run(sql)
      @id = result[0]['id'].to_i()
    end

    def delete()
      sql = "DELETE FROM albums WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE albums SET (title, genre) = ('#{@title}', '#{@genre}') WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * from albums;"
      result = SqlRunner.run(sql)
      return result.map { |album_hash| Album.new(album_hash) }
    end

    def self.delete_all()
      sql = "DELETE FROM albums;"
      SqlRunner.run(sql)
    end
  end