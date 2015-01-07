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

  has_many :emails

  def required_items
    Item.where(:id => self.items.where(:required => true).pluck(:id))
  end

  def members_and_emails_addresses
    club_emails = Email.where(:club_id => self.id)
    club_email_addresses = club_emails.pluck(:email)
    club_members = User.where(:id => self.memberships.pluck(:user_id))
    club_members_email_addresses = club_members.pluck(:email)
    club_members_and_emails = club_email_addresses + club_members_email_addresses
    return club_members_and_emails.uniq
  end


end
