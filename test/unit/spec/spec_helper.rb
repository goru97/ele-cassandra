# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '14.04',
  log_level: 'debug'
}.freeze
::CHEFSPEC_OPTS = {
  log_level: 'debug'
}.freeze

def stub_resources
end

at_exit { ChefSpec::Coverage.report! }
