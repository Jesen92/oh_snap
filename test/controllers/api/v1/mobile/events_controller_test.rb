require 'test_helper'

class Api::V1::Mobile::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_mobile_events_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_mobile_events_show_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_mobile_events_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_mobile_events_create_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_mobile_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_mobile_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_mobile_events_destroy_url
    assert_response :success
  end

end
