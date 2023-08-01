class FeedbackController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    email = params[:email] || current_user.email
    FeedbackMailer.send_to_admin(params[:body], email).deliver_now
  end
end
