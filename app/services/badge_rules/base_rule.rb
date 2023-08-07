# frozen_string_literal: true

module BadgeRules
  class BaseRule
    def initialize(passage, badge)
      @test_passage = passage
      @rule_options = badge.rule_options
    end
  end
end
