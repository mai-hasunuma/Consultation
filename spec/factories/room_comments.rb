FactoryBot.define do
  factory :room_comment do
    sequence(:content) { |n| "content#{n}" }
  end
end
