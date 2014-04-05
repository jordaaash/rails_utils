require 'action_view/helpers/capture_helper'

module ActionView
  module Helpers
    module CaptureHelper
      def default_for (name, content = nil, options = {}, &block)
        content_for?(name) \
          ? content_for(name) : content_for(name, content, options, &block)
      end

      def yield_for (name, content = nil, &block)
        if content_for?(name)
          content_for(name)
        else
          block_given? ? capture(&block) : content
        end
      end
    end
  end
end
