class EventsController < ApplicationController

  before_action :require_login, except: :index
  # before_action :get_user, only: :show

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      redirect_to user_events_path(@current_user), success: "Event successfully created"
    else
      flash.now.warning = "Event not created successfully"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:event, :name, :user, :description, :location)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

end
