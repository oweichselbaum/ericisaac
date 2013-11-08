class Admin::TagsController < AdminController
  before_filter :load_tag, :except => [:index, :new, :create, :sort, :remove_content]

  def load_tag
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Tag Saved"
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "Tag Updated"
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def destroy
    flash[:notice] = "Tag Deleted." if @tag.destroy
    redirect_to admin_tags_path
  end

  def sort
    params[:channel_tag].each_with_index do |id, index|
      ChannelTag.where(:id => id).update_all(:position => index)
    end

    #params[:channel_photo].each_with_index do |id, index|
    #  ChannelPhoto.update_all({position: index+1}, {id: id})
    #end
    render nothing: true

    #render :json => {}
  end

  def remove_content
    @channel_tag = ChannelTag.find(params[:id])
    @channel_tag.destroy
    flash[:notice] = "Tag removed from channel."
    redirect_to admin_channel_path(@channel_tag.channel)
  end
end