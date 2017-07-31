class ProfileController < ApplicationController
		before_action :authenticate_user!, :except => [:show]
	def index
		if current_user.admin == true
			@title = 'All users'
			@users = User.all.paginate(:page => params[:page], :per_page => 20).order('id DESC')
		end
	end
	def show
		@user = User.find(params[:id])
		@title = @user.display_name.humanize+'s Profile'
		@posts = Post.where('location_id = ?', params[:id]).reverse
		@postswithphotos = Post.where('user_id =?', @user.id)
		@photoposts = @postswithphotos.where('photo_one_file_name IS NOT NULL')
		if user_signed_in? && @user.requested_friends.include?(current_user)
			@requested = true
		else
			@requested = false
		end
		if user_signed_in? && ( @user.friends_with?(current_user) || @user == current_user )
			@post = current_user.posts.build
		end
		@message = Message.new
	end
	def photos
		@user = User.find(params[:id])
		if current_user.friends_with?(@user) || @user == current_user
			@title = @user.display_name.humanize+'s Photos'
			@posts = Post.where('user_id =?', @user.id)
			@photoposts = @posts.where('photo_one_file_name IS NOT NULL')
			render :partial => "photos"
		else 
			@things = 'photos'
			render :partial => 'failure'
		end
	end
	def createpost
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to profile_path(@post.location_id)
		end
	end
	def deletepost
		@post = Post.find(params[:id])
		if current_user.id == @post.user_id
			@post.destroy
			render :nothing => true
		end
	end
	def mine
		if user_signed_in?
			redirect_to profile_path(current_user)
		else 
			redirect_to '/users/sign_up'
		end
	end
	def friends
		@user=User.find(params[:id])
		@friends = @user.friends
		if current_user.friends_with?(@user) || @user == current_user
			render :partial => "friends"
		else 
			@things = 'friends'
			render :partial => 'failure'
		end
	end
	def wall
		@user=User.find(params[:id])
		@posts = Post.where('location_id = ?', params[:id]) 
		@post = current_user.posts.build
		if current_user.friends_with?(@user) || @user == current_user
			render :partial => "wall"
		else 
			@things = 'posts'
			render :partial => 'failure'
		end
	end
	def requestfriendship
		@user = User.find(params[:id])
		current_user.friend_request(@user)
		render :nothing => true
	end	
	def acceptfriendship
		@user = User.find(params[:id])
		current_user.accept_request(@user)
		render :nothing => true
	end
	def declinefriendship
		@user = User.find(params[:id])
		current_user.decline_request(@user)
		render :nothing => true
	end
	def unfriend
		@user = User.find(params[:id])
		current_user.remove_friend(@user)
		render :nothing => true
	end

	def edit
		@user = current_user
		@profile = current_user
	end
	def update 
		@profile = current_user
		if @profile.update(profile_params)
			redirect_to profile_path(@profile)
		else
			render 'edit'
		end
	end
	def valid 
	    @post = Post.find(params[:id])
	    @post.liked_by current_user
	    render :nothing => true
	end
	def unvalid 
		@post = Post.find(params[:id])
		@post.unliked_by current_user
		render :nothing => true
	end
	def invalid 
		@post = Post.find(params[:id])
		@post.disliked_by current_user
		render :nothing => true
	end
	def uninvalid 
		@post = Post.find(params[:id])
		@post.undisliked_by current_user
		render :nothing => true
	end
	private
	def profile_params
		params.require(:user).permit(:username,:first_name,:last_name,:gender,:avatar,:email,:location)
	end
	def post_params
		params.require(:post).permit(:content,:photo_one, :location_id)
	end
end
