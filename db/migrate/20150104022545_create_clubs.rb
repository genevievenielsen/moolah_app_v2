class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :university_id
      t.string :website
      t.integer :owner_id

      t.timestamps
    end
  end
end
