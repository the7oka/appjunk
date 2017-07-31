class TimelineController < ApplicationController
  def index
    @title = 'Timeline'
    if user_signed_in?
      @user = current_user
      @post = current_user.posts.build
      @targets = @user.friends
      @posts = Post.where('user_id=? OR user_id=? OR user_id=?', @targets.pluck(:id), @user.id , 1).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    else
      redirect_to '/users/sign_up'
    end

  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to '/timeline'
    end
  end
  private
  def post_params
    params.require(:post).permit(:content,:photo_one, :location_id)
  end
end
