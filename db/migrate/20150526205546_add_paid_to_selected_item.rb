class AddPaidToSelectedItem < ActiveRecord::Migration
  def change
    add_column :selected_items, :paid, :boolean

  end
end
