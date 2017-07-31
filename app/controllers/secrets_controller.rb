class SecretsController < ApplicationController
	def index
		@title = 'Secrets'
		@secret = Secret.new
	end
	def all
		if user_signed_in? && current_user.admin == true
			@title = 'secrets'
			@secrets = Secret.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
		else 
			redirect_to '/secrets'
		end
	end
	def create
		@old_secret = Secret.offset(rand(Secret.count)).first
    	content = params[:new_secret]
    if content && !content.blank? && content.length <= 255 && content.length > 10
      Secret.create(:content => content, :user => current_user)
    end    
    respond_to do |format|
      format.html
      format.json { render :json => @old_secret.content.humanize }
    end    
  end
  	def delete
  		if user_signed_in? && current_user.admin == true
  		@secret = Secret.find(params[:id])
  		@secret.destroy
  		redirect_to '/secrets/all'
  	end
  	end
	private 
	def secret_params 
		params.require(:secret).permit(:content, :user)
	end
end
