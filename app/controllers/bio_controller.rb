class BioController < ApplicationController
  before_filter :load_event

  def load_event
    @bio = Bio.first
  end

  def index
    #@bio = Bio.first
    @channel = Channel.find_by_name("bio")
    @channel_photos = @channel.channel_photos.order('position asc').all
    @featured_photo = Photo.find(params[:featured_id]) if params[:featured_id]
  end


end
