require "helper"

describe "external request" do
  it "queries the medhub api" do
    uri = URI("https://test.medhub.com/functions/api/info/text")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
