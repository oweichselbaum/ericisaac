class AddCachedSlugToTags < ActiveRecord::Migration
  def up
    add_column :tags, :cached_slug, :string
    add_index :tags, :cached_slug, :unique => true
  end

  def down
    remove_column :tags, :cached_slug
    remove_index :tags, :cached_slug
  end
end
