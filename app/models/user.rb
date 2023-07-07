class User < ApplicationRecord
  has_many :authored_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :attempts
  has_many :tests, through: :attempts

  def find_tests_by_level(level)
    Test.joins(:attempts).where(attempts: { user_id: id }, level: level).distinct
  end
end
