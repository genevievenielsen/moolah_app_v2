class CreateSelectedItems < ActiveRecord::Migration
  def change
    create_table :selected_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :user_id

      t.timestamps
    end
  end
end
