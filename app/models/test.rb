class Test < ApplicationRecord

  def self.find_by_category_name(name)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: {title: name})
      .order(title: :desc)
      .pluck(:title)
  end
end
