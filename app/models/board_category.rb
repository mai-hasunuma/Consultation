class BoardCategory < ApplicationRecord
  validates :name, presence: true
  has_many :board_selected_categories, dependent: :destroy
  # boardとboard_categoryの紐付け
  has_many :boards, :through => :board_selected_categories
end
