require 'mail'
require 'active_model/validator'

module Mail
  class Address
    def valid?
      domain && address == raw && tree.domain.dot_atom_text.elements.size > 1
    end
  end
end

class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each (record, attribute, value)
    valid = begin
      address = Mail::Address.new(value).valid?
    rescue Mail::Field::ParseError
      false
    end

    if valid && options[:mx]
      require 'resolv'
      Resolv::DNS.open do |dns|
        resources = dns.getresources(address.domain, \
          Resolv::DNS::Resource::IN::MX)
        valid     = resources.any?
      end
    end

    unless valid
      record.errors[attribute] << options[:message] || 'is not a valid email address'
    end
  end
end
