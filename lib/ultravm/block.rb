module UltraVM
  class Block
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # The virtual disk
    def disk
      Disk.new(@client, @client.get('VBD', :VDI, @uuid))
    end
    
    # Device seen by the guest e.g., hda1
    def device
      @client.get('VBD', :device, @uuid)
    end
    
    def metrics
      BlockMetric.new(@client, @client.get('VBD', :metrics, @uuid))
    end
  
  end
end