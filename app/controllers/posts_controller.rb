class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.create!(post_params)
    render json: @post
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
      @post = Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:body.text)
    end

    def render_not_found
      render json: {message: "not found"}, status: :not_found
    end

    def render_unprocessable_entity
      render json: @post.errors, status: :unprocessable_entity
    end
end
