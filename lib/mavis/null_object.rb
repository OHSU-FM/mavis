require "naught"

module Mavis
  NullObject = Naught.build do |config|
    config.black_hole
    config.define_explicit_conversions
    config.define_implicit_conversions
    config.predicates_return false

    def respond_to?(*)
      true
    end
  end
end
