class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :created_by
      t.string :role_type
      t.timestamps
    end
  end
end
