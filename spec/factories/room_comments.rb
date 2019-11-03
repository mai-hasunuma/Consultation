# frozen_string_literal: true

FactoryBot.define do
  factory :room_comment do
    sequence(:content) { |n| "content#{n}" }
  end
end
