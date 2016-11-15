require_relative "information"
require_relative "users"
require_relative "courses"
require_relative "evals"
require_relative "stats"
require_relative "dutyhours"
require_relative "conferences"

module Mavis
  module API
    include Mavis::Information
    include Mavis::Users
    include Mavis::Courses
    include Mavis::Evals
    include Mavis::Stats
    include Mavis::Dutyhours
    include Mavis::Conferences
  end
end
