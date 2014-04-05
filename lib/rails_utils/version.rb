require 'rails_utils/gem_version'

module RailsUtils
  # Returns the version of the currently loaded RailsUtils as a <tt>Gem::Version</tt>
  def self.version
    gem_version
  end
end
