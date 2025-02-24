FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    birthdate { "2006-03-21" }
    kind { association :kind }
    association :user
  end
end
