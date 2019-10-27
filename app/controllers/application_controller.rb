class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    edit_user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :housewife_year ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
