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
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id]).decorate
  end


  private
  def user_params
    params.require(:user).permit(:name)
  end

end
