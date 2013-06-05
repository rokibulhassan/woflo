class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :country, :zip, :addressable_id, :addressable_type
  belongs_to :addressable, :polymorphic => true
end