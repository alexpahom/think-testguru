# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :rules
end
