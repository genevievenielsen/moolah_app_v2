class University < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, :presence => true
  validates :location, :presence => true
  validates :owner_id, :presence => true


  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  has_many :users
  has_many :clubs
  has_many :items

end
