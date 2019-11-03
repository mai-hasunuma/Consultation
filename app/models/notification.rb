# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :action, presence: true
  validates :check, inclusion: { in: [true, false] }
  # 通知の表示をデフォルトの並び順を「作成日時の降順（新しいデータから順に表示）」で指定
  default_scope -> { order(created_at: :desc) }
  belongs_to :board_comment, optional: true
  belongs_to :room_comment, optional: :true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
