class Admin::ChannelsController < AdminController
  before_filter :load_channel, :except => [:index, :new, :create]

  def load_channel
    @channel = Channel.find(params[:id])
  end

  def index
    @channel = Channel.all
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      flash[:notice] = "Channel saved."
      redirect_to admin_channel_path(@channel)
    else
      render :new
    end
  end

  def new
    @channel = Channel.new
  end

  def update
    if @channel.update_attributes(params[:channel])
      notice = "#{@channel.name.titleize} Channel Updated."

      respond_to do |format|
        format.html do
          flash[:notice] = notice
          redirect_to admin_channel_path(@channel)
        end

      end
    end
  end

  def destroy
    flash[:notice] = "Channel deleted." if @channel.destroy
    redirect_to admin_channels_path
  end
end