class ParentActivity < ActiveRecord::Base
  attr_accessible :title, :code, :enable, :description, :created_by, :company_id

  has_many :activities
  belongs_to :company

  scope :active, where(:enable => true)

  def creator
    User.find(self.created_by).full_name rescue nil
  end
end
