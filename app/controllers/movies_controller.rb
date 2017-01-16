class MoviesController < ApplicationController

  def movie_delete
    movie_id = params[:id]
    user_id = $redis.get(params[:token])
    user = User.find(user_id)
    user.movies.where({id:movie_id}).first.destroy
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
