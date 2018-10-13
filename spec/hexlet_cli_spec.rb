require 'hexlet_cli'
require 'json'

describe HexletCli do
  let(:http_client)          { double() }
  let(:body)                 { { "amount" => 7000 } }
  let(:response)             { double(parsed_response: body) }

  subject { described_class }

  before do
    allow(http_client).to  receive(:get).and_return(response)
  end

  it 'return amount by default'do
    is_asserted_by {
      subject.convert(70, http_client: http_client) == 7_000
    }
  end
end
