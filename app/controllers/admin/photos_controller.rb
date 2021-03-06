class Admin::PhotosController < AdminController
  before_filter :load_photo, :except => [:index, :new, :create, :sort, :remove_content]

  def load_photo
    @photo = Photo.find(params[:id])
  end

  def index
    @photo = Photo.all
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo saved."
      redirect_to admin_photos_path
    else

      render :new
    end
  end

  def new
    @photo = Photo.new
  end

  def update
    if @photo.update_attributes(params[:photo])
      notice = "#{@photo.name.titleize} Photo Updated."

      respond_to do |format|
        format.html do
          flash[:notice] = notice
          redirect_to admin_photos_path
        end

      end
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Photo deleted." if @photo.destroy
    redirect_to admin_photos_path
  end

  def sort
    params[:channel_photo].each_with_index do |id, index|
      ChannelPhoto.where(:id => id).update_all(:position => index)
    end

    #params[:channel_photo].each_with_index do |id, index|
    #  ChannelPhoto.update_all({position: index+1}, {id: id})
    #end
    render nothing: true

    #render :json => {}
  end

  def remove_content
    @channel_photo = ChannelPhoto.find(params[:id])
    @photo_channels_available = @channel_photo.photo.channels
    @photo = @channel_photo.photo
    @channel_photo.destroy
    if @photo_channels_available.blank?
      @photo.channels << Channel.find_by_name('archive')
      @photo.save!
    end
    flash[:notice] = "Photo removed from channel."
    redirect_to admin_channel_path(@channel_photo.channel)
  end

end