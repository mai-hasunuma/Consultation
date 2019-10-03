class Room < ApplicationRecord
  has_many :room_comments, dependent: :destroy
  has_many :entries, dependent: :destroy
end
