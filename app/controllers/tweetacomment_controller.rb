class TweetacommentController < ApplicationController
	def create
    @tweeta = Tweetamela5er.find(params[:tweetamela5er_id])
    @tweetacomment = @tweeta.tweetacomments.build(tweetacomment_params)
    @tweetacomment.user_id = current_user.id
    if @tweetacomment.save
  		redirect_to '/tweetamela5er'
  	else 
  		redirect_to '/tweetamela5er'
  	end
  end
 
   def destroy
    @tweeta = Tweetamela5er.find(params[:tweetamela5er_id])
    @tweetacomment = @tweeta.tweetacomments.find(params[:id])
    @comment.destroy
    redirect_to '/Tweetamela5er'
  end
  def like
    @comment = Tweetacomment.find(params[:id])
    @comment.liked_by current_user
    render :nothing => true
  end
  def unlike
    @comment = Tweetacomment.find(params[:id])
    @comment.unliked_by current_user
    render :nothing => true
  end
  def dislike
    @comment = Tweetacomment.find(params[:id])
    @comment.disliked_by current_user
    render :nothing => true
  end
  def undislike
    @comment = Tweetacomment.find(params[:id])
    @comment.undisliked_by current_user
    render :nothing => true
  end
  private
    def tweetacomment_params
      params.require(:tweetacomment).permit(:content)
    end
end
