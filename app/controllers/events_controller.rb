class EventsController < ApplicationController

  before_action :require_login, except: :index
  before_action :get_user, only: [:index, :show]

  def index
    @events = @user.events.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "Event successfully created"
    else
      flash.now.alert = "Event not created successfully"
      render :new
    end
  end

  def show
    @event = @user.events.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:event, :name, :user)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

end
