class Event < ApplicationRecord

  validates :name, presence: true

  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user


end
