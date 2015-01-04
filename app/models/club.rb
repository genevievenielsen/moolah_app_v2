class Club < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, :presence => true
  validates :university_id, :presence => true
  validates :owner_id, :presence => true

  belongs_to :university
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  has_many :items
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

end
