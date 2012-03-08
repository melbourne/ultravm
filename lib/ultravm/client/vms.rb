module UltraVM
  class Client
    module VMs
      
      # Get all VMs
      #
      # Examples
      #   client.vms 
      #   # => [UltraVM::VM, UltraVM::VM, ...]
      #
      # Returns Array of UltraVM::VM objects.
      def vms
        get('host', :resident_VMs, uuid).collect do |vm|
          UltraVM::VM.new(self, vm)
        end
      end
      
      # Get all VMs which label matches +name.
      #
      # name - The String of the names of VMs to find.
      #
      # Examples
      #   client.vms_by_name('some-name')
      #   # => [UltraVM::VM, UltraVM::VM, ...]
      #
      # Returns array of UltraVM::VM object.
      def vms_by_name(name)
        get('VM', :by_name_label, name).collect do |vm|
          UltraVM::VM.new(self, vm)
        end
      end
      
      # Get first VM which label matches +name. Assumes unique labels.
      #
      # name - The String of the name of the VM to find.
      #
      # Examples
      #   client.vm_by_name('some-name')
      #   # => UltraVM::VM
      #
      # Returns UltraVM::VM object.
      def vm_by_name(name)
        vms = get('VM', :by_name_label, name)
        if vms.any?
            UltraVM::VM.new(self, vms.first)
        else
          false
        end
      end
      
      # Get a complete VM hash of attributes
      #
      # ref - The UUID of the VM to find.
      #
      # Examples
      #   client.record_by_ref('uuid-xbc123123213123123')
      #   # => Hash
      # 
      # Returns Hash of attributes of VM.
      def record_by_ref(ref)
        get('VM', :record, ref)
      end
      
    end
  end
end