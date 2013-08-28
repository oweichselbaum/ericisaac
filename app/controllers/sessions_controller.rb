class SessionsController < Devise::SessionsController
  after_filter :remove_flash_notice, :only => [:create, :destroy]
  private

  def remove_flash_notice
    flash[:notice] = nil
  end
end