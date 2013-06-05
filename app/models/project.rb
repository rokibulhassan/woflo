class Project < ActiveRecord::Base
  attr_accessible :description, :title, :code, :created_by, :company_id

  has_many :activities

  def creator
    User.find(self.created_by).full_name rescue nil
  end
end
