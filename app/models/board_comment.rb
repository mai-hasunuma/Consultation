class BoardComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :board
  belongs_to :user
  has_many_attached :images
  has_many :notifications, dependent: :destroy
end
