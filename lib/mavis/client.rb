require_relative "api"
require "httparty"

module Mavis
  class Client
    include Mavis::API

    BASE_HTTPS = "https://"
    BASE_URL   = ".medhub.com/functions/api/"

    # Set instance variables and define methods for each options key
    #
    # @param options [Hash]
    # @return [Mavis::Client]
    def initialize options = {}
      options.each do |key, value|
        self.class.send(:define_method, key) do
          value
        end
        instance_variable_set "@#{key}", value
      end
      yield self if block_given?
    end

    # Perform http POST to the medhub API
    #
    # @param url [String]
    # @param data [Hash]
    # @return [Hash, Array]
    def perform_post url, data
      p = HTTParty.post(url, body: data,)
      begin
        JSON.parse(p.parsed_response())
      rescue TypeError
        JSON.parse(p.to_json)
      end
    end

    # get a hash of client id/auth values
    #
    # @return [Hash]
    def credentials
      {
        client_id:   @client_id,
        institution: @institution,
        p_key:       @p_key
      }
    end

    # Predicate-style presence getter
    #
    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    # Generates verify string required by API
    #
    # @param request [String]
    # @return [String]
    def verify_string request
      Digest::SHA256.hexdigest("#{client_id}|#{Time.now.to_i}|#{p_key}|#{request}")
    end

    private

    # Utility method to build institution medhub url
    #
    # @param call_path [String]
    # @return [String]
    def build_url call_path
      "#{BASE_HTTPS + institution + BASE_URL + call_path}"
    end

    # Utility method to build request body
    #
    # @param request [String, Hash]
    # @return [Hash]
    def build_post_data request
      data = {
          "clientID" => client_id,
          "ts"       => Time.now.to_i.to_s,
          "verify"   => verify_string(request),
          "type"     => "json"
        }
      request.empty? ? data : data['request'] = request
      data
    end
  end
end
