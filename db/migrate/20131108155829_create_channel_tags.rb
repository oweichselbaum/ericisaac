class CreateChannelTags < ActiveRecord::Migration
  def self.up
    create_table :channel_tags do |t|
      t.belongs_to :tag
      t.belongs_to :channel
      t.integer :position
      t.timestamps
    end
    add_index :channel_tags, :channel_id
    add_index :channel_tags, :tag_id
  end

  def self.down
    drop_table :channel_tags
  end
end
