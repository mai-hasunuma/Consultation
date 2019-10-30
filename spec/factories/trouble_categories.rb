FactoryBot.define do
  factory :trouble_category do
    sequence(:name) { |n| "name#{n}" }

    trait :create_with_current_troubles do
      after(:create) do |trouble_category|
        create_list(:current_trouble, user: user, trouble_category: create(:trouble_category))
      end
    end
  end
end
