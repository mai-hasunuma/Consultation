class BoardCategory < ApplicationRecord
  validates :name, presence: true
  has_many :board_selected_category, dependent: :destroy
end
