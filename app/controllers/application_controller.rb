class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    return if  current_user

    cookies[:forward_to] = request.path
    redirect_to login_path, alert: 'Сперва нужно войти'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def alert_messages_for(entity)
    entity.errors.full_messages.to_sentence
  end
end
