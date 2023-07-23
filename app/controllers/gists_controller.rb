class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result[:url]
                      { notice: t('.success', link: result[:url]) }
                    else
                      { alert: [t('.failure'), result[:error]].join("\n") }
                    end
    redirect_to @test_passage, flash_options
  end

end
