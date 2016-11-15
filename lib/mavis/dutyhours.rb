module Mavis
  module Dutyhours

    # Grab timesheet data for a resident in a specified date period
    #
    # @param userID [Integer]
    # @param startDate [String] datetime
    # @param endDate [String] datetime
    # @return date [String] datetime YYYY-MM-DD
    # @return start_time [String] time HH:MM:SS
    # @return end_time [String] time HH:MM:SS
    # @return worktypeID [String] date, use 'Work Types' call to get list of
    #         types
    # @return absence_type [Integer] 0=none, 1=vac, 2=sick, 3=away conf, 4=loa
    # @return status [String] Incomplete/Submitted
    def dutyhours_timesheets terms={}
      call_path = "dutyhours/timesheets"
      data = build_post_data(terms.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
