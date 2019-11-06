FactoryBot.define do
  factory :board_selected_category do
    trait :no_board_selected_categories_board_categroy do
      board_category_id {}
      board_id { 1 }
    end

    trait :no_board_selected_categories_board do
      board_id {}
      board_category_id { 1 }
    end
  end
end
