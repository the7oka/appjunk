class CountdownController < ApplicationController
  def index
  	@title = "Countdown"
  	@visitoremail = Visitoremail.new
  end
  def create
  	@visitoremail = Visitoremail.new(visitoremail_params)
  	if @visitoremail.save
  		redirect_to "/"
  	else 
  		redirect_to "/"
  	end
  end
  private 
  def visitoremail_params
  	params.require(:visitoremail).permit(:address)
  end
end
