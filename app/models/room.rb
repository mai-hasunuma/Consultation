class Room < ApplicationRecord
  has_many :room_comments, dependent: :destroy
  has_many :entries, dependent: :destroy
  # 多対多
  has_many :entry_users, :through => :entries, source: :user
  has_many :room_comment_users, :through => :room_comments, source: :user
end
