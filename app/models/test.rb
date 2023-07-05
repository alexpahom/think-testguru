class Test < ApplicationRecord

  def self.find_by_category_name(name)
    category_id = Category.where(title: name).first&.id
    raise 'Категория не найдена' unless category_id
    Test.where(category_id: category_id).order(title: :desc)
  end
end
