require 'active_model/dirty'

module ActiveModel
  module Dirty
    alias_method :changed_without_patch?, :changed?

    def changed? (attribute = nil)
      if attribute.nil?
        changed_without_patch?
      else
        changed_attributes.include?(attribute)
      end
    end
  end
end
