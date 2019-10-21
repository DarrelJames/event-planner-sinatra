class Guest < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  
  belongs_to :user
  has_and_belongs_to_many :events
end
