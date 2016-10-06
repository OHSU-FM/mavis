module Mavis
  module Evals

    # Returns a list of all courses the account can call
    #
    # @params terms [Hash] list of optional search terms
    # @param programID [Integer]
    # @param courseID [Integer]
    # @return [Array[Hash]]
    def evals_forms terms={}
      call_path = "evals/forms"
      request = terms
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end
  end
end
