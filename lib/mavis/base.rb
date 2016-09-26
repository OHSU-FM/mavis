require "mavis/null_object.rb"

module Mavis
  class Base
    attr_reader :attrs
    alias to_h attrs
    alias to_hash to_h

    # @param attrs [Hash]
    # @return [Mavis::Base]
    def initialize attrs = {}
      @attrs = attrs
      attr_reader attrs
    end

    # Define getter and getter? for each attr
    #
    # @param attrs [Enumerable]
    # @return attrs [Enumerable]
    def attr_reader attrs
      attrs.each do |key, value|
        define_attribute_method(key)
        define_predicate_method(key)
      end
    end

    # Define getter for a single attr
    #
    # @param attr [key]
    def define_attribute_method attr
      self.class.send(:define_method, attr) do
        if attr_falsey_or_empty?(attr)
          NullObject.new
        else
          @attrs[attr]
        end
      end
    end

    # Define getter? for a single attr
    #
    # @param attr [key]
    def define_predicate_method attr
      self.class.send(:define_method, "#{attr}?") do
        !attr_falsey_or_empty?(attr)
      end
    end

    # @param key [attr] || *
    # @return [@attrs[attr]] || nil
    def [](key)
      send(key.to_sym)
    rescue NoMethodError
      nil
    end

    private

    # @param key [attr] || *
    # @return [Boolean]
    def attr_falsey_or_empty? key
      !@attrs[key] || @attrs[key].respond_to?(:empty) && @attrs[key].empty?
    end
  end
end
