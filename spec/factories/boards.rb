# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n}" }

    trait :no_board_user do
      user_id {}
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
  end
end
