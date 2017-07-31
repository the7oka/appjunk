require 'test_helper'

class ConjuringControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conjuring_index_url
    assert_response :success
  end

end
