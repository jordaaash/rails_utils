require 'active_model/dirty'

module ActiveModel
  module Dirty
    alias_method :changed_without_patch?, :changed?
    def changed? (attribute = nil)
      attribute.nil? ? changed_without_patch? : changed_attributes.include?(attribute)
    end
  end
end
