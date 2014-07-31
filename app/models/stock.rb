class Stock < ActiveRecord::Base
  has_many :ownerships
  has_many :stock_data
end
