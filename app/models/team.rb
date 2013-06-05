class Team < ActiveRecord::Base
  attr_accessible :title, :description, :company_id, :created_by, :team_members_attributes
  has_many :team_members
  has_many :users, through: :team_members
  accepts_nested_attributes_for :team_members

  def team_leader
    self.team_members.where(role_type: 'team_lead').first rescue nil
  end

  def creator
    User.find(self.created_by).full_name rescue nil
  end
end
