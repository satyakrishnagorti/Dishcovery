http = Curl.get("https://api.zomato.com/v1/cuisines.json/city_id=4") do|http|
    http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
end


json_resp = JSON.parse(http.body_str)
puts json_resp
json_resp['cuisines'].each do |a|
    puts a['cuisine']['cuisine_name']
   c = Cuisine.new
   c.cuisine_name = a['cuisine']['cuisine_name']
   c.save
end


