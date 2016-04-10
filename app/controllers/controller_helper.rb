module ControllerHelper

  def find_artist
    if self.class == SongsController
      @artist = Artist.find(params[:artist_id])
    else
      @artist = Artist.find(params[:id])
    end
  end

  private :find_artist

end
