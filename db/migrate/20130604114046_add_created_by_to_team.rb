class AddCreatedByToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :created_by, :integer
  end
end
