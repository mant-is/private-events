class InvitationsController < ApplicationController

  before_action :get_invitee
  before_action :get_event

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(user_id: @invitee.id, event_id: 1)
    if @invitation.save
      redirect_to @invitee, notice: "Invite sent successfully"
    else
      flash.now.alert = "Invite sent failed"
      flash.now.alert = @invitation.errors.full_messages
      redirect_to user_path(@invitee)
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:user_id, :event, :invitee)
  end

  def get_invitee
    @invitee = User.find_by_name(invitation_params[:invitee])
    puts "INVITEE :  #{ @invitee.name }"
  end

  def get_event
    @event = Event.find_by_id(invitation_params[:event])
  end
end
