class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin_user!
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404 unless current_user.admin?
  end

  protected

  def configure_permitted_parameters
    allows = [:email, :name, :sex, :birth]
    devise_parameter_sanitizer.for(:sign_up) << allows
    devise_parameter_sanitizer.for(:account_update) << allows
  end
end
