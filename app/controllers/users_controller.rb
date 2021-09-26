class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def show
    user = User.find_by(id: session[:user_id])
    render json: user
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: {messages: "Signup sucessful", user: user}, status: :created
  end

 

  private

  def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
