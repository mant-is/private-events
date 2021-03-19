class EventDecorator < Draper::Decorator 
  delegate_all

  def invited
    invitees = []
    object.invitations.select(:id, :user_id).each do |attendee|
      attendee = User.find_by_id(attendee.user_id).name
      invitees.push(attendee) unless invitees.include?(attendee)
    end
    invitees
  end

  def date
    object.date.strftime("%A - %m/%d/%Y")
  end

  def time
    event = object.time.strftime("%I:%M %p")
  end
end
