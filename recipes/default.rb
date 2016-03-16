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
include_recipe 'ele-cassandra::tarball'
include_recipe 'ele-cassandra::config'


