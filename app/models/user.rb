class User < ApplicationRecord

  def find_tests_by_level(level)
    sanitized_sql = self.class.sanitize_sql_array(
      ["JOIN attempts a ON a.test_id = tests.id WHERE a.user_id = %s AND level = %s", id, level]
    )
    Test.joins(sanitized_sql)
  end
end
