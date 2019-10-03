class TroubleCategory < ApplicationRecord
  validates :name, presence: true
  has_many :current_troubles, dependent: :destroy
  has_many :past_troubles, dependent: :destroy
end
