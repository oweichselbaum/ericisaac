class Bio < ActiveRecord::Base
  mount_uploader :bio_image, ImageUploader
  attr_accessible :bio_title, :title, :description, :keywords, :bio_image, :body
  validates :bio_title, :title, :description, :keywords, :presence => true
end