class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :relevant_data])
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :relevant_data])
  end
end

