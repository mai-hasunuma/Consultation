class CurrentTrouble < ApplicationRecord
  belongs_to :user
  belongs_to :trouble_category
  # user_idとtrouble_categoryが同じやつの保存を防ぐvalidationを記述。pastの方も　scopedってやつを確か使います
end
