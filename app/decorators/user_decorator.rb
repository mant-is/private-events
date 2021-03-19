class UserDecorator < ApplicationDecorator
  delegate_all

  def upcoming_events
    object.events.where("DATE(date) > ?", Date.today).to_a
  end

  def upcoming_invitations(up_inv = [])
    up_inv = []
    object.invitations.each do |event|
      if Event.find(event.event_id).date > Date.today
        up_inv << Event.find(event.event_id)
      end
    end
    up_inv
  end

  def upcoming_events_and_invitations
    @upcoming = (upcoming_events + upcoming_invitations).sort_by!{ |event| event.date }
  end

  def past_events
    object.events.where("DATE(date) < ?", Date.today).to_a
  end

  def past_invitations
    pa_inv = []
    object.invitations.each do |event|
      if Event.find(event.event_id).date < Date.today
        pa_inv << Event.find(event.event_id)
      end
    end
    pa_inv
  end

  def past_events_and_invitations
    @past = (past_events + past_invitations).sort_by!{ |event| event.date }
  end
end
