class Admin::BadgesController < ApplicationController

  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def edit; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], success: t('.success')
    else
      redirect_to new_admin_badge_path, alert: alert_messages_for(@badge)
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], success: t('.success')
    else
      redirect_to edit_admin_badge_path(@badge), alert: alert_messages_for(@badge)
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, success: t('.success')
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :rule_options, :badge_image_id, :rule_template_id)
  end
end
