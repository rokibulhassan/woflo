class CreateTeam < ActiveRecord::Migration
  create_table :teams do |t|
    t.string :title
    t.text :description
    t.integer :company_id
    t.timestamps
  end
end
