module ExchangeRatesHelper
  def format_rate(value, precision)
    value.to_f / (10 ** precision)
  end
end
