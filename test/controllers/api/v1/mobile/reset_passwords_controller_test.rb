require 'test_helper'

class Api::V1::Mobile::ResetPasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_mobile_reset_passwords_create_url
    assert_response :success
  end

end
