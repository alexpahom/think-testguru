class User < ApplicationRecord

  def find_tests_by_level(level)
    test_ids = Attempt.where('user_id = ? AND started_at IS NOT NULL', id).pluck(:test_id)
    Test.where(id: test_ids, level: level)
  end
end
