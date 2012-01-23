module UltraVM
  class Client
    module Hosts
      
      # Get all hosts
      def hosts
        get('host', :all).collect do |host|
          UltraVM::Host.new(self, host)
        end
      end
      
    end
  end
end