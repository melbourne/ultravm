module UltraVM
  class VM
        
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # Returns the label of the VM.
    def label
      @client.get('VM', :name_label, @uuid)
    end
    
    # Returns the power state of the VM.
    def power_state
      @client.get('VM', :power_state, @uuid)
    end
    
    # Metrics associated with this VM
    def metrics
      VMMetric.new(@client, @client.get('VM', :metrics, @uuid))
    end
    
    # The value of this field at VM start time acts as a hard limit of the amount of memory a guest can use. 
    # New values only take effect on reboot.
    def max_memory
      @client.get('VM', :memory_static_max, @uuid).to_i
    end
    
    # Statically-set (i.e. absolute) mininum (bytes). 
    # The value of this field indicates the least amount of memory this VM can boot with without crashing.
    def min_memory
      @client.get('VM', :memory_static_min, @uuid).to_i
    end
    
    # Start VM.
    def start
      @client.call('VM', :start, @uuid, false, true)
    end
    
    # Pause the specified VM. This can only be called when the specified VM is in the Running state.
    def pause
      @client.call('VM', :pause, @uuid)
    end
    
    # Resume the specified VM. This can only be called when the specified VM is in the Paused state.
    def unpause
      @client.call('VM', :unpause, @uuid)
    end
    
    # Clones the specified VM, making a new VM. 
    # Clone automatically exploits the capabilities of the underlying storage repository in which the
    # VM's disk images are stored (e.g. Copy on Write). This function can only be called when the VM is
    # in the Halted State.
    def clone(new_name)
      UltraVM::VM.new(@client, @client.call('VM', :clone, @uuid, new_name))
    end
    
    # Force VM to shutdown.
    def force_shutdown
      @client.call('VM', :hard_shutdown, @uuid)
    end
    
    # Force VM to reboot.
    def force_reboot
      @client.call('VM', :hard_reboot, @uuid)
    end
    
    # Returns whether the VM is running or not.
    def running?
      power_state == "Running"
    end
    
    # Returns whether the VM is halted or not.
    def halted?
      power_state == "Halted"
    end
    
    def vbds
      @client.get('VM', :VBDs, @uuid).collect do |block|
        Block.new(@client, block)
      end
    end
    
    # Virtual network interfaces
    def vifs
      @client.get('VM', :VIFs, @uuid).collect do |interface|
        Network.new(@client, interface)
      end
    end
    
    # Returns the VM unique ID
    def uuid
      @uuid
    end
    
    # TODO
    def to_s
      "<UltraVM::VM #{label}>"
    end
    
  end
end