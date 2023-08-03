# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController

  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, except: %i[index new create]

  def index; end

  def show; end

  def edit; end

  def new
    @test = Test.new
    render :edit
  end

  def create
    @test = current_user.authored_tests.build(test_params)

    if @test.save
      redirect_to [:admin, @test], success: t('.success')
    else
      render :edit
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], success: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, success: t('.success')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time_limit)
  end

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
