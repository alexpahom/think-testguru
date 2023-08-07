class TestPassagesController < ApplicationController

  before_action :set_test_passage

  def show
    if @test_passage.completed?
      redirect_to tests_path, notice: t('.already_completed')
    else
      set_time_limit_cookie
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      check_for_badges
      notice_text =
        @test_passage.time_is_up? ? t('.time_is_up') : t('.test_completed')
      redirect_to result_test_passage_path(@test_passage), notice: notice_text
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_time_limit_cookie
    cookies[:finish_by] = @test_passage.finish_by if @test_passage.test.time_limit
  end

  def check_for_badges
    new_badges = BadgeIssuerService.new(@test_passage).scan_for_reward.new_badges_issued
    flash[:success] = t('.new_badge_received') if new_badges
  end
end
