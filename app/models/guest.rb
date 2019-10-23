class Guest < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :user
  has_many :event_guests
  has_many :events, through: :event_guests
end
