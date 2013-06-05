class CreateAnswerDetail < ActiveRecord::Migration
  def change
    create_table :answer_details do |t|
      t.integer :topic_id
      t.integer :question_id
      t.integer :activity_id
      t.string :answer
      t.string :comment
      t.timestamps
    end
  end
end
