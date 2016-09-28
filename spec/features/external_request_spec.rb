require "helper"

describe "external request" do
  it "queries the medhub api" do
    stub_request(:get, "https://test.medhub.com/functions/api/").
      with(headers: headers).
      to_return(status: 200, body: "stubbed response", headers: {})

    uri = URI("https://test.medhub.com/functions/api/")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
