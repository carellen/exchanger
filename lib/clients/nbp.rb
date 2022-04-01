require 'net/http'

module Clients
  class Nbp
    BASE_URL = 'https://api.nbp.pl/api/exchangerates'

    class << self
      def load_by_date(currency: , date:)
        fetch_json(url: "#{BASE_URL}/rates/c/#{currency}/#{date}")
      end

      private

      def fetch_json(url:)
        uri = URI(url.concat('?format=json'))
        response = ::Net::HTTP.get(uri)
        p response

        JSON.parse(response)
      rescue => e
        { errros: e }
      end
    end
  end
end

