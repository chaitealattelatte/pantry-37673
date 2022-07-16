FactoryBot.define do
  factory :pantry do
    name        { Faker::Name.initials(number: 5) }
    description { Faker::Lorem.sentences(number: 1) }
    association :user
  end
end
