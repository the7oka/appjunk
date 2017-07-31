class WallmessagesController < ApplicationController
	def index
		@title = 'Leave a message'
		@messages = Wallmessage.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
		if user_signed_in?
		@message = current_user.wallmessages.build
	end
	end
	def create 
		@message = current_user.wallmessages.build(wallmessage_params)
		if @message.save
			redirect_to index
		else
			render index
		end
	end
	private 

	def wallmessage_params
		params.require(:wallmessage).permit(:content)
	end
end
