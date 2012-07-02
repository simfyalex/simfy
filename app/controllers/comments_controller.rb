class CommentController < AccountController
  before_filter :fetch_album


  def create
    @album.comments.create(params[:comment])
    redirect_to album_path(@album)
  end

  def update
    @comment = @album.comments.find(params[:id])
    @comment.update_attributes(params[:comment]) if @comment
    redirect_to artists_path
  end


  def destroy
    @album.comments.find(params[:id]).try(:destroy)
    redirect_to artists_path
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
