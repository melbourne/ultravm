require 'xmlrpc/client'

require 'ultravm/vm'

module UltraVM
  class Client
    
    require 'ultravm/client/vms'
    
    include UltraVM::Client::VM
    
    attr_accessor :options
    
    def initialize(options = {})
      options = default_options.merge(options)
      Config::VALID_OPTIONS.each do |key|
        instance_variable_set("@#{key}", options[key])
      end
    end
    
    def default_options
      {
        username: 'root'
      }
    end
    
  end
end