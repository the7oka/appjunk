class VideocommentController < ApplicationController
	def create
    @video = Video.find(params[:video_id])
    @videocomment = @video.videocomments.build(videocomment_params)
    @videocomment.user_id = current_user.id
    if @videocomment.save
  		redirect_to video_path(@video)
  	else 
  		redirect_to "/videos/index"
  	end
  end
 
   def destroy
    @video = Video.find(params[:video_id])
    @videocomment = @video.videocomments.find(params[:id])
    @comment.destroy
    redirect_to video_path(@video)
  end
  def like
    @comment = Videocomment.find(params[:id])
    @comment.liked_by current_user
    render :nothing => true
  end
  def unlike
    @comment = Videocomment.find(params[:id])
    @comment.unliked_by current_user
    render :nothing => true
  end
  def dislike
    @comment = Videocomment.find(params[:id])
    @comment.disliked_by current_user
    render :nothing => true
  end
  def undislike
    @comment = Videocomment.find(params[:id])
    @comment.undisliked_by current_user
    render :nothing => true
  end
  private
    def videocomment_params
      params.require(:videocomment).permit(:content)
    end
end