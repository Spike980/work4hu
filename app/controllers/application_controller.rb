class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource_or_scope)
		home_url
	end

	config.to_prepare do
	    Devise::SessionsController.layout "application"
	    Devise::RegistrationsController.layout "application"
	    Devise::ConfirmationsController.layout "application"
	    Devise::UnlocksController.layout "application"
	    Devise::PasswordsController.layout "application"
	end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :state, :gender])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :name, :city, :state, :gender, :avatar])
	  end

end
