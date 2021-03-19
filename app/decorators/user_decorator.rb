class UserDecorator < ApplicationDecorator
  delegate_all

  ## Reminder: meta program these out
  ## Reminder: set a flag for host
  def upcoming_events
    object.events.where("DATE(date) > ?", Date.today).to_a
  end

  def upcoming_invitations
    Event.where("DATE(date) > ?", Date.today).find_by_id(object.invitations.each {|i| i.event_id}).to_a
  end

  def upcoming_events_and_invitations
    (upcoming_events + upcoming_invitations).sort_by!{ |event| event.date }
  end

  def past_events
    object.events.where("DATE(date) < ?", Date.today).to_a
  end

  def past_invitations
    Event.where("DATE(date) < ?", Date.today).find_by_id(object.invitations.each {|i| i.event_id}).to_a
  end

  def past_events_and_invitations
    (past_events + past_invitations).sort_by!{ |event| event.date }
  end
end
