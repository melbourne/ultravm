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
```

## TODO
* Network Stats
* Host Stats
* Change power states
