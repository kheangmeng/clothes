class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
	 #  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	 #    user_params.permit(:username, :phone, :address)
	 #  end
  # end
  before_filter :categoryBar

  protected
  
  def categoryBar
  	@cateTag = Category.all
  end
end
