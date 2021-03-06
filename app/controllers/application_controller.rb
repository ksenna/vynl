class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
  	if resource.sign_in_count == 1
  		profile_users_path
  	else
  		root_path
  	end
  end

end
