require "test_helper"

class ExchangeRatesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get exchange_rates_url
    assert_response :success
  end
end
