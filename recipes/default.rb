#
# Cookbook Name:: ele-cassandra
# Recipe:: default
#
# Copyright (C) 2016 RACKSPACE INC.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'java' if node['cassandra']['install_java']
include_recipe 'python'
include_recipe 'python::pip'
include_recipe 'ele-cassandra::tarball'
include_recipe 'ele-cassandra::config'
include_recipe 'cassandra-dse::opscenter_agent'

# install cql, required for cqlsh
python_pip 'cql' do
  action :install
end


