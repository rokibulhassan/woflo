class Profile < ActiveRecord::Base
  attr_accessible :user_id, :company_id, :first_name, :last_name, :job_title, :phone, :mobile, :company_attributes
  belongs_to :user
  belongs_to :company

  accepts_nested_attributes_for :company

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
