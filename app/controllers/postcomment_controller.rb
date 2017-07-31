class PostcommentController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @postcomment = @post.postcomments.build(postcomment_params)
    @postcomment.user_id = current_user.id
    if @postcomment.save
  		redirect_to profile_path(@postcomment.post.location_id)
  	else 
  		redirect_to "/posts/index"
  	end
  end
 
   def destroy
    @post = Post.find(params[:post_id])
    @postcomment = @post.postcomments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  def like
    @comment = Postcomment.find(params[:id])
    @comment.liked_by current_user
    render :nothing => true
  end
  def unlike
    @comment = Postcomment.find(params[:id])
    @comment.unliked_by current_user
    render :nothing => true
  end
  def dislike
    @comment = Postcomment.find(params[:id])
    @comment.disliked_by current_user
    render :nothing => true
  end
  def undislike
    @comment = Postcomment.find(params[:id])
    @comment.undisliked_by current_user
    render :nothing => true
  end
  private
    def postcomment_params
      params.require(:postcomment).permit(:content)
    end
end
