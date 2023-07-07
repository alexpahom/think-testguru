class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :attempts
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :users, through: :attempts

  def self.find_by_category_name(name)
    joins(:category).where(categories: {title: name}).order(title: :desc).pluck(:title)
  end
end
