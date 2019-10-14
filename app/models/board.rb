class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  # 掲示板
  has_many_attached :images
  has_many :board_selected_categories, dependent: :destroy
  has_many :board_categories, :through => :board_selected_categories
  has_many :board_comments, dependent: :destroy
  # activeadminでboardページの中でboard_commentsを編集、削除できるようにするため
  accepts_nested_attributes_for :board_comments, allow_destroy: true


  belongs_to :user

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # Comment.select(:user_id):BoardCommentテーブルのユーザidを取得
    temp_ids = BoardComment.select(:user_id).where(board_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, board_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, board_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    #コメントは複数回することが考えられる為、一つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      board_id: id,
      board_comment_id: board_comment_id,
      visited_id: visited_id,
      action: 'board_comment'
    )
    # 自分の投稿に対するコメントの場合は通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
    end
end
