# frozen_string_literal: true

class BadgeImage < ApplicationRecord
  belongs_to :badge, optional: true
end
