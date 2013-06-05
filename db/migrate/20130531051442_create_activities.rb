class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activity_request_id
      t.integer :inspected_by
      t.integer :project_manager
      t.datetime :inspection_date
      t.integer :project_id
      t.string :project_code
      t.integer :building_id
      t.integer :floor_id
      t.integer :room_id
      t.integer :company_id
      t.integer :created_by
      t.timestamps
    end
  end
end
