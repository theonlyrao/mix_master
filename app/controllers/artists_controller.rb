class ArtistsController < ApplicationController

  include ControllerHelper

  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

end
