class ArtistsController < ApplicationController

  def index
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
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.update(params[:id], artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end


end
