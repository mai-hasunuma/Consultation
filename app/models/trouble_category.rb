# frozen_string_literal: true

class TroubleCategory < ApplicationRecord
  validates :name, presence: true
  # userとtrouble_categoryの紐付け
  has_many :current_trouble_users, through: :current_troubles, source: :user, dependent: :destroy
  has_many :past_troubles_users, through: :past_troubles, source: :user, dependent: :destroy

  has_many :current_troubles, dependent: :destroy
  has_many :past_troubles, dependent: :destroy
end
