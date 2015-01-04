class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # mount_uploader :image, ImageUploader

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  belongs_to :university

  has_many :memberships
  has_many :clubs, :through => :memberships, :source => :club


  # items in the cart
  has_many :selected_items
  has_many :carts, :through => :selected_items, :source => :cart

  # carts the user has paid for
  def paid_carts
    Cart.where(:paid => true, :user => self.id)
  end

  # selected items the user has paid for
  def paid_selected_items
    SelectedItem.where( :cart => self.paid_carts)
  end

  # items the user has paid for
  def paid_items
    Item.where(:selected_items => self.paid_selected_items)
  end



end
