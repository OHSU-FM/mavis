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

    # Returns a list of all courses the account can call
    #
    # Ex: @client.evals_questions({"evaluationID": 1111})
    #
    # @params terms [Hash] list of optional search terms
    # @param evaluationID [Integer]
    # @return [Array[Hash]]
    def evals_questions terms={}
      call_path = "evals/questions"
      request = terms
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Returns evaluations data
    #
    # Ex: @client.evals_responses("2016-01-01", "courses": [1111])
    #
    # @param startDate [String]
    # @param optional endDate [String]
    # @param optional programs [Array]
    # @param optional courses [Array]
    # @return responseID [Int] unique evaluation response identifier
    def evals_responses(start_date, terms={})
      call_path = "evals/responses"
      request = {"startDate": start_date}.merge(terms)
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Returns status of an evaluation request
    #
    # Ex: @client.evals_status(11111)
    #
    # @param responseID [Int]
    # @return status_code [Int] {0: incomplete, 1: partially complete,
    #                 3: complete, 4,5: complete - tiered contributor}
    # @return status_title [String] status desc
    def evals_status(response_id)
      call_path = "evals/status"
      request = {"responseID": response_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end
  end
end
