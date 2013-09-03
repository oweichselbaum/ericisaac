class ChangePhotoImageColumn < ActiveRecord::Migration
  def self.up
    rename_column :photos, :image, :main_image
  end

  def self.down
    rename_column :photos, :main_image, :image
  end
end
