class UsersController < ApplicationController

  def auth
    user = User.where({name: params[:name], password: params[:password]}).first
    if user.present?
      token = SecureRandom.hex(10)
      $redis.set(token, user.id)
      render json: {token: token}
    else
      render :nothing , status: 403
    end
  end

  def update_password
    id = $redis.get(params[:token])
    current_pass = params[:currentPassword]
    user = User.find(id)
    user_pass = user.password
    if user_pass == current_pass
      user.update_attribute(:password, params[:newPassword])
      render json: {answer: "Successfuly changed"}
    else
      render json: {answer: "Wrong current password"}
    end
  end

  def user_movies
    id = $redis.get(params[:token])
    user = User.find(id)
    render json: user.movies
  end

  def user_info
    id = $redis.get(params[:token])
    user = User.where({id: id}).first
    if user.present?
     render json: user
    else
     render nothing: true, status: 403
    end
  end

  def user_delete
    id = $redis.get(params[:token])
    user = User.find(id)
    user.destroy
  end


  def create
    user_name = User.where({name: params[:name]}).first
    user_email = User.where({email: params[:email]}).first

    if user_name.present?
      error = "Name is already taken, sorry"
      render json: {error: error}
    elsif user_email.present?
      error = "E-mail is already taken, sorry"
      render json: {error: error}
    end

    valid = User.create(
      name:params[:name],
      email:params[:email],
      password:params[:password]
    ).valid?

    if !valid
      error = "Wrong e-mail format"
      render json: {error: error}
    else
      message = "Successfuly registered. Log in to continue"
      render json: {error: message}
    end
  end

end
