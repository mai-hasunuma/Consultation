class Room < ApplicationRecord
  has_many :room_comments, dependent: :destroy
  # activeadminでroomページの中でroom_commentsを編集、削除できるようにするため
  accepts_nested_attributes_for :room_comments, allow_destroy: true

  has_many :entries, dependent: :destroy
  # 多対多
  has_many :entry_users, :through => :entries, source: :user
  has_many :room_comment_users, :through => :room_comments, source: :user

  # DM通知

  def create_notification_room_comment!(current_user, room_comment_id)
    other_user_id = Entry.select(:user_id).where(room_id: self.id).where.not(user_id: current_user.id)
    # other_user_ids = RoomComment.select(:user_id).where(room_id: self.id).where.not(user_id: current_user.id).distinct
    # other_user_ids.each do |temp_id|
    #   save_notification_room_comment!(current_user, room_comment_id, temp_id['user_id'])
    # end
    # binding.pry
    save_notification_room_comment!(current_user, room_comment_id, other_user_id[0])
  end

  def save_notification_room_comment!(current_user, room_comment_id, visited_id)
    notification = current_user.active_notifications.new(
      room_comment_id: room_comment_id,
      visited_id: visited_id.user_id,
      action: 'room_comment',
      check: "false"
    )

    if notification.visitor_id == notification.visited_id
      notification.check = true
    end
    notification.save! if notification.valid?
    end
end
