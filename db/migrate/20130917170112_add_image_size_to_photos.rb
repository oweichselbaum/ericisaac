class AddImageSizeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_size, :string
  end
end
