class AmioldyetController < ApplicationController
  
  def index
    @title ='Am i old yet?'
  	button_view
  end
  def click
    @title ='Am i old yet?'
    button_click
    render :nothing => true
  end
end
