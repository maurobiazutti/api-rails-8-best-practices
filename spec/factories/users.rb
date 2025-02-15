FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Name.name }
    email { "user@example.com" }
    password { "123456" }
    password_confirmation { "123456" }
    uid { email }

    factory :confirmed_user do
      confirmed_at { Time.now }
    end
  end
end
