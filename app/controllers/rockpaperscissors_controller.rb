class RockpaperscissorsController < ApplicationController
  def index
  	@title = 'Rock paper scissors'
  	button_view
  end
  def advanced 
  	@title = 'Rock paper scissors lizard spock'
  	button_view
  end
  def click
    @title = 'Rock paper scissors'
  	button_click
  	render :nothing => true
  end
end
