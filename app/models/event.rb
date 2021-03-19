class Event < ApplicationRecord
  before_validation { self.name = name.downcase.titleize }
  
  validates :date, :description, :location, :name, :time, presence: true
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, through: :invitations, source: :user
  has_many :invitations, dependent: :destroy
  
  def past
    self.date < Date.today
  end

  def upcoming
    self.date > Date.today
  end

end
