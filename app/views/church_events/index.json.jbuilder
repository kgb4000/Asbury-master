json.array!(@church_events) do |church_event|
  json.extract! church_event, :id, :event_date, :event_name, :event_description, :event_time, :event_location
  json.url church_event_url(church_event, format: :json)
end
