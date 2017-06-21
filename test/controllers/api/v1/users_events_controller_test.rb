require 'test_helper'

class Api::V1::UsersEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_users_events_create_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_users_events_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_users_events_show_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_users_events_destroy_url
    assert_response :success
  end

end
