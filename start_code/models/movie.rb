# require('pg')
require_relative('../db/sql_runner')
require_relative('./casting.rb')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save
    sql = "INSERT INTO movies
    (title, genre, budget) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @budget]
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

  # def budget(fee, budget)
  #   # sql = "SELECT movies.* FROM movies
  #   #       INNER JOIN castings.fee = movies.id
  #   #       WHERE movie_id = $1"
  #     movie_budget = @budget -= casting.fee
  #     return movie_budget
  # end

end
