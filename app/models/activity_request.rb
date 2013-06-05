class ActivityRequest < ActiveRecord::Base
  attr_accessible :title, :code, :description, :created_by, :company_id

  has_many :activities
  belongs_to :company

  def creator
    User.find(self.created_by).full_name rescue nil
  end
end
