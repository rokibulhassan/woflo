class Activity < ActiveRecord::Base
  attr_accessible :activity_request_id, :inspected_by, :project_manager, :inspection_date, :project_id, :project_code,
                  :building_id, :floor_id, :room_id, :company_id, :created_by, :priority, :status, :project_title,
                  :parent_activity_id, :building_title, :floor_title, :room_title, :answer_details_attributes, :topic_id

  belongs_to :activity_request
  belongs_to :parent_activity
  belongs_to :company
  belongs_to :project
  has_many :answer_details
  has_many :questions, through: :answer_details

  accepts_nested_attributes_for :answer_details

  def creator
    User.find(self.created_by).full_name rescue nil
  end

  def inspector
    User.find(self.inspected_by).full_name rescue nil
  end

  def manager
    User.find(self.project_manager).full_name rescue nil
  end

end
