class CoinflipController < ApplicationController
  def index
  	@title = 'Coin flip'
  	button_view
  end
  def click
  	@title = 'Coin flip'
  	button_click
  	render :nothing => true
  end
end
