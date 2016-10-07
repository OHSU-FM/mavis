module Mavis
  module Courses

    # Returns a list of all courses the account can call
    #
    # @return courseID [Int]
    # @return course_name [String]
    # @return course_abbrev [String]
    def courses_access
      call_path = "courses/access"
      data = build_post_data("")
      perform_post(build_url(call_path), data)
    end

    # Returns a list of all courses the account can call
    # Same as courses_access?
    #
    # @return courseID [Int]
    # @return course_name [String]
    # @return course_abbrev [String]
    def courses_all
      call_path = "courses/all"
      data = build_post_data("")
      perform_post(build_url(call_path), data)
    end
  end
end
