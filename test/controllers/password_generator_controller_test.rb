require 'test_helper'

class PasswordGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get password_generator_index_url
    assert_response :success
  end

end
