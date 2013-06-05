class AddFieldsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :string
    add_column :activities, :status, :string
  end
end
