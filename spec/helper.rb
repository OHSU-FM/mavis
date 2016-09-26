require "mavis"
require "rspec"
require "pry"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub_get client, path
  stub_request(:get, base_https + client.institution + base_url + path)
end

def stub_post client, path
  stub_request(:post, base_https + client.institution + base_url + path)
end

def base_https
  Mavis::Request::BASE_HTTPS
end

def base_url
  Mavis::Request::BASE_URL
end
