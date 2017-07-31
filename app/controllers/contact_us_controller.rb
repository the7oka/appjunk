class ContactUsController < ApplicationController
	before_action :authenticate_user!
  def index
  	if current_user.admin?
  	@contactmes = Contactme.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  	else 
  		redirect_to new
  	end
  end

  def new
    @title = 'Contact Us'
  	@contactme = current_user.contactmes.build
  end
  def create
  	@contactme = current_user.contactmes.build(contactme_params)
  	if @contactme.save
      ContactusMailer.notification_email.deliver
  		redirect_to new
  	else 
  		redirect_to new
  	end
  end
  private
  def contactme_params
  	params.require(:contactme).permit(:regarding_id,:content,:document)
  end
end
