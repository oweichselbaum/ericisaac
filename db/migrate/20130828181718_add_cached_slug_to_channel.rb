class AddCachedSlugToChannel < ActiveRecord::Migration
  def up
    add_column :channels, :cached_slug, :string
    add_index :channels, :cached_slug, :unique => true
  end

  def down
    remove_column :channels, :cached_slug
    remove_index :channels, :cached_slug
  end
end
