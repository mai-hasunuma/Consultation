class TroubleCategory < ApplicationRecord
  validates :name, presence: true
  has_many :current_trouble_users, :through => :current_troubles, source: :user
  has_many :past_troubles_users, :through => :past_troubles, source: :user
end
