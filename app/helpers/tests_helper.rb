# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    if test.persisted?
      t('admin.tests.test_form.edit_header', title: test.title)
    else
      t('admin.tests.test_form.create_header')
    end
  end
end
