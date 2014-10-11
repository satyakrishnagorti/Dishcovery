require 'test_helper'

class ReviewCountsControllerTest < ActionController::TestCase
  setup do
    @review_count = review_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_count" do
    assert_difference('ReviewCount.count') do
      post :create, review_count: { rest_id: @review_count.rest_id, rev_count: @review_count.rev_count }
    end

    assert_redirected_to review_count_path(assigns(:review_count))
  end

  test "should show review_count" do
    get :show, id: @review_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_count
    assert_response :success
  end

  test "should update review_count" do
    patch :update, id: @review_count, review_count: { rest_id: @review_count.rest_id, rev_count: @review_count.rev_count }
    assert_redirected_to review_count_path(assigns(:review_count))
  end

  test "should destroy review_count" do
    assert_difference('ReviewCount.count', -1) do
      delete :destroy, id: @review_count
    end

    assert_redirected_to review_counts_path
  end
end
