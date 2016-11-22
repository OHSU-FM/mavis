module Mavis
  module Conferences

    # Lists conferences attended by an individual user in a specified date range
    #
    # @param user_id [Integer]
    # @param programID [Integer] required if course_id not supplied
    # @param courseID [Integer] required if program_id not supplied
    # @param startDate [String] YYYY-MM-DD
    # @param endDate [String] YYYY-MM-DD
    # @return conferenceID [Integer]
    # @return date [String] YYYY-MM-DD HH:mm(am/pm)
    # @return start_time [String] HH:MM:SS
    # @return end_time [String] HH:MM:SS
    # @return title [String]
    # @return location [String]
    # @return groupID [Integer] see 'Conference Groups' endpoint
    # @return late_flag [Integer] 1="Late"
    # @return async_flag [Integer] 1="Asynchronous"
    # @return self_flag [Integer] 1="Resident Self Attendance"
    def conferences_attendance terms={}
      call_path = "conferences/attendance"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end

    # Lists conference groups for a program
    #
    # @param programID [Integer] required if course_id not supplied
    # @param courseID [Integer] required if program_id not supplied
    # @return groupID [Integer] see 'Conference Groups' endpoint
    # @return title [String]
    # @return status [Integer] "Inactive" or "Active"
    def conferences_groups terms={}
      call_path = "conferences/groups"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end

    # Lists conference schedule for a program in a specified date range
    #
    # @param programID [Integer] required if course_id not supplied
    # @param courseID [Integer] required if program_id not supplied
    # @param startDate [String] YYYY-MM-DD
    # @param endDate [String] YYYY-MM-DD
    # @param groupID [Integer] not required -- can be used to filter by group
    # @return conferenceID [Integer]
    # @return date [String] YYYY-MM-DD HH:mm(am/pm)
    # @return start_time [String] HH:MM:SS
    # @return end_time [String] HH:MM:SS
    # @return title [String]
    # @return location [String]
    # @return groupID [Integer] see 'Conference Groups' endpoint
    # @return attendance_flag [Integer] 0="no attendance", 1="attendance taken"
    def conferences_schedule terms={}
      call_path = "conferences/schedule"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
