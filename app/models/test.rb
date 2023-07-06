class Test < ApplicationRecord

  def self.find_by_category_name(name)
    sanitized_sql = sanitize_sql_array(
      ["INNER JOIN categories c ON c.id = tests.category_id WHERE c.title = '%s'", name]
    )
    Test.joins(sanitized_sql)
        .order(title: :desc)
        .pluck(:title)
  end
end
