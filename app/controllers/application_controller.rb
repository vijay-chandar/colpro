class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

 protected
	def after_sign_in_path_for(resource)
    	selection_path
  	end
	def after_sign_out_path_for(resource)
   		home_path 
  	end
  	def after_sign_up_path_for(resource)
    	selection_path
  	end
    def after_update_path_for(resource)
      papers_path 
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :email, :password, :password_confirmation, :first_name, :designation,:college_name,:mobile_number) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

end
