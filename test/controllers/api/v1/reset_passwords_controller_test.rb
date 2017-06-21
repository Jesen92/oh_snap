require 'test_helper'

class Api::V1::ResetPasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_reset_passwords_create_url
    assert_response :success
  end

end
