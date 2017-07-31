require 'test_helper'

class HexmeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hexme_index_url
    assert_response :success
  end

end
