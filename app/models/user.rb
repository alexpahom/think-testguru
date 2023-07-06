class User < ApplicationRecord

  def find_tests_by_level(level)
    Test.joins('JOIN attempts ON attempts.test_id = tests.id')
        .where(attempts: { user_id: id }, level: level)
        .distinct
        .pluck(:title)
  end
end
