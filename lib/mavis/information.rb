module Mavis
  module Information

    # call to verify working connection to the MedHub API
    #
    # @return [HTTParty::Response]
    def test
      call_path = "info/test"
      request = ""
      url = build_url(call_path)
      data = build_post_data(verify_string(request))
      perform_post(url, data)
    end
  end
end
