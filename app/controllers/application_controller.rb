class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin?
    redirect_to user_path(current_user) unless current_user.admin?
  end

  def logged_in?
    !!current_user
  end

  def require_login
  	redirect_to root_path unless logged_in?
  end
  
end
