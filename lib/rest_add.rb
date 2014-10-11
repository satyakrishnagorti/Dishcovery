require 'json'
require 'curb'
http = Curl.get("https://api.zomato.com/v1/subzones.json?city_id=4") do|http|
  http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
end
json_resp = JSON.parse(http.body_str)
json_resp['subzones'].each { |location|

  loc_id = location['subzone']['subzone_id']
  query = "https://api.zomato.com/v1/search.json?subzone_id="+loc_id.to_s+"&start=0&count=50"
  http1 = Curl.get(query) do |http|
    http.headers['X-Zomato-API-Key'] = '7749b19667964b87a3efc739e254ada2'
  end
  restaurants_json = JSON.parse(http1.body_str)
  restaurants_json['results'].each {|rest|

    puts rest['result']['name']
    restobj = Restaurant.new
    restobj.rest_id=rest['result']['id']
    restobj.name=rest['result']['name']
    restobj.location = location['subzone']['name']
    restobj.loc_id = loc_id
    restobj.zone_name = 'null'
    restobj.zone_id = location['subzone']['zone_id']
    restobj.city_name = "Bangalore"
    restobj.city_id = "4"
    restobj.cuisines = rest['result']['cuisines']
    restobj.twitter_handle = 'null'
    restobj.cost_for_two = rest['result']['cost_for_two']
    restobj.rating = rest['result']['rating_editor_overall']
    restobj.save




  }
}