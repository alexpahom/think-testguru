# frozen_string_literal: true

module BadgeRules
  class NTestsInRowRule < BaseRule
    def meet_criteria?
      length = @rule_options.to_i
      @test_passage.user.test_passages.order(completed_at: :desc).limit(length).then do |last_attempts|
        last_attempts.count == length && last_attempts.all?(&:passed?)
      end
    end
  end
end
