#
# Cookbook Name:: ele-cassandra
# Recipe:: default
#
# Copyright (C) 2016 RACKSPACE INC.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'cassandra-dse'
include_recipe 'ele-cassandra::tarball'


