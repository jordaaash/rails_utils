require 'active_model/dirty'

module ActiveModel
  module Dirty
    def changed? (attribute = nil)
      attribute.nil? ? super() : changed_attributes.include?(attribute)
    end
  end
end
