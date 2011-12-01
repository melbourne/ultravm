# UltraVM API

## Installation

## Rails
Add to your Gemfile:

``` ruby
gem 'ultravm', :git => 'git@github.com:melbourne/ultravm.git'
```

## Command Line

<pre>
$ git clone git@github.com:melbourne/ultravm.git
$ bundle install
$ rake install
</pre>

``` ruby
require 'ultravm'
```

## Usage

``` ruby
ultravm = UltraVM::Client.new(:endpoint => "https://path-to-xen-server/", :password => "kittens")

# Connect
ultravm.connect # => "host-uuid"

# Get all VM objects
ultravm.vms # => [UltraVM::VM, UltraVM::VM, ...]

# Get first vm
vm = ultravm.vms.first # => UltraVM::VM

# Get VM power state
vm.power_state # => "Running"

# Check if VM is running
vm.running? # => true

# Check if VM is halted
vm.halted? # => false

# Get VM label
vm.label # => "happy-kittens"

# Start a VM
vm.start

# Force reboot a VM
vm.force_reboot

# Force shutdown a VM
vm.force_shutdown

# Get VM stats
metrics = vm.metrics # => UltraVM::Metric

# Get VM memory
metrics.memory # => 4294881280

# Get VM boot time
metrics.started_at # => 2011-08-24 12:10:02 UTC

# Get VM install time
metrics.installed_at # => 011-08-24 12:10:02 UTC 

# Find VMs by label
ultravm.vms_by_name('cool-vm') # => [UltraVM::VM, UltraVM::VM, ...]

# Find a VM by label
ultravm.vm_by_name('cool_vm') # => UltraVm::VM


```


## TODO
* Make vms_by_name search using any attribute.
* Power state changes should return whether they succeeded or not.
* Network Stats
* Host Stats
