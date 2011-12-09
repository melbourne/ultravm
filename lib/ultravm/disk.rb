module UltraVM
  class Disk
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
    # A human-readable name
    def label
      @client.get('VDI', :name_label, @uuid)
    end
    
    # Size of disk as presented to the guest (in bytes). 
    # Note that, depending on storage backend type, requested size may not be respected exactly.
    def size
      @client.get('VDI', :virtual_size, @uuid).to_i
    end
    
    # Returns whether the disk may only be mounted read-only or not.
    def read_only?
      @client.get('VDI', :read_only, @uuid)
    end
    
  end
end