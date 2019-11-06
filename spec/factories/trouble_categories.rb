# frozen_string_literal: true

FactoryBot.define do
  factory :trouble_category do
    sequence(:name) { |n| "name#{n}" }
  end


  trait :no_trouble_cateroy_name do
    name {}
  end
end
