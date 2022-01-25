require "ggtranslate"
require "byebug"

describe Ggtranslate::ResultObject do
  it "raise ApiCallException when failing to call API" do
    mocked_rest_response = RestClient::Response.new()
    allow(mocked_rest_response).to receive(:code).and_return(400)

    expect { Ggtranslate::ResultObject.new(mocked_rest_response) }.to raise_error(Ggtranslate::ApiCallException)
  end

  it "raise ResponseParsingException when failing to parse API response" do
    mocked_rest_response = RestClient::Response.new()
    allow(mocked_rest_response).to receive(:code).and_return(200)
    allow(mocked_rest_response).to receive(:body).and_return({ random: :stuffs }.to_json)

    result = Ggtranslate::ResultObject.new(mocked_rest_response)
    expect { result.translated_text }.to raise_error(Ggtranslate::ResponseParsingException)
  end
end
