require 'test_helper'

class OrgsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orgs_index_url
    assert_response :success
  end

  test "should get show" do
    get orgs_show_url
    assert_response :success
  end

end
