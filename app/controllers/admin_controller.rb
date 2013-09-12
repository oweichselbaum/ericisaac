class AdminController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    @photo = Photo.all
  end

  def channels
    @channels = Channel.all
  end

end