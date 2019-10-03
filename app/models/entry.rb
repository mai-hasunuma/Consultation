class Entry < ApplicationRecord
  validates :content, presence: true
  belongs_to :room
  belongs_to :entry
end
