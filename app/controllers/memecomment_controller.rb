class MemecommentController < ApplicationController
	def create
    @meme = Meme.find(params[:meme_id])
    @memecomment = @meme.memecomments.build(memecomment_params)
    @memecomment.user_id = current_user.id
    if @memecomment.save
  		redirect_to meme_path(@meme)
  	else 
  		redirect_to "/memes/index"
  	end
  end
 
   def destroy
    @meme = Meme.find(params[:meme_id])
    @memecomment = @meme.memecomments.find(params[:id])
    @comment.destroy
    redirect_to meme_path(@meme)
  end
  def like
    @comment = Memecomment.find(params[:id])
    @comment.liked_by current_user
    render :nothing => true
  end
  def unlike
    @comment = Memecomment.find(params[:id])
    @comment.unliked_by current_user
    render :nothing => true
  end
  def dislike
    @comment = Memecomment.find(params[:id])
    @comment.disliked_by current_user
    render :nothing => true
  end
  def undislike
    @comment = Memecomment.find(params[:id])
    @comment.undisliked_by current_user
    render :nothing => true
  end
  private
    def memecomment_params
      params.require(:memecomment).permit(:content)
    end
end
