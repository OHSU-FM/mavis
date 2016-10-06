module Mavis
  module Information

    # call to verify working connection to the MedHub API
    #
    # @return [Hash]
    def test
      call_path = "info/test"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # call to verify get the status of the MedHub API
    #
    # @return [Hash]
    def status
      call_path = "info/status"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # returns alist of granted API calls for the institution
    #
    # @return [Array]
    def access
      call_path = "info/access"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # returns institutional information
    #
    # @return [Hash]
    def info_institution
      call_path = "info/institution"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # returns institutional information
    #
    # @return [Hash]
    def terms
      call_path = "info/terms"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end
  end
end
