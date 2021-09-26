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
    post = logged_in_user.posts.create!(post_params)
    render json: post, status: :created
  end

  def update
    post = Post.find_by(id: params[:id])
    logged_in_user = User.find_by(id: session[:user_id])
    if post.user_id == logged_in_user.id
      post.update!(post_params)
      render json: post
    else
      render json: {errors: "Not Authorized"}, status: :unauthorized
    end  
  end

  def destroy
    post = Post.find_by(id: params[:id])
    logged_in_user = User.find_by(id: session[:user_id])
    if post.user_id == logged_in_user.id
      post.destroy
      render json: post
    else
      render json: {errors: "Not Authorized"}, status: :unauthorized
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

end
