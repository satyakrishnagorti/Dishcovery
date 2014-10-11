json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :cuisine_name
  json.url cuisine_url(cuisine, format: :json)
end
