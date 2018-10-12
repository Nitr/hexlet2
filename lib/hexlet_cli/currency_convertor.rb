require 'byebug'
module HexletCli
  class CurrencyConvertor
    def initialize(http_client: HTTParty, services: {})
      @services = services
      @services['Rest7Service'] ||= HexletCli::Rest7Service.new(http_client)
    end

    def convert(amount, from: 'USD', to: 'RUB', service_name: 'Rest7Service')
      @services[service_name].convert(amount: amount, from: from, to: to)
    end
  end
end
