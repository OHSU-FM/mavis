module Mavis
  module Users

    # Lists active residents in the provided program
    #
    # @param program_id [Integer]
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return typeID [Integer] see "resident types" to idenitify
    # @return level [Integer] PGY level
    def users_residents program_id
      call_path = "users/residents"
      request = {"programID": program_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

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

    # Lists the active outside evaluators for a given program
    #
    # @param program_id [Integer]
    # @return outsideID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return location [String] optional field
    # @return location_abbrev [String] optional field
    # @return outside_type [Integer]
    # @return outside_type_name [String]
    def users_outside program_id
      call_path = "users/outside"
      request = {"programID": program_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Provides outside evaluator information for the given unique id
    #
    # @param outside_id [Integer]
    # @return outsideID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return location [String] optional field
    # @return location_abbrev [String] optional field
    # @return outside_type [Integer]
    # @return outside_type_name [String]
    # @return status [Integer]
    # @return status_name [String]
    def users_outside_lookup outside_id
      call_path = "users/outsideLookup"
      request = {"outsideID": outside_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Search for a resident. at least one of name, username, or
    # employeeID must be provided as key/value in the terms hash. If
    # multiple terms are provided, only returns records where both are
    # true
    #
    # @param terms [Hash]
    # @param optional name [String]
    # @param optional username [String]
    # @param optional employeeID [String]
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return typeID [Integer] see "Resident Types" endpoint
    # @return level [Integer] PGY level
    def users_resident_search terms={}
      call_path = "users/residentSearch"
      data = build_post_data(terms.to_json)
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
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return programID [Integer]
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
    # @return userID [Integer]
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return typeID [Integer] see "Student Types" endpoint
    # @return level [Integer] year in medical school
    def users_student_search terms={}
      call_path = "users/studentSearch"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end

    # Identifies possible user-types at the institution
    #
    # @return usertype [Integer]
    # @return type_name [String]
    # @return active_users [Integer]
    # @return total_users [Integer]
    def users_types
      call_path = "users/types"
      request = ""
      data = build_post_data(request)
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
    # @return name_last [String]
    # @return name_first [String]
    # @return email [String]
    # @return username [String]
    # @return employeeID [String]
    # @return user_type [Integer]
    # @return user_type_name [String]
    # @return programID [Integer]
    # @return program_name [String]
    def users_user_lookup user_id
      call_path = "users/userLookup"
      request = {"userID": user_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
