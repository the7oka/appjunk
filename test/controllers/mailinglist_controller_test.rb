require 'test_helper'

class MailinglistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailinglist_index_url
    assert_response :success
  end

end
