require "test_helper"

class ThatControllerTest < ActionDispatch::IntegrationTest
  test "should get it" do
    get that_it_url
    assert_response :success
  end
end
