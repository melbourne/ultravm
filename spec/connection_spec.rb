require 'ultravm'

describe UltraVM::Connection do
  
  it "should have default options" do
    connection = UltraVM::Connection.new
    connection.options.should == { :username => 'root' }
  end
  
end