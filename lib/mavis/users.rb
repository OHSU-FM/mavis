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

    # Lists active residents in the provided program
    #
    # @param program_id [Integer]
    # @return [Array[Hash]]
    # def users_residents program_id
    #   call_path = "users/residents"
    #   request = {"programID": program_id}
    #   data = build_post_data(request)
    #   perform_post(build_url(call_path), data)
    # end

    # Lists active faculty in the provided program
    #
    # @param program_id [Integer]
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    def users_faculty program_id
      call_path = "users/faculty"
      request = {"programID": program_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Lists active students in the provided course
    #
    # @param course_id [Integer]
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return typeID [Integer] use "student types" call to idenitify
    # @return level [Integer] year in med school
    def users_students course_id
      call_path = "users/students"
      request = {"courseID": course_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Search for a faculty member. at least one of name, username, and
    # employeeID must be provided as key/value in the terms hash. If
    # multiple terms are provided, only returns records where both are
    # true
    #
    # @param terms [Hash]
    # @param optional name [String]
    # @param optional username [String]
    # @param optional employeeID [String]
    # @return [Array[Hash]]
    def users_faculty_search terms={}
      call_path = "users/facultySearch"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end

    # Search for a student. at least one of name, username, and
    # employeeID must be provided as key/value in the terms hash. If
    # multiple terms are provided, only returns records where both are
    # true
    #
    # @param terms [Hash]
    # @param optional name [String]
    # @param optional username [String]
    # @param optional employeeID [String]
    # @return [Array[Hash]]
    def users_student_search terms={}
      call_path = "users/studentSearch"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end

    # Identifies complete training history for the specified student
    #
    # @param userID [Integer]
    # @return [Array[Hash]]
    def users_student_training user_id
      call_path = "users/studentTraining"
      request = {"userID": user_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Identifies possible student types at the institution
    #
    # @return typeID [Integer]
    # @return type_name [String]
    # @return visiting_flag [Integer] { 0: in house, 1: visitor }
    def users_student_types
      call_path = "users/studentTypes"
      data = build_post_data("")
      perform_post(build_url(call_path), data)
    end

    # Returns information about a user
    #
    # @param userID [Integer]
    # @return [Array[Hash]]
    def users_user_lookup user_id
      call_path = "users/userLookup"
      request = {"userID": user_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
