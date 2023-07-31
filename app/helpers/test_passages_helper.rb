module TestPassagesHelper

  def total_questions_count
    @test_passage.test.questions.count
  end

  def current_question_number
    @test_passage.test.questions.index(@test_passage.current_question) + 1
  end

  def current_progress_percents
    current_question_number / total_questions_count.to_f * 100
  end
end
