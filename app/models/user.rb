class User < ApplicationRecord
  has_many :authored_tests, foreign_key: :author_id, class_name: 'Test', dependent: :nullify
  has_many :attempts, dependent: :destroy
  has_many :tests, through: :attempts, dependent: :destroy

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.where(level: level).distinct
  end
end
