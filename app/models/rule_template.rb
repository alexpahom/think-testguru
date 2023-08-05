# frozen_string_literal: true

class RuleTemplate < ApplicationRecord
  has_many :badges

  validates :text, presence: true
end
