kinds = %w[Amigo Comercial Conhecido]

kinds.each do |kind|
  Kind.create!(
    description: kind
  )
end

# Criando um usuário padrão
user = User.create!(
  name: "Mauro Biazutti",
  email: "mauro@email.com",
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.zone.now # Se estiver usando confirmação de e-mail
)

35.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday,
    kind: Kind.all.sample,
    user: user
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
