class CreateChannelPhotos < ActiveRecord::Migration
  def self.up
    create_table :channel_photos do |t|
      t.belongs_to :photo
      t.belongs_to :channel
      t.integer :position
      t.timestamps
    end
    add_index :channel_photos, :channel_id
    add_index :channel_photos, :photo_id
  end

  def self.down
    drop_table :channel_photos
  end
end
