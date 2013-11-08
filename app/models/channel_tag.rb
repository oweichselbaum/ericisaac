class ChannelTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :channel

  validates :channel, :presence => true
  validates :tag_id, :uniqueness => {:scope => :channel_id}

  acts_as_list :scope => :channel

  delegate :name, :to => :tag

  def tag_name=(tag_name)
    @tag_name = photo_name
    self.tag = tag.find_by_name(tag_name)
  end

  def tag_name
    @tag_name || self.tag.try(:name)
  end
end