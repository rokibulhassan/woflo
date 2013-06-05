class RemoveIndexUserNameToUser < ActiveRecord::Migration
  def up
    remove_index :users, :column => :user_name
  end

  def down
    add_index :users, :user_name, :unique => true
  end
end
