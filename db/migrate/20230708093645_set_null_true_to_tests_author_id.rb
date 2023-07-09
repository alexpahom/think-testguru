class SetNullTrueToTestsAuthorId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tests, :author_id, true
  end
end
