require_relative('../db/sql_runner')

class Movie
  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO movies
    (title, genre)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE movies SET (title, genre)
    = ($1, $2)
    WHERE
    id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM movies
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stars
    sql = "SELECT stars.*
          FROM stars
          INNER JOIN castings
          ON castings.star_id = stars.id
          WHERE castings.movie_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).map { |star_hash| Star.new(star_hash) }
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end
end
