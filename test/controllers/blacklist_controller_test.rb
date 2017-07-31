require 'test_helper'

class BlacklistControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get blacklist_edit_url
    assert_response :success
  end

  test "should get index" do
    get blacklist_index_url
    assert_response :success
  end

  test "should get new" do
    get blacklist_new_url
    assert_response :success
  end

  test "should get constants" do
    get blacklist_constants_url
    assert_response :success
  end

  test "should get show" do
    get blacklist_show_url
    assert_response :success
  end

end
