class VideosController < ApplicationController
	def index
		@title = 'Video of the day'
		@videos = Video.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
		@popularvideos = Video.order(:cached_votes_up).reverse.first(10)
		@videocats = Videocat.all
	end
	def cat
		@title = 'Video of the day'
		@cat = Videocat.find(params[:videocat_id])
		@popularvideos = Video.order(:cached_votes_up).reverse.first(10)
		@videos = @cat.videos.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
		@videocats = Videocat.all
	end
	def show
		@title = 'Video of the day'
		@video = Video.find(params[:id])
		@videosbefore = Video.where("id < ?", params[:id]).last(5)
		@videosafter = Video.where("id > ?", params[:id]).first(5)
		@videocomments = Videocomment.where("video_id=?" , params[:id]).reverse_order
	end
	def new
		@title = 'Video of the day'
		if current_user.admin == true 
			@video = Video.new
		end
	end
	def create
		if current_user.admin == true 
			@video = Video.new(video_params)
			@video.thumbnail = URI.parse("http://img.youtube.com/vi/"+@video.url+"/maxresdefault.jpg")
		end
		if @video.save 
			redirect_to "/videos/new"
		else
			redirect_to "/videos"
		end
	end
	def like 
    @video = Video.find(params[:id])
    @video.liked_by current_user
    render :nothing => true
  end
  def unlike 
    @video = Video.find(params[:id])
    @video.unliked_by current_user
    render :nothing => true
  end
  def dislike 
    @video = Video.find(params[:id])
    @video.disliked_by current_user
    render :nothing => true
  end
  def undislike 
    @video = Video.find(params[:id])
    @video.undisliked_by current_user
    render :nothing => true
  end
	private
	def video_params
		params.require(:video).permit(:url, :duration, :title, :description,:videocat_ids => [])
	end
end
