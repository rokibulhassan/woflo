class ChangeUserNameConstraintToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :user_name, :string, :null => true
  end

  def self.down
    change_column :users, :user_name, :string, :null => false
  end
end
