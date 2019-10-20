class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  has_many :guests

  validates :name, presence: true

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|event| event.slug == slug}
  end
end
