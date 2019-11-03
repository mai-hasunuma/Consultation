# frozen_string_literal: true

class BoardSelectedCategory < ApplicationRecord
  belongs_to :board_category
  # board_category_idとboard_idが同じやつの保存を防ぐvalidation
  validates :board_id, uniqueness: { scope: :board_category_id }
end
