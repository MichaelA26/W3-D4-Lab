# require ('pg')
require_relative('./db/sql_runner')
require_relative('./models/casting')
require_relative('./models/movie')
require_relative('./models/star')
require ('pry')

movie1 = Movie.new( { 'title' => 'Blade Runner', 'genre' => 'Sci-fi' } )
movie1.save
movie2 = Movie.new( { 'title' => 'Gone With The Wind', 'genre' => 'Classic' } )
movie2.save
movie3 = Movie.new( { 'title' => 'Fight Club', 'genre' => 'Thriller' } )
movie3.save

star1 = Star.new( { 'first_name' => 'Harrison', 'last_name' => 'Ford' } )
star1.save
star2 = Star.new( { 'first_name' => 'Clark', 'last_name' => 'Gable' } )
star2.save
star3 = Star.new( { 'first_name' => 'Brad', 'last_name' => 'Pitt' } )
star3.save

casting1 = Casting.new( { 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 50000 } )
casting1.save
casting2 = Casting.new( { 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 20000 } )
casting2.save
casting3 = Casting.new( { 'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => 35000 } )
casting3.save



binding.pry
nil
