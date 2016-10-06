require "helper"

describe Mavis::Information do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#test" do
    before do
      stub_post("/info/test")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("test.json"))
    end

    it "should return 'success'" do
      t = @client.test()
      expect(t["response"]).to eq "success"
    end
  end

  describe "#status" do
    before do
      stub_post("/info/status")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("status.json"))
    end

    it "should return 'success'" do
      t = @client.status()
      expect(t["status"]).to eq "active"
    end
  end

  describe "#access" do
    before do
      stub_post("/info/access")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("access.json"))
    end

    it "should return an Array of hashes" do
      t = @client.access()
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
      # the access call should always include a reference to the access endpoint
      expect(t.any?{|h| h.values.include? "info/access"}).to be_truthy
    end
  end

  describe "#info_institution" do
    before do
      stub_post("/info/institution")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("info_institution.json"))
    end

    it "should return a hash" do
      t = @client.info_institution()
      expect(t).to be_a Hash
      expect(t["url"]).to eq "https://ohsu-test.medhub.com"
    end
  end

  describe "#terms" do
    before do
      stub_post("/info/terms")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("terms.json"))
    end

    it "should return a hash" do
      t = @client.terms()
      expect(t).to be_a Hash
    end
  end
end
