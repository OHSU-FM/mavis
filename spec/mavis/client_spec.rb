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
      expect(Mavis::Client.new(client_id: "123", p_key: "456").credentials?)
        .to be_falsey
    end
  end
end
