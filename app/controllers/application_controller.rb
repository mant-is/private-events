class ApplicationController < ActionController::Base

  before_action :current_user
  helper_method :current_user 
  
  def require_login
    unless current_user
      redirect_to login_path, alert: "You must be signed in to do that"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
