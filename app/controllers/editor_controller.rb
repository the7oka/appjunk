class EditorController < ApplicationController
  def index
		@title = 'TestMe code editor'
    	button_view
  end
  def click
  	@title = 'TestMe code editor'
		button_click
		render :nothing => true
	end
end
