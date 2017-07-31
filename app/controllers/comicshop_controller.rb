class ComicshopController < ApplicationController
	def index
		@title = 'Comicshop'
		@memes = Meme.where("hot = ?", true).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
		@topmemes = Meme.order(:cached_votes_up).limit(20)
	end
	def make_a_comic
		@title = 'Comicshop | Make a comic'
		@meme = Meme.new
	end
	def new
		@title = 'Comicshop | New comics'
		@memes = Meme.where("hot=? AND trending=?",false,false).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
		@topmemes = Meme.order(:cached_votes_up).limit(20)
	end
	def trending
		@title = 'Comicshop | Trending comics'
		@memes = Meme.where("hot=? AND trending=?",false,true).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
		@topmemes = Meme.order(:cached_votes_up).limit(20)
	end
	def create
		@meme = current_user.memes.build(meme_params)
	  	if @meme.save
	  		redirect_to "/comicshop/new"
	  	else 
	  		redirect_to "/"
	  	end
	end
	def show
		@title = 'Comicshop'
		@memesbefore = Meme.where("id < ?", params[:id]).last(10)
		@memesafter = Meme.where("id > ?", params[:id]).first(10)
		@memeafter = Meme.where("id > ?", params[:id]).first
		@memebefore = Meme.where("id < ?", params[:id]).last
		@meme = Meme.find(params[:id])
		@memecomments = Memecomment.where("meme_id=?" , params[:id])
	end
	def delete
		@meme = Meme.find(params[:id])
		if current_user.admin? || current_user == @meme.user
			@meme.destroy
			render :nothing => true
		end
	end
	def trendit 
		if current_user.admin?
			@meme = Meme.find(params[:id])
			@meme.trending = true
			@meme.save
			render :nothing => true
		end
	end
	def hotit 
		if current_user.admin?
			@meme = Meme.find(params[:id])
			@meme.trending = true
			@meme.hot = true
			@meme.save
			render :nothing => true
		end
	end
	def like 
    @meme = Meme.find(params[:id])
    @meme.liked_by current_user
    render :nothing => true
  end
  def unlike 
    @meme = Meme.find(params[:id])
    @meme.unliked_by current_user
    render :nothing => true
  end
  def dislike 
    @meme = Meme.find(params[:id])
    @meme.disliked_by current_user
    render :nothing => true
  end
  def undislike 
    @meme = Meme.find(params[:id])
    @meme.undisliked_by current_user
    render :nothing => true
  end
	private 
	def meme_params
		params.require(:meme).permit(:title, :photo,:arabic)
	end
end
