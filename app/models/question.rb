class Question < ActiveRecord::Base
  attr_accessible :topic_id, :title
  belongs_to :topic
  has_many :answer_details
end
