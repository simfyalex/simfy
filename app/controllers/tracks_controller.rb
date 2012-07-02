class TracksController < AccountController
  load_and_authorize_resource :album
  load_and_authorize_resource :track,:through=>:album

  def index
    @tracks = @album.tracks
  end

  def new
    @track = @album.tracks.build
  end

  def edit
    @track = @album.tracks.find(params[:id])
  end

  def create
    @track = @album.tracks.create(params[:track])
    respond_with @track ,:location=> album_path(@album)
  end

  def update
    @track = @album.tracks.find(params[:id])
    @track.update_attributes(params[:track]) if @track
    respond_with @track
  end


  def destroy
    @album.tracks.find(params[:id]).try(:destroy)
    redirect_to album_path(@album)
  end

  private

  def fetch_album
    @album = current_user.albums.find(params[:album_id])
    unless @album
      flash.notice "We couldn't find that record!'"
      redirect_to artists_path
    end
  end
end
