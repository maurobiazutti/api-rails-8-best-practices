json.array! @kinds do |kind|
  json.type "kinds"
  json.id kind.id
  json.description kind.description
  json.created_at kind.created_at
end
