# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  context "when not authenticated" do
    should "get redirected" do
      get root_url
      assert_response :found
    end
  end

  context "when authenticated" do
    setup do
      sign_in users(:one)
    end

    should "get index" do
      get root_url
      assert_response :success
    end
  end
end
