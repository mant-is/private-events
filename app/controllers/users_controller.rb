class UsersController < ApplicationController

  before_action :require_login, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "#{@user.name} was successfully created"
    else
      flash.now.alert = "User not created"
      render register_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end


  private
  def user_params
    params.require(:user).permit(:name)
  end

end
