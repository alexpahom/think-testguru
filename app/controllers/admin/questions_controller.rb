class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
    render :edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to [:admin, @question], notice: t('.success')
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test], notice: t('.success')
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    redirect_to admin_tests_path
  end
end
