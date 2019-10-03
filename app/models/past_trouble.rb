class PastTrouble < ApplicationRecord
  belongs_to :user
  belongs_to :trouble_category
end
