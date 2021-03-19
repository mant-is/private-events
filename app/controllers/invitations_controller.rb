class InvitationsController < ApplicationController
  before_action :get_event

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(event_id: @event.id, user_id: invitation_params[:invitee])
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

  def get_event
    @event = Event.find_by_id(params[:event_id])
  end
end
