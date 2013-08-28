class AdminController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
  end

  def channels
    @channels = Channel.all
  end

end