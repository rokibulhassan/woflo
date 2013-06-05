class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :topic_id
      t.string :title
      t.timestamps
    end
  end
end
