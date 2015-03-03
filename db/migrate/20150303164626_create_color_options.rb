class CreateColorOptions < ActiveRecord::Migration
  def change
    create_table :color_options do |t|
      t.string :color
      t.string :item_id

      t.timestamps
    end
  end
end
