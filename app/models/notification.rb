class Notification < ApplicationRecord
  validates :action, presence: true
  validates :check, presence: true
end
