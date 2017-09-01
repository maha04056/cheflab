#
# Cookbook:: mifos
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


raise  if node['platform'] !="ubuntu"

include_recipe 'java'
include_recipe 'mifos::tomcatinst'
include_recipe 'mifos::appserconfig'
include_recipe 'mifos::mysqlinst' 
