class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :user_name, :full_name, :password, :password_confirmation, :remember_me, :send_email_notification,
                  :profile_attributes, :user_roles_attributes, :admin_checked
  attr_accessor :send_email_notification, :admin_checked

  has_one :profile, :dependent => :destroy
  has_many :user_roles
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :parent_activities

  accepts_nested_attributes_for :profile, :user_roles

  after_create :set_user_roles

  def admin?
    self.find_user_roles.include?("admin")
  end

  def find_user_roles
    self.user_roles.collect(&:role).collect(&:name)
  end

  def full_name
    "#{self.profile.first_name} #{self.profile.last_name}" rescue ""
  end

  def admin_checked?
    admin_checked.present? && admin_checked == 'true'
  end

  private

  def set_user_roles
    self.user_roles.create!(role_id: 3) unless admin_checked?
  end


  def make_admin!
    @role = self.user_roles.new
    @role = @role.build_role
    @role.name = 'admin'
    @role.save!
  end
end
