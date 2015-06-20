class ClubLeader < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	
	belongs_to :club
end
