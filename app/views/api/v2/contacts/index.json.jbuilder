json.data @contacts do |contact|
  json.type "contacts"
  json.id contact.id
  json.attributes do
    json.name contact.name
    json.email contact.email
    json.birthdate I18n.l(contact.birthdate)
  end

  json.relationships do
    json.kind do
      json.data do
        json.type "kinds"
        json.id contact.kind.id
        json.description contact.kind.description
        json.links do
          # json.self kind_url(contact.kind.id, format: :json)
          # json.self url_for(controller: 'kinds', action: 'show', id: contact.kind.id, format: :json)
        end
      end
    end
  end

  json.phones do
    json.data contact.phones do |phone|
      json.id phone.id
      json.number phone.number
        json.contact_id phone.contact_id
    end
  end

  json.address do
    json.data do
      json.id contact.address.id
      json.street contact.address.street
      json.city contact.address.city
      json.contact_id contact.address.contact_id
    end
  end

  # json.set! :meta do
  #   json.set! "author", "Mauro Biazutti"
  # end
  #
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

  # json.links do
  #   json.self contacts_url(page: @contacts.current_page, format: :json)
  #   json.first contacts_url(page: 1, format: :json)
  #   json.last contacts_url(page: @contacts.total_pages, format: :json)
  #   json.prev contacts_url(page: @contacts.prev_page, format: :json) if @contacts.prev_page
  #   json.next contacts_url(page: @contacts.next_page, format: :json) if @contacts.next_page
  # end
end
