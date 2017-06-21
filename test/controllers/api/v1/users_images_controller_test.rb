require 'test_helper'

class Api::V1::UsersImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_users_images_index_url
    assert_response :success
  end

end
