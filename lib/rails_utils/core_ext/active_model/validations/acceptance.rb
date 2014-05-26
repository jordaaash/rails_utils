require 'active_model/validations/acceptance'
require 'active_model/validator'
require 'active_support/core_ext/hash/except'

module ActiveModel
  module Validations
    class AcceptanceValidator < EachValidator
      alias_method :initialize_without_patch, :initialize

      def initialize (options)
        defaults         = {
          allow_nil: true,
          accept:    ['1', 1, true]
        }
        options          = options.dup
        options[:accept] = Array(options[:accept]) if options.include?(:accept)
        options          = defaults.merge!(options)
        initialize_without_patch(options)
      end

      def validate_each (record, attribute, value)
        options = self.options
        unless options[:accept].include?(value)
          options = options.except(:allow_nil, :accept)
          record.errors.add(attribute, :accepted, options)
        end
      end
    end
  end
end
