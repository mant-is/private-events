class EventDecorator < Draper::Decorator 
  delegate_all
  include Draper::LazyHelpers

  def invited
    invitees = []
    object.invitations.select(:id, :user_id).each do |attendee|
      attendee = User.find_by_id(attendee.user_id).name
      invitees.push(attendee) unless invitees.include?(attendee)
    end
    invitees
  end

  def date
    event = object.date.strftime("%m/%d/%Y")
  end
end
