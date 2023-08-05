# frozen_string_literal: true

module BadgeRules
  class PassAfterFailRule < BaseRule
    def meet_criteria?
      return unless @test_passage.passed?

      @test_passage.user.test_passages.where(test: @test_passage.test)
                   .where.not(id: @test_passage)
                   .any? { |t| !t.passed? }
    end
  end
end
