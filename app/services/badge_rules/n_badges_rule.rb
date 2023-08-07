# frozen_string_literal: true

module BadgeRules
  class NBadgesRule < BaseRule
    def meet_criteria?
      @test_passage.user.badges.count == @rule_options.to_i
    end
  end
end
