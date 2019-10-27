class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
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
  def create_notification_board_comment!(write_user, board_comment_id)
    # current_user 書き込み者
    # self.user_id ログインしてる人
    # owner=掲示板所有者　owner_comment は掲示板作成者のコメントか、というフラグ
    owner_comment = false
    # 掲示板のオーナー
    board_owner_id =  BoardComment.find(board_comment_id).board.user_id
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # Comment.select(:user_id):BoardCommentテーブルのユーザidを取得する。
    # where(board_id: self.id).where.not(user_id: current_user.id).distinct :board_idは自分自身(@board)のid、かつカレントユーザ以外を取りたい
    board_writed_users = BoardComment.select(:user_id).where(board_id: self.id).where.not(user_id: write_user.id).distinct
    # 掲示板にコメントしたことがあるユーザたち
    board_writed_users.each do |writed_user|
      # いま書き込みをした人が過去書き込みをしたことがなければ　通知を作成して保存する
      if write_user.id != writed_user.id
        save_notification_board_comment!(write_user, board_comment_id, writed_user['user_id'])
      end
      # 過去書き込みがあった人が掲示板ユーザと同一ならば
      if writed_user.user_id == board_owner_id
        owner_comment = true
      end
    end

    # board_writed_usersに掲示板作成者がいなければ投稿者本人に通知を送る
    if board_writed_users.blank? && !owner_comment
      save_notification_board_comment!(write_user, board_comment_id, board_owner_id)
    end
    # 掲示板に書き込んだことがあるユーザが存在して、オーナーのコメントじゃなければ
    if board_writed_users.exists? && !owner_comment
      save_notification_board_comment!(write_user, board_comment_id, board_owner_id)
    end
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
