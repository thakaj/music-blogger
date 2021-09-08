class AlbumsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :set_album, only: [:show]

  def index
    @albums = Album.all
    render json: @albums
  end

  def show
    render json: @album
  end

  def create
    @album = Album.create!(album_params)
    render json: @album
  end


  private

    def set_album
      @album = Album.find_by_id(params[:id])
    end

    def album_params
      params.require(:album).permit(:name)
    end

    def render_unprocessable_entity
      render json: @album.errors, status: :unprocessable_entity
    end
end
