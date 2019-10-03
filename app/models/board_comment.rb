class BoardComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :board
  belongs_to :user
end
