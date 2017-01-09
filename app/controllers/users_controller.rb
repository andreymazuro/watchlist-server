class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def auth
    users = User.where({name: params[:name], password: params[:password]}).first
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user.movies
  end

  def destroy
     user = User.find(params[:id])
     user.destroy
  end


  def create
    user = User.create(
      name:params[:name],
      email:params[:email],
      password:params[:password]
    )
    render json: user
  end

end
