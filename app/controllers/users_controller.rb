class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :set_user, only: [:show, :update, :destroy]
  has_secure_password

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  end

  def update
    @user.update!(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    render json: @user
  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def render_not_found
      render json: {message: "not found"}, status: :not_found
    end

    def render_unprocessable_entity
      render json: @user.errors, status: :unprocessable_entity
    end
end
