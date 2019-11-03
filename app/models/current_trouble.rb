# frozen_string_literal: true

class CurrentTrouble < ApplicationRecord
  belongs_to :user
  belongs_to :trouble_category
  # user_idとtrouble_categoryが同じやつの保存を防ぐvalidation
  validates :user_id, uniqueness: { scope: :trouble_category_id }
end
