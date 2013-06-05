class AnswerDetail < ActiveRecord::Base
  attr_accessible :topic_id, :question_id, :activity_id, :answer, :comment

  belongs_to :question
  belongs_to :activity

  scope :by_topic_id, lambda { |topic_id| where(topic_id: topic_id) }
end
