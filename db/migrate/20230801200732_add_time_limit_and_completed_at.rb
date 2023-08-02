class AddTimeLimitAndCompletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_limit, :integer
    add_column :test_passages, :completed_at, :datetime
  end
end
