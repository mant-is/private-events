class User < ApplicationRecord

  has_many :events, inverse_of: 'host'
  has_many :invitations
  
  validates :name, presence: true, uniqueness: true

end
