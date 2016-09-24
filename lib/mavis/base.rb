require "forwardable"
module Mavis
  class Base
    extend Forwardable
    attr_reader :attrs
    alias to_h attrs
    alias to_hash to_h

    def attribute_reader attrs
      attrs.each do |key, value|
        self.class.send(:define_method, key) do
          if attr_falsey_or_empty?(key)
            NullObject.new
          else
            @attrs[key]
          end
        end
      end
    end

    def initialize attrs = {}
      @attrs = attrs
      attribute_reader attrs
    end

    def [](method)
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

    private

    def attr_falsey_or_empty? key
      !@attrs[key] || @attrs[key].respond_to?(:empty) && @attrs[key].empty?
    end

    # # @param options [Hash]
    # # @return [Mavis::Client]
    # def initialize options = {}
    #   options.each do |key, value|
    #     # instance_variable_set "@#{key}", value
    #     define_attr_reader(key)
    #   end
    #   yield self if block_given?
    # end
    #
    # # @return [Hash]
    # def credentials
    #   {
    #     client_id: client_id,
    #     institution: institution,
    #     p_key: p_key
    #   }
    # end
    #
    # # @return [Boolean]
    # def credentials?
    #   credentials.values.all?
    # end
  end
end
