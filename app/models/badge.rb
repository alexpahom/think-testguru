# frozen_string_literal: true

class Badge < ApplicationRecord
  has_one :rule, dependent: :destroy
  has_one :badge_image, dependent: :nullify
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy
end
