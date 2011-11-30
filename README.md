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
ultravm.connect

# Get all VM objects
ultravm.vms

# Get first vm
vm = ultravm.vms.first

# Get VM power state
vm.power_state # => "Running"

# Check if VM is running
vm.running? # => true

# Check if VM is halted
vm.halted? # => false

# Get VM label
vm.label # => "happy-kittens"

# Get VM stats
metrics = vm.metrics # => UltraVM::Metric

# Get VM memory
metrics.memory # => 4294881280

# Get VM boot time
metrics.started_at # => 2011-08-24 12:10:02 UTC

# Get VM install time
metrics.installed_at # => 011-08-24 12:10:02 UTC 

```


## TODO
* Network Stats
* Host Stats
* Change power states
