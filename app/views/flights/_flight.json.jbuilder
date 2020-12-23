json.extract! flight, :id, :from_airport, :to_airport, :start_time, :duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
