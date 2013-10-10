class AddHideFieldToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :hidden, :boolean, :default => false
  end
end
