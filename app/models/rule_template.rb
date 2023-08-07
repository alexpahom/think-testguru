# frozen_string_literal: true

class RuleTemplate < ApplicationRecord
  has_many :badges

  validates :text, presence: true

  def available?
    option_key ? true : Badge.find_by(rule_template: self).nil?
  end
end
