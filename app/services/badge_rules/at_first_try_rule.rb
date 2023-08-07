# frozen_string_literal: true

module BadgeRules
  class AtFirstTryRule < BaseRule
    def meet_criteria?
      @test_passage.passed? && @test_passage.user.test_passages.where(test: @test_passage.test).count == 1
    end
  end
end
