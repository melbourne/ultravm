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

### Connect 
``` ruby
ultravm = UltraVM::Client.new(:endpoint => "https://path-to-xen-server/", :password => "kittens")

# Connect
ultravm.connect # => "host-uuid"
```

### General
``` ruby
# Get all VM objects
ultravm.vms # => [UltraVM::VM, UltraVM::VM, ...]

# Get first vm
vm = ultravm.vms.first # => UltraVM::VM

# Get VM label
vm.label # => "happy-kittens"

# Get block devices
vbds = vm.vbds # => [UltraVM::Block, UltraVM::Block, ...]
```

### Power State

``` ruby
# Get VM power state
vm.power_state # => "Running"

# Check if VM is running
vm.running? # => true

# Check if VM is halted
vm.halted? # => false

# Start a VM
vm.start

# Force reboot a VM
vm.force_reboot

# Force shutdown a VM
vm.force_shutdown

# Pause a VM
vm.pause

# Unpause a VM
vm.unpause

# Clone a VM
newvm = vm.clone # => UltraVM::VM

```

### VM Metrics
``` ruby
# Get VM stats
metrics = vm.metrics # => UltraVM::VMMetric

# Get VM memory
metrics.memory # => 4294881280

# Get VM boot time
metrics.started_at # => 2011-08-24 12:10:02 UTC

# Get VM install time
metrics.installed_at # => 011-08-24 12:10:02 UTC 
```

### VBD Block
``` ruby
# Get first block
vbd = vbds.first

# Get VBD name
vbd.name # => "hda1"

# Get VDI Disk
disk = vbd.disk # => UltraVM::Disk
```

### VBD Metrics
``` ruby
# Get VBD metrics
metrics = vbd.metrics # => UltraVM::VBDMetric

# Read bandwidth (KiB/s)
metrics.io_read # => 500

# Write bandwidth (KiB/s)
metrics.io_write # => 100
```

### VDI Disk
``` ruby
# Get disk label
disk.label # => "happy-unicorns"

# Get disk size (bytes)
disk.size # => 10000000000000

# Is the disk read only?
disk.read_only? # => false
```

### Finders

``` ruby
# Get a complete VM hash of attributes
ultravm.record_by_ref UltraVM::VM.uuid # => {"uuid" => ...}

# Find VMs by label
ultravm.vms_by_name('cool-vm') # => [UltraVM::VM, UltraVM::VM, ...]

# Find a VM by label
ultravm.vm_by_name('cool_vm') # => UltraVm::VM
```


## TODO
* Make vms_by_attribute search using any attribute.
* Power state changes should return whether they succeeded or not.
* Network Stats
* Host Stats
