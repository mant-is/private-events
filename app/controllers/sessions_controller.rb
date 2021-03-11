class SessionsController < ApplicationController

  before_action :require_login, only: :destroy

  def new
  end

  def create
    @user = User.find_by_name(params[:name])
    if @user
      flash.now.notice = "Logged in successfully."
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now.notice = "User not found. Please register."
      redirect_to register_path, notice: "You must register"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end

end
