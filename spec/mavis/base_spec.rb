require "helper"

describe Mavis::Base do
  before do
    @base = Mavis::Base.new(hello: "test")
  end

  describe "#[]" do
    it "should be a getter with symbol" do
      expect(@base[:hello]).to eq "test"
    end

    it "should be a getter with string" do
      expect(@base["hello"]).to eq "test"
    end

    it "returns nil for missing method" do
      expect(@base[:foo]).to be_nil
      expect(@base["foo"]).to be_nil
    end
  end

  describe "#key" do
    it "should be a getter" do
      expect(@base.hello).to eq "test"
    end
  end

  describe "#key?" do
    it "should get {key} presence" do
      expect(@base.hello?).to be_truthy
    end
  end
end
