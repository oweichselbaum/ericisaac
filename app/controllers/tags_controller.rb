class TagsController < ApplicationController
  before_filter :load_event, :except => [:index]

  def load_event
    @tag = Tag.find(params[:id])
  end

  def index
  end

  def show
    @tag_photos = @tag.photos.sort_by {|x| x.main_image.to_s.gsub(('http://s3.amazonaws.com/ericisaacsite/photos/'), (''))}
    @featured_photo = Photo.find(params[:featured_id]) if params[:featured_id]
  end

end
