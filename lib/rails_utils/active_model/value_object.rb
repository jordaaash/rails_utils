require 'active_model/model'
require 'rails_utils/core_ext/active_model/dirty'

module RailsUtils
  class ValueObject
    include ActiveModel::Model

    def self.reflect_on_association (*)
      nil
    end

    def initialize (attributes = {}, &block)
      super(attributes)
      yield self if block_given?
    end

    def save
      valid?
    end

    def update (attributes)
      assign_attributes(attributes)
      save
    end

    def destroy
      @destroyed = true
    end

    def assign_attributes (attributes)
      attributes.each { |a, v| public_send(:"#{a}=", v) }
    end

    alias_method :attributes=, :assign_attributes

    def to_param
      nil
    end

    def persisted?
      !to_param.nil?
    end

    def destroyed?
      @destroyed.nil? ? false : @destroyed
    end
  end
end

ValueObject = RailsUtils::ValueObject
