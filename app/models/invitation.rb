class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :invitee, class_name: 'User', foreign_key: 'user_id'
end
