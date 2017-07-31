require 'test_helper'

class LocationerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get locationer_index_url
    assert_response :success
  end

end
