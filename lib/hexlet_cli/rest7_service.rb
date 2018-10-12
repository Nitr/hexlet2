module HexletCli
  class Rest7Service
    API_URL = 'http://api.rest7.com/v1/currency_convert.php'

    def initialize(http_client = HTTParty)
      @http_client = http_client
    end

    def convert(amount:, from:, to:)
      uri = URI(API_URL)
      uri.query = URI.encode_www_form(amount: amount, currency_in: from, currency_out: to)
      response = @http_client.get(uri)
      JSON.parse(response.body)["amount"]
    end
  end
end
