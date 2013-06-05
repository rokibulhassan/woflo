class Company < ActiveRecord::Base
  attr_accessible :description, :title, :address_attributes, :logo

  has_one :address, :as => :addressable
  has_many :profiles
  has_many :users, through: :profiles, :dependent => :destroy
  has_many :parent_activities
  has_many :activities
  has_many :teams
  has_many :projects

  accepts_nested_attributes_for :address

  has_attached_file :logo, :styles => {:medium => "300x300>", :thumb => "100x100>", :logo => "100x20!"}
end
