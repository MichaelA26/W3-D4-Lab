# require('pg')
require_relative('../db/sql_runner')
require_relative('./casting.rb')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO movies
    (title, genre) VALUES ($1, $2)
    RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

  def stars
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    star = result.map { |star| Star.new(star) }
    return star
  end

end
