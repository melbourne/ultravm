require 'ultravm'

describe UltraVM::Client do
  
  it "should have default options" do
    client = UltraVM::Client.new
    client.options.should == { :username => 'root' }
  end
  
end