module UltraVM
  class Client
    module VMs
      
      # Get all VMs
      def vms
        get('host', :resident_VMs, uuid).collect do |vm|
          UltraVM::VM.new(self, vm)
        end
      end
      
      # Get all VMs which label matches +name.
      def vms_by_name(name)
        get('VM', :by_name_label, name).collect do |vm|
          UltraVM::VM.new(self, vm)
        end
      end
      
      # Get first VM which label matches +name. Assumes unique labels.
      def vm_by_name(name)
        vms = get('VM', :by_name_label, name)
        if vms.any?
            UltraVM::VM.new(self, vms.first)
        else
          false
        end
      end
      
    end
  end
end