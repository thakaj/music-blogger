class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]
  before_action :set_artist, only: [:index, :create]

  def index
    render json: artist.albums
  end

  def show
    render json: @album
  end

  def create
    album = artist.albums.create!(album_params)
    render json: album
  end


  private

  def set_artist
    artist = Artist.find(params[:post_id])
  end

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name)
    end

end
