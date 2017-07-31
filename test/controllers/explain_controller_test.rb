require 'test_helper'

class ExplainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get explain_index_url
    assert_response :success
  end

  test "should get show" do
    get explain_show_url
    assert_response :success
  end

end
