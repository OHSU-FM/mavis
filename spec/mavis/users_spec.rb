require "helper"

describe Mavis::Users do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#users_types" do
    before do
      stub_post("/users/types")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("users_types.json"))
    end

    it "should return an Array of Hashes" do
      t = @client.users_types()
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
    end
  end

  describe "#users_student_search" do
    before do
      stub_post("/users/studentSearch")
        .with(body: body(@client, {"username": "test"}.to_json) + "&request=%7B%22username%22%3A%22test%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_student_search.json"), headers: {})
    end

    it "should return an Array of Hashes" do
      t = @client.users_student_search({"username": "test"})
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
    end
  end
end
