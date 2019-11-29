# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    from  = Time.now.at_beginning_of_day
    to    = (from + 30.day).at_end_of_day

    # current_user.passive_notifications→current_userがvisited_idに入っているデータ、つまりcurrent_userが受け取った通知
    @notifications = current_user.passive_notifications.where(visited_id: current_user.id).where.not(visitor_id: current_user.id).page(params[:page]).per(10)
    @notifications.where(check: false, created_at: from...to).each do |notification|
      notification.update_attributes(check: true)
    end
  end
end
