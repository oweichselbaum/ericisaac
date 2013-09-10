class CreatePhotoTag < ActiveRecord::Migration
  def self.up
     create_table :photo_tags do |t|
       t.belongs_to :photo
       t.belongs_to :tag
       t.timestamps
     end
   end

   def self.down
     drop_table :photo_tags
   end
end
