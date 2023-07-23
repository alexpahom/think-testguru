# frozen_string_literal: true

module GistsHelper
  def shortened_question(question_text)
    "#{question_text.slice(0, 25)}..."
  end
end
