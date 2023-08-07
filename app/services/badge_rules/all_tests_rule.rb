# frozen_string_literal: true

module BadgeRules
  class AllTestsRule < BaseRule
    def meet_criteria?
      passed_tests = @test_passage.user.test_passages.order(:test_id).pluck(:test_id).uniq
      Test.all.order(:id).pluck(:id) == passed_tests
    end
  end
end
