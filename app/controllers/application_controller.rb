class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'application'

  def phone_number
    @phone = Contact.first.phone
  end

  def email_address
    @email = Contact.first.email
  end
end
