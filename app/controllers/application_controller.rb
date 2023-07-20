class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def alert_messages_for(entity)
    entity.errors.full_messages.to_sentence
  end
end
