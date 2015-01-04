class Item < ActiveRecord::Base
  # mount_uploader :image, ImageUploader

  validates :name, :presence => true
  validates :price, :presence => true
  validates :owner_id, :presence => true
  validates :club_id, :presence => true

  belongs_to :university
  belongs_to :club
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  has_many :selected_items
  has_many :carts, :through => :selected_items, :source => :cart

  # carts the user has paid for
  def purchases
    Cart.where(:paid => true, :item => self.id)
  end



end
