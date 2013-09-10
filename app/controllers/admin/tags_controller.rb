class Admin::TagsController < AdminController
  before_filter :load_tag, :except => [:index, :new, :create]

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
end