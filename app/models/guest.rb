class Guest < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :user
  has_many :invitations
  has_many :events, through: :invitations
end
