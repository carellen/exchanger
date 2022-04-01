require "application_system_test_case"

class ExchangeRatesTest < ApplicationSystemTestCase
  include ExchangeRatesHelper

  setup do
    @eur_today = exchange_rates(:eur_today)
    @eur_yesterday = exchange_rates(:eur_yesterday)
  end

  test "should display todays rates" do
    visit exchange_rates_url
    assert_selector "##{dom_id(@eur_today)}", text: @eur_today.currency
  end

  test "should display list of exchange rates" do
    visit exchange_rates_url

    select :eur, from: :currency
    fill_in :date, with: Date.yesterday
    click_on "Show"

    assert_selector "#rates", text: format_rate(@eur_yesterday.buy, @eur_yesterday.precision)
  end
end
