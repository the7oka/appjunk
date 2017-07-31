class RandomNumberController < ApplicationController
  def index
  	@title = 'Random number generator'
  	button_view
  end
  def click
  	@title = 'Random number generator'
  	button_click
  	render :nothing => true
  end
end
