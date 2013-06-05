class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :phone
      t.string :mobile

      t.timestamps
    end
  end
end
