FactoryBot.define do
  factory :food do
    name         { Faker::Name.initials(number: 5) }
    purchase_day { Faker::Date.between(from: 5.days.ago, to: 10.days.ago) }
    limit_day    { Faker::Date.between(from: 5.days.ago, to: Date.today) }
    association :pantry
  end
end
