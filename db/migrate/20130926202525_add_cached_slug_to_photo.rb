class AddCachedSlugToPhoto < ActiveRecord::Migration
  def up
    add_column :photos, :cached_slug, :string
    add_index :photos, :cached_slug, :unique => true
  end

  def down
    remove_column :photos, :cached_slug
    remove_index :photos, :cached_slug
  end
end
