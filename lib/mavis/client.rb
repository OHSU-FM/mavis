require_relative "api"
require "httparty"

module Mavis
  class Client
    include Mavis::API
    BASE_HTTPS = "https://"
    BASE_URL   = ".medhub.com/functions/api/"

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

    def perform_post url, data
      HTTParty.post(url, body: data)
    end
    #
    # @return [Hash]
    def credentials
      {
        client_id:   @client_id,
        institution: @institution,
        p_key:       @p_key
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def verify_string request
      Digest::SHA256.hexdigest("#{credentials[:client_id]}|#{Time.now.to_i}|#{credentials[:p_key]}|#{request}")
    end

    private

    def build_url call_path
      "#{BASE_HTTPS + credentials[:institution] + BASE_URL + call_path}"
    end

    def build_post_data v_string
      {
        clientID: credentials[:client_id],
        ts:       Time.now.to_i,
        verify:   v_string,
        type:     "json"
      }
    end
  end
end
