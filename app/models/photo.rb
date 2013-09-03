class Photo < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader
  attr_accessible :name, :channel_id, :main_image
  belongs_to :channel
  validates :name, :presence => true, :uniqueness => true
  validates :channel, :presence => true
end