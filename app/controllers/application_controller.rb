# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 会員登録にhousewife_yearなどを追加したので、下記の通りカスタマイズして、変更を可能にした
    added_attrs = %i[email name password password_confirmation housewife_year]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
