#!/bin/sh
set -e
set -x

# Created demo and subdemo with
#  bundle gem demo
#  bundle gem subdemo
# then edited demo to require subdemo:
#  demo/demo.gemspec:  spec.add_runtime_dependency "subdemo"
#  demo/lib/demo.rb:require "subdemo"
#  demo/Gemfile:path '..'
 
cd subdemo
bundle install
rake
gem build subdemo
cd ../demo
bundle install
rake
gem build demo
