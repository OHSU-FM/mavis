module Mavis
  module Information

    # call to verify working connection to the MedHub API
    #
    # @return [HTTParty::Response]
    def test
      call_path = "info/test"
      request = ""
      data = build_post_data(verify_string(request))
      perform_post(build_url(call_path), data)
    end

    # call to verify get the status of the MedHub API
    #
    # @return [HTTParty::Response]
    def status
      call_path = "info/status"
      request = ""
      data = build_post_data(verify_string(request))
      perform_post(build_url(call_path), data)
    end

    # returns alist of granted API calls for the institution
    #
    # @return [HTTParty::Response]
    def access
      call_path = "info/access"
      request = ""
      data = build_post_data(verify_string(request))
      perform_post(build_url(call_path), data)
    end
  end
end
