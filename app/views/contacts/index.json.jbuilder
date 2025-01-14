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
          json.self url_for(controller: 'kinds', action: 'show', id: contact.kind.id, format: :json)
        end
      end
    end
  end

  json.phnes do
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

  json.set! :meta do
    json.set! "author", "Mauro Biazutti"
  end
end
