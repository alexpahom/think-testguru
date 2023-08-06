# frozen_string_literal: true

class BadgeIssuerService

  RULES_MAPPING = {
    first_test: BadgeRules::FirstTestRule,
    all_tests_of_category: BadgeRules::AllTestsOfCategoryRule,
    at_first_try: BadgeRules::AtFirstTryRule,
    pass_after_fail: BadgeRules::PassAfterFailRule,
    n_tests_in_row: BadgeRules::NTestsInRowRule,
    # { text: 'n_tests' },
    # { text: 'all_tests_of_level' },
    # { text: 'all_tests' },
    # { text: 'n_badges' },
  }

  attr_reader :new_badges_issued

  def initialize(passage)
    @test_passage = passage
    @new_badges_issued = false
  end

  def scan_for_reward
    Badge.all.each do |badge|
      klass = RULES_MAPPING[badge.rule_template.text.to_sym]
      reward(badge) if klass.new(@test_passage, badge).meet_criteria?
    end
    self
  end

  private

  def reward(badge)
    @test_passage.user.badges << badge
    @new_badges_issued = true
  end
end
