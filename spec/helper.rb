require "mavis"
require "rspec"
require "webmock/rspec"
require "pry"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

WebMock.disable_net_connect!(allow_localhost: true)

def a_get path
  a_request(:get, "https://test.medhub.com/functions/api" + path)
end

def stub_get path
  stub_request(:get, "https://test.medhub.com/functions/api" + path)
end

def stub_post path
  stub_request(:post, "https://test.medhub.com/functions/api" + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture file
  File.new(fixture_path + "/" + file)
end

def body client, request
  "clientID=#{client.client_id}&ts=#{Time.now.to_i}&verify=#{client.verify_string(request)}&type=json"
end

def headers
  {"Accept"=>"*/*", "Accept-Encoding"=>"gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "User-Agent"=>"Ruby"}
end
