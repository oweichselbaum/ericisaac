class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cached_slug

      t.timestamps
    end
  end
end
