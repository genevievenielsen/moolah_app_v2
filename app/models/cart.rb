class Cart < ActiveRecord::Base

  belongs_to :user

  has_many :selected_items
  has_many :items, :through => :selected_items, :source => :item



end
