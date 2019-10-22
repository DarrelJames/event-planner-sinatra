class Event < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :user
  belongs_to :venue

  has_many :invitations, dependent: :destroy
  has_many :guests, through: :invitations

  has_many :faqs, dependent: :destroy

  validates :name, presence: true

  # def slug
  #   self.name.downcase.gsub(" ", "-")
  # end
  #
  # def self.find_by_slug(slug)
  #   self.all.find {|event| event.slug == slug}
  # end
end
