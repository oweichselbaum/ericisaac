class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.integer :channel_id
    end
    add_index :photos, :channel_id
  end

  def down
    drop_table :photos
    remove_index :photos, :channel_id
  end
end
