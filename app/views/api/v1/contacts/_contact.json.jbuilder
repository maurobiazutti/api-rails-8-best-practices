json.extract! contact, :id, :name, :email, :birthdate, :kind_id, :user_id
json.phones contact.phones, :id, :number
json.address contact.address, :id, :street, :city

# json.type "contacts"
# json.id contact.id
# json.attributes do
#   json.namesss contact.name
#   json.email contact.email
#   json.birthdate contact.birthdate
# end

# json.relationships do
#   json.kind do
#     json.data do
#       json.type "kinds"
#       json.id contact.kind.id
#       json.description contact.kind.description
#     end
#   end
# end

# json.phones do
#   json.data contact.phones.each do |phone|
#     json.child! do
#       json.id phone.id
#       json.number phone.number
#       json.contact_id phone.contact_id
#     end
#   end
# end

# json.address do
#   json.data do
#     json.id contact.address.id
#     json.street contact.address.street
#     json.city contact.address.city
#     json.contact_id contact.address.contact_id
#   end
# end

# json.user do
#   json.id contact.user.id
#   json.name contact.user.name
#   json.email contact.user.email
#   # json.confirmed_at contact.user.confirmed_at
# end

