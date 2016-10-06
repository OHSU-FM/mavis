require "helper"

describe "errors" do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "malformed verify string" do
    before do
      stub_post("/info/test")
        .with(body: body(@client, ""), headers: headers)
        .to_return(body: fixture("error_s07.json"))
    end

    it "returns error s07" do
      response = @client.info_test()
      expect(response["ErrorCode"]).to eq "S07"
    end
  end
end
