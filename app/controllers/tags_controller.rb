class TagsController < ApplicationController
  before_filter :load_event, :except => [:index]

  def load_event
    @tag = Tag.find(params[:id])
  end

  def index
  end

  def show
    @tag_photos = @tag.photos.order('created_at desc').all
    @featured_photo = Photo.find(params[:featured_id]) if params[:featured_id]
  end

end
