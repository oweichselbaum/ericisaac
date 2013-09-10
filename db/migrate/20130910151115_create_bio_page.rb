class CreateBioPage < ActiveRecord::Migration
  def up
    create_table :bios do |t|
      t.string :bio_title
      t.string :bio_image
      t.string :title
      t.string :keywords
      t.string :description
      t.text :body
      t.timestamps
    end
    Bio.create(:bio_title => "Eric Isaac Bio", :title => "Eric Isaac Bio", :keywords => "Eric Isaac Bio", :description => "Eric Isaac Bio", :body => "Eric Isaac Bio")
  end

  def down
    drop_table :bios
  end
end
