class NotificationsController < ApplicationController
  def index
    from  = Time.now.at_beginning_of_day
    to    = (from + 30.day).at_end_of_day
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(check: false, created_at: from...to).each do |notification|
      notification.update_attributes(check: true)
    end
  end
end
