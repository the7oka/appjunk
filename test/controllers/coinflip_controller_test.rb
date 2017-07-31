require 'test_helper'

class CoinflipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coinflip_index_url
    assert_response :success
  end

end
