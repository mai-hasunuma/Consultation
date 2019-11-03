# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # room_idとuser_idが同じやつの保存を防ぐvalidation
  validates :room_id, uniqueness: { scope: :user_id }
end
