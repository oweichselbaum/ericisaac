class Contact < ActiveRecord::Base
  attr_accessible :phone, :email
  validates :phone, :email, :presence => true
end