require_relative 'models/casting'
require_relative 'models/movie'
require_relative 'models/star'

require 'pry-byebug'

Movie.delete_all()
Star.delete_all()
Casting.delete_all()

###

movie1 = Movie.new({'title' => 'The Matrix', 'genre' => 'Action'})
movie1.save

movie2 = Movie.new({'title' => 'Step Brothers', 'genre' => 'Comedy'})
movie2.save

movie3 = Movie.new({'title' => 'Lion King', 'genre' => 'Family'})
movie3.save

###

star1 = Star.new({'first_name' => 'Jack', 'last_name' => 'Nicholson'})
star1.save

star2 = Star.new({'first_name' => 'Tom', 'last_name' => 'Hanks'})
star2.save

star3 = Star.new({'first_name' => 'Meryl', 'last_name' => 'Streep'})
star3.save

###

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '20'})
casting1.save

casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => '20'})
casting2.save

casting3 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => '20'})
casting3.save

binding.pry
nil
