class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    gist = Gist.new(
      author_email: current_user.email,
      github_url: result.url,
      question: @test_passage.current_question
    )
    flash_options = if result.success? && gist.save
                      { notice: t('.success', link: result.url) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_passage, flash_options
  end
end
