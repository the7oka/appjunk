class MailinglistController < ApplicationController
	http_basic_authenticate_with name: "appjunk", password: "appjunkadmin@1"
  def index
  	@visitoremails = Visitoremail.all
  end
end
