module ActionController
  class Responder
    def initialize(controller, resources, options = {})
      @controller       = controller
      @request          = @controller.request
      @format           = @controller.formats.first
      @resource         = resources.last
      @resources        = resources
      @options          = options
      @action           = options[:action]
      @default_response = options.delete(:default_response)
    end
  end
end
