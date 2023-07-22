# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('admin.questions.question_form.edit_header', title: @question.test.title)
    else
      t('admin.questions.question_form.create_header', title: @test.title)
    end
  end
end
