class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  # 掲示板
  has_many_attached :images
  has_many :board_selected_categories, dependent: :destroy
  has_many :board_categories, :through => :board_selected_categories
  has_many :board_comments, dependent: :destroy

  belongs_to :user
end
