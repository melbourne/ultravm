module UltraVM
  class VMMetric
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # Guest's actual memory (bytes)
    def memory
      @client.get('VM_metrics', :memory_actual, @uuid).to_i
    end
    
    # Time at which this VM was last booted.
    def started_at
      @client.get('VM_metrics', :start_time, @uuid).to_time
    end
    
    # Time at which the VM was installed at.
    def installed_at
      @client.get('VM_metrics', :start_time, @uuid).to_time
    end

    def cores
      @client.get('VM_metrics', :VCPUs_number, @uuid).to_i
    end
  end
end