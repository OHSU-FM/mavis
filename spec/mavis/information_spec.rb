require "helper"

describe Mavis::Information do
  before do
    @creds = {
      secrets: [],
    }
    @client = Mavis::Client.new(@creds)
  end

  describe "#test" do
    it "should return 'success'" do
      t = @client.test.body
      expect(t).to include "success"
    end
  end
end
