json.extract! event, :id, :name, :private, :created_at, :updated_at
json.url event_url(event, format: :json)
