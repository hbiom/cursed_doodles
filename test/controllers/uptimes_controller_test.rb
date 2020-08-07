require 'test_helper'

class UptimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get uptimes_new_url
    assert_response :success
  end

  test "should get create" do
    get uptimes_create_url
    assert_response :success
  end

end
