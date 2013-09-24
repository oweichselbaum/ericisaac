class WelcomeController < ApplicationController
  def index
    @channel = Channel.find_by_name("new work")
    @channel_photos = @channel.channel_photos.order("position DESC").all
  end

  def bio
    @bio = Bio.first
  end
end
