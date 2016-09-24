require "helper"

describe Mavis::Base do
  before do
    @base = Mavis::Base.new(hello: "test")
  end

  describe "#[]" do
    it "should be a getter" do
      expect(@base[:hello]).to eq "test"
    end
  end
end
