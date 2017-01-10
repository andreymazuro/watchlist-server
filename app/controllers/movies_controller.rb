class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def destroy
     movies = UsersToMovie.where({movie_id: params[:id]}).first
     movies.destroy
     movie = Movie.find(params[:id])
     movie.destroy
  end

  def create
    movie = User.where({id: params[:user_id]}).first.movies
    movie.create(
      name:params[:name],
      poster_path:params[:poster_path],
      vote_average:params[:vote_average],
      first_air_date:params[:first_air_date],
      movie_id:params[:movie_id]
    )
    render json: movie
  end


end
