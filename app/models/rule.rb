# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :achievement
  belongs_to :badge
end
