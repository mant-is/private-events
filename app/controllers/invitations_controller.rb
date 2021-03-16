class InvitationsController < ApplicationController

  before_action :get_invitee
  before_action :get_event

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(user_id: @invitee.id, event_id: @event.id)
    if @invitation.save
      flash[:success] = "Invite sent successfully"
      redirect_to @event
    else
      flash.now.warning = "Invite sent failed"
      flash.now.alert = @invitation.errors.full_messages
      redirect_to :root
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:invitee)
  end

  def get_invitee
    @invitee = User.find_by_name(invitation_params[:invitee])
    if !@invitee or @invitee == nil
      flash[:error] = "Invitation not sent."
      flash[:alert] = "#{ invitation_params[:invitee] } must sign up."
      redirect_to :root
    end
  end

  def get_event
    @event = Event.find_by_id(params[:event_id])
  end

end
