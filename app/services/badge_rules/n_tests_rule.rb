# frozen_string_literal: true

module BadgeRules
  class NTestsRule < BaseRule
    def meet_criteria?
      @test_passage.user.test_passages.count == @rule_options.to_i
    end
  end
end
