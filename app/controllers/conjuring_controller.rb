class ConjuringController < ApplicationController
  def index
  	@title = 'Conjuring'
  	button_view
  end
  def click
  	@title = 'Conjuring'
    button_click
    render :nothing => true
  end
end
