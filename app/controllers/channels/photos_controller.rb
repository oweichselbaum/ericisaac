class Channels::PhotosController < ChannelsController
  before_filter :load_event, :except => [:index]

  def load_event
    @photo = Photo.find(params[:id])
  end

  def show

  end

end