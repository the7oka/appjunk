require 'test_helper'

class Tweetamela5erControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweetamela5er_index_url
    assert_response :success
  end

end
