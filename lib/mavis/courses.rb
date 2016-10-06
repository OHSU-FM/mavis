module Mavis
  module Courses

    # Returns a list of all courses the account can call
    #
    # @return [Array[Hash]]
    def courses_access
      call_path = "courses/access"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # Returns a list of all courses the account can call
    # Same as courses_access?
    #
    # @return [Array[Hash]]
    def courses_all
      call_path = "courses/all"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end
  end
end
