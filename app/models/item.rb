class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, :presence => true
  validates :price, :presence => true
  validates :owner_id, :presence => true
  validates :club_id, :presence => true

  belongs_to :university
  belongs_to :club
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  has_many :selected_items
  has_many :carts, :through => :selected_items, :source => :cart

  has_many :color_options
  accepts_nested_attributes_for :color_options, allow_destroy: true

  has_many :size_options
  accepts_nested_attributes_for :size_options, allow_destroy: true

end
