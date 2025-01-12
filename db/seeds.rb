# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Contact.new(name: "John Doe", email: "jonh@example.com", birthdate: "1990-01-01").save
# Contact.new(name: "Jane", email: "jabe@example.com", birthdate: "2000-02-02").save

10.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday
  )
end
