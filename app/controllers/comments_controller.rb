class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :create]
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    #post = Post.find(params[:post_id])
    render json: post.comments
  end

  def show
    render json: comment
  end

  def create
    #post = Post.find(params[:post_id]) 
    comment = post.comments.create!(comment_params)
    render json: comment
  end

  def update
    #comment = Comment.find(params[:id])
    comment.update!(comment_params)
    render json: comment
  end

  def destroy
    comment.destroy
    render json: comment
  end

  private

    def set_comment
      comment = Comment.find(params[:id])
    end
    
    def set_post
      post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :name)
    end
    
end
