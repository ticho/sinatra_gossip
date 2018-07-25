require 'bundler'
Bundler.require

require 'csv'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app'
require 'gossip'
run GossipProjectApp
