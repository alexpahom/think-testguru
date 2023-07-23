class Gist < ApplicationRecord
  belongs_to :question

  validates :github_url, presence: true
  validates :author_email, presence: true
end
