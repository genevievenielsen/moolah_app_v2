class AddColorAndSizeOptionToSelectedItem < ActiveRecord::Migration
  def change
      add_column :selected_items, :color_option_id, :integer
      add_column :selected_items, :size_option_id, :integer
  end
end
