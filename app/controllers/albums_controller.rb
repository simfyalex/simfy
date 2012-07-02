class AlbumsController < AccountController
  load_and_authorize_resource
  #this is just simple for test purpose. Can be done with separate controllers thought user scope
  def public_list
    @albums = Album.by_letter(params[:letter])
    render :action => :index
  end

  def index
    @albums = current_user.albums.by_letter(params[:letter])
  end

  def show
    @album ||= Album.find(params[:id])
  end

  def new
    @album ||= current_user.albums.build
  end

  def edit
    @album ||= current_user.albums.find(params[:id])
  end

  def create
    @album ||= current_user.albums.create(params[:album])
    respond_with @album ,:location=>current_user ? user_albums_path(current_user) : public_albums_list_path
  end

  def update
    @album ||= current_user.albums.find(params[:id])
    @album.update_attributes(params[:album])
    respond_with @album ,:location=>current_user ? user_albums_path(current_user) : public_albums_list_path
  end

  def destroy
    @album ||= current_user.albums.find(params[:id])
    @album.try(:destroy)
    redirect_to current_user ? user_albums_path(current_user) : public_albums_list_path
  end
end
