class ExchangeRatesController < ApplicationController

  def index
    @today_rates = ExchangeRateService.new.latest
    @rate = ExchangeRateService.new.load_by_date(currency: params[:currency], date: params[:date])
  end
end
