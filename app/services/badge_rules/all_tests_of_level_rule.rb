# frozen_string_literal: true

module BadgeRules
  class AllTestsOfLevelRule < BaseRule
    def meet_criteria?
      return false if @rule_options.to_i != @test_passage.test.level

      tests_of_level = Test.where(level: @rule_options.to_i).order(:id).pluck(:id)
      passed_tests_of_level = TestPassage.where(user: @test_passage.user, tests: tests_of_level)
                                         .order(:test_id)
                                         .select(&:passed?)
                                         .pluck(:test_id)
                                         .uniq
      passed_tests_of_level == tests_of_level
    end
  end
end
