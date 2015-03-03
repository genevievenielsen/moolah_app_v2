class CreateSizeOptions < ActiveRecord::Migration
  def change
    create_table :size_options do |t|
      t.string :size
      t.string :item_id

      t.timestamps
    end
  end
end
