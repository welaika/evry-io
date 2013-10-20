class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :save_user_time_zone, if: :current_user
  around_filter :set_user_time_zone, if: :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not allowed to see that"
    redirect_to root_url
  end

  def save_user_time_zone
    if cookies["user_time_zone"].present? && current_user.time_zone.blank?
      current_user.update_attribute(:time_zone, cookies["user_time_zone"])
    end
  end

  def set_user_time_zone(&block)
    Time.use_zone(current_user.time_zone || 'UTC', &block)
  end
end
