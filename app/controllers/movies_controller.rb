class MoviesController < ApplicationController

  def destroy
     movies = UsersToMovie.where({movie_id: params[:id]}).first
     movies.destroy
     movie = Movie.find(params[:id])
     movie.destroy
  end

  def create
    id = $redis.get(params[:user_token])
    user = User.find(id)
    movie = user.movies
    movie.create(
      name:params[:name],
      poster_path:params[:poster_path],
      vote_average:params[:vote_average],
      first_air_date:params[:first_air_date],
      movie_id:params[:movie_id]
    )
  end


end
