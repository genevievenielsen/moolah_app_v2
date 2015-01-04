class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :location
      t.integer :owner_id
      t.string :image

      t.timestamps
    end
  end
end
