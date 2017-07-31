class GeometrySwissArmyKnifeController < ApplicationController
  def index
  	@title = 'Geometry Swiss Army Knife'
  	button_view
  end
  def click
  	@title = 'Geometry Swiss Army Knife'
  	button_click
  	render :nothing => true
  end
end
