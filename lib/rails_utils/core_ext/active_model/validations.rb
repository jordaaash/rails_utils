require 'active_model/validations'

module ActiveModel
  module Validations
    module ClassMethods
      def validate (*args, &block)
        options = args.extract_options!
        if options.include?(:on)
          options      = options.dup
          options[:if] = Array(options[:if])
          options[:on] = Array(options[:on])
          options[:if].unshift(-> (model) {
            options[:on].include?(model.validation_context)
          })
        end
        args << options
        set_callback :validate, *args, &block
      end
    end
  end
end
