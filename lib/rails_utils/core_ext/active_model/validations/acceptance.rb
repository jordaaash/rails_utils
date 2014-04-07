require 'active_model/validations/acceptance'
require 'active_model/validator'

module ActiveModel
  module Validations
    class AcceptanceValidator < EachValidator
      def initialize (options)
        defaults         = { :allow_nil => true, :accept => ['1', 1, true] }
        options          = options.dup
        options[:accept] = Array(options[:accept]) if options.key? :accept
        options          = defaults.merge!(options)
        super
      end

      def validate_each (record, attribute, value)
        options = self.options
        unless options[:accept].include?(value)
          options = options.except :allow_nil, :accept
          record.errors.add(attribute, :accepted, options)
        end
      end
    end
  end
end
