class Admin::PhotosController < AdminController
  before_filter :load_photo, :except => [:index, :new, :create]

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
      redirect_to admin_photo_path(@photo)
    else
      render :new
    end
  end

  def new
    @photo = Photo.new
  end

  def update
    if @photo.update_attributes(params[:photo])
      notice = "#{@Photo.name.titleize} Photo Updated."

      respond_to do |format|
        format.html do
          flash[:notice] = notice
          redirect_to admin_photo_path(@Photo)
        end

      end
    end
  end

  def destroy
    flash[:notice] = "Photo deleted." if @photo.destroy
    redirect_to admin_photos_path
  end
end