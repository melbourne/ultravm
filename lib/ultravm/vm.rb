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
      Metric.new(@client, @client.get('VM', :metrics, @uuid))
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
    
    # TODO
    def to_s
      "<UltraVM::VM #{label}>"
    end
    
  end
end