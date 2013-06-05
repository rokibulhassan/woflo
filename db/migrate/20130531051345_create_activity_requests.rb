class CreateActivityRequests < ActiveRecord::Migration
  def change
    create_table :activity_requests do |t|
      t.string :title
      t.string :code
      t.boolean :enable, :default => false
      t.text :description
      t.integer :created_by
      t.integer :company_id
      t.timestamps
    end
  end
end
