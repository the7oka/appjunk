class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Sign Up'
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end
  protected
	def after_sign_up_path_for(resource)
		if current_user.provider?
			"/"
  	else
  		@user = current_user
  		@user.display_name = @user.username
  		@user.save
      "/" # Or :prefix_to_your_route
    end
  end
end
