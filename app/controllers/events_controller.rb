class EventsController < ApplicationController

  before_action :require_login, except: :index

  def index
    @events = Event.all
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
    @event = Event.find(params[:id])
  end


  private
  def event_params
    params.require(:event).permit(:name)
  end

end
