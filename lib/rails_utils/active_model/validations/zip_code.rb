require 'active_model/validator'

class ZipCodeValidator < ActiveModel::EachValidator
  def validate_each (record, attribute, value)
    unless value.to_s =~ /\A\d{3,5}(-\d{4})?\z/
      record.errors[attribute] << options[:message] || 'is not a valid zip code'
    end
  end
end
