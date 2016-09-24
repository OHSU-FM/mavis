require "helper"

describe Mavis::Base do
  before do
    @creds = {
      client_id:   "123",
      institution: "abc",
      p_key:        "456",
    }
    @base = Mavis::Base.new(@creds)
  end

  describe "#credentials" do
    it "returns a hash of credentials" do
      expect(@base.credentials).to eq @creds
    end
  end

  describe "#credentials?" do
    it "returns true if credentials exist" do
      expect(@base.credentials?).to eq true
    end
  end
end
