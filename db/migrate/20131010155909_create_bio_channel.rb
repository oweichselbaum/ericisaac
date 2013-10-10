class CreateBioChannel < ActiveRecord::Migration
  def up
    Channel.create(:name => "bio", :title => "Eric Isaac Bio", :description => "Eric Isaac Biography", :keywords => "bio", :hidden => true)
  end

  def down
    Channel.find_by_name("bio").destroy
  end
end
