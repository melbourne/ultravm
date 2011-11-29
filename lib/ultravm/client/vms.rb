require 'xmlrpc/client'

module UltraVM
  class Client
    module VMs
      
      def vms
        UltraVM::VM.new
      end
      
    end
  end
end