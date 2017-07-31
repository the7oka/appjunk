require 'test_helper'

class AmioldyetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amioldyet_index_url
    assert_response :success
  end

end
