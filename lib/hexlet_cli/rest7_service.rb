module HexletCli
  class Rest7Service
    API_URL = 'http://api.rest7.com/v1/currency_convert.php'

    def initialize(http_client = HTTParty)
      @http_client = http_client
    end

    def convert(amount:, from:, to:)
      response = @http_client.get(API_URL, query: { amount: amount, currency_in: from, currency_out: to })
      response.parsed_response[:amount]
    end
  end
end
