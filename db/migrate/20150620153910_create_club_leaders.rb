class CreateClubLeaders < ActiveRecord::Migration
  def change
    create_table :club_leaders do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
