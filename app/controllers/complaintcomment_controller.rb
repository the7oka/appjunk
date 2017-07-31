class ComplaintcommentController < ApplicationController
	def create
    @complaint = Complaint.find(params[:complaint_id])
    @complaintcomment = @complaint.complaintcomments.build(complaintcomment_params)
    @complaintcomment.user_id = current_user.id
    if @complaintcomment.save
  		redirect_to complaint_path(@complaint)
  	else 
  		redirect_to "/blacklist"
  	end
  end
 
   def destroy
    @complaint = Complaint.find(params[:complaint_id])
    @complaintcomment = @complaint.complaintcomments.find(params[:id])
    @comment.destroy
    redirect_to complaint_path(@complaint)
  end
  def like
    @comment = Complaintcomment.find(params[:id])
    @comment.liked_by current_user
    render :nothing => true
  end
  def unlike
    @comment = Complaintcomment.find(params[:id])
    @comment.unliked_by current_user
    render :nothing => true
  end
  def dislike
    @comment = Complaintcomment.find(params[:id])
    @comment.disliked_by current_user
    render :nothing => true
  end
  def undislike
    @comment = Complaintcomment.find(params[:id])
    @comment.undisliked_by current_user
    render :nothing => true
  end
  private
    def complaintcomment_params
      params.require(:complaintcomment).permit(:content)
    end
end
