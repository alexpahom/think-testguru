# frozen_string_literal: true

module TestsHelper
  # TODO: delete after auth implementation
  def random_author_id
    User.all.sample.id
  end

  def test_header(test)
    if test.persisted?
      "Редактировать тест #{test.title}"
    else
      'Создать тест'
    end
  end
end
