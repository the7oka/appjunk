require 'test_helper'

class DictionaryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dictionary_new_url
    assert_response :success
  end

  test "should get search" do
    get dictionary_search_url
    assert_response :success
  end

  test "should get show" do
    get dictionary_show_url
    assert_response :success
  end

end
