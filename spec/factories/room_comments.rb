# frozen_string_literal: true

FactoryBot.define do
  factory :room_comment do
    sequence(:content) { |n| "content#{n}" }
    association :user
    association :room

    trait :no_room_comment_room do
      room {}
    end

    trait :no_room_comment_user do
      user {}
    end

    trait :no_room_comment_content do
      content {}
    end
  end
end
