module BadgesHelper
  def received_badges
    @badges_received ||= current_user.badges
                                     .each_with_object(Hash.new(0)) { |badge, counts| counts[badge] += 1 }
  end

  def css_availability_class(badge)
    'disabled' if received_badges[badge] == 0
  end
end
