class Ownership < ActiveRecord::Base
  belongs_to :user
  has_one :stock
end
