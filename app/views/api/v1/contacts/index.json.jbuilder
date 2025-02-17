# json.array! @contacts, partial: "api/v1/contacts/contact", as: :contact
json.data @contacts do |contact|
  json.partial! "api/v1/contacts/contact", contact: contact
end

json.meta do
  json.author "Mauro Biazutti"
  json.pagination do
    json.current_page @contacts.current_page
    json.prev_page @contacts.prev_page
    json.next_page @contacts.next_page
    json.total_pages @contacts.total_pages
    json.total_count @contacts.total_count
    json.per_page @contacts.limit_value
  end
end