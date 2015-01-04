class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.boolean :required
      t.integer :owner_id
      t.datetime :expiration_date
      t.integer :club_id
      t.string :image
      t.string :category
      t.string :color
      t.string :size
      t.integer :university_id

      t.timestamps
    end
  end
end
