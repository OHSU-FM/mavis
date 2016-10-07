require "helper"

describe Mavis::Courses do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#courses_access" do
    before do
      stub_post("/courses/access")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("courses_access.json"))
    end

    it "should return an Array of Hashes" do
      t = @client.courses_access()
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
    end
  end

  describe "#courses_all" do
    before do
      stub_post("/courses/all")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("courses_access.json"))
    end

    it "should request the correct resource" do
      @client.courses_all()
      expect(a_post("/courses/all")).to have_been_made
    end
  end
end
