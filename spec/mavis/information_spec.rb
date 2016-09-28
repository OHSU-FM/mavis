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
      stub_post("/info/status")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("status.json"))
    end

    it "should return 'success'" do
      t = @client.status()
      expect(t["status"]).to eq "active"
    end
  end
end
