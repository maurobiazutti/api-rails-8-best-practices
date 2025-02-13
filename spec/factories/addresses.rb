FactoryBot.define do
  factory :address do
    street { "Tiradente " }
    city { "Santos" }
    association :contact
  end
end
