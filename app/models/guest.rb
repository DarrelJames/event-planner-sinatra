class Guest < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :user
  has_many :rsvps
  has_many :events, through: :rsvps


  validates :name, presence: true
end
