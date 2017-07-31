class Tweetamela5erController < ApplicationController
	def index
    @title='Tweetamela5er'
    @admin = User.first
		@tweets = Tweetamela5er.where('approved=?', true).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    @besttweets = Tweetamela5er.order(:cached_votes_up).reverse.first(5)
    if user_signed_in?
      @tweet = current_user.tweetamela5ers.build
    end
	end	
  def unapproved
    if current_user.admin == true 
      @admin = User.first
      @title='Tweetamela5er'
      @tweets = Tweetamela5er.where('approved=?', false).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
      @besttweets = Tweetamela5er.order(:cached_votes_up).reverse.first(5)
    end
  end
	def create
    @tweet = current_user.tweetamela5ers.build(tweetamela5er_params)
    if params[:cover] = "1" 
      @tweet.covered = true
      @tweet.save
    end
    if current_user.admin == true
      @tweet.approved = true
      @tweet.save
    end
		if @tweet.save
			redirect_to '/tweetamela5er'
		end
	end
	def like 
    @tweet = Tweetamela5er.find(params[:id])
    @tweet.liked_by current_user
    render :nothing => true
  end
  def unlike 
    @tweet = Tweetamela5er.find(params[:id])
    @tweet.unliked_by current_user
    render :nothing => true
  end
  def dislike 
    @tweet = Tweetamela5er.find(params[:id])
    @tweet.disliked_by current_user
    render :nothing => true
  end
  def undislike 
    @tweet = Tweetamela5er.find(params[:id])
    @tweet.undisliked_by current_user
    render :nothing => true
  end
  def approve
    if user_signed_in? && current_user.admin == true
      @tweet = Tweetamela5er.find(params[:id])
      @tweet.approved = true
      @tweet.save
      render :nothing => true
    else
      redirect_to"/"
    end

  end
  def delete
    if user_signed_in? && current_user.admin == true
      @tweet = Tweetamela5er.find(params[:id])
      @tweet.destroy
      render :nothing => true
    else
      redirect_to"/"
    end
  end
	private
	def tweetamela5er_params
		params.require(:tweetamela5er).permit(:url)
	end
end
