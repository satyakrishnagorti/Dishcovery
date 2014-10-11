require 'json'
require 'curb'

# Bangalore id = 4
# Central Bangalore = 5100
# Brigade Road 5112

# Get reviews for a restaurant -> https://api.zomato.com/v1/reviews.json/89/user?start=0&count=10
# 54097 Arbor Brewing Company

# Getting all resaturants in Brigade
=begin
http = Curl.get("https://api.zomato.com/v1/search.json?subzone_id=5112") do|http|
  http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
end

json_resp = JSON.parse(http.body_str)
json_resp['results'].each { |restaurant|
  name = restaurant['result']['name']
  id = restaurant['result']['id']

  puts name

  # Writing to database
  rest = Restaurant.new
  rest.restaurant_id = id
  rest.name = name
  rest.location_name = 'Brigade Road'
  rest.location_id = '5112'
  rest.zone_name = 'Central Bangalore'
  rest.zone_id = '5100'
  rest.city_name = 'Bangalore'
  rest.city_id = '4'
  rest.twitter_id = 'null'
  rest.cuisines = restaurant['result']['cuisines']
  rest.cost_for_two = restaurant['result']['cost_for_two']
  rest.rating = restaurant['result']['rating_editor_overall']
  rest.save

  http1 = Curl.get('https://api.zomato.com/v1/reviews.json/'+id+'/user?start=0&count=45') do|http1|
    http1.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
  end
  reviews_result = JSON.parse(http1.body_str)
  reviews_result['userReviews'].each { |a|

    review = Review.new
    review.restaurant_id = id
    review.user = a['review']["userName"]
    review.review_text = a['review']["reviewText"]
    review.rating = a['review']["rating"]
    review.sentiment = 'null'
    review.save
  }

}
=end

http = Curl.get("https://api.zomato.com/v1/subzones.json?city_id=4") do|http|
  http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
end
json_resp = JSON.parse(http.body_str)
json_resp['subzones'].each { |location|
 print  location['subzone']['name']
 print " --> "
 print location['subzone']['subzone_id']
 print "\n"
  each_loc = Location.new
  each_loc.loc_id = location['subzone']['subzone_id']
  each_loc.loc_name = location['subzone']['name']
  each_loc.zone_id = location['subzone']['zone_id']
  each_loc.save
}

