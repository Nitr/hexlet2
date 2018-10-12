require "hexlet_cli/version"
require "httparty"
require 'json'
require 'hexlet_cli/rest7_service'
require 'hexlet_cli/currency_convertor'

require 'byebug'

module HexletCli
  def self.convert(amount, from: 'USD', to: 'RUB', service_name: 'Rest7Service', http_client: HTTParty)
    convertor = HexletCli::CurrencyConvertor.new http_client: http_client
    convertor.convert(amount, from: from, to: to, service_name: service_name)
  end
end
