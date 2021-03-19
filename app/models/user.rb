class User < ApplicationRecord
  scope :all_except, ->(user) { where.not(id: user) }

  validates :name, presence: true, uniqueness: true
  has_many :events, inverse_of: 'host'
  has_many :invitations  
end
