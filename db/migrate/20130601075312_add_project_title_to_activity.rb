class AddProjectTitleToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :project_title, :string
    add_column :activities, :parent_activity_id, :integer
    add_column :activities, :building_title, :string
    add_column :activities, :floor_title, :string
    add_column :activities, :room_title, :string
  end
end
