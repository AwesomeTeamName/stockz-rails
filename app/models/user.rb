class User < ActiveRecord::Base
  has_many :ownerships
end
