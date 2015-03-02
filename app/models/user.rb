class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  after_create :send_welcome_email
  after_create :check_club_email_lists

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  belongs_to :university

  has_many :memberships
  has_many :clubs, :through => :memberships, :source => :club

  has_many :items_for_sale, :class_name => "Item", :foreign_key => "owner_id"

  # items in the cart
  has_many :selected_items
  has_many :carts, :through => :selected_items, :source => :cart

  devise :omniauthable

  def self.find_for_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        if user
          return user
        else
          registered_user = User.where(:email => auth.info.email).first
          if registered_user
            return registered_user
          else
            user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email.blank? ? TEMP_EMAIL : auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
       end
    end
    user
  end

  # carts the user has paid for
  def paid_carts
    Cart.where(:paid => true, :user => self.id)
  end

  # selected items the user has paid for
  def paid_selected_items
    SelectedItem.where( :cart_id => self.paid_carts.pluck(:id))
  end

  # items the user has paid for
  def paid_items
    Item.where(:id => self.paid_selected_items.pluck(:item_id))
  end

  # carts the user has not paid for
  def unpaid_carts
    Cart.where(:paid => false, :user => self.id)
  end

  # selected items the user has not paid for
  def unpaid_selected_items
    SelectedItem.where( :cart_id => self.unpaid_carts.pluck(:id))
  end

  def items_in_cart
    Item.where(:id => self.unpaid_selected_items.pluck(:item_id))
  end


  # all the required items
  def required_items
    Item.where(:id => self.clubs.items.where(:required => true).pluck(:id))
  end

  # CREATE NEW USER METHODS
  def send_welcome_email
    Notifier.welcome_email(self).deliver
  end

  #when user registers check to see if their email is included on a club email list
  #if it is, create a membership
  def check_club_email_lists
    existing_club_memberships = Email.where(:email => self.email)
    if existing_club_memberships.present?
      existing_club_memberships.each do |email|
        m = Membership.new
        m.club_id = email.club_id
        m.user_id = self.id
        m.save
      end
    end
  end




end
