require 'hexlet_cli'
require 'json'

describe HexletCli::CurrencyConvertor do
  let(:http_client)          { double() }
  let(:body)                 { { "amount": 7000 } }
  let(:response)             { double(body: body.to_json) }
  let(:rest7_service_custom)  { HexletCli::Rest7Service.new(http_client) }

  subject {
    HexletCli::CurrencyConvertor.new(http_client: http_client, services: { 'rest7_service_custom' => rest7_service_custom })
  }

  before do
    allow(http_client).to  receive(:get).and_return(response)
  end

  it '#convert by default' do
    allow(rest7_service_custom).to receive(:convert)
    subject.convert(70)
    expect(rest7_service_custom).not_to have_received(:convert)
  end

  it '#convert by custom' do
    allow(rest7_service_custom).to receive(:convert)
    subject.convert(70, service_name: 'rest7_service_custom')
    expect(rest7_service_custom).to have_received(:convert)
  end
end
