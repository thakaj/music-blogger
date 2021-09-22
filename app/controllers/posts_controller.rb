class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    posts = Post.all
    render json: posts
  end

  def show
    render json: @post
  end

  def create
    logged_in_user = User.find_by(id: session[:user_id])
    post = Post.create!(body: params[:body], title: params[:title], user_id: logged_in_user.id)
    render json: post, status: :created
  end

  def update
    post = Post.find(params[:id])
    logged_in_user = User.find_by(id: session[:user_id])
    if post.user_id == logged_in_user.id
      post.update!(body: params[:body], title: params[:title])
      render json: post
    else
      render json: {errors: "Not Authorized"}, status: :unauthorized
    end  
  end

  def destroy
    post = Post.find(params[:id])
    logged_in_user = User.find_by(id: session[:user_id])
    if post.user_id == logged_in_user.id
      post.destroy
      render json: post
    else
      render json: {errors: "Not Authorized"}, status: :unauthorized
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end


end
