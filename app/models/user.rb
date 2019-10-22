class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :guests, dependent: :destroy
  
  validates :email, presence: true
  validates_uniqueness_of :email
end
