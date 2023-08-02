class TestPassagesController < ApplicationController

  before_action :set_test_passage

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
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
end
