require "test_helper"

class V1::OpenbankingControllerTest < ActionDispatch::IntegrationTest
  test "should get qualification" do
    get v1_openbanking_qualification_url
    assert_response :success
  end
end
