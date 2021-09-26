class UsersController < ApplicationController

  


  def show
    @user = User.find_by(id: session[:user_id])
    if @user
      render json: @user
    else
      render json: { errors: "Not authorized"}, status: :unauthorized
    end
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: {messages: "Signup sucessful", user: user}, status: :created
  end

 

  private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
