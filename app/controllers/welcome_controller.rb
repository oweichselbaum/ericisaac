class WelcomeController < ApplicationController
  def index
    @channel = Channel.find_by_name("new work")
  end

  def bio
    @bio = Bio.first
  end
end
