#
# Cookbook:: apachelab
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

platform = node['platform']
raise "this is not suported on '#{platform}" if node['platform'] != "ubuntu"
include_recipe 'java'
include_recipe "apachelab::apacheinstall"
include_recipe 'apachelab::mysqlinstall'
