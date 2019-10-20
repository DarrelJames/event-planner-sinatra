class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :guests
  validates :email, presence: true
  validates_uniqueness_of :email
end
