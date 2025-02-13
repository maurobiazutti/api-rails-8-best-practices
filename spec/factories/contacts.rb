FactoryBot.define do
  factory :contact do
    name { "John Doe" }
    email { "jCt7G@example.com" }
    birthdate { "1990-01-01" }
    association :kind
    association :user
  end
end
