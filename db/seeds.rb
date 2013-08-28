# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(:email => 'oren@ericisaac.com', :password => 'ericisaac2013', :password_confirmation => 'ericisaac2013')
Admin.create(:email => 'eric@ericisaac.com', :password => 'ericisaac2013', :password_confirmation => 'ericisaac2013')

["new work","travel","food","portraits","published"].each do |name|
  Channel.create!(:name => name, :keywords => "Eric Isaac, #{name.capitalize}", :title => "Eric Issac Photography - #{name.capitalize} Photographs", :description => "This is a category.")
end
