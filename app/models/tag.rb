class Tag < ActiveRecord::Base
  attr_accessible :name, :channels, :hidden, :channel_ids
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  has_many :photo_tags
  has_many :photos, :through => :photo_tags, :dependent => :destroy
  has_many :channel_tags
  has_many :channels, :through => :channel_tags, :dependent => :destroy
end