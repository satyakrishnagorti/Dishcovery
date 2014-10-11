require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { city_id: @restaurant.city_id, city_name: @restaurant.city_name, cost_for_two: @restaurant.cost_for_two, cuisines: @restaurant.cuisines, loc_id: @restaurant.loc_id, location: @restaurant.location, name: @restaurant.name, rating: @restaurant.rating, rest_id: @restaurant.rest_id, twitter_handle: @restaurant.twitter_handle, zone_id: @restaurant.zone_id, zone_name: @restaurant.zone_name }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { city_id: @restaurant.city_id, city_name: @restaurant.city_name, cost_for_two: @restaurant.cost_for_two, cuisines: @restaurant.cuisines, loc_id: @restaurant.loc_id, location: @restaurant.location, name: @restaurant.name, rating: @restaurant.rating, rest_id: @restaurant.rest_id, twitter_handle: @restaurant.twitter_handle, zone_id: @restaurant.zone_id, zone_name: @restaurant.zone_name }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
