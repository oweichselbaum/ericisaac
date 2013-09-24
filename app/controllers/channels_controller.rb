class ChannelsController < ApplicationController
  before_filter :load_event, :except => [:index]

  def load_event
    @channel = Channel.find(params[:id])
  end

  def index
  end

  def show
    @channel_photos = @channel.channel_photos.order("position DESC").all
  end

end
