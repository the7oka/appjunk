class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    # raise request.env["omniauth.auth"].to_yaml
    # render :text => "<pre>" + env["omniauth.auth"].to_yaml and return
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end
    def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #render :text => "<pre>" + env["omniauth.auth"].to_yaml and return
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end