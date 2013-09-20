class BioController < ApplicationController
  before_filter :load_event
  def load_event
    @bio = Bio.first
  end

  def index
  end


end
