kinds = %w[Amigo Comercial Conhecido]

kinds.each do |kind|
  Kind.create!(
    description: kind
  )
end

10.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday,
    kind: Kind.all.sample
  )
end

Contact.all.each do |contact|
  Random.rand(1..3).times do |index|
    Phone.create!(
      number: Faker::PhoneNumber.phone_number,
      contact: contact
    ).save!
  end
end

Contact.all.each do |contact|
  address = Address.create!(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    contact: contact
  ).save!
end