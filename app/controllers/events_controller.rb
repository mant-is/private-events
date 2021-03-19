class EventsController < ApplicationController
  decorates_assigned :event, :events, :user
  before_action :require_login, except: :index
  
  # before_action :get_user, only: :show

  def index
    @events = Event.all.decorate
  end

  def new
    @event = Event.new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      redirect_to user_events_path(@current_user), success: "Event successfully created"
    else
      flash[:error] = @event.errors.full_messages
      render :new
    end
  end

  def show
    @event = Event.find(params[:id]).decorate
    @users = User.all_except(@current_user).map { |u| [ u.name, u.id ] }
  end

  private
  def event_params
    params.require(:event).permit(:event, :name, :user, :date, :time, :description, :location)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def normalize_name
    self.name.titleize
  end

end
