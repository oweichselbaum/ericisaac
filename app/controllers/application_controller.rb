class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

  layout 'application'

  def phone_number
    @phone = Contact.first.phone
  end

  def email_address
    @email = Contact.first.email
  end

  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  def force_to_non_mobile
    request.format = 'html'.to_sym if params[:format] == "mobile"
  end

  helper_method :force_to_non_mobile
end
