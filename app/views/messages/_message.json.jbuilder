json.extract! message, :id, :name, :spec, :created_at, :updated_at
json.url message_url(message, format: :json)
