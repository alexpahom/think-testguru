# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Редактировать вопрос для #{@question.test.title}"
    else
      "Создать вопрос для #{@test.title}"
    end
  end
end
