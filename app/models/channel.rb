class Channel < ActiveRecord::Base
  extend FriendlyId
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  attr_accessible :name, :title, :description, :keywords

  validates :name, :presence => true, :uniqueness => true
  validates :title, :description, :keywords, :presence => true

  def display_name
    name.titleize
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
