class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :club_id

      t.timestamps
    end
  end
end
