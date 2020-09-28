require 'test_helper'

class AuthenticateControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get authenticate_create_url
    assert_response :success
  end

end
