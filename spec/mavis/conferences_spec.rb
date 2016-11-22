require "helper"

describe Mavis::Evals do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#conferences_attendance" do
    before do
      stub_post("/conferences/attendance")
        .with(body: body(@client, {"userID": 111, "programID": 3}.to_json) + "&request=%7B%22userID%22%3A111%2C%22programID%22%3A3%7D", headers: headers)
        .to_return(status: 200, body: fixture("conferences_attendance.json"))
    end

    it "requests the correct resource" do
      @client.conferences_attendance({"userID": 111, "programID": 3})
      expect(a_post("/conferences/attendance")).to have_been_made
    end
  end

  describe "#conferences_groups" do
    before do
      stub_post("/conferences/groups")
        .with(body: body(@client, {"programID": 3}.to_json) + "&request=%7B%22programID%22%3A3%7D", headers: headers)
        .to_return(status: 200, body: fixture("conferences_groups.json"))
    end

    it "requests the correct resource" do
      @client.conferences_groups({"programID": 3})
      expect(a_post("/conferences/groups")).to have_been_made
    end
  end

  describe "#conferences_schedule" do
    before do
      stub_post("/conferences/schedule")
        .with(body: body(@client, {"programID": 3, "startDate": "2016-01-01", "endDate": "2016-11-01"}.to_json) + "&request=%7B%22programID%22%3A3%2C%22startDate%22%3A%222016-01-01%22%2C%22endDate%22%3A%222016-11-01%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("conferences_schedule.json"))
    end

    it "requests the correct resource" do
      @client.conferences_schedule({"programID": 3, "startDate": "2016-01-01", "endDate": "2016-11-01"})
      expect(a_post("/conferences/schedule")).to have_been_made
    end
  end
end
