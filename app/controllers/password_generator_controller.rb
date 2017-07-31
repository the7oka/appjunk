class PasswordGeneratorController < ApplicationController
  def index
  	@title = 'Password Generator'
  	button_view
  end
  def click
    @title = 'Password Generator'
  	button_click
  	render :nothing => true
  end
end
