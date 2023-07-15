class TestPassage < ApplicationRecord

  PASS_TEST_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    if answer_ids.nil?
      errors.add(:answers, 'Нужно выбрать хотя бы один ответ')
      return
    end
    self.correct_answers_made += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def passed?
    pass_rate_percents >= PASS_TEST_THRESHOLD
  end

  def pass_rate_percents
    (correct_answers_made * 100 / test.total_correct_answers_count).round
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
