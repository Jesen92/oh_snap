require 'test_helper'

class Api::V1::Mobile::UsersImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_mobile_users_images_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_mobile_users_images_show_url
    assert_response :success
  end

end
