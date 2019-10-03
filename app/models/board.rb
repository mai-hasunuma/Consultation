class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :board_selected_category, dependent: :destroy
  has_many :board_comment, dependent: :destroy
  belongs_to :user
end
