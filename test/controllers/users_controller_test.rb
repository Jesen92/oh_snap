require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_events" do
    get users_user_events_url
    assert_response :success
  end

  test "should get users_images" do
    get users_users_images_url
    assert_response :success
  end

end
