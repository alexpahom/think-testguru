# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  after_action :set_welcome_flash, only: :create

  private

  def set_welcome_flash
    flash[:notice] = "Привет, #{current_user.first_name}!"
  end
end
