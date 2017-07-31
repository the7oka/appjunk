require 'test_helper'

class GeometrySwissArmyKnifeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get geometry_swiss_army_knife_index_url
    assert_response :success
  end

end
