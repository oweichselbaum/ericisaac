class Photo < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader
  attr_accessible :name, :channel_ids, :main_image, :tag_ids, :image_size, :image_type

  has_many :tags, :through => :photo_tags
  has_many :photo_tags
  #belongs_to :channel
  has_many :channel_photos
  has_many :channels, :through => :channel_photos, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :channels, :presence => true
end