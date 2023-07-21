# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  after_action :set_welcome_flash, only: :create

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def set_welcome_flash
    flash[:notice] = t('general.welcome_flash', first_name: current_user.first_name)
  end
end
