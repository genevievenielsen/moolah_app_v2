class AddClubIdToClubLeaders < ActiveRecord::Migration
  def change
  	 add_column :club_leaders, :club_id, :integer
  end
end
