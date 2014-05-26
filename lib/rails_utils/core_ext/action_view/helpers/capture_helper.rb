require 'action_view/helpers/capture_helper'

module ActionView
  module Helpers
    module CaptureHelper
      def default_for (name, content = nil, options = {}, &block)
        if (value = content_for?(name))
          value
        else
          content_for(name, content, options, &block)
        end
      end

      def yield_for (name, content = nil, &block)
        if (value = content_for?(name))
          value
        else
          block_given? ? capture(&block) : content
        end
      end
    end
  end
end
