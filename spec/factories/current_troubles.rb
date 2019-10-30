# frozen_string_literal: true

FactoryBot.define do
  factory :current_trouble do


    trait :no_user do
      user_id {}
      trouble_category_id { 1 }
    end

    trait :no_trouble_category do
      trouble_category_id {}
      user_id { 1 }
    end
  end
end
