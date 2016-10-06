require "helper"

describe Mavis::Evals do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#evals_questions" do
    before do
      stub_post("/evals/questions")
        .with(body: body(@client, {"evaluationID": 1111}.to_json) + "&request=%7B%22evaluationID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("evals_questions.json"))
    end

    it "requests the correct resource" do
      @client.evals_questions({"evaluationID": 1111})
      expect(a_post("/evals/questions")).to have_been_made
    end
  end

  describe "#evals_responses" do
    before do
      stub_post("/evals/responses")
        .with(body: body(@client, {"startDate": "2016-01-01", "courses": [1111]}.to_json) + "&request=%7B%22startDate%22%3A%222016-01-01%22%2C%22courses%22%3A%5B1111%5D%7D", headers: headers)
        .to_return(status: 200, body: fixture("evals_responses.json"))
    end

    it "requests the correct resource" do
      @client.evals_responses("2016-01-01", "courses": [1111])
      expect(a_post("/evals/responses")).to have_been_made
    end
  end

  describe "#evals_status" do
    before do
      stub_post("/evals/status")
        .with(body: body(@client, {"responseID": 11111}.to_json) + "&request=%7B%22responseID%22%3A11111%7D", headers: headers)
        .to_return(status: 200, body: fixture("evals_status.json"))
    end

    it "requests the correct resource" do
      @client.evals_status(11111)
      expect(a_post("/evals/status")).to have_been_made
    end
  end
end
