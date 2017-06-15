class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :respondent_id, null: false
      t.timestamps
    end
    add_index :responses, [:answer_choice_id, :respondent_id]
  end
end