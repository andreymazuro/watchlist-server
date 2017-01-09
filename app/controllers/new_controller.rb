class NewController < ApplicationController
  def index
    movies = UsersToMovie.order(:user_id).all
    render json: movies
  end
end
