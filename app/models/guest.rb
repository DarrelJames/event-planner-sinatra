class Guest < ActiveRecord::Base
  belongs_to :event
  belongs_to :user, through: :guests
end
