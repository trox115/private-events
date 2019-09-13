FactoryBot.define do
  factory :user, aliases: [:creator] do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@mail.com"}
    password '12345678'

    trait :with_events do
      after(:create) { |user| create_list(:event, 5, creator: user) }
    end
  end
end
