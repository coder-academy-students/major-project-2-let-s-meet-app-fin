json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :location_place_id, :start_date_time, :end_date_time, :message
  json.url event_url(event, format: :json)
end
