class ChannelsController < ApplicationController
  before_filter :load_event, :except => [:index]
  def load_event
    @channel = Channel.find(params[:id])
  end

  def index
  end

  def show
  end

end
