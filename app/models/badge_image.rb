# frozen_string_literal: true

class BadgeImage < ApplicationRecord
  has_one :badge

  validates :url, presence: :true

  def available?
    Badge.find_by(badge_image: self).nil?
  end
end
