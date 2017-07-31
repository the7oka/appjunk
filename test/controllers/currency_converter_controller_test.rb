require 'test_helper'

class CurrencyConverterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get currency_converter_index_url
    assert_response :success
  end

end
