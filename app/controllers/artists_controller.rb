class ArtistsController < AccountController
  load_and_authorize_resource
  #this is just simple for test purpose. Can be done with separate controllers thought user scope
  def public_list
    @artists = Artist.by_letter(params[:letter])
    render :action => :index
  end

  def index
    @artists = current_user.artists.by_letter(params[:letter])
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = current_user.artists.build
  end

  def edit
    @artist = current_user.artists.find(params[:id])
  end

  def create
    @artist = current_user.artists.create(params[:artist])
    respond_with @artist, :location => current_user ? user_artists_path(current_user) : public_artist_list_path
  end

  def update
    @artist = current_user.artists.find(params[:id])
    @artist.update_attributes(params[:artist]) if @artist
    respond_with @artist, :location => current_user ? user_artists_path(current_user) : public_artist_list_path
  end


  def destroy
    current_user.artists.find(params[:id]).try(:destroy)
    redirect_to artists_path
  end
end
