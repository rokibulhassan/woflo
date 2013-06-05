class TeamMember < ActiveRecord::Base
  attr_accessible :team_id, :user_id, :role_type, :created_by

  belongs_to :team
  belongs_to :user

  def creator
    User.find(self.created_by).full_name rescue nil
  end
end
