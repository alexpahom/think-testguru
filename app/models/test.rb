class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :time_limit, numericality: { only_integer: true, greater_than_or_equal_to: 30 }, allow_nil: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :category_tests, -> (category_name) do
    joins(:category).where(categories: { title: category_name })
                    .order(title: :desc)
  end

  def self.find_test_titles_by_category(category_name)
    category_tests(category_name).pluck(:title)
  end

  def total_correct_answers_count
    Test.joins(questions: :answers).where(id:, answers: { correct: true }).count
  end
end
