class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :guests, through: :events
end
