class CreateContactPage < ActiveRecord::Migration
  def up
      create_table :contacts do |t|
        t.string :phone
        t.string :email
        t.timestamps
      end
      Contact.create(:phone => "917.295.5313", :email => "eric@ericisaac.com")
    end

    def down
      drop_table :contacts
    end
end
