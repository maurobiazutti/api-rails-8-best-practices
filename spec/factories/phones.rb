FactoryBot.define do
  factory :phone do
    number { Faker::PhoneNumber.phone_number }
    association :contact
  end
end
