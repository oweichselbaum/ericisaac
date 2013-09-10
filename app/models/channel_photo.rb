class ChannelPhoto < ActiveRecord::Base
  belongs_to :photo
  belongs_to :channel

  validates :channel, :presence => true
  validates :photo_id, :uniqueness => {:scope => :channel_id}

  acts_as_list :scope => :channel

  delegate :name, :to => :photo

  def photo_name=(photo_name)
    @photo_name = photo_name
    self.photo = Photo.find_by_name(photo_name)
  end

  def photo_name
    @photo_name || self.photo.try(:name)
  end
end