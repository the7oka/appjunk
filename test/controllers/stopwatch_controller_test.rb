require 'test_helper'

class StopwatchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stopwatch_index_url
    assert_response :success
  end

end
