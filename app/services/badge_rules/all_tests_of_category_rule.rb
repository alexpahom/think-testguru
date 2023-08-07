# frozen_string_literal: true

module BadgeRules
  class AllTestsOfCategoryRule < BaseRule
    def meet_criteria?
      category = @test_passage.test.category
      return false unless Category.find_by(title: @rule_options) == category

      category_tests = category.tests.order(:id).pluck(:id)
      user_tests = TestPassage.where(user: @test_passage.user, tests: category.tests)
                              .order(:test_id)
                              .select(&:passed?)
                              .pluck(:test_id)
                              .uniq
      category_tests == user_tests
    end
  end
end
