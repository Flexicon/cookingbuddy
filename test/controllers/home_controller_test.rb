require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get redirected" do
    get root_url
    assert_response :found
  end

  test "should get index when authenticated" do
    sign_in users(:one)
    get root_url
    assert_response :success
  end
end
