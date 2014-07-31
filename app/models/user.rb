class User < ActiveRecord::Base
  validates :phone_number, presence: true
  validates :credits, numericality: { greater_than_or_equal_to: 0 }

  has_many :ownerships
end
