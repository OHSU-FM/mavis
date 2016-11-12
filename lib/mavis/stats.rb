module Mavis
  module Stats

    # Provides a count of users at the institution
    #
    # @return active_users [Integer]
    # @return total_users [Integer]
    def stats_users
      call_path = "status/users"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # Provides a count of users at the institution by type
    #
    # @return usertype [Integer]
    # @return type_name [String]
    # @return active_users [Integer]
    # @return total_users [Integer]
    def stats_users
      call_path = "status/userTypes"
      request = ""
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end
  end
end
