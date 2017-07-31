class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def button_view
      Button.where(location: @title).first_or_create do |b|
        b.views += 1
        b.save
      end
      @button = Button.find_by location: @title
      @button.views += 1
      @button.save
  end
  def button_click
      @button = Button.find_by location: @title
      @button.clicks += 1
      @button.save
  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || profile_path(current_user)
  end
  def after_sign_out_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email,:first_name])
  end
end
