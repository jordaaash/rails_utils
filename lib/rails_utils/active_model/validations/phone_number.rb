require 'active_model/validator'

class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each (record, attribute, value)
    unless value.to_s =~ /\A\d{10}\z/
      record.errors[attribute] << options[:message] \
        || 'is not a valid phone number'
    end
  end
end
