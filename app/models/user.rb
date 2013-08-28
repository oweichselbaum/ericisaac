class User < ActiveRecord::Base
  attr_accessible :cached_slug, :name
  has_friendly_id :name, :use_slug => true
end
