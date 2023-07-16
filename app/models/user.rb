class User < ApplicationRecord
  has_many :authored_tests, foreign_key: :author_id, class_name: 'Test', dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.where(level: level).distinct
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
