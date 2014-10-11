json.array!(@locations) do |location|
  json.extract! location, :id, :loc_id, :loc_name, :zone_id
  json.url location_url(location, format: :json)
end
