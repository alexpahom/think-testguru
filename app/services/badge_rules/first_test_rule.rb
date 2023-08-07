# frozen_string_literal: true

module BadgeRules
  class FirstTestRule < BaseRule
    def meet_criteria?
      @test_passage.user.test_passages.count == 1
    end
  end
end
