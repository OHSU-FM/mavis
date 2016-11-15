module Mavis
  module Evals

    # List active evaluation forms for a program/course
    #
    # @params terms [Hash] list of optional search terms
    # @param optional programID [Integer]
    # @param optional courseID [Integer]
    # @return evaluationID [Integer]
    # @return evaluation_title [String]
    # @return introduction [String]
    # @return questions_count [Integer]
    # @return types [Array] evaluation types this form can be used for
    def evals_forms request
      call_path = "evals/forms"
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # List incomplete evaluations for a given user
    #
    # @params userID [Integer]
    # @return responseID [Integer]
    # @return evaluationID [Integer]
    # @return eval_type [String] evaluation response title
    # @return status [Integer] "incomplete"
    def evals_incomplete user_id
      call_path = "evals/incomplete"
      data = build_post_data({"userID": user_id}.to_json)
      perform_post(build_url(call_path), data)
    end

    # List the milestones, EPAs or rotation objectives for a program
    #
    # @params terms [Hash]
    # @param programID [Integer]
    # @param list [String] one of {"milestones", "epas", "elements"}
    # @return reflID [Integer]
    # @return global_relfID [Integer]
    # @return name [String]
    # @return abreb [String]
    # @return status [Integer] {"active", "inactive"}
    def evals_milestones program_id, list
      call_path = "evals/milestones"
      request = {"programID": program_id, "list": list}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # Lists the evaluation questions for a specified evaluation form
    #
    # @param evaluationID [Integer]
    # @return [Array[Hash]]
    def evals_questions evaluation_id
      call_path = "evals/questions"
      request = {"evaluationID": evaluation_id}.to_json
      data = build_post_data(request)
      perform_post(build_url(call_path), data)
    end

    # Returns progress report for a given resident in a given period
    #
    # ex: client.evals_progress({"programID":19,
    #                            "userID":886858,
    #                            "year":"2014",
    #                            "half":"2"})
    #
    # @param programID [Integer]
    # @param userID [Integer]
    # @param year [Integer] four-digit, ex: 2016
    # @param half [Integer] one of "1"/"2"
    # @return milestone_reflID [Integer] see "Milestone List"
    # @return level [Float] Dreyful level
    # @return notes [String]
    # @return status [String] "Draft" or "Final"
    def evals_progress terms={}
      call_path = "evals/progress"
      data = build_post_data(terms.to_json)
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
    def evals_responses start_date, terms={}
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
    def evals_status response_id
      call_path = "evals/status"
      request = {"responseID": response_id}
      data = build_post_data(request.to_json)
      perform_post(build_url(call_path), data)
    end

    # List of possible evaluation delivery types
    #
    # @return typeID [Integer]
    # @return type_name [String]
    def evals_types
      call_path = "evals/types"
      data = build_post_data("")
      perform_post(build_url(call_path), data)
    end
  end
end
