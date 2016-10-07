require "helper"

describe Mavis::Client do
  before do
    @creds = {
      client_id:   "123",
      institution: "abc",
      p_key:       "456",
    }
    @client = Mavis::Client.new(@creds)
  end

  describe "attr_readers" do
    it "has methods to read credential values" do
      expect(@client.client_id).to eq @creds[:client_id]
    end
  end

  describe "#perform_post" do
    it "performs a post request" do
      stub_post("").with(headers: headers).to_return(body: {}.to_json)

      @client.perform_post("https://test.medhub.com/functions/api", {})
      expect(a_post("")).to have_been_made
    end

    it "returns JSON" do
      stub_post("").with(headers: headers)
      .to_return(body: {"key":"value"}.to_json)

      r = @client.perform_post("https://test.medhub.com/functions/api", {})
      expect(r["key"]).to eq "value"
    end
  end

  describe "#credentials" do
    it "returns a hash of credentials" do
      expect(@client.credentials).to eq @creds
    end
  end

  describe "#credentials?" do
    it "returns true if all credentials are present" do
      expect(@client.credentials?).to be_truthy
    end

    it "returns false if any credentials are missing" do
      @c = Mavis::Client.new(client_id: "123", p_key: "456")
      expect(@c.credentials?).to be_falsey
    end
  end

  describe "#verify_string" do
    it "returns a string" do
      expect(@client.verify_string("hi!")).to be_a String
    end

    it "accepts empty requests" do
      expect(@client.verify_string("")).to be_a String
    end
  end
end
