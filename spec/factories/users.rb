require 'faker'
FactoryBot.define do
  password = Faker::Internet.password

  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:housewife_year) { |n| "#{n}" }
    password { password }
    password_confirmation { password }
  end

  trait :no_name do
    name {}
  end

  trait :too_long_name do
    name {Faker::Lorem.characters(number: 31)}
  end

  trait :no_housewife_year do
    housewife_year { }
  end

  trait :no_email do
    email { }
  end

  trait :too_long_introduction do
    introduction {Faker::Lorem.characters(number: 301)}
  end

  trait :create_introduction do
    introduction {Faker::Lorem.characters(number: 20)}
  end

  trait :create_with_image do
    after(:build) do |user|
      user.attached = fixture_file_upload(Rails.root.join('spec', 'files', 'test.jpg'), 'image/jpg')
    end
  end

  # trait :create_with_image do
  #   profile_image {Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")}
  # end

  trait :create_with_boards do
    after(:create) do |user|
      create_list(:board, 3, user: user)
    end
  end

  trait :create_with_current_troubles do
    after(:create) do |user|
      create_list(:current_trouble, user: user, trouble_category: create(:trouble_category))
    end
  end
end
