module UltraVM
  class VM
        
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # Returns the label of the VM.
    def label
      @client.get('VM', :get_name_labe, @uuid)
    end
    
    # Returns the power state of the VM.
    def power_state
      @client.get('VM', :get_power_state, @uuid)
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
      super
    end
    
  end
end