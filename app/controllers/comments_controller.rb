class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.create!(comment_params)
    render json: @comment
  end

  def update
    @comment.update!(comment_params)
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: @comment
  end

  private
    
    def set_comment
      @comment = Comment.find_by_id(params[:id])
    end

    def comment_params
      params.fetch(:comment, {})
    end

    def render_unprocessable_entity
      render json: @comment.errors, status: :unprocessable_entity
    end
    
    def render_not_found
      render json: {message: "not found"}, status: :not_found
    end
    
end
