class Room < ApplicationRecord
  has_many :room_comments, dependent: :destroy
  # activeadminでboardページの中でboard_commentsを編集、削除できるようにするため
  accepts_nested_attributes_for :room_comments, allow_destroy: true

  has_many :entries, dependent: :destroy
  # 多対多
  has_many :entry_users, :through => :entries, source: :user
  has_many :room_comment_users, :through => :room_comments, source: :user

  # DM通知
end
