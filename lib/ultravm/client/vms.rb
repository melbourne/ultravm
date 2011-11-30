module UltraVM
  class Client
    module VMs
      
      def vms
        get('host', :resident_VMs).collect do |vm|
          UltraVM::VM.new(self, vm)
        end
      end
      
    end
  end
end