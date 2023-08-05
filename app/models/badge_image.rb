# frozen_string_literal: true

class BadgeImage < ApplicationRecord
  has_one :badge

  validates :url, presence: :true
end
