# frozen_string_literal: true

FactoryBot.define do
  factory :board_category do
    sequence(:name) { |n| "name#{n}" }
  end


  trait :no_board_cateroy_name do
    name {}
  end
end
