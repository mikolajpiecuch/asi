json.extract! trip, :id, :depdate, :place, :description, :phone, :capacity, :car, :created_at, :updated_at
json.url trip_url(trip, format: :json)
