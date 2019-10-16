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
  # 掲示板コメント通知
  # 下のcurrent_userはdef以下でcurrent_userを使うために引数として定義している
  def create_notification_board_comment!(current_user, board_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # Comment.select(:user_id):BoardCommentテーブルのユーザidを取得する。
    # where(board_id: self.id).where.not(user_id: current_user.id).distinct :board_idは自分自身(@board)のid、かつカレントユーザ以外を取りたい
    other_user_ids = BoardComment.select(:user_id).where(board_id: self.id).where.not(user_id: current_user.id).distinct
    # each文で回す
    other_user_ids.each do |temp_id|
      save_notification_board_comment!(current_user, board_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_board_comment!(current_user, board_comment_id, self.user_id) if other_user_ids.blank?
  end

  def save_notification_board_comment!(current_user, board_comment_id, visited_id)
    #コメントは複数回することが考えられる為、一つの投稿に複数回通知する
    #カレントユーザーのactive_notificationsを作る→visitoridはcurrent_userになる
    notification = current_user.active_notifications.new(
      board_comment_id: board_comment_id,
      visited_id: visited_id,
      action: 'board_comment',
      check: "false"
    )
    # 自分の投稿に対するコメントの場合は通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.check = true
    end
    notification.save! if notification.valid?
    end
end
