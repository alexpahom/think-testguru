class Admin::BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], success: 'ok'
    else
      redirect_to new_admin_badge_path, alert: 'error'
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :description, :rule_options, :badge_image_id, :rule_template_id)
  end
end
