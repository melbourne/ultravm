module UltraVM
  class BlockMetric
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # Read bandwidth (KiB/s)
    def io_read
      @client.get('VBD_metrics', :io_read_kbs, @uuid).to_i
    end
    
    # Write bandwidth (KiB/s)
    def io_write
      @client.get('VBD_metrics', :io_read_kbs, @uuid).to_i
    end
    
  end
end