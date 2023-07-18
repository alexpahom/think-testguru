class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path, notice: 'Успешный вход'
    else
      redirect_to login_path, alert: 'Нет пользователя с таким email-ом и паролем'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Успешно вышли из системы'
  end
end
