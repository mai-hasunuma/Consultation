# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    trait :no_entry_user do
      user_id {}
      room_id { 1 }
    end

    trait :no_entry_room do
      room_id {}
      user_id { 1 }
    end
  end
end