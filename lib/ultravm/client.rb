require 'ultravm/vm'
require 'ultravm/metric'
require 'xmlrpc/client'

module UltraVM
  class Client
    
    require 'ultravm/client/vms'
    
    include UltraVM::Client::VMs
    
    attr_accessor :options
    
    def initialize(options = {})
      options = default_options.merge(options)
      
      Config::VALID_OPTIONS.each do |key|
        instance_variable_set("@#{key}", options[key])
      end
    end
    
    # Connect and authenticate.
    def connect
      @client = XMLRPC::Client.new2(@endpoint)
      
      # Disable SSL certification verification :/
      @client.instance_variable_get(:@http).instance_variable_set(:@verify_mode, OpenSSL::SSL::VERIFY_NONE)
      
      @session = @client.proxy('session')
      @sid = @session.login_with_password(@username, @password)['Value']
    end
    
    # Default UUID is the hosts
    def uuid
      @client.call('host.get_all', @sid)['Value'][0]
    end
    
    # API accessor.
    def get(proxy_name, method, object_uuid = nil)
      @client.proxy(proxy_name).send(:"get_#{method}", @sid, object_uuid || uuid)['Value']
    end
    
    def default_options
      {
        username: 'root'
      }
    end
    
  end
end