# frozen_string_literal: true

module NotificationsHelper
  def unchecked_notifications
    from  = Time.now.at_beginning_of_day
    to    = (from + 30.day).at_end_of_day
    @notifications = current_user.passive_notifications.where(check: false, created_at: from...to)
  end

  def notification_form(notification)
    visitor = link_to notification.visitor.name, notification.visitor, style: 'font-weight: bold;'
    case notification.action
    when 'board_comment' then
      @board_comment = nil
      your_board = link_to 'あなたが投稿した掲示板', notification.board_comment.board, style: 'font-weight: bold;'
      @board_comment = BoardComment.find_by(id: notification.board_comment_id)&.content
      "#{visitor}さんが#{your_board}にコメントしました"
    when 'room_comment' then
      @room_comment = nil
      your_room = link_to 'DM', notification.room_comment.room, style: 'font-weight: bold;'
      @room_comment = RoomComment.find_by(id: notification.room_comment_id)&.content
      "#{visitor}さんから#{your_room}が届きました"
    end
  end
end
