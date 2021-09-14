class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Post.all
    render json: posts
  end

  def show
    render json: @post
  end

  def create
    post = Post.create!(post_params)
    render json: post
  end

  def update
    @post.update!(post_params)
    render json: @post
  end

  def destroy
    @post.destroy
    render json: @post
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :title)
    end

end
