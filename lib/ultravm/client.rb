require 'xmlrpc/client'

require 'ultravm/vm'
require 'ultravm/vm_metric'
require 'ultravm/network'
require 'ultravm/block'
require 'ultravm/block_metric'
require 'ultravm/disk'

module UltraVM
  class Client
    
    require 'ultravm/client/vms'
    
    include UltraVM::Client::VMs
    
    attr_accessor :options
    
    # UltraVM::Client.new(options)
    def initialize(options = {})
      options = default_options.merge(options)
      
      Config::VALID_OPTIONS.each do |key|
        instance_variable_set("@#{key}", options[key])
      end
    end
    
    # UltraVM::Client.connect(options)
    def self.connect(options = {})
      new(options).connect
    end
    
    # Connect and authenticate.
    def connect
      @client = XMLRPC::Client.new2(@endpoint)
      
      # Disable SSL certification verification :/
      @client.instance_variable_get(:@http).instance_variable_set(:@verify_mode, OpenSSL::SSL::VERIFY_NONE)
      
      @session = @client.proxy('session')
      @sid = @session.login_with_password(@username, @password)['Value']
      
      self
    end
    
    # Default UUID is the hosts
    def uuid
      @client.call('host.get_all', @sid)['Value'][0]
    end
    
    # API accessor for get_<method> requests.
    def get(proxy_name, method, *arguments)
      call(proxy_name, :"get_#{method}", *arguments)
    end
    
    # API accessor.
    def call(proxy_name, method, *arguments)
      @client.proxy(proxy_name).send(method, @sid, *arguments)['Value']
    end
    
    def default_options
      {
        username: 'root'
      }
    end
    
  end
end