# frozen_string_literal: true

FactoryBot.define do
  factory :board_comment do
    sequence(:content) { |n| "content#{n}" }
    association :user
    association :board

    trait :no_board_comment_board do
      board {}
    end

    trait :no_board_comment_user do
      user {}
    end

    trait :no_board_comment_content do
      content {}
    end
  end
end
