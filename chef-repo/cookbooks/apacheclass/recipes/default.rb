#
# Cookbook:: apacheclass
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# this cookbook is supported only on ububtu so faiin for other
# platforms

platform = node ['platform']

raise "this cookbook is not supported on #{platform}" if  node['platform'] != "ubuntu"
include_recipe 'appacheclass::installrecipe'
include_recipe 'java'
include_recipe 'appacheclass::mysqlinstalation'