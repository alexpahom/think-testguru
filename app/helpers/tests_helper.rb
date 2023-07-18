# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    if test.persisted?
      "Редактировать тест #{test.title}"
    else
      'Создать тест'
    end
  end
end
