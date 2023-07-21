class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question, message: t('activerecord.errors.messages.too_many_answers')) if question.answers.count >= 4
  end
end
