class ChangeNameFromTypeToImageType < ActiveRecord::Migration
  def change
    rename_column :photos, :type, :image_type
  end
end
