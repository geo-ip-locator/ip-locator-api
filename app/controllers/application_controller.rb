class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:login, keys: %i[email password])
  end
end
