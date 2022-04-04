require "test_helper"

class V1::ProposalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_proposals_create_url
    assert_response :success
  end
end
