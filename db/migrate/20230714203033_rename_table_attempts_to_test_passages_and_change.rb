class RenameTableAttemptsToTestPassagesAndChange < ActiveRecord::Migration[6.1]
  def change
    rename_table :attempts, :test_passages
    change_table :test_passages do |table|
      table.column :current_question_id, :integer, references: :questions
      table.column :correct_answers_made, :integer, null: false, default: 0
    end
  end
end
