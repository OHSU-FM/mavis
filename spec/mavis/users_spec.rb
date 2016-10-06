require "helper"

describe Mavis::Users do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#types" do
    before do
      stub_post("/users/types")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("types.json"))
    end

    it "should return an Array of Hashes" do
      t = @client.types()
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
    end
  end
end
