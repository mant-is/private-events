class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
  end

  private
  def invitation_params
    params.require(:event).permit(:user_id, :event_id)
  end

end
