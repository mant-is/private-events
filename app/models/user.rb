class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :events, inverse_of: 'host'
  has_many :invitations  
end
