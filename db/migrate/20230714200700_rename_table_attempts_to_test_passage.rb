class RenameTableAttemptsToTestPassage < ActiveRecord::Migration[6.1]
  def change
    rename_table :attempts, :test_passages
  end
end
