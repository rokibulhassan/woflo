class Topic < ActiveRecord::Base
  attr_accessible :title, :questions_attributes
  has_many :questions

  accepts_nested_attributes_for :questions
end
