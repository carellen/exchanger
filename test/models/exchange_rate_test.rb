require "test_helper"

class ExchangeRateTest < ActiveSupport::TestCase

  test 'do not create record if exists' do
    assert_not_nil exchange_rates(:eur_today)
    rate = ExchangeRate.new(currency: :eur,
                            effective_date: Date.today,
                            precision: 4,
                            buy: 123456,
                            sell: 123456)
    assert_not rate.save
  end
end
