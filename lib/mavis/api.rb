require_relative "information"
require_relative "users"
require_relative "courses"
require_relative "evals"
require_relative "stats"

module Mavis
  module API
    include Mavis::Information
    include Mavis::Users
    include Mavis::Courses
    include Mavis::Evals
    include Mavis::Stats
  end
end
