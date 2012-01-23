module UltraVM
  class Host
    
    def initialize(client, uuid)
      @client = client
      @uuid = uuid
    end
    
   # Returns the label of the host.
    def label
      @client.get('host', :name_label, @uuid)
    end
    
    def to_s
      "<UltraVM::Host #{label}>"
    end
  end
end