module Mavis
  module Users

    # Identifies possible user-types at the institution
    #
    # @return [Array[Hash]]
    def users_types
      call_path = "users/types"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # Identifies possible user-types at the institution
    #
    # @return [Array[Hash]]
    def users_residents program_id
      call_path = "users/residents"
      request = {"programID": program_id}
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # search for a student. at least one of name, username, and
    # employeeID must be provided as key/value in the terms hash. If
    # multiple terms are provided, only returns records where both are
    # true
    #
    # @param terms [Hash]
    # @param name [String] *optional
    # @param username [String] *optional
    # @param employeeID [String] *optional
    # @return [Array[Hash]]
    def users_student_search terms={}
      call_path = "users/studentSearch"
      request = terms
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
