class ArtistsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :set_artist, only: [:show]

  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    render json: @artist
  end

  def create
    @artist = Artist.create!(artist_params)
    render json: @artist
  end
 
  private

    def set_artist
      @artist = Artist.find_by_id(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end

    def render_unprocessable_entity
      render json: @artist.errors, status: :unprocessable_entity
    end
end
