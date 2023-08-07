# frozen_string_literal: true

module BadgeRules
  class PassAfterFailRule < BaseRule
    def meet_criteria?
      return unless @test_passage.passed?

      previous_passage = @test_passage.user.test_passages.where(test: @test_passage.test)
                   .where.not(id: @test_passage)
                   .order(completed_at: :desc)
                   .limit(1).first
      previous_passage && !previous_passage.passed?
    end
  end
end
