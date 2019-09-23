# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "event_#{n}" }
    sequence(:description) { |n| "description of the #{n} event :)" }
    association :creator
    date 1.month.from_now

    trait :tomorrow do
      date 1.day.from_now
    end

    trait :next_week do
      date 1.week.from_now
    end

    trait :next_month do
      date 1.month.from_now
    end
  end
end
