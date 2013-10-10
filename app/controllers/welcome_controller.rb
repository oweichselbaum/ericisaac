class WelcomeController < ApplicationController
  def index
    @channel = Channel.find_by_name("new work")
    @channel_photos = @channel.channel_photos.order("position DESC").all
    @featured_photo = Photo.find(params[:featured_id]) if params[:featured_id]
  end

  def bio
    @bio = Bio.first
    @channel = Channel.find_by_name("new work")
    @channel_photos = @channel.channel_photos.order("position DESC").all
    @featured_photo = Photo.find(params[:featured_id]) if params[:featured_id]
  end
end
