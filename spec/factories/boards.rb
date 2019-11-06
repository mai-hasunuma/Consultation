# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n}" }
    association :user

    trait :no_board_user do
      # user_id {}ではなく、user {} と記載したら通った（association :userと設定しているから？？）
      user {}
    end

    trait :no_board_title do
      title {}
    end

    trait :no_board_content do
      content {}
    end

    trait :too_long_board_title do
      title { Faker::Lorem.characters(number: 31) }
    end

    trait :too_long_board_content do
      content { Faker::Lorem.characters(number: 201) }
    end


    trait :create_with_board_selected_troubles do
      after(:create) do |board|
        create_list(:board_selected_categories, board: board, board_category: create(:board_category))
      end
    end
  end
end
