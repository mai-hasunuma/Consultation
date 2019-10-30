FactoryBot.define do
  factory :notification do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n}" }

    trait :no_title do
      title {}
    end
  end
end
