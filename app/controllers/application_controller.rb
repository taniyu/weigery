class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_user!
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404 unless current_user.admin?
  end
end
