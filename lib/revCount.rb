Restaurant.all.each do |restaurant|

  id = restaurant.rest_id.to_str
  http = Curl.get("https://api.zomato.com/v1/restaurant.json/"+id) do|http|
    http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
  end
  json_resp = JSON.parse(http.body_str)
  r = ReviewCount.new
  r.rest_id = json_resp['id']
  r.rev_count = json_resp['userReviews']['count']
  r.save
  puts json_resp['name'] + " : " + json_resp['userReviews']['count'].to_s


end