
require 'test_helper'

class MoviesDupTest < ActionDispatch::IntegrationTest
   test "movies dups" do

     post "/users",
     params: { name: "johnny", email: "arsdf@gmail.com", password: "123456" }

     post "/users",
     params: { name: "vasya", email: "arssdf@gmail.com", password: "123456" }



     post "/auth",
     params: { name: "johnny", password: "123456" }
     token_johnny = JSON.parse(@response.body)

     post "/auth",
     params: { name: "vasya", password: "123456" }
     token_vasya = JSON.parse(@response.body)


     post "/movies",
     params: {
         name: "Dexter",
         poster_path: "sd.com",
         vote_average: "4",
         first_air_date: "2012-12-10",
         movie_id: "2",
         user_token: token_vasya["token"]
     }

     post "/movies",
     params: {
         name: "Dexter",
         poster_path: "sd.com",
         vote_average: "4",
         first_air_date: "2012-12-10",
         movie_id: "2",
         user_token: token_johnny["token"]
     }
       vasya = User.where({name:"vasya"}).first
       johnny = User.where({name:"johnny"}).first
       assert_equal(vasya.movies.length, johnny.movies.length, "adding to users movies with same id")

        movie =  User.where({name:"vasya"}).first.movies.first
        id = movie.id


     get "/movies_delete",
     params: {
      id: id,
      token: token_vasya["token"],
     }

     vasya = User.where({name:"vasya"}).first
     johnny = User.where({name:"johnny"}).first
     assert_not_equal(johnny.movies.length, vasya.movies.length, "deleting movie from one user doesn't affect another")

     prev_length = johnny.movies.length
     post "/movies",
     params: {
         name: "Dexter",
         poster_path: "sd.com",
         vote_average: "4",
         first_air_date: "2012-12-10",
         movie_id: "2",
         user_token: token_johnny["token"]
     }
     johnny = User.where({name:"johnny"}).first

     assert_equal(johnny.movies.length, prev_length, "prevent adding movie with same id")


   end
end
