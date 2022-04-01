class ExchangeRateService
  def initialize(source: ::Clients::Nbp)
    @source = source
  end

  def latest
    ExchangeRate.currencies.map do |_, v|
      ExchangeRate.find_by(currency: v, effective_date: Date.today) ||
        ExchangeRate.find_by(currency: v, effective_date: Date.yesterday)
    end
  end

  def load_by_date(currency:, date:)
    return unless currency || date

    ExchangeRate.send(currency.to_sym).find_by(effective_date: date) ||
      create_from_source(currency: currency, date: date)
  end

  private

  attr_reader :source

  def create_from_source(currency:, date:)
    raw_rate = source.load_by_date(currency: currency, date: date)['rates'].first
    rate_params = {
      currency: currency,
      effective_date: date,
      precision: 4,
      buy: (Float(raw_rate['bid']) * 10000).to_i,
      sell: (Float(raw_rate['ask']) * 10000).to_i
    }

    ExchangeRate.create(rate_params)
  end
end
